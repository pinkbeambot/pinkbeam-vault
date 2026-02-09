---
created: 2026-02-09
updated: 2026-02-09
type: architecture
category: technical
status: draft
---

# Web Services — Technical Architecture

**Version:** 1.0  
**Status:** Draft  
**Decided By:** CTO  

---

## 🏗️ System Overview

The Pink Beam Web Services platform is a multi-tenant SaaS application consisting of three primary interfaces:

1. **Marketing Website** — Public-facing lead generation
2. **Client Portal** — Client project management & analytics
3. **Admin Dashboard** — Internal operations & management

### Architecture Principles

- **Multi-tenancy**: Single codebase, isolated client data
- **Server-first**: Use Server Components where possible
- **API-driven**: RESTful APIs for all data operations
- **Event-based**: Webhooks for external integrations
- **Scalable**: Cloud-native, auto-scaling infrastructure

---

## 🧱 Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Framework** | Next.js 15 (App Router) | Full-stack React framework |
| **Language** | TypeScript 5.x | Type safety |
| **Styling** | Tailwind CSS 4.x | Utility-first CSS |
| **UI Components** | shadcn/ui + Radix | Accessible component library |
| **Database** | PostgreSQL (Supabase) | Primary data store |
| **ORM** | Prisma | Type-safe database access |
| **Auth** | Clerk | Authentication & authorization |
| **Payments** | Stripe | Billing & subscriptions |
| **Storage** | Cloudflare R2 | File & asset storage |
| **Email** | Resend | Transactional emails |
| **Analytics** | PostHog + Plausible | Product analytics |
| **Search** | Algolia (or Meilisearch) | Full-text search |
| **Cache** | Redis (Upstash) | Session & data caching |
| **Queue** | BullMQ (Redis) | Background job processing |
| **Hosting** | Vercel | Edge deployment |
| **Monitoring** | Sentry + Vercel Analytics | Error & performance tracking |

---

## 📐 Database Schema

### Core Entities

