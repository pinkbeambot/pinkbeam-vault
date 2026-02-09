---
id: TASK-009
title: Invoice generation
status: backlog
priority: P1
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FULL/IDENTITY]]"
collaborators:
  - "[[Org Chart/DESIGN-UI/IDENTITY]]"
  - "[[Org Chart/OPS/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 32
actual_hours: 0
dependencies:
  - "[[TASK-006]]"
  - "[[TASK-008]]"
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - backend
  - frontend
  - invoicing
  - billing
  - payments
  - P1
---

# TASK-009: Invoice generation

## 🎯 Objective
Build an invoice generation system that creates professional invoices from tracked time and fixed-price projects. Include PDF generation, sending, payment tracking, and basic reporting.

## 📖 Context
Invoicing is critical for cash flow. The system should:
- Generate professional PDF invoices
- Pull time entries automatically for time-and-materials projects
- Support fixed-price invoice line items
- Handle different billing rates per client/project
- Track invoice status (draft, sent, paid, overdue)
- Send invoices via email
- Record payments manually
- Provide aging reports

Integration with payment processors (Stripe, etc.) can be added later.

---

## ✅ Definition of Done

### Phase 1: Design & Requirements ([[Org Chart/OPS/IDENTITY]])
- [ ] `[D1]` Design invoice template (PDF)
- [ ] `[D2]` Design invoice list view
- [ ] `[D3]` Design invoice detail view
- [ ] `[D4]` Design invoice creation flow
- [ ] `[D5]` Define invoice numbering scheme
- [ ] `[D6]` Define payment terms options
- [ ] `[D7]` Design payment tracking UI
- [ ] `[D8]` Design invoice settings

### Phase 2: Database Schema ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[DB1]` Create invoices table
- [ ] `[DB2]` Create invoice_line_items table
- [ ] `[DB3]` Create invoice_status_history table
- [ ] `[DB4]` Create payments table
- [ ] `[DB5]` Create billing_rates table
- [ ] `[DB6]` Add invoice columns to time_entries
- [ ] `[DB7]` Create invoice_templates table
- [ ] `[DB8]` Set up indexes for reporting

### Phase 3: Backend API ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` CRUD endpoints for invoices
- [ ] `[B2]` Line item management endpoints
- [ ] `[B3]` Time entry to invoice conversion
- [ ] `[B4]` Invoice PDF generation endpoint
- [ ] `[B5]` Invoice sending endpoint (email)
- [ ] `[B6]` Payment recording endpoints
- [ ] `[B7]` Invoice reporting endpoints
- [ ] `[B8]` Duplicate/recurring invoice endpoints

### Phase 4: Frontend - Invoice List ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FL1]` Build InvoicesList page
- [ ] `[FL2]` Build InvoiceCard/Row component
- [ ] `[FL3]` Implement status filtering
- [ ] `[FL4]` Add date range filtering
- [ ] `[FL5]` Build invoice search
- [ ] `[FL6]` Add sorting options
- [ ] `[FL7]` Display total amounts and outstanding
- [ ] `[FL8]` Add quick actions (send, mark paid)

### Phase 5: Frontend - Invoice Creation ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FC1]` Build CreateInvoice page
- [ ] `[FC2]` Build ClientSelector component
- [ ] `[FC3]` Build ProjectSelector component
- [ ] `[FC4]` Implement time entry import
- [ ] `[FC5]` Build LineItemEditor component
- [ ] `[FC6]` Add line item reordering
- [ ] `[FC7]` Build invoice preview
- [ ] `[FC8]` Add save as draft functionality

### Phase 6: Frontend - Invoice Detail ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FD1]` Build InvoiceDetail page
- [ ] `[FD2]` Display full invoice information
- [ ] `[FD3]` Show PDF preview/viewer
- [ ] `[FD4]` Build payment recording form
- [ ] `[FD5]` Display payment history
- [ ] `[FD6]` Add send invoice button
- [ ] `[FD7]` Implement download PDF
- [ ] `[FD8]` Add duplicate/create credit note

### Phase 7: PDF Generation ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[PDF1]` Set up PDF generation library (Puppeteer/Playwright)
- [ ] `[PDF2]` Create invoice HTML template
- [ ] `[PDF3]` Style invoice with CSS
- [ ] `[PDF4]` Add company branding
- [ ] `[PDF5]` Include all invoice data
- [ ] `[PDF6]` Handle multi-page invoices
- [ ] `[PDF7]` Optimize PDF file size
- [ ] `[PDF8]` Test print quality

### Phase 8: Email & Notifications ([[Org Chart/ENG-FULL/IDENTITY]])
- [ ] `[E1]` Build email templates for invoices
- [ ] `[E2]` Implement invoice sending
- [ ] `[E3]` Add send history tracking
- [ ] `[E4]` Build payment reminder emails
- [ ] `[E5]` Implement overdue notifications
- [ ] `[E6]` Add email open tracking (optional)
- [ ] `[E7]` Configure SMTP/email service
- [ ] `[E8]` Add email preview before send

### Phase 9: Reporting & Settings ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[R1]` Build invoice aging report
- [ ] `[R2]` Build revenue report
- [ ] `[R3]` Build outstanding invoices report
- [ ] `[R4]` Implement invoice settings page
- [ ] `[R5]` Add default payment terms setting
- [ ] `[R6]` Configure invoice numbering
- [ ] `[R7]` Add tax/VAT settings
- [ ] `[R8]` Testing and polish

---

## 📝 Work Log

### 2026-02-09 12:00 [[Org Chart/CEO/IDENTITY]] — Task Created
- Invoice generation system
- Estimated 32 hours
- Requires OPS input for billing workflows
- Critical for business operations

---

## 🚧 Blockers

**Current blockers:**
- TASK-006: Project management core
- TASK-008: Time tracking system
- Need to finalize invoice template design
- Define payment terms and billing cycles

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09 | PDF generation via HTML template | ENG-LEAD | Flexible, easy to customize, good quality |
| 2026-02-09 | Manual payment recording first | FOUNDER | Payment processor integration can be added later |

---

## 🔗 Related

- **Parent:** [[LABS-ROADMAP.md]] — Phase 3: Project Management
- **Depends on:**
  - [[TASK-006]] — Project management core
  - [[TASK-008]] — Time tracking system
- **Blocks:** None (end of foundation chain)
