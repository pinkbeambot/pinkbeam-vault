# Pink Beam Solutions — Technical Architecture

**Architecture for the Strategic Consulting Platform**

---

## 🏗️ Overview

Pink Beam Solutions is a comprehensive consulting platform that combines client-facing marketing content with authenticated portals for engagement management, deliverable collaboration, and resource access. The platform serves three primary user types:

1. **Prospects** — Anonymous visitors exploring services
2. **Clients** — Authenticated users managing active engagements
3. **Consultants** — Internal team managing engagements and deliverables

---

## 📚 Tech Stack

### Frontend
| Layer | Technology | Purpose |
|-------|------------|---------|
| Framework | Next.js 15 (App Router) | SSR, SSG, API routes |
| Language | TypeScript | Type safety |
| Styling | Tailwind CSS | Utility-first CSS |
| Components | shadcn/ui | Accessible UI primitives |
| Animation | Framer Motion | Page transitions, micro-interactions |
| State | Zustand | Client state management |
| Forms | React Hook Form + Zod | Form handling and validation |
| Charts | Recharts | Data visualization |
| Calendar | react-big-calendar | Scheduling and booking |
| Editor | TipTap / BlockNote | Rich text editing |

### Backend
| Layer | Technology | Purpose |
|-------|------------|---------|
| API | Next.js API Routes + tRPC | Type-safe API |
| Database | PostgreSQL (Supabase) | Primary data store |
| ORM | Prisma | Database access |
| Auth | Supabase Auth | Multi-provider auth |
| Storage | Supabase Storage | File uploads |
| Search | Algolia | Document/resource search |
| Cache | Redis (Upstash) | Session, cache, rate limiting |
| Queue | Inngest / QStash | Background jobs |
| AI | OpenAI API | Document analysis, chat |
| PDF | Puppeteer / React-PDF | Document generation |

### Infrastructure
| Layer | Technology | Purpose |
|-------|------------|---------|
| Hosting | Vercel | Edge deployment |
| CDN | Vercel Edge Network | Asset delivery |
| Monitoring | Sentry | Error tracking |
| Analytics | PostHog | Product analytics |
| Email | Resend | Transactional emails |
| Calendar | Cal.com API | Workshop booking |
| Video | Whereby / Daily.co | Video calls |

---

## 🗄️ Data Model

### Core Entities

```
┌─────────────────────────────────────────────────────────────────┐
│                         USERS                                    │
├─────────────────────────────────────────────────────────────────┤
│ id (PK)                                                          │
│ email                                                            │
│ role (prospect | client | consultant | admin)                   │
│ profile (json)                                                   │
│ company_id (FK)                                                  │
│ created_at                                                       │
│ updated_at                                                       │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                       COMPANIES                                  │
├─────────────────────────────────────────────────────────────────┤
│ id (PK)                                                          │
│ name                                                             │
│ industry                                                         │
│ size                                                             │
│ website                                                          │
│ billing_address                                                  │
│ created_at                                                       │
└─────────────────────────────────────────────────────────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          ▼                   ▼                   ▼
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│   ENGAGEMENTS    │ │     USERS       │ │   RESOURCES     │
├─────────────────┤ ├─────────────────┤ ├─────────────────┤
│ id (PK)          │ │ (company_users) │ │ id (PK)          │
│ company_id (FK)  │ │ company_id (FK) │ │ company_id (FK)  │
│ type             │ │ user_id (FK)    │ │ title            │
│ status           │ │ role            │ │ type             │
│ start_date       │ │ created_at      │ │ url              │
│ end_date         │ └─────────────────┘ │ metadata         │
│ value            │                     │ created_at       │
│ consultant_id    │                     └─────────────────┘
│ deliverables     │
└─────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│                      DELIVERABLES                                │
├─────────────────────────────────────────────────────────────────┤
│ id (PK)                                                          │
│ engagement_id (FK)                                               │
│ title                                                            │
│ type (document | presentation | spreadsheet | diagram)          │
│ status (draft | review | approved | delivered)                  │
│ version                                                          │
│ content (json - BlockNote format)                                │
│ file_url                                                         │
│ created_by                                                       │
│ created_at                                                       │
│ updated_at                                                       │
└─────────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│                     COLLABORATION                                │
├─────────────────────────────────────────────────────────────────┤
│ id (PK)                                                          │
│ deliverable_id (FK)                                              │
│ user_id (FK)                                                     │
│ type (comment | edit | approval)                                 │
│ content                                                          │
│ created_at                                                       │
└─────────────────────────────────────────────────────────────────┘
```

