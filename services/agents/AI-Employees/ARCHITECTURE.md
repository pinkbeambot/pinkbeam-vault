# 🏗️ AI Employee Platform Architecture

**Deep dive into the technical architecture of the Pink Beam AI Employee system.**

---

## Table of Contents

1. [Core Concepts](#core-concepts)
2. [Two Modes: Batch vs Autonomous](#two-modes-batch-vs-autonomous)
3. [System Architecture](#system-architecture)
4. [Technology Stack](#technology-stack)
5. [Data Flow](#data-flow)
6. [Security Considerations](#security-considerations)
7. [Scalability Design](#scalability-design)

---

## Core Concepts

### Employee Base Module

Every AI Employee inherits from a shared **Employee Base Module** that provides:

```typescript
interface EmployeeBase {
  // Identity
  id: string;           // Unique identifier (e.g., "sarah-001")
  name: string;         // Display name (e.g., "Sarah")
  role: string;         // Job title (e.g., "Market Intelligence Analyst")
  
  // Configuration
  mode: 'batch' | 'autonomous' | 'hybrid';
  status: 'active' | 'paused' | 'offline';
  
  // Capabilities
  skills: Skill[];      // What this employee can do
  permissions: string[]; // API scopes, data access
  
  // Runtime
  memory: MemorySystem;
  queue: TaskQueue;
  integrations: IntegrationLayer;
}
```

**Shared capabilities include:**
- Authentication and authorization
- Logging and audit trails
- Error handling and retry logic
- Rate limiting and cost controls
- Human handoff triggers

### Memory System

The memory system enables AI Employees to learn and personalize:

#### Short-Term Memory (Conversation Context)
```typescript
interface ConversationMemory {
  sessionId: string;
  messages: Message[];     // Last N messages (window: 10-20)
  context: ContextData;    // Current task, user intent
  expiresAt: Date;         // TTL: 24 hours
}
```

#### Long-Term Memory (Vector Store)
```typescript
interface LongTermMemory {
  userId: string;
  preferences: Preferences;  // JSONB: communication style, priorities
  facts: Embedding[];        // pgvector: semantic search
  history: Interaction[];    // Past conversations and outcomes
}
```

**Implementation:** PostgreSQL with pgvector extension
- Embeddings stored as `vector(1536)` (OpenAI text-embedding-3-small)
- Similarity search with cosine distance
- Automatic context retrieval for relevant past interactions

### Task Queue

All work flows through a centralized task queue:

```typescript
interface Task {
  id: string;
  employeeId: string;      // Who should handle this
  type: TaskType;          // Classification
  priority: number;        // 1-10
  payload: JSON;           // Task-specific data
  
  // Lifecycle
  status: 'pending' | 'processing' | 'completed' | 'failed';
  createdAt: Date;
  startedAt: Date | null;
  completedAt: Date | null;
  
  // Retry logic
  attempts: number;
  maxAttempts: number;
  errorLog: Error[];
  
  // Handoff
  handoffTo: string | null; // Human or other employee
}
```

**Queue Implementation:** PostgreSQL with `SKIP LOCKED`
```sql
-- Worker picks up next available task
UPDATE tasks
SET status = 'processing', started_at = NOW(), attempts = attempts + 1
WHERE id = (
  SELECT id FROM tasks
  WHERE status = 'pending' AND attempts < max_attempts
  ORDER BY priority DESC, created_at ASC
  FOR UPDATE SKIP LOCKED
  LIMIT 1
)
RETURNING *;
```

### Integration Layer

Standardized interface for all external systems:

```typescript
interface IntegrationLayer {
  // Inputs
  email: EmailIntegration;
  webhook: WebhookIntegration;
  api: APIIntegration;
  
  // Outputs
  sendEmail: (options: EmailOptions) => Promise<void>;
  sendSlack: (options: SlackOptions) => Promise<void>;
  sendWebhook: (options: WebhookOptions) => Promise<void>;
  
  // Data sources
  fetchURL: (url: string) => Promise<ScrapedContent>;
  queryDatabase: (query: SQLQuery) => Promise<QueryResult>;
}
```

### Human Handoff System

AI Employees know when to escalate to humans:

**Automatic Triggers:**
- Confidence score < 0.7
- Sensitive topics (pricing, legal, complaints)
- User explicitly requests human
- Repeated failures on same task
- High-value opportunity detected

**Handoff Process:**
1. AI Employee marks task for handoff
2. Notification sent to human (email, Slack, dashboard)
3. Context package assembled (conversation history, relevant data)
4. Human takes over via dashboard
5. AI learns from human response (optional)

---

## Two Modes: Batch vs Autonomous

### Detailed Comparison

| Aspect | Batch Mode (v1) | Autonomous Mode (v2) |
|--------|-----------------|----------------------|
| **Trigger** | Schedule (cron) | Event (webhook/real-time) |
| **Input** | Pull (fetch URLs, query APIs) | Push (incoming email/chat/API call) |
| **Output** | Deliverable (brief, email, report) | Conversation + Actions |
| **Latency** | Minutes to hours | Seconds |
| **Complexity** | Medium | High |
| **Cost** | Lower (scheduled, batched) | Higher (always-on, real-time) |
| **Use Cases** | Research, Reports, Content | Support, Sales, Real-time assistance |
| **Infrastructure** | Scheduled functions | Webhook handlers, WebSockets |
| **State Management** | Task-based, ephemeral | Session-based, persistent |
| **Error Handling** | Retry with backoff | Immediate response or queue |

### Batch Mode Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   pg_cron   │────▶│   Trigger   │────▶│   Queue     │
│  (schedule) │     │  Function   │     │   Task      │
└─────────────┘     └─────────────┘     └──────┬──────┘
                                               │
                    ┌─────────────┐            │
                    │  Employee   │◀───────────┘
                    │   Worker    │   (poll)
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │  Generate   │
                    │  Deliverable│
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │   Output    │
                    │ (email/DB)  │
                    └─────────────┘
```

**Characteristics:**
- Runs on predictable schedule (daily, weekly)
- Processes multiple items in batch
- Results stored for later review
- Lower cost per unit of work
- Higher latency acceptable

### Autonomous Mode Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Webhook   │────▶│   Edge      │────▶│   Queue     │
│   (event)   │     │   Function  │     │   (fast)    │
└─────────────┘     └─────────────┘     └──────┬──────┘
                                               │
                    ┌─────────────┐            │
                    │  Employee   │◀───────────┘
                    │   (real-    │   (immediate)
                    │    time)    │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │  Respond    │
                    │  (streaming)│
                    └─────────────┘
```

**Characteristics:**
- Event-driven, immediate response
- Maintains conversation state
- Handles interruptions and context switches
- Higher cost per interaction
- Requires low latency (< 5s response)

### Hybrid Mode

Employees can operate in **hybrid mode** — batch for routine work, autonomous for exceptions:

**Example: Sarah (Researcher)**
- **Batch:** Weekly competitor brief every Monday
- **Autonomous:** Alert on breaking news (real-time RSS monitoring)
- **Trigger:** Breaking news detected → switch to autonomous → notify user → return to batch

---

## System Architecture

### High-Level Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        CLIENT LAYER                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐ │
│  │   Dashboard │  │   Email     │  │   Slack/Discord     │ │
│  │   (React)   │  │   Client    │  │   (future)          │ │
│  └──────┬──────┘  └──────┬──────┘  └──────────┬──────────┘ │
└─────────┼────────────────┼────────────────────┼────────────┘
          │                │                    │
          └────────────────┴────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────┐
│                    API GATEWAY                           │
│              (Supabase Edge Functions)                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │   Auth      │  │   Rate      │  │   Webhook       │  │
│  │   (JWT)     │  │   Limiting  │  │   Handlers      │  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
└──────────────────────────┬───────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────┐
│                 EMPLOYEE RUNTIME                         │
│              (Deno Edge Functions)                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │   Sarah     │  │    Mike     │  │  Alex/Casey/... │  │
│  │ (Research)  │  │    (SDR)    │  │   (Others)      │  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
│                                                          │
│  ┌─────────────────────────────────────────────────────┐ │
│  │              Employee Base Module                    │ │
│  │  (Memory, Queue, Integrations, Handoff)             │ │
│  └─────────────────────────────────────────────────────┘ │
└──────────────────────────┬───────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────┐
│                   DATA LAYER                             │
│                  (Supabase PostgreSQL)                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │   Tasks     │  │   Memory    │  │   Preferences   │  │
│  │   (Queue)   │  │   (Vector)  │  │   (JSONB)       │  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
│                                                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │  Employees  │  │   Briefs    │  │   Audit Log     │  │
│  │   (Config)  │  │  (Outputs)  │  │   (History)     │  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
└──────────────────────────┬───────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────┐
│                INTEGRATION LAYER                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │   OpenAI    │  │   Jina AI   │  │     Resend      │  │
│  │    (LLM)    │  │  (Scraping) │  │    (Email)      │  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  │
│  │  Firecrawl  │  │  (Future)   │  │    (Future)     │  │
│  │  (Scraping) │  │   Slack     │  │  Google Calendar│  │
│  └─────────────┘  └─────────────┘  └─────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

### Key Design Decisions

#### 1. Edge Functions over Traditional Servers
**Why Supabase Edge Functions (Deno)?**
- Zero cold start (critical for autonomous mode <5s response)
- Built-in PostgreSQL connection pooling
- Automatic scaling
- TypeScript native
- Cost-effective at low-medium scale

**Trade-off:** Limited execution time (150s for HTTP, unlimited for background)

#### 2. PostgreSQL as Single Source of Truth
**Why not separate queue/message broker?**
- One less system to manage
- ACID guarantees for task state
- pgvector for semantic memory
- pg_cron for scheduling
- Simpler mental model

**Trade-off:** May need dedicated queue (Redis/RabbitMQ) at very high scale (>10M tasks/day)

#### 3. Multi-Tenant with Row-Level Security
All tables use `tenant_id` with RLS policies:
```sql
CREATE POLICY tenant_isolation ON tasks
  USING (tenant_id = current_setting('app.current_tenant')::UUID);
```

This enables:
- Single database for all customers
- Guaranteed data isolation
- Simplified operations

---

## Technology Stack

### Core Infrastructure

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Runtime** | Supabase Edge Functions (Deno) | Serverless TypeScript execution |
| **Database** | PostgreSQL 15+ | Primary data store |
| **Vector DB** | pgvector (in PostgreSQL) | Semantic memory, search |
| **Scheduler** | pg_cron | Batch job scheduling |
| **Queue** | PostgreSQL + SKIP LOCKED | Task distribution |
| **Auth** | Supabase Auth | JWT-based authentication |

### AI/ML

| Component | Technology | Purpose | Cost Model |
|-----------|------------|---------|------------|
| **LLM (Start)** | OpenAI GPT-4o-mini | Reasoning, generation | ~$0.15/M tokens |
| **LLM (Scale)** | OpenAI GPT-4o | Complex tasks, higher quality | ~$5/M tokens |
| **Embeddings** | text-embedding-3-small | Vector search | ~$0.02/M tokens |
| **Scraping (Free)** | Jina AI | URL content extraction | Free tier |
| **Scraping (Scale)** | Firecrawl | Robust scraping, JS rendering | $0.005/page |

### Communication

| Component | Technology | Purpose | Cost Model |
|-----------|------------|---------|------------|
| **Email** | Resend | Transactional email | 3,000/mo free, then $0.0001/email |
| **Notifications** | Supabase Realtime | Live dashboard updates | Included |
| **Future: Chat** | Slack Bolt | Slack integration | Free tier available |

### Frontend

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Dashboard** | React + TypeScript | Admin interface |
| **Styling** | Tailwind CSS | Consistent design |
| **State** | React Query | Server state management |
| **Forms** | React Hook Form | Form handling |

### Development & Operations

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Version Control** | GitHub | Code repository |
| **CI/CD** | GitHub Actions | Automated testing, deployment |
| **Monitoring** | Supabase Dashboard + custom | Health, performance |
| **Logging** | PostgreSQL + edge logs | Audit trail, debugging |
| **Testing** | Deno Test | Unit and integration tests |

---

## Data Flow

### Batch Mode Flow (Sarah Example)

```
1. SCHEDULE TRIGGER
   pg_cron runs every Monday at 9am
   ↓
2. QUEUE TASK
   Trigger function creates task:
   { type: 'generate_brief', employee: 'sarah', config: {...} }
   ↓
3. WORKER PICKUP
   Sarah worker polls queue, acquires task
   ↓
4. DATA COLLECTION
   Fetch competitor URLs (Jina AI/Firecrawl)
   Query database for previous briefs
   ↓
5. GENERATION
   Send to OpenAI with structured prompt
   Parse response into sections
   ↓
6. STORAGE
   Save brief to database
   Store vector embeddings of key insights
   ↓
7. DELIVERY
   Send email via Resend
   Update dashboard
   ↓
8. COMPLETION
   Mark task complete
   Log audit trail
```

### Autonomous Mode Flow (Alex Example)

```
1. EVENT TRIGGER
   Support email arrives → Resend webhook
   ↓
2. CLASSIFICATION
   Edge function receives webhook
   Classify: question/refund/complaint/bug
   ↓
3. CONTEXT RETRIEVAL
   Query vector DB for similar past tickets
   Load user preferences
   Check for open conversations
   ↓
4. RESPONSE GENERATION
   Send to OpenAI with context
   Stream response for low latency
   ↓
5. HUMAN CHECK
   If confidence < 0.7 → queue for human review
   Else → send immediately
   ↓
6. DELIVERY
   Send email response
   Update conversation state
   ↓
7. LEARNING
   Store interaction in memory
   Update user preferences if new info learned
```

---

## Security Considerations

### Data Isolation
- Row-Level Security (RLS) on all tables
- Tenant ID passed via PostgreSQL setting
- No cross-tenant queries possible

### API Security
- JWT authentication required for all endpoints
- Rate limiting per tenant and per user
- API keys for integrations stored encrypted

### LLM Security
- Prompt injection detection
- Output sanitization (no PII leakage)
- Confidence thresholds for sensitive topics

### Audit & Compliance
- Every action logged to audit table
- Immutable audit log (append-only)
- Data retention policies configurable per tenant

---

## Scalability Design

### Horizontal Scaling Strategy

**Current (v1):**
- Single database instance
- Edge Functions auto-scale
- Stateless workers

**Future (v2 scale):**
- Read replicas for query-heavy workloads
- Dedicated queue service (if needed)
- Sharding by tenant for database

### Cost Optimization

| Strategy | Implementation | Savings |
|----------|----------------|---------|
| **Caching** | Redis for frequent queries | 30-50% API costs |
| **Batching** | Group similar tasks | 20-30% LLM costs |
| **Model Tiering** | GPT-4o-mini → GPT-4o | 90% for simple tasks |
| **Smart Scraping** | Check cache before fetch | 50% scraping costs |

### Performance Targets

| Metric | Batch Mode | Autonomous Mode |
|--------|------------|-----------------|
| **Response Time** | < 60 seconds | < 5 seconds |
| **Throughput** | 100 tasks/hour | 1000 requests/minute |
| **Availability** | 99.9% | 99.99% |
| **Error Rate** | < 1% | < 0.1% |

---

## Future Considerations

### v2 Enhancements
- Real-time collaboration (multiple AI employees on one task)
- Advanced orchestration (AI employee manager)
- Voice integration (phone calls)
- Multi-modal (images, video understanding)

### v3 Vision
- Self-improving AI employees (learn from feedback)
- Cross-employee knowledge sharing
- Predictive task creation (proactive AI employees)
- Industry-specific specialized employees

---

*Last Updated: 2026-02-07*
*Architecture Version: 1.0*
*Next Review: Monthly or after significant feature release*
