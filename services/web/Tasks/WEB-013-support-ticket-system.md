---
id: WEB-013
title: Build Support Ticket System
status: todo
priority: P1
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-BE/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 16
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
  - WEB-009
  - WEB-011
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - frontend
  - backend
  - support
  - tickets
  - P1
---

# WEB-013: Build Support Ticket System

## 🎯 Objective
Create a complete support ticket system where clients can submit requests, track their status, and communicate with the support team. Includes SLA tracking and priority management.

## 📖 Context
Support is a key differentiator for Pink Beam. This system ensures client issues are tracked, prioritized, and resolved efficiently. It also provides visibility into support workload and performance.

**Features:**
- Ticket creation with categorization
- Priority and SLA tracking
- Internal notes vs client comments
- Assignment and escalation
- Knowledge base integration

---

## ✅ Definition of Done

### Phase 1: Database & API (ENG-BE)
- [ ] `[D1]` Create Ticket model
- [ ] `[D2]` Create Comment model (polymorphic for tickets)
- [ ] `[D3]` Add migration
- [ ] `[D4]` Create ticket API endpoints
- [ ] `[D5]` Create comment API endpoints
- [ ] `[D6]` Add SLA tracking fields

### Phase 2: Client Ticket UI (ENG-FE)
- [ ] `[CU1]` Create ticket list view in portal
- [ ] `[CU2]` Add ticket status filters (open, in-progress, resolved)
- [ ] `[CU3]` Create new ticket form
- [ ] `[CU4]` Build ticket detail view
- [ ] `[CU5]` Add comment thread
- [ ] `[CU6]` Show ticket status and priority
- [ ] `[CU7]` Display SLA countdown

### Phase 3: Admin Ticket UI (ENG-FE)
- [ ] `[AU1]` Create ticket queue in admin
- [ ] `[AU2]` Add advanced filters (priority, category, assignee)
- [ ] `[AU3]` Build ticket detail with admin controls
- [ ] `[AU4]` Add assignment interface
- [ ] `[AU5]` Create priority change controls
- [ ] `[AU6]` Add status workflow buttons
- [ ] `[AU7]` Create internal notes section (client can't see)

### Phase 4: Ticket Features (ENG-BE + ENG-FE)
- [ ] `[F1]` Add file attachments to tickets
- [ ] `[F2]` Implement @mentions in comments
- [ ] `[F3]` Add email notifications for updates
- [ ] `[F4]` Create ticket templates (common issues)
- [ ] `[F5]` Add "waiting for client" status
- [ ] `[F6]` Implement ticket merging

### Phase 5: SLA Management (ENG-BE)
- [ ] `[SLA1]` Define SLA rules by priority:
  - URGENT: 4 hours
  - HIGH: 24 hours
  - MEDIUM: 72 hours
  - LOW: 1 week
- [ ] `[SLA2]` Calculate SLA deadlines on ticket creation
- [ ] `[SLA3]` Track breach status
- [ ] `[SLA4]` Send SLA warning notifications
- [ ] `[SLA5]` Generate SLA compliance report

### Phase 6: Automation (ENG-BE)
- [ ] `[AUTO1]` Auto-assign based on category
- [ ] `[AUTO2]` Auto-respond with ticket number
- [ ] `[AUTO3]` Escalate overdue tickets
- [ ] `[AUTO4]` Close resolved tickets after 3 days

### Phase 7: Knowledge Base Integration (ENG-FE)
- [ ] `[KB1]` Suggest KB articles on ticket creation
- [ ] `[KB2]` Link KB articles in responses
- [ ] `[KB3]` Track article helpfulness

### Phase 8: Reporting (ENG-FE)
- [ ] `[R1]` Create ticket volume chart
- [ ] `[R2]` Show average resolution time
- [ ] `[R3]` Display SLA compliance rate
- [ ] `[R4]` Show tickets by category
- [ ] `[R5]` Create agent performance view

### Phase 9: Email Integration (ENG-BE)
- [ ] `[E1]` Parse incoming emails to tickets
- [ ] `[E2]` Send email notifications for replies
- [ ] `[E3]` Include ticket number in subject
- [ ] `[E4]` Handle email attachments

### Phase 10: Testing (ENG-BE + ENG-FE)
- [ ] `[T1]` Test ticket creation flow
- [ ] `[T2]` Test comment threading
- [ ] `[T3]` Test SLA calculations
- [ ] `[T4]` Test email notifications
- [ ] `[T5]` Test file attachments

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Define ticket categories
- [ ] Write SLA policy
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)
- WEB-009 (Client Portal)
- WEB-011 (API)  
**Notes:** SLA tracking is crucial for maintaining service quality standards.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)
- WEB-009 (Client Portal Dashboard)
- WEB-011 (Core REST API)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Polymorphic comments | Reuse comment system for projects and tickets |
| 2026-02-09 | Internal notes separate from client comments | Team can collaborate privately |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 5: Support
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
  - WEB-009 (Client Portal)
  - WEB-011 (API)
- **Blocks:** None
- **Related:**
  - [[WEB-009-client-portal-dashboard]] — Tickets live in portal

---

## 📐 Technical Notes

### Ticket Model
```typescript
interface Ticket {
  id: string;
  title: string;
  description: string;
  status: TicketStatus;
  priority: TicketPriority;
  category: TicketCategory;
  
  // Relations
  clientId: string;
  assigneeId?: string;
  projectId?: string;
  
  // SLA
  slaDeadline: Date;
  slaBreach: boolean;
  
  // Timestamps
  createdAt: Date;
  updatedAt: Date;
  resolvedAt?: Date;
}

type TicketStatus = 'OPEN' | 'IN_PROGRESS' | 'WAITING_CLIENT' | 'RESOLVED' | 'CLOSED';
type TicketPriority = 'LOW' | 'MEDIUM' | 'HIGH' | 'URGENT';
type TicketCategory = 'GENERAL' | 'BUG' | 'FEATURE_REQUEST' | 'BILLING' | 'TECHNICAL';
```

### SLA Calculation
```typescript
function calculateSLA(priority: TicketPriority): number {
  const hours = {
    URGENT: 4,
    HIGH: 24,
    MEDIUM: 72,
    LOW: 168 // 1 week
  };
  
  return Date.now() + hours[priority] * 60 * 60 * 1000;
}
```

### Routes
```
/portal/support              → Client ticket list
/portal/support/new          → New ticket form
/portal/support/[id]         → Ticket detail (client)

/admin/support               → Admin ticket queue
/admin/support/[id]          → Ticket detail (admin)
```

---

*Target: < 4 hour first response for all tickets*