### Engagement Types

```typescript
enum EngagementType {
  WORKSHOP = 'workshop',           // Half-day intensive
  ASSESSMENT = 'assessment',       // 2-3 week analysis
  RETAINER = 'retainer',           // Monthly advisory
  PROJECT = 'project',             // Fixed-scope implementation
  FRACTIONAL_CTO = 'fractional_cto' // Embedded leadership
}

enum EngagementStatus {
  PROPOSED = 'proposed',           // SOW sent, awaiting signature
  ONBOARDING = 'onboarding',       // Contract signed, kickoff prep
  ACTIVE = 'active',               // Work in progress
  COMPLETED = 'completed',         // Deliverables finalized
  ARCHIVED = 'archived'            // Historical record
}
```

### Deliverable Schema

```typescript
interface Deliverable {
  id: string;
  engagement_id: string;
  title: string;
  type: 'strategy_doc' | 'roadmap' | 'assessment' | 'architecture' | 'playbook';
  status: 'draft' | 'in_review' | 'approved' | 'delivered';
  content: BlockNoteDocument;      // Structured editor content
  template_id?: string;            // If created from template
  version: number;
  versions: Version[];             // Version history
  feedback: Feedback[];            // Client comments
  approvals: Approval[];           // Sign-off tracking
  due_date?: Date;
  completed_at?: Date;
}
```

---

## 🎨 Frontend Architecture

### Route Structure

```
/solutions                    # Public marketing site
├── /                         # Landing page
├── /services                 # Service overview
│   ├── /digital-transformation
│   ├── /ai-strategy
│   ├── /process-automation
│   ├── /technology-architecture
│   └── /growth-strategy
├── /engagement-models        # How we work
│   ├── /workshops
│   ├── /assessments
│   ├── /retainers
│   ├── /projects
│   └── /fractional-cto
├── /case-studies             # Success stories
│   └── /[slug]
├── /insights                 # Thought leadership
│   ├── /blog
│   ├── /whitepapers
│   └── /resources
├── /about                    # Team and approach
└── /contact                  # Get in touch

/solutions/portal             # Client portal (auth required)
├── /dashboard                # Overview of all engagements
├── /engagements              # Engagement list
│   └── /[id]                 # Single engagement view
│       ├── /roadmap          # Interactive roadmap
│       ├── /deliverables     # Documents and deliverables
│       ├── /meetings         # Meeting notes and recordings
│       └── /files            # Shared file repository
├── /documents                # All deliverables across engagements
│   └── /[id]                 # Document editor/viewer
├── /resources                # Resource library access
├── /booking                  # Schedule workshops/calls
├── /billing                  # Invoices and payments
└── /settings                 # Profile and preferences

/solutions/admin              # Consultant portal (admin only)
├── /dashboard                # Practice overview
├── /clients                  # Client management
├── /engagements              # All engagements
├── /deliverables             # Document creation
├── /templates                # Deliverable templates
├── /workshop-booking         # Workshop scheduling
├── /analytics                # Practice metrics
└── /proposals                # Quote generation
```

### Component Architecture

