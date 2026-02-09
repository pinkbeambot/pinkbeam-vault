---
id: "TASK-007"
title: "Invoice Generation System"
status: "todo"
priority: "P1"
created_at: "2026-02-09T12:51:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 16
actual_hours: 0
dependencies:
  - "TASK-005"
blocks:
  - "TASK-018"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "web"
  - "billing"
  - "invoices"
  - "P1"
  - "backend"
---

# TASK-007: Invoice Generation System

## 🎯 Objective
Build an automated invoice generation system that creates professional invoices, tracks payments, and provides clients with billing history and payment options.

## 📖 Context
Invoicing is critical for cash flow. The system needs to handle one-time project invoices, recurring maintenance billing, and SEO retainer payments. Integration with payment processors and accounting software is important.

**Invoice Types:**
- Project invoices (milestones or final)
- Monthly maintenance retainers
- SEO service retainers
- Additional services/overages

**Wait for:**
- [[TASK-005]] — Client dashboard foundation (billing section)

---

## ✅ Definition of Done

### Phase 1: UI Components
- [ ] `[1.1]` Invoice list view:
  - [ ] `[1.1a]` Invoice table component
  - [ ] `[1.1b]` Status badges (Draft, Sent, Paid, Overdue, Void)
  - [ ] `[1.1c]` Amount and due date columns
  - [ ] `[1.1d]` Filter by status and date range
  - [ ] `[1.1e]` Sort by date or amount
  - [ ] `[1.1f]` Export to CSV option
- [ ] `[1.2]` Invoice detail view:
  - [ ] `[1.2a]` Invoice header (number, dates, status)
  - [ ] `[1.2b]` Client information
  - [ ] `[1.2c]` Line items table
  - [ ] `[1.2d]` Subtotal, tax, total calculation
  - [ ] `[1.2e]` Payment history
  - [ ] `[1.2f]` Notes and terms
- [ ] `[1.3]` Invoice PDF viewer:
  - [ ] `[1.3a]` Embedded PDF viewer
  - [ ] `[1.3b]` Download PDF button
  - [ ] `[1.3c]` Print invoice option
- [ ] `[1.4]` Payment UI:
  - [ ] `[1.4a]` Pay now button
  - [ ] `[1.4b]` Payment method selection
  - [ ] `[1.4c]` Payment confirmation
  - [ ] `[1.4d]` Payment failure handling

### Phase 2: Backend - Database & Logic
- [ ] `[2.1]` Database schema:
  - [ ] `[2.1a]` Invoices table
    - id, invoice_number, client_id, project_id
    - issue_date, due_date, paid_date
    - status, subtotal, tax_rate, tax_amount, total
    - notes, terms, stripe_invoice_id
  - [ ] `[2.1b]` Invoice line items table
    - id, invoice_id, description, quantity, unit_price, amount
  - [ ] `[2.1c]` Payments table
    - id, invoice_id, amount, payment_method, transaction_id
    - paid_at, stripe_payment_intent_id
- [ ] `[2.2]` Invoice generation logic:
  - [ ] `[2.2a]` Invoice number generation (sequencing)
  - [ ] `[2.2b]` Line item calculation
  - [ ] `[2.2c]` Tax calculation based on location
  - [ ] `[2.2d]` Draft → Sent workflow
  - [ ] `[2.2e]` Void and credit note creation
- [ ] `[2.3]` PDF generation:
  - [ ] `[2.3a]` HTML template for invoices
  - [ ] `[2.3b]` PDF generation service (Puppeteer/react-pdf)
  - [ ] `[2.3c]` Branded invoice styling
  - [ ] `[2.3d]` PDF storage and retrieval

### Phase 3: Integration
- [ ] `[3.1]` Payment processing:
  - [ ] `[3.1a]` Stripe integration for card payments
  - [ ] `[3.1b]` ACH/bank transfer option
  - [ ] `[3.1c]` Payment intent creation
  - [ ] `[3.1d]` Webhook handling for payment status
  - [ ] `[3.1e]` Failed payment retry logic
- [ ] `[3.2]` Automated billing:
  - [ ] `[3.2a]` Recurring invoice generation (maintenance)
  - [ ] `[3.2b]` Stripe subscription integration
  - [ ] `[3.2c]` Automatic payment for saved methods
  - [ ] `[3.2d]` Dunning management for failed payments
- [ ] `[3.3]` Client dashboard integration:
  - [ ] `[3.3a]` Display invoice list with status
  - [ ] `[3.3b]` Outstanding balance summary
  - [ ] `[3.3c]` Payment history
  - [ ] `[3.3d]` Download past invoices
- [ ] `[3.4]` Email notifications:
  - [ ] `[3.4a]` Invoice sent notification
  - [ ] `[3.4b]` Payment received confirmation
  - [ ] `[3.4c]` Upcoming due date reminder
  - [ ] `[3.4d]` Overdue invoice reminders

### Phase 4: Admin & Reporting
- [ ] `[4.1]` Admin invoice management:
  - [ ] `[4.1a]` Create manual invoice
  - [ ] `[4.1b]` Edit draft invoices
  - [ ] `[4.1c]` Send invoice to client
  - [ ] `[4.1d]` Mark as paid (offline payments)
  - [ ] `[4.1e]` Void invoice
- [ ] `[4.2]` Financial reporting:
  - [ ] `[4.2a]` Revenue by period
  - [ ] `[4.2b]` Outstanding receivables
  - [ ] `[4.2c]` Aging report
  - [ ] `[4.2d]` Tax reporting export

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

**Current blockers:**
- Waiting for [[TASK-005]] — Client dashboard foundation

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEB-ROADMAP.md]] — Phase 2: Client Portal
- **Depends on:**
  - [[TASK-005]] — Client dashboard foundation
- **Blocks:**
  - [[TASK-018]] — Reporting automation (uses invoice data)
- **Related Docs:** Billing policies, Stripe integration guide