```prisma
// schema.prisma

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

// ============================================
// USER & AUTHENTICATION
// ============================================

model User {
  id            String    @id @default(cuid())
  clerkId       String    @unique // External auth ID
  email         String    @unique
  firstName     String?
  lastName      String?
  phone         String?
  avatarUrl     String?
  role          UserRole  @default(CLIENT)
  status        UserStatus @default(ACTIVE)
  
  // Relations
  ownedAgencies Agency[]
  agencyMembers AgencyMember[]
  createdProjects Project[] @relation("ProjectCreator")
  assignedTickets Ticket[] @relation("TicketAssignee")
  comments      Comment[]
  activityLogs  ActivityLog[]
  notifications Notification[]
  
  createdAt     DateTime  @default(now())
  updatedAt     DateTime  @updatedAt
  
  @@map("users")
}

enum UserRole {
  SUPER_ADMIN
  ADMIN
  PROJECT_MANAGER
  DESIGNER
  DEVELOPER
  SEO_SPECIALIST
  CLIENT
}

enum UserStatus {
  ACTIVE
  INACTIVE
  SUSPENDED
}

// ============================================
// AGENCY (Multi-tenant isolation)
// ============================================

model Agency {
  id          String   @id @default(cuid())
  name        String
  slug        String   @unique
  description String?
  logoUrl     String?
  website     String?
  
  // Brand Settings
  primaryColor   String @default("#FF006E")
  secondaryColor String @default("#0A0A0F")
  fontFamily     String @default("Inter")
  
  // Billing
  stripeCustomerId String?
  subscriptionTier SubscriptionTier @default(FREE)
  subscriptionStatus SubscriptionStatus @default(TRIAL)
  
  // Relations
  ownerId     String
  owner       User     @relation(fields: [ownerId], references: [id])
  members     AgencyMember[]
  clients     Client[]
  projects    Project[]
  services    Service[]
  invoices    Invoice[]
  tickets     Ticket[]
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("agencies")
}

model AgencyMember {
  id        String @id @default(cuid())
  agencyId  String
  userId    String
  role      AgencyMemberRole @default(MEMBER)
  
  agency    Agency @relation(fields: [agencyId], references: [id], onDelete: Cascade)
  user      User   @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  joinedAt  DateTime @default(now())
  
  @@unique([agencyId, userId])
  @@map("agency_members")
}

enum AgencyMemberRole {
  OWNER
  ADMIN
  MEMBER
}

enum SubscriptionTier {
  FREE
  STARTER
  PROFESSIONAL
  ENTERPRISE
}

enum SubscriptionStatus {
  TRIAL
  ACTIVE
  PAST_DUE
  CANCELLED
  SUSPENDED
}

// ============================================
// CLIENTS
// ============================================

model Client {
  id          String   @id @default(cuid())
  agencyId    String
  
  // Contact Info
  companyName String
  contactName String
  email       String
  phone       String?
  website     String?
  
  // Address
  address     String?
  city        String?
  state       String?
  zipCode     String?
  country     String @default("US")
  
  // Billing
  billingEmail     String?
  billingAddress   String?
  stripeCustomerId String?
  
  // Relations
  agency    Agency    @relation(fields: [agencyId], references: [id], onDelete: Cascade)
  projects  Project[]
  invoices  Invoice[]
  tickets   Ticket[]
  
  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt
  
  @@map("clients")
}

// ============================================
// SERVICES (Agency Service Catalog)
// ============================================

model Service {
  id          String @id @default(cuid())
  agencyId    String
  
  name        String
  description String
  category    ServiceCategory
  
  // Pricing
  pricingType PricingType @default(FIXED)
  basePrice   Decimal @db.Decimal(10, 2)
  hourlyRate  Decimal? @db.Decimal(10, 2)
  
  // Details
  deliverables String[]
  timelineDays Int?
  
  // Status
  isActive    Boolean @default(true)
  isPublic    Boolean @default(false)
  
  agency      Agency @relation(fields: [agencyId], references: [id], onDelete: Cascade)
  projects    ProjectService[]
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("services")
}

enum ServiceCategory {
  WEB_DESIGN
  WEB_DEVELOPMENT
  SEO
  CONTENT
  MAINTENANCE
  HOSTING
  CONSULTING
}

enum PricingType {
  FIXED
  HOURLY
  RETAINER
}

// ============================================
// PROJECTS
// ============================================

model Project {
  id          String @id @default(cuid())
  agencyId    String
  clientId    String
  
  // Basic Info
  name        String
  description String?
  status      ProjectStatus @default(LEAD)
  priority    ProjectPriority @default(MEDIUM)
  
  // Timeline
  startDate   DateTime?
  targetDate  DateTime?
  completedDate DateTime?
  
  // Financial
  budget      Decimal? @db.Decimal(10, 2)
  
  // Relations
  agency      Agency @relation(fields: [agencyId], references: [id], onDelete: Cascade)
  client      Client @relation(fields: [clientId], references: [id], onDelete: Cascade)
  creatorId   String
  creator     User   @relation("ProjectCreator", fields: [creatorId], references: [id])
  
  services    ProjectService[]
  phases      ProjectPhase[]
  tasks       Task[]
  files       File[]
  comments    Comment[]
  invoices    Invoice[]
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("projects")
}

enum ProjectStatus {
  LEAD
  PROPOSAL
  CONTRACT
  IN_PROGRESS
  REVIEW
  LAUNCHED
  COMPLETED
  ON_HOLD
  CANCELLED
}

enum ProjectPriority {
  LOW
  MEDIUM
  HIGH
  URGENT
}

// Project Services (many-to-many with details)
model ProjectService {
  id          String @id @default(cuid())
  projectId   String
  serviceId   String
  
  // Custom pricing for this project
  price       Decimal @db.Decimal(10, 2)
  quantity    Int @default(1)
  
  project     Project @relation(fields: [projectId], references: [id], onDelete: Cascade)
  service     Service @relation(fields: [serviceId], references: [id], onDelete: Cascade)
  
  @@map("project_services")
}

// ============================================
// PROJECT PHASES & TASKS
// ============================================

model ProjectPhase {
  id          String @id @default(cuid())
  projectId   String
  
  name        String
  description String?
  order       Int
  status      PhaseStatus @default(PENDING)
  
  startDate   DateTime?
  dueDate     DateTime?
  completedAt DateTime?
  
  project     Project @relation(fields: [projectId], references: [id], onDelete: Cascade)
  tasks       Task[]
  
  @@map("project_phases")
}

enum PhaseStatus {
  PENDING
  IN_PROGRESS
  COMPLETED
  BLOCKED
}

model Task {
  id          String @id @default(cuid())
  projectId   String
  phaseId     String?
  
  title       String
  description String?
  status      TaskStatus @default(TODO)
  priority    TaskPriority @default(MEDIUM)
  
  // Time tracking
  estimatedHours Float?
  actualHours    Float @default(0)
  
  // Dates
  dueDate     DateTime?
  completedAt DateTime?
  
  // Relations
  project     Project @relation(fields: [projectId], references: [id], onDelete: Cascade)
  phase       ProjectPhase? @relation(fields: [phaseId], references: [id])
  assigneeId  String?
  assignee    User?   @relation("TaskAssignee", fields: [assigneeId], references: [id])
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("tasks")
}

enum TaskStatus {
  TODO
  IN_PROGRESS
  IN_REVIEW
  COMPLETED
  CANCELLED
}

enum TaskPriority {
  LOW
  MEDIUM
  HIGH
  URGENT
}

// ============================================
// FILES & ASSETS
// ============================================

model File {
  id          String @id @default(cuid())
  projectId   String?
  
  name        String
  fileName    String
  mimeType    String
  size        Int
  url         String
  thumbnailUrl String?
  
  category    FileCategory @default(ASSET)
  
  // Relations
  project     Project? @relation(fields: [projectId], references: [id], onDelete: SetNull)
  
  uploadedAt  DateTime @default(now())
  
  @@map("files")
}

enum FileCategory {
  CONTRACT
  DESIGN
  ASSET
  DOCUMENT
  INVOICE
  OTHER
}

// ============================================
// INVOICING
// ============================================

model Invoice {
  id          String @id @default(cuid())
  agencyId    String
  clientId    String
  projectId   String?
  
  // Invoice Details
  invoiceNumber String @unique
  status      InvoiceStatus @default(DRAFT)
  
  // Dates
  issueDate   DateTime @default(now())
  dueDate     DateTime
  paidAt      DateTime?
  
  // Amounts
  subtotal    Decimal @db.Decimal(10, 2)
  taxRate     Decimal? @db.Decimal(5, 2)
  taxAmount   Decimal? @db.Decimal(10, 2)
  total       Decimal @db.Decimal(10, 2)
  
  // Stripe
  stripeInvoiceId String?
  
  // Relations
  agency      Agency @relation(fields: [agencyId], references: [id], onDelete: Cascade)
  client      Client @relation(fields: [clientId], references: [id], onDelete: Cascade)
  project     Project? @relation(fields: [projectId], references: [id])
  items       InvoiceItem[]
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("invoices")
}

enum InvoiceStatus {
  DRAFT
  SENT
  VIEWED
  PARTIAL
  PAID
  OVERDUE
  CANCELLED
}

model InvoiceItem {
  id          String @id @default(cuid())
  invoiceId   String
  
  description String
  quantity    Int @default(1)
  unitPrice   Decimal @db.Decimal(10, 2)
  total       Decimal @db.Decimal(10, 2)
  
  invoice     Invoice @relation(fields: [invoiceId], references: [id], onDelete: Cascade)
  
  @@map("invoice_items")
}

// ============================================
// SUPPORT TICKETS
// ============================================

model Ticket {
  id          String @id @default(cuid())
  agencyId    String
  clientId    String
  
  title       String
  description String
  status      TicketStatus @default(OPEN)
  priority    TicketPriority @default(MEDIUM)
  category    TicketCategory @default(GENERAL)
  
  // Relations
  agency      Agency @relation(fields: [agencyId], references: [id], onDelete: Cascade)
  client      Client @relation(fields: [clientId], references: [id], onDelete: Cascade)
  assigneeId  String?
  assignee    User? @relation("TicketAssignee", fields: [assigneeId], references: [id])
  comments    Comment[]
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  resolvedAt  DateTime?
  
  @@map("tickets")
}

enum TicketStatus {
  OPEN
  IN_PROGRESS
  WAITING_CLIENT
  RESOLVED
  CLOSED
}

enum TicketPriority {
  LOW
  MEDIUM
  HIGH
  URGENT
}

enum TicketCategory {
  GENERAL
  BUG
  FEATURE_REQUEST
  BILLING
  TECHNICAL_SUPPORT
}

// ============================================
// COMMENTS & ACTIVITY
// ============================================

model Comment {
  id          String @id @default(cuid())
  
  // Polymorphic relation
  projectId   String?
  ticketId    String?
  taskId      String?
  
  content     String
  
  // Relations
  authorId    String
  author      User @relation(fields: [authorId], references: [id])
  project     Project? @relation(fields: [projectId], references: [id], onDelete: Cascade)
  ticket      Ticket? @relation(fields: [ticketId], references: [id], onDelete: Cascade)
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("comments")
}

model ActivityLog {
  id          String @id @default(cuid())
  userId      String
  
  action      String
  entityType  String
  entityId    String?
  metadata    Json?
  
  user        User @relation(fields: [userId], references: [id])
  
  createdAt   DateTime @default(now())
  
  @@map("activity_logs")
}

// ============================================
// NOTIFICATIONS
// ============================================

model Notification {
  id          String @id @default(cuid())
  userId      String
  
  type        NotificationType
  title       String
  message     String
  data        Json?
  
  isRead      Boolean @default(false)
  readAt      DateTime?
  
  user        User @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  createdAt   DateTime @default(now())
  
  @@map("notifications")
}

enum NotificationType {
  PROJECT_UPDATE
  TASK_ASSIGNED
  COMMENT_ADDED
  INVOICE_CREATED
  PAYMENT_RECEIVED
  TICKET_UPDATE
  MILESTONE_REACHED
}

// ============================================
// SEO & ANALYTICS (Per Project)
// ============================================

model ProjectSEO {
  id          String @id @default(cuid())
  projectId   String @unique
  
  // Audit Results
  auditDate   DateTime?
  overallScore Int?
  
  // Core Web Vitals
  lcp         Float? // Largest Contentful Paint
  fid         Float? // First Input Delay
  cls         Float? // Cumulative Layout Shift
  fcp         Float? // First Contentful Paint
  ttfb        Float? // Time to First Byte
  
  // SEO Metrics
  pageSpeedScore   Int?
  mobileScore      Int?
  seoScore         Int?
  
  // Rankings (stored as JSON for flexibility)
  keywordRankings  Json?
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("project_seo")
}

// ============================================
// QUOTE REQUESTS
// ============================================

model QuoteRequest {
  id          String @id @default(cuid())
  agencyId    String?
  
  // Contact Info
  name        String
  email       String
  phone       String?
  company     String?
  
  // Project Details
  projectType String
  budget      String?
  timeline    String?
  description String
  
  // Status
  status      QuoteStatus @default(NEW)
  
  // Source
  source      String? // utm_source, referrer
  
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  @@map("quote_requests")
}

enum QuoteStatus {
  NEW
  CONTACTED
  QUALIFIED
  PROPOSAL_SENT
  ACCEPTED
  DECLINED
  ARCHIVED
}
```

