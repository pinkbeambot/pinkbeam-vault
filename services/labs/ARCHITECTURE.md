# Pink Beam Labs — Technical Architecture

This document describes the technical architecture of the Labs client platform—a comprehensive project management and collaboration system for our software development agency.

---

## 🏛️ Architecture Overview

### Design Principles
1. **Multi-tenant by design** — Each client organization is isolated
2. **API-first** — All functionality available via REST and tRPC
3. **Real-time** — WebSocket connections for live updates
4. **Extensible** — Plugin architecture for integrations
5. **Secure** — Zero-trust, encrypted, audited

### High-Level Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        Client Layer                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────────┐ │
│  │  Web App    │  │ Mobile App  │  │   Partner Integrations  │ │
│  │  (Next.js)  │  │ (PWA/React) │  │   (GitHub, Slack, etc)  │ │
│  └──────┬──────┘  └──────┬──────┘  └───────────┬─────────────┘ │
└─────────┼────────────────┼──────────────────────┼───────────────┘
          │                │                      │
          └────────────────┴──────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                      API Gateway (Kong/AWS)                     │
│            Auth, Rate Limiting, SSL Termination                 │
└─────────────────────────────┬───────────────────────────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
┌─────────▼──────────┐ ┌──────▼───────┐ ┌─────────▼──────────┐
│    REST API        │ │   tRPC API   │ │  WebSocket Server  │
│   (Public/Ext)     │ │ (Internal)   │ │   (Real-time)      │
└─────────┬──────────┘ └──────┬───────┘ └─────────┬──────────┘
          │                   │                   │
          └───────────────────┼───────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                    Application Layer (Next.js App Router)       │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐           │
│  │  Auth    │ │ Projects │ │  Tasks   │ │  Time    │           │
│  │  Module  │ │  Module  │ │  Module  │ │ Tracking │           │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘           │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐           │
│  │ Invoices │ │  Files   │ │ GitHub   │ │  Slack   │           │
│  │  Module  │ │  Module  │ │  Sync    │ │  Sync    │           │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘           │
└─────────────────────────────┬───────────────────────────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
┌─────────▼──────────┐ ┌──────▼───────┐ ┌─────────▼──────────┐
│   PostgreSQL       │ │    Redis     │ │   File Storage     │
│   (Primary DB)     │ │   (Cache/    │ │   (S3/CloudFront)  │
│                    │ │   Queue)     │ │                    │
└────────────────────┘ └──────────────┘ └────────────────────┘
```

---

## 🛠️ Technology Stack

### Frontend
| Layer | Technology | Purpose |
|-------|------------|---------|
| Framework | Next.js 14+ | App Router, SSR, API routes |
| Language | TypeScript | Type safety |
| Styling | Tailwind CSS | Utility-first CSS |
| Components | shadcn/ui | Accessible component library |
| State | Zustand | Global state management |
| Forms | React Hook Form + Zod | Form handling & validation |
| Charts | Recharts | Data visualization |
| Tables | TanStack Table | Complex data tables |

### Backend
| Layer | Technology | Purpose |
|-------|------------|---------|
| Runtime | Node.js 20+ | Server runtime |
| Framework | Next.js API Routes | API endpoints |
| RPC | tRPC | Type-safe API calls |
| ORM | Prisma | Database access |
| Validation | Zod | Schema validation |
| Auth | Clerk | Authentication & authorization |
| Queue | BullMQ (Redis) | Background jobs |

### Database
| Layer | Technology | Purpose |
|-------|------------|---------|
| Primary | PostgreSQL 15+ | Relational data |
| Cache | Redis 7+ | Session, cache, queue |
| Search | PostgreSQL FTS | Full-text search |
| Analytics | ClickHouse (future) | Time-series analytics |

### Infrastructure
| Layer | Technology | Purpose |
|-------|------------|---------|
| Hosting | Vercel | Edge deployment |
| CDN | CloudFront | Static assets |
| Storage | S3 | File uploads |
| Email | Resend | Transactional email |
| Monitoring | Vercel Analytics | Performance |
| Logging | Datadog | Centralized logs |

### Integrations
| Service | Purpose |
|---------|---------|
| GitHub | Code repository sync |
| Slack | Notifications & chat |
| Stripe | Billing & invoicing |
| Linear | Issue tracking sync |
| Figma | Design handoff |
| Notion | Documentation sync |

---

## 🗄️ Database Schema

### Core Entities

```
┌────────────────────────────────────────────────────────────────┐
│                         organizations                          │
├────────────────────────────────────────────────────────────────┤
│ id (PK)              │ UUID                                     │
│ name                 │ VARCHAR(255)                             │
│ slug                 │ VARCHAR(100) UNIQUE                      │
│ plan                 │ ENUM (free, starter, growth, scale)      │
│ settings             │ JSONB                                    │
│ billing_email        │ VARCHAR(255)                             │
│ stripe_customer_id   │ VARCHAR(255)                             │
│ stripe_subscription_id │ VARCHAR(255)                           │
│ created_at           │ TIMESTAMP                                │
│ updated_at           │ TIMESTAMP                                │
└────────────────────────────────────────────────────────────────┘
                                 │
         ┌───────────────────────┼───────────────────────┐
         │                       │                       │