```
app/
├── (marketing)/              # Public marketing pages
│   ├── layout.tsx            # Marketing layout with nav/footer
│   ├── page.tsx              # Landing page
│   ├── services/
│   ├── engagement-models/
│   ├── case-studies/
│   └── insights/
│
├── (portal)/                 # Client portal
│   ├── layout.tsx            # Portal layout with sidebar
│   ├── dashboard/
│   ├── engagements/
│   ├── documents/
│   ├── resources/
│   └── booking/
│
├── (admin)/                  # Consultant portal
│   ├── layout.tsx            # Admin layout
│   ├── dashboard/
│   ├── clients/
│   ├── engagements/
│   └── templates/
│
├── api/                      # API routes
│   ├── trpc/                 # tRPC router
│   ├── webhooks/             # Stripe, Cal.com, etc.
│   └── cron/                 # Scheduled jobs
│
└── auth/                     # Auth pages
    ├── callback/
    └── login/

components/
├── marketing/                # Public site components
│   ├── hero/
│   ├── service-cards/
│   ├── case-study-preview/
│   └── pricing/
│
├── portal/                   # Client portal components
│   ├── navigation/
│   ├── engagement-card/
│   ├── roadmap-timeline/
│   ├── deliverable-list/
│   └── resource-browser/
│
├── admin/                    # Admin components
│   ├── client-manager/
│   ├── engagement-builder/
│   ├── deliverable-editor/
│   └── template-library/
│
├── shared/                   # Shared components
│   ├── document-editor/      # TipTap/BlockNote wrapper
│   ├── roadmap-visualizer/   # Gantt/timeline charts
│   ├── booking-calendar/     # Cal.com integration
│   └── file-uploader/        # Supabase storage
│
└── ui/                       # shadcn/ui components

lib/
├── trpc/                     # tRPC setup
│   ├── routers/
│   │   ├── engagement.ts
│   │   ├── deliverable.ts
│   │   ├── client.ts
│   │   ├── booking.ts
│   │   └── resource.ts
│   ├── trpc.ts
│   └── client.ts
│
├── supabase/                 # Supabase client
│   ├── client.ts
│   ├── server.ts
│   └── admin.ts
│
├── prisma/                   # Database
│   └── schema.prisma
│
├── ai/                       # AI integrations
│   ├── document-analysis.ts
│   ├── chat-assistant.ts
│   └── content-generation.ts
│
└── utils/
    ├── pdf-generator.ts
    ├── email-templates.ts
    └── formatting.ts

hooks/
├── use-engagement.ts
├── use-deliverables.ts
├── use-documents.ts
├── use-booking.ts
└── use-analytics.ts

stores/
├── portal-store.ts           # Client portal state
├── editor-store.ts           # Document editor state
└── ui-store.ts               # UI state (sidebar, modals)

types/
├── engagement.ts
├── deliverable.ts
├── client.ts
└── api.ts
```

---

## 🔧 Backend Architecture

### tRPC Router Structure

```typescript
// routers/engagement.ts
export const engagementRouter = createTRPCRouter({
  // Queries
  list: protectedProcedure
    .input(z.object({ status: z.enum(['active', 'completed']).optional() }))
    .query(({ ctx, input }) => {
      // List engagements for current user
    }),
  
  getById: protectedProcedure
    .input(z.object({ id: z.string() }))
    .query(({ ctx, input }) => {
      // Get single engagement with details
    }),
  
  getRoadmap: protectedProcedure
    .input(z.object({ engagementId: z.string() }))
    .query(({ ctx, input }) => {
      // Get roadmap milestones
    }),
  
  // Mutations
  create: adminProcedure
    .input(EngagementCreateSchema)
    .mutation(({ ctx, input }) => {
      // Create new engagement
    }),
  
  update: adminProcedure
    .input(EngagementUpdateSchema)
    .mutation(({ ctx, input }) => {
      // Update engagement details
    }),
  
  addMilestone: adminProcedure
    .input(MilestoneSchema)
    .mutation(({ ctx, input }) => {
      // Add roadmap milestone
    }),
  
  completeMilestone: protectedProcedure
    .input(z.object({ milestoneId: z.string() }))
    .mutation(({ ctx, input }) => {
      // Mark milestone complete
    }),
});

// routers/deliverable.ts
export const deliverableRouter = createTRPCRouter({
  list: protectedProcedure
    .input(z.object({ engagementId: z.string() }))
    .query(({ ctx, input }) => {
      // List deliverables for engagement
    }),
  
  getById: protectedProcedure
    .input(z.object({ id: z.string() }))
    .query(({ ctx, input }) => {
      // Get deliverable with content
    }),
  
  create: adminProcedure
    .input(DeliverableCreateSchema)
    .mutation(({ ctx, input }) => {
      // Create new deliverable from template or blank
    }),
  
  update: protectedProcedure
    .input(DeliverableUpdateSchema)
    .mutation(({ ctx, input }) => {
      // Update content, save version
    }),
  
  addComment: protectedProcedure
    .input(CommentSchema)
    .mutation(({ ctx, input }) => {
      // Add feedback comment
    }),
  
  requestApproval: adminProcedure
    .input(z.object({ deliverableId: z.string() }))
    .mutation(({ ctx, input }) => {
      // Send approval request to client
    }),
  
  approve: protectedProcedure
    .input(z.object({ deliverableId: z.string(), signature: z.string() }))
    .mutation(({ ctx, input }) => {
      // Client approves deliverable
    }),
});
```

### Background Jobs (Inngest)