---

## 🔌 API Endpoints

### REST API Structure

```
/api/v1/
├── auth/           # Clerk webhook handlers
├── users/
│   ├── GET /me
│   ├── PUT /me
│   └── GET /:id
├── agencies/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── PUT /:id
│   ├── DELETE /:id
│   ├── GET /:id/members
│   └── POST /:id/invite
├── clients/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── PUT /:id
│   └── GET /:id/projects
├── projects/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── PUT /:id
│   ├── DELETE /:id
│   ├── GET /:id/phases
│   ├── GET /:id/tasks
│   ├── GET /:id/files
│   └── POST /:id/comments
├── tasks/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── PUT /:id
│   └── POST /:id/complete
├── invoices/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── POST /:id/send
│   └── POST /:id/mark-paid
├── tickets/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   ├── PUT /:id
│   └── POST /:id/comments
├── services/
│   ├── GET /
│   ├── POST /
│   ├── GET /:id
│   └── PUT /:id
├── files/
│   ├── POST /upload (presigned URL)
│   └── DELETE /:id
├── quotes/
│   ├── POST /request (public)
│   └── GET / (admin only)
└── webhooks/
    ├── stripe
    ├── clerk
    └── resend
```

### GraphQL (Future)

Consider Apollo Server for complex queries:
- Project dashboard data aggregation
- Analytics & reporting
- Search functionality