┌────────▼────────┐    ┌─────────▼──────────┐  ┌────────▼────────┐
│     users       │    │      projects      │  │    invoices     │
└─────────────────┘    └────────────────────┘  └─────────────────┘
```

### Organizations
```sql
CREATE TABLE organizations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(100) UNIQUE NOT NULL,
  plan plan_type DEFAULT 'free',
  settings JSONB DEFAULT '{}',
  billing_email VARCHAR(255),
  stripe_customer_id VARCHAR(255),
  stripe_subscription_id VARCHAR(255),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Users (Clerk-managed with local sync)
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  clerk_id VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  avatar_url TEXT,
  role user_role DEFAULT 'client',
  organization_id UUID REFERENCES organizations(id),
  timezone VARCHAR(50) DEFAULT 'America/Los_Angeles',
  notification_preferences JSONB DEFAULT '{}',
  last_active_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Projects
```sql
CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  status project_status DEFAULT 'planning',
  priority priority_level DEFAULT 'medium',
  start_date DATE,
  target_end_date DATE,
  actual_end_date DATE,
  budget_hours INTEGER,
  github_repo_url TEXT,
  slack_channel_id VARCHAR(100),
  settings JSONB DEFAULT '{}',
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_projects_org ON projects(organization_id);
CREATE INDEX idx_projects_status ON projects(status);
```

### Tasks
```sql
CREATE TABLE tasks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  organization_id UUID NOT NULL REFERENCES organizations(id),
  title VARCHAR(500) NOT NULL,
  description TEXT,
  status task_status DEFAULT 'backlog',
  priority priority_level DEFAULT 'medium',
  type task_type DEFAULT 'feature',
  assignee_id UUID REFERENCES users(id),
  reporter_id UUID REFERENCES users(id),
  estimated_hours DECIMAL(5,2),
  sprint_id UUID REFERENCES sprints(id),
  github_issue_number INTEGER,
  parent_task_id UUID REFERENCES tasks(id),
  due_date DATE,
  completed_at TIMESTAMPTZ,
  position INTEGER DEFAULT 0,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_tasks_project ON tasks(project_id);
CREATE INDEX idx_tasks_assignee ON tasks(assignee_id);
CREATE INDEX idx_tasks_status ON tasks(status);
CREATE INDEX idx_tasks_sprint ON tasks(sprint_id);
```

### Time Entries
```sql
CREATE TABLE time_entries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id),
  project_id UUID NOT NULL REFERENCES projects(id),
  task_id UUID REFERENCES tasks(id),
  organization_id UUID NOT NULL REFERENCES organizations(id),
  description TEXT,
  started_at TIMESTAMPTZ NOT NULL,
  ended_at TIMESTAMPTZ,
  duration_minutes INTEGER,
  billable BOOLEAN DEFAULT TRUE,
  hourly_rate DECIMAL(10,2),
  invoiced BOOLEAN DEFAULT FALSE,
  invoice_id UUID REFERENCES invoices(id),
  source time_entry_source DEFAULT 'manual',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_time_entries_user ON time_entries(user_id);
CREATE INDEX idx_time_entries_project ON time_entries(project_id);
CREATE INDEX idx_time_entries_date ON time_entries(started_at);
CREATE INDEX idx_time_entries_invoiced ON time_entries(invoiced) WHERE invoiced = FALSE;
```

