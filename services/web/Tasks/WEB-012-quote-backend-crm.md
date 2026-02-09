---
id: WEB-012
title: Build Quote Request Backend & CRM Integration
status: todo
priority: P1
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 12
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
  - WEB-011
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - crm
  - lead-management
  - P1
---

# WEB-012: Build Quote Request Backend & CRM Integration

## 🎯 Objective
Replace the local JSON storage from WEB-005 with proper database persistence, add lead scoring, and integrate with email/CRM for automated follow-up sequences.

## 📖 Context
Quote requests are the lifeblood of the business. This system ensures no lead falls through the cracks with automated workflows, status tracking, and follow-up sequences.

**Features:**
- Database storage of all quote requests
- Lead scoring based on project details
- Automated email sequences
- Status workflow management
- Assignment to sales team

---

## ✅ Definition of Done

### Phase 1: Database Schema (ENG-BE)
- [ ] `[D1]` Create QuoteRequest model
- [ ] `[D2]` Add migration
- [ ] `[D3]` Add indexes for querying
- [ ] `[D4]` Create lead score calculation

### Phase 2: API Endpoints (ENG-BE)
- [ ] `[A1]` POST /api/quotes — Submit new quote
- [ ] `[A2]` GET /api/quotes — List quotes (admin)
- [ ] `[A3]` GET /api/quotes/:id — Get quote detail
- [ ] `[A4]` PUT /api/quotes/:id — Update quote
- [ ] `[A5]` PUT /api/quotes/:id/status — Update status
- [ ] `[A6]` POST /api/quotes/:id/assign — Assign to user

### Phase 3: Lead Scoring (ENG-BE)
- [ ] `[S1]` Create scoring algorithm
- [ ] `[S2]` Score based on budget range
- [ ] `[S3]` Score based on timeline urgency
- [ ] `[S4]` Score based on project type
- [ ] `[S5]` Calculate total lead score
- [ ] `[S6]` Add lead quality tags (hot, warm, cold)

### Phase 4: Email Automation (ENG-BE)
- [ ] `[E1]` Setup Resend templates
- [ ] `[E2]` Send admin notification on new quote
- [ ] `[E3]` Send client auto-responder
- [ ] `[E4]` Create follow-up email sequence (day 1, 3, 7)
- [ ] `[E5]` Send status update emails
- [ ] `[E6]` Add email open/click tracking

### Phase 5: Status Workflow (ENG-BE)
- [ ] `[W1]` Define status states:
  - NEW
  - CONTACTED
  - QUALIFIED
  - PROPOSAL_SENT
  - NEGOTIATING
  - ACCEPTED
  - DECLINED
  - ARCHIVED
- [ ] `[W2]` Create status transition logic
- [ ] `[W3]` Add status history tracking
- [ ] `[W4]` Send notifications on status changes

### Phase 6: Quote Management UI (ENG-FE)
- [ ] `[U1]` Create quotes list in admin
- [ ] `[U2]` Add filtering by status
- [ ] `[U3]` Add sorting by score/date
- [ ] `[U4]` Create quote detail view
- [ ] `[U5]` Add status change interface
- [ ] `[U6]` Add internal notes section
- [ ] `[U7]` Add assignment dropdown

### Phase 7: Notes & Activity (ENG-BE)
- [ ] `[N1]` Add notes to QuoteRequest model
- [ ] `[N2]` Create note API endpoints
- [ ] `[N3]` Display note history
- [ ] `[N4]` Log all activity (emails sent, status changes)

### Phase 8: Integration Migration (ENG-BE)
- [ ] `[M1]` Migrate existing local JSON quotes to database
- [ ] `[M2]` Update WEB-005 form to use new API
- [ ] `[M3]` Remove local JSON storage
- [ ] `[M4]` Test end-to-end flow

### Phase 9: Reporting (ENG-FE)
- [ ] `[R1]` Create conversion funnel view
- [ ] `[R2]` Add quote volume chart
- [ ] `[R3]` Show average time to close
- [ ] `[R4]` Display conversion rate by source

### Phase 10: Testing (ENG-BE)
- [ ] `[T1]` Test quote submission
- [ ] `[T2]` Test email delivery
- [ ] `[T3]` Test status workflow
- [ ] `[T4]` Test lead scoring
- [ ] `[T5]` Test assignment logic

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Design lead scoring algorithm
- [ ] Write email templates
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)
- WEB-011 (API)  
**Notes:** Lead scoring helps prioritize which quotes to follow up with first.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)
- WEB-011 (Core REST API)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Lead scoring 0-100 | Simple scale, easy to filter |
| 2026-02-09 | 3-email follow-up sequence | Industry standard, not too aggressive |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 3: Operations
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
  - WEB-011 (API)
- **Blocks:** None
- **Related:**
  - [[WEB-005-quote-request-system]] — Frontend form (will be updated to use this)

---

## 📐 Technical Notes

### Lead Scoring Algorithm
```typescript
function calculateLeadScore(quote: QuoteRequest): number {
  let score = 0;
  
  // Budget (max 30 points)
  if (quote.budget === '10k-25k') score += 15;
  if (quote.budget === '25k-50k') score += 25;
  if (quote.budget === '50k+') score += 30;
  
  // Timeline (max 25 points)
  if (quote.timeline === 'urgent') score += 25;
  if (quote.timeline === '1-3months') score += 20;
  if (quote.timeline === '3-6months') score += 15;
  
  // Project type (max 20 points)
  if (quote.projectType === 'ecommerce') score += 20;
  if (quote.projectType === 'business') score += 15;
  if (quote.projectType === 'starter') score += 10;
  
  // Description quality (max 15 points)
  if (quote.description.length > 200) score += 15;
  else if (quote.description.length > 100) score += 10;
  else if (quote.description.length > 50) score += 5;
  
  // Company website (max 10 points)
  if (quote.website) score += 10;
  
  return Math.min(score, 100);
}
```

### Email Sequence
```
Day 0: Auto-responder (immediate)
Day 1: Personal follow-up from team
Day 3: Value-add content ("How to evaluate web agencies")
Day 7: Final check-in & case study
Day 14: Archive if no response
```

### Status Transitions
```
NEW → CONTACTED → QUALIFIED → PROPOSAL_SENT → ACCEPTED
              ↓
         DECLINED/ARCHIVED
```

---

*Every quote should get a response within 4 business hours*