---

## 🔗 Integration Requirements

### Stripe Integration

```typescript
// Features needed:
- Checkout sessions for one-time payments
- Subscription management
- Customer portal (self-service)
- Invoice generation
- Webhook handling
- Usage-based billing (future)
```

**Webhook Events:**
- `invoice.paid`
- `invoice.payment_failed`
- `customer.subscription.created`
- `customer.subscription.updated`
- `customer.subscription.deleted`

### Clerk Integration

```typescript
// Features needed:
- Email/password auth
- OAuth (Google, GitHub)
- Organization/team support
- Role-based access control
- Session management
- Webhook handling
```

**Webhook Events:**
- `user.created`
- `user.updated`
- `session.created`
- `organization.created`
- `organizationMembership.created`

### External SEO Tools

```typescript
// PageSpeed Insights API
- Automated Core Web Vitals checks
- Performance monitoring

// Google Search Console API
- Keyword ranking data
- Click/impression metrics

// Ahrefs/SEMrush API (future)
- Backlink analysis
- Competitor research
```

### Hosting/DNS APIs

```typescript
// Cloudflare API
- DNS record management
- SSL certificate provisioning
- Page rules for redirects

// Vercel API
- Project deployment
- Domain configuration
- Environment variables
```

### Communication

```typescript
// Resend (Email)
- Transactional emails
- Invoice notifications
- Project updates

// Slack API (future)
- Team notifications
- Client updates
```