### Invoices
```sql
CREATE TABLE invoices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id),
  project_id UUID REFERENCES projects(id),
  invoice_number VARCHAR(50) UNIQUE NOT NULL,
  status invoice_status DEFAULT 'draft',
  issue_date DATE NOT NULL,
  due_date DATE NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  tax_amount DECIMAL(10,2) DEFAULT 0,
  total_amount DECIMAL(10,2) NOT NULL,
  amount_paid DECIMAL(10,2) DEFAULT 0,
  stripe_invoice_id VARCHAR(255),
  stripe_payment_intent_id VARCHAR(255),
  paid_at TIMESTAMPTZ,
  notes TEXT,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE invoice_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
  description VARCHAR(500) NOT NULL,
  quantity DECIMAL(8,2) NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  time_entry_ids UUID[],
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_invoices_org ON invoices(organization_id);
CREATE INDEX idx_invoices_status ON invoices(status);
CREATE INDEX idx_invoices_due_date ON invoices(due_date);
```

### Sprints
```sql
CREATE TABLE sprints (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  goal TEXT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status sprint_status DEFAULT 'planning',
  total_points INTEGER DEFAULT 0,
  completed_points INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

### Files & Documents
```sql
CREATE TABLE files (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id),
  project_id UUID REFERENCES projects(id),
  task_id UUID REFERENCES tasks(id),
  uploaded_by UUID NOT NULL REFERENCES users(id),
  name VARCHAR(255) NOT NULL,
  original_name VARCHAR(255) NOT NULL,
  mime_type VARCHAR(100) NOT NULL,
  size_bytes BIGINT NOT NULL,
  s3_key VARCHAR(500) NOT NULL,
  s3_bucket VARCHAR(100) NOT NULL,
  public_url TEXT,
  version INTEGER DEFAULT 1,
  parent_version_id UUID REFERENCES files(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_files_org ON files(organization_id);
CREATE INDEX idx_files_project ON files(project_id);
```

### Activity Log
```sql
CREATE TABLE activity_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id),
  project_id UUID REFERENCES projects(id),
  user_id UUID REFERENCES users(id),
  action VARCHAR(50) NOT NULL,
  entity_type VARCHAR(50) NOT NULL,
  entity_id UUID NOT NULL,
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_activity_org ON activity_logs(organization_id);
CREATE INDEX idx_activity_project ON activity_logs(project_id);
CREATE INDEX idx_activity_created ON activity_logs(created_at DESC);
```

---

## 🔌 API Structure

### REST API (External/Public)

Base: `/api/v1`

| Endpoint | Methods | Description |
|----------|---------|-------------|
| `/health` | GET | Health check |
| `/auth/*` | ALL | Clerk webhook handlers |
| `/organizations` | CRUD | Organization management |
| `/projects` | CRUD | Project management |
| `/projects/:id/tasks` | CRUD | Task management |
| `/projects/:id/time-entries` | CRUD | Time tracking |
| `/invoices` | CRUD | Invoice management |
| `/files` | POST/GET | File uploads |
| `/webhooks/github` | POST | GitHub integration |
| `/webhooks/stripe` | POST | Stripe billing events |
| `/webhooks/slack` | POST | Slack interactions |

### tRPC API (Internal)

```typescript
// Router structure
appRouter
├── auth
│   ├── getSession
│   └── getOrganization
├── projects
│   ├── list
│   ├── getById
│   ├── create
│   ├── update
│   └── archive
├── tasks
│   ├── list
│   ├── getById
│   ├── create
│   ├── update
│   ├── delete
│   └── bulkUpdate
├── timeEntries
│   ├── list
│   ├── startTimer
│   ├── stopTimer
│   └── getRunningTimer
├── invoices
│   ├── list
│   ├── getById
│   ├── create
│   ├── generateFromTime
│   └── send
├── dashboard
│   ├── getMetrics
│   ├── getActivityFeed
│   └── getProjectStatus
└── integrations
    ├── github
    │   ├── syncRepo
    │   └── linkIssue
    └── slack
        ├── sendNotification
        └── configureChannel
```

### WebSocket Events

```javascript
// Real-time updates
socket.on('task:updated', (task) => {...})
socket.on('time:entry:started', (entry) => {...})
socket.on('project:status:changed', (project) => {...})
socket.on('invoice:paid', (invoice) => {...})

// Presence
socket.on('user:joined', (user) => {...})
socket.on('user:left', (user) => {...})
socket.on('typing', (data) => {...})
```

---

## 🔗 Integration Points

### GitHub Integration

**Capabilities:**
- Repository linking per project
- Issue sync (GitHub ↔ Labs tasks)
- Pull request tracking
- Commit activity logging
- Automated status updates

**Webhook Events:**
- `push` — Log commits, update activity
- `issues` — Sync issue state
- `pull_request` — Track PR lifecycle
- `pull_request_review` — Log reviews

**Data Flow:**
```
GitHub Issue Created
        ↓
  Webhook Received
        ↓
  Create/Update Task
        ↓
  Notify via WebSocket
```

### Slack Integration

**Capabilities:**
- Channel per project
- Sprint notifications
- Task assignments
- Time entry reminders
- Invoice notifications

**Slash Commands:**
- `/labs time` — Log time entry
- `/labs task` — Create quick task
- `/labs status` — Project status

**Events Posted:**
- Sprint started/ended
- Task status changes
- New invoice available
- Deploy completed

### Stripe Integration

**Capabilities:**
- Subscription management
- Invoice generation & payment
- Usage-based billing
- Automatic tax calculation

**Webhook Events:**
- `invoice.created`
- `invoice.paid`
- `subscription.updated`
- `payment_intent.succeeded`

---

## 🏢 Multi-Tenant Architecture

### Tenant Isolation Strategy

**Row-Level Security (RLS) in PostgreSQL:**
```sql
-- Enable RLS on all tables
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;

-- Policy: Users can only see their org's data
CREATE POLICY project_org_isolation ON projects
  USING (organization_id = current_setting('app.current_org')::UUID);
```

**Application-Level Enforcement:**
```typescript
// Every query includes org filter
const projects = await prisma.project.findMany({
  where: {
    organizationId: ctx.session.orgId // Always enforced
  }
});
```

**Data Segregation:**
| Level | Isolation Method |
|-------|-----------------|
| Database | Single DB, RLS policies |
| Cache | Key prefix: `org:{id}:` |
| Files | S3 prefix: `/{orgId}/` |
| Search | Filtered by org_id |

---

## 🔒 Security Architecture

### Authentication
- **Primary:** Clerk (OAuth, SAML, MFA)
- **Session:** JWT with httpOnly cookies
- **API:** API keys for integrations

### Authorization
- **RBAC:** Organization-level roles
- **Permissions:** Resource-level ACLs
- **Middleware:** Route protection

### Data Protection
- **Encryption at Rest:** AWS RDS encryption
- **Encryption in Transit:** TLS 1.3
- **PII:** Encrypted columns for sensitive data
- **Backups:** Encrypted, geographically distributed

### Audit
- All actions logged to `activity_logs`
- Immutable audit trail
- 7-year retention for compliance

---

## 📈 Scalability

### Horizontal Scaling
- Stateless application servers
- Database read replicas
- Redis cluster for cache
- CDN for static assets

### Performance Targets
| Metric | Target |
|--------|--------|
| API Response | <200ms p95 |
| Page Load | <2s (TTFB) |
| WebSocket Latency | <50ms |
| DB Query | <10ms avg |

---

## 🧪 Development & Deployment

### Environments
- `local` — Developer machines
- `dev` — Feature branch deployments
- `staging` — Pre-production testing
- `prod` — Production (Vercel + AWS)

### CI/CD Pipeline
```
Push to branch
    ↓
Run tests (unit, integration, e2e)
    ↓
Lint & type check
    ↓
Deploy to preview (dev)
    ↓
Merge to main
    ↓
Deploy to staging
    ↓
Manual approval
    ↓
Deploy to production
```

### Database Migrations
- Prisma Migrate for schema changes
- Migrations run automatically in CI/CD
- Rollback plan for each migration

---

*Last updated: 2026-02-09*