```typescript
// Jobs for the platform

// Generate deliverable PDF when approved
export const generatePdf = inngest.createFunction(
  { id: 'generate-deliverable-pdf' },
  { event: 'deliverable.approved' },
  async ({ event, step }) => {
    // 1. Render React component to HTML
    const html = await step.run('render-html', () => 
      renderDeliverableToHtml(event.data.deliverableId)
    );
    
    // 2. Convert HTML to PDF via Puppeteer
    const pdf = await step.run('generate-pdf', () =>
      generatePdfFromHtml(html)
    );
    
    // 3. Upload to Supabase Storage
    await step.run('upload-pdf', () =>
      uploadToStorage(pdf, `deliverables/${event.data.deliverableId}.pdf`)
    );
    
    // 4. Notify client
    await step.run('send-notification', () =>
      sendEmail({
        to: event.data.clientEmail,
        template: 'deliverable-ready',
        data: { downloadUrl }
      })
    );
  }
);

// Send engagement reminders
export const engagementReminders = inngest.createFunction(
  { id: 'engagement-reminders' },
  { cron: '0 9 * * 1' }, // Every Monday at 9am
  async ({ step }) => {
    const upcomingMilestones = await step.run('fetch-milestones', () =>
      db.milestone.findMany({
        where: {
          dueDate: { lte: addDays(new Date(), 7) },
          status: { not: 'completed' }
        }
      })
    );
    
    for (const milestone of upcomingMilestones) {
      await step.run(`notify-${milestone.id}`, () =>
        sendReminderEmail(milestone)
      );
    }
  }
);

// Weekly progress digest
export const weeklyDigest = inngest.createFunction(
  { id: 'weekly-digest' },
  { cron: '0 17 * * 5' }, // Every Friday at 5pm
  async ({ step }) => {
    const activeEngagements = await step.run('fetch-engagements', () =>
      db.engagement.findMany({ where: { status: 'active' } })
    );
    
    for (const engagement of activeEngagements) {
      const summary = await step.run(`generate-summary-${engagement.id}`, () =>
        generateWeeklySummary(engagement.id)
      );
      
      await step.run(`send-digest-${engagement.id}`, () =>
        sendWeeklyDigest(engagement, summary)
      );
    }
  }
);
```

---

## 🔐 Authentication & Authorization

### Role-Based Access Control (RBAC)

```typescript
// Role hierarchy
enum Role {
  PROSPECT = 'prospect',           // Anonymous visitor
  CLIENT = 'client',               // Authenticated client
  CONSULTANT = 'consultant',       // Pink Beam team member
  ADMIN = 'admin'                  // Full platform access
}

// Permission matrix
const permissions = {
  engagement: {
    create: ['consultant', 'admin'],
    read: ['client', 'consultant', 'admin'],
    update: ['consultant', 'admin'],
    delete: ['admin'],
  },
  deliverable: {
    create: ['consultant', 'admin'],
    read: ['client', 'consultant', 'admin'], // Client only sees their own
    update: ['consultant', 'admin'],          // Client can comment, not edit
    approve: ['client', 'admin'],
  },
  template: {
    create: ['consultant', 'admin'],
    read: ['consultant', 'admin'],
    update: ['consultant', 'admin'],
    delete: ['admin'],
  },
  client: {
    create: ['consultant', 'admin'],
    read: ['consultant', 'admin'],
    update: ['consultant', 'admin'],
    delete: ['admin'],
  }
};

// Row Level Security (RLS) policies for Supabase
-- Clients can only see their company's data
CREATE POLICY "Clients see own company" ON engagements
  FOR ALL USING (
    company_id IN (
      SELECT company_id FROM company_users 
      WHERE user_id = auth.uid()
    )
  );

-- Consultants can see all data
CREATE POLICY "Consultants see all" ON engagements
  FOR ALL USING (
    auth.jwt() ->> 'role' IN ('consultant', 'admin')
  );
```

---

## 📦 Document & Deliverable Management

### BlockNote Schema for Rich Content

```typescript
// Document structure using BlockNote
interface StrategyDocument {
  blocks: [
    // Title block
    {
      type: 'heading',
      props: { level: 1 },
      content: 'Digital Transformation Strategy'
    },
    // Executive summary
    {
      type: 'callout',
      props: { type: 'info' },
      content: 'Key findings and recommendations...'
    },
    // Section header
    {
      type: 'heading',
      props: { level: 2 },
      content: 'Current State Assessment'
    },
    // Rich text content
    {
      type: 'paragraph',
      content: [
        { type: 'text', text: 'Based on our analysis, ' },
        { type: 'text', text: 'three key areas', styles: { bold: true } },
        { type: 'text', text: ' require immediate attention...' }
      ]
    },
    // Embedded chart
    {
      type: 'chart',
      props: { 
        chartType: 'maturity',
        data: [...]
      }
    },
    // Table
    {
      type: 'table',
      content: {
        rows: [
          ['Initiative', 'Priority', 'Timeline', 'Owner'],
          ['...', '...', '...', '...']
        ]
      }
    },
    // Roadmap embed
    {
      type: 'roadmap',
      props: { 
        engagementId: '...',
        milestones: [...]
      }
    }
  ]
}
```