---

## 🏢 Multi-Tenant Architecture

### Data Isolation Strategy

**Row-Level Security (RLS) with PostgreSQL:**

```sql
-- Enable RLS on all tables
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;

-- Policy: Users can only see their agency's data
CREATE POLICY projects_isolation ON projects
  USING (agency_id IN (
    SELECT agency_id FROM agency_members WHERE user_id = current_user_id()
  ));
```

**Application-Level Enforcement:**

```typescript
// All queries must include agency filter
const projects = await prisma.project.findMany({
  where: {
    agencyId: currentUser.agencyId, // Enforced
  }
});
```

### Tenant Identification

1. **Subdomain**: `agency-slug.pinkbeam.ai`
2. **Custom Domain**: `client-domain.com` → verified and mapped
3. **Path-based**: `pinkbeam.ai/a/agency-slug` (fallback)

### Middleware Implementation

```typescript
// middleware.ts
import { authMiddleware } from '@clerk/nextjs';
import { resolveTenant } from '@/lib/tenant';

export default authMiddleware({
  publicRoutes: ['/', '/web', '/api/webhooks/*'],
  async afterAuth(auth, req) {
    // Resolve tenant from subdomain or custom domain
    const tenant = await resolveTenant(req);
    req.headers.set('x-tenant-id', tenant.id);
  }
});
```

---

## 🔒 Security Architecture

### Authentication Flow

```
User → Clerk SDK → Clerk Servers → JWT Token → Our API
                              ↓
                        Webhook → Create/Update User in DB
```

### Authorization (RBAC)

```typescript
// Permission matrix
const permissions = {
  'project:read': ['CLIENT', 'DEVELOPER', 'ADMIN'],
  'project:write': ['DEVELOPER', 'ADMIN'],
  'project:delete': ['ADMIN'],
  'invoice:read': ['CLIENT', 'ADMIN'],
  'invoice:write': ['ADMIN'],
  'agency:manage': ['ADMIN'],
};
```

### Data Protection

- **Encryption at rest**: PostgreSQL with AES-256
- **Encryption in transit**: TLS 1.3
- **PII handling**: Minimal collection, encrypted storage
- **File uploads**: Virus scanning, size limits, type validation

---

## 📊 Caching Strategy

### Redis Cache Layers

```typescript
// Session caching (Clerk handled, but we cache lookups)
// Project lists (TTL: 5 minutes)
// User permissions (TTL: 15 minutes)
// Analytics data (TTL: 1 hour)
// SEO reports (TTL: 24 hours)
```

### CDN Caching (Vercel Edge)

```typescript
// Static assets: 1 year
// Public pages: 1 hour
// Authenticated pages: no cache
// API responses: vary by endpoint
```

---

## 🚀 Deployment Architecture

### Environment Strategy

| Environment | URL | Database | Purpose |
|-------------|-----|----------|---------|
| **Production** | pinkbeam.ai | Supabase Prod | Live site |
| **Staging** | staging.pinkbeam.ai | Supabase Staging | Pre-release testing |
| **Preview** | *.vercel.app | Supabase Staging | PR previews |
| **Local** | localhost | Docker/local | Development |

### CI/CD Pipeline

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck
      - run: npm run test

  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: vercel/action-deploy@v1
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
```

---

## 📈 Scalability Considerations

### Database

- **Read replicas** for reporting queries
- **Connection pooling** (PgBouncer)
- **Sharding** if agencies > 10,000 (future)

### Application

- **Serverless functions** scale automatically
- **Edge functions** for global low-latency
- **Background jobs** for heavy processing

### Storage

- **R2** is automatically scalable
- **Image optimization** on-demand

---

## 📝 Change Log

| Date | Change | Author |
|------|--------|--------|
| 2026-02-09 | Initial architecture draft | CTO |

---

*See [ROADMAP.md](./ROADMAP.md) for implementation phases*