### Version Control

```typescript
// Versioning system for deliverables
interface Version {
  id: string;
  deliverableId: string;
  versionNumber: number;
  content: BlockNoteDocument;
  createdBy: string;
  createdAt: Date;
  changeSummary: string;
  diff: DiffResult;  // Structural diff between versions
}

// Create new version on save
async function saveDeliverable(
  deliverableId: string, 
  content: BlockNoteDocument,
  changeSummary: string
) {
  const current = await getCurrentVersion(deliverableId);
  const newVersion = await db.version.create({
    data: {
      deliverableId,
      versionNumber: current.versionNumber + 1,
      content,
      changeSummary,
      diff: calculateDiff(current.content, content)
    }
  });
  
  // Update deliverable to point to new version
  await db.deliverable.update({
    where: { id: deliverableId },
    data: { 
      content,
      version: newVersion.versionNumber 
    }
  });
}
```

---

## 📅 Workshop Booking System

### Integration with Cal.com

```typescript
// Workshop types with Cal.com event types
const workshopTypes = {
  'strategy-intensive': {
    calEventTypeId: 'strategy-intensive-4h',
    duration: 240, // 4 hours
    price: 3500,
    prepSession: true,
    maxParticipants: 8
  },
  'ai-opportunity': {
    calEventTypeId: 'ai-opportunity-2h',
    duration: 120,
    price: 2500,
    prepSession: false,
    maxParticipants: 6
  },
  'assessment-kickoff': {
    calEventTypeId: 'assessment-kickoff-1h',
    duration: 60,
    price: 0, // Included in assessment
    prepSession: false,
    maxParticipants: 10
  }
};

// Booking flow
async function bookWorkshop(
  workshopType: string,
  date: Date,
  clientEmail: string,
  participants: string[]
) {
  // 1. Create booking in Cal.com
  const booking = await cal.bookings.create({
    eventTypeId: workshopTypes[workshopType].calEventTypeId,
    start: date,
    attendee: {
      email: clientEmail,
      name: clientName,
      timeZone: clientTimeZone
    },
    guests: participants,
    metadata: {
      source: 'solutions-portal',
      companyId: company.id
    }
  });
  
  // 2. Create engagement record
  const engagement = await db.engagement.create({
    data: {
      type: 'WORKSHOP',
      companyId: company.id,
      status: 'ONBOARDING',
      startDate: date,
      value: workshopTypes[workshopType].price,
      metadata: {
        calBookingId: booking.id,
        workshopType,
        participants
      }
    }
  });
  
  // 3. Send prep materials
  await sendPrepEmail(clientEmail, workshopType, booking);
  
  // 4. Create calendar holds for Pink Beam team
  await createInternalCalendarEvent(booking, engagement.id);
  
  return { booking, engagement };
}
```

---

## 📊 Analytics & Reporting

### Practice Metrics

```typescript
// Key metrics tracked
interface PracticeMetrics {
  // Revenue
  mrr: number;                          // Monthly recurring revenue
  projectRevenue: number;               // One-time project revenue
  pipelineValue: number;                // Proposed engagements
  
  // Engagement health
  activeEngagements: number;
  avgEngagementValue: number;
  avgEngagementDuration: number;        // Days
  onTimeDeliveryRate: number;           // %
  clientSatisfaction: number;           // NPS score
  
  // Utilization
  consultantUtilization: number;        // Billable hours %
  capacityRemaining: number;            // Hours available
  
  // Sales
  proposalWinRate: number;              // %
  avgSalesCycle: number;                // Days
  leadConversionRate: number;           // %
}

// Real-time dashboard data
async function getPracticeMetrics(timeRange: DateRange) {
  return {
    revenue: await calculateRevenue(timeRange),
    engagements: await getEngagementMetrics(timeRange),
    pipeline: await getPipelineMetrics(),
    utilization: await getUtilizationMetrics(timeRange)
  };
}
```

---

## 🔄 Integration Architecture

### External Services

```
┌────────────────────────────────────────────────────────────────┐
│                    Pink Beam Solutions                         │
│                      (Next.js + Supabase)                      │
└──────────────┬─────────────────────────────────┬───────────────┘
               │                                 │
    ┌──────────▼──────────┐          ┌───────────▼──────────┐
    │    Cal.com API      │          │   Supabase Auth      │
    │  (Workshop Booking) │          │  (Authentication)    │
    └─────────────────────┘          └──────────────────────┘
    ┌──────────┬──────────┐
    │          │          │
    ▼          ▼          ▼
┌────────┐ ┌────────┐ ┌────────┐
│ Stripe │ │ OpenAI │ │ Algolia│
│(Billing)│ │  (AI)  │ │(Search)│
└────────┘ └────────┘ └────────┘
    ┌──────────┬──────────┐
    │          │          │
    ▼          ▼          ▼
┌────────┐ ┌────────┐ ┌────────┐
│ Resend │ │ Sentry │ │PostHog │
│ (Email)│ │(Errors)│ │(Product)│
└────────┘ └────────┘ └────────┘
```

---

## 🚀 Deployment & DevOps

### Environment Strategy

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Local     │────▶│   Staging   │────▶│  Production │
│  (localhost)│     │ (staging.★) │     │  (pinkbeam) │
└─────────────┘     └─────────────┘     └─────────────┘
       │                   │                   │
       ▼                   ▼                   ▼
   Supabase            Supabase            Supabase
   (local)           (staging)           (production)
```

### CI/CD Pipeline (GitHub Actions)

```yaml
name: Deploy Solutions

on:
  push:
    branches: [main, develop]
    paths: ['apps/solutions/**']

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 20
      - run: npm ci
      - run: npm run test
      - run: npm run type-check
      - run: npm run lint

  deploy-staging:
    needs: test
    if: github.ref == 'refs/heads/develop'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: vercel/action-deploy@v1
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v3
      - uses: vercel/action-deploy@v1
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          vercel-args: '--prod'
```

---

## 📋 Database Migrations

### Migration Strategy

```typescript
// Using Prisma migrations
// 1. Make schema changes in schema.prisma
// 2. Generate migration: npx prisma migrate dev --name add-deliverable-versions
// 3. Apply to staging/production: npx prisma migrate deploy

// Example migration: Adding deliverable versioning
model Deliverable {
  id            String    @id @default(cuid())
  engagementId  String
  title         String
  content       Json      // BlockNote JSON
  version       Int       @default(1)
  versions      Version[] // Relation to version history
  status        DeliverableStatus @default(DRAFT)
  createdAt     DateTime  @default(now())
  updatedAt     DateTime  @updatedAt
  
  @@index([engagementId])
}

model Version {
  id              String     @id @default(cuid())
  deliverableId   String
  deliverable     Deliverable @relation(fields: [deliverableId], references: [id])
  versionNumber   Int
  content         Json
  changeSummary   String?
  createdBy       String
  createdAt       DateTime   @default(now())
  
  @@unique([deliverableId, versionNumber])
  @@index([deliverableId])
}
```

---

## 📱 Progressive Enhancement

### Mobile Strategy

```
Public Marketing Site        Client Portal
       │                          │
       ▼                          ▼
┌──────────────┐           ┌──────────────┐
│   Mobile     │           │   Mobile     │
│  Responsive  │           │  Responsive  │
│   (Tailwind) │           │   (Tailwind) │
└──────────────┘           └──────────────┘
       │                          │
       ▼                          ▼
┌──────────────┐           ┌──────────────┐
│  PWA Install │           │  PWA Install │
│   (Optional) │           │  (Recommended)│
└──────────────┘           └──────────────┘
```

### Performance Budgets

- **First Contentful Paint**: < 1.5s
- **Largest Contentful Paint**: < 2.5s
- **Time to Interactive**: < 3.5s
- **Cumulative Layout Shift**: < 0.1
- **Total Bundle Size**: < 200KB (initial)

---

## 🔒 Security Considerations

### Data Protection

- **Encryption at Rest**: Supabase encrypts all data
- **Encryption in Transit**: TLS 1.3 for all connections
- **PII Handling**: Minimal collection, encrypted storage
- **Document Access**: RLS policies ensure client isolation

### Compliance

- **SOC 2**: Target certification by Q3 2026
- **GDPR**: Data export and deletion capabilities
- **CCPA**: Privacy controls for California residents

### Security Scanning

- **Dependency Scanning**: Snyk on every PR
- **SAST**: CodeQL analysis
- **Secrets Scanning**: GitHub secret scanning
- **Container Scanning**: Trivy for base images

---

*Last Updated: 2026-02-09*
