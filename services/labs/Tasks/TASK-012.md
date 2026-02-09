---
id: TASK-012
title: Quote/estimate system
status: backlog
priority: P2
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FULL/IDENTITY]]"
collaborators:
  - "[[Org Chart/DESIGN-UI/IDENTITY]]"
  - "[[Org Chart/SALES/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 28
actual_hours: 0
dependencies:
  - "[[TASK-005]]"
  - "[[TASK-006]]"
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - backend
  - frontend
  - sales
  - quotes
  - estimates
  - P2
---

# TASK-012: Quote/estimate system

## 🎯 Objective
Build a quote and estimate generation system for creating professional proposals. Include line items, pricing options, templates, and client approval workflow.

## 📖 Context
The quote system streamlines the sales process:
- Create professional quote documents
- Build estimates from project templates
- Offer pricing options (good/better/best)
- Track quote status and client responses
- Convert approved quotes to projects
- Maintain quote history and analytics

This system helps standardize pricing and reduces time to close deals.

---

## ✅ Definition of Done

### Phase 1: Design & Requirements ([[Org Chart/SALES/IDENTITY]])
- [ ] `[D1]` Define quote lifecycle states
- [ ] `[D2]` Design quote template structure
- [ ] `[D3]` Plan pricing models (fixed, T&M, retainer)
- [ ] `[D4]` Design client approval flow
- [ ] `[D5]` Define quote numbering scheme
- [ ] `[D6]` Design quote PDF layout
- [ ] `[D7]` Plan quote analytics needs
- [ ] `[D8]` Define expiration and revision handling

### Phase 2: Database Schema ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[DB1]` Create quotes table
- [ ] `[DB2]` Create quote_line_items table
- [ ] `[DB3]` Create quote_options table (pricing tiers)
- [ ] `[DB4]` Create quote_status_history table
- [ ] `[DB5]` Create quote_templates table
- [ ] `[DB6]` Create quote_approvals table
- [ ] `[DB7]` Link quotes to projects (conversion)
- [ ] `[DB8]` Add indexes for reporting

### Phase 3: Backend API ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` CRUD endpoints for quotes
- [ ] `[B2]` Line item management endpoints
- [ ] `[B3]` Quote option/tier management
- [ ] `[B4]` Quote PDF generation
- [ ] `[B5]` Quote sending endpoint
- [ ] `[B6]` Client approval endpoint
- [ ] `[B7]` Quote conversion to project
- [ ] `[B8]` Quote duplication and versioning

### Phase 4: Frontend - Quote List ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FL1]` Build QuotesList page
- [ ] `[FL2]` Build QuoteCard/Row component
- [ ] `[FL3]` Implement status filtering
- [ ] `[FL4]` Add client filtering
- [ ] `[FL5]` Display quote values and margins
- [ ] `[FL6]` Add date range filtering
- [ ] `[FL7]` Build quote search
- [ ] `[FL8]` Add quick actions

### Phase 5: Frontend - Quote Builder ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FB1]` Build QuoteBuilder page
- [ ] `[FB2]` Create ClientSelector component
- [ ] `[FB3]` Build LineItemEditor with reordering
- [ ] `[FB4]` Implement pricing tier options
- [ ] `[FB5]` Add scope of work editor
- [ ] `[FB6]` Build terms and conditions section
- [ ] `[FB7]` Add expiration date setting
- [ ] `[FB8]` Implement auto-save

### Phase 6: Frontend - Quote Preview & Send ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FP1]` Build QuotePreview page
- [ ] `[FP2]` Display formatted quote
- [ ] `[FP3]` Show PDF preview
- [ ] `[FP4]` Build send quote modal
- [ ] `[FP5]` Add email customization
- [ ] `[FP6]` Implement send history
- [ ] `[FP7]` Add reminder scheduling
- [ ] `[FP8]` Build quote sharing link

### Phase 7: Client-Facing Quote View ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FC1]` Build public quote view page
- [ ] `[FC2]` Display professional quote layout
- [ ] `[FC3]` Show pricing options clearly
- [ ] `[FC4]` Build option selector for client
- [ ] `[FC5]` Add accept/decline buttons
- [ ] `[FC6]` Build comment/request changes form
- [ ] `[FC7]` Display terms acceptance
- [ ] `[FC8]` Mobile-responsive design

### Phase 8: Templates & Analytics ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[T1]` Build QuoteTemplates page
- [ ] `[T2]` Create template builder
- [ ] `[T3]` Add template categories
- [ ] `[T4]` Build quote analytics dashboard
- [ ] `[T5]` Show conversion rates
- [ ] `[T6]` Display average quote values
- [ ] `[T7]` Show time-to-close metrics
- [ ] `[T8]` Add win/loss analysis

### Phase 9: PDF Generation & Polish ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[PDF1]` Create quote HTML template
- [ ] `[PDF2]` Style professional quote layout
- [ ] `[PDF3]` Add company branding
- [ ] `[PDF4]` Include all pricing details
- [ ] `[PDF5]` Handle multi-page quotes
- [ ] `[PDF6]` Optimize file size
- [ ] `[PDF7]` Testing and bug fixes
- [ ] `[PDF8]` Final review

---

## 📝 Work Log

### 2026-02-09 12:00 [[Org Chart/CEO/IDENTITY]] — Task Created
- Quote/estimate generation system
- Estimated 28 hours
- Requires SALES input for workflows
- Streamlines deal closing process

---

## 🚧 Blockers

**Current blockers:**
- TASK-005: Dashboard foundation
- TASK-006: Project management core
- Need quote template designs
- Finalize pricing models

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09 | Include pricing tiers (good/better/best) | SALES | Gives clients options while maintaining margin |
| 2026-02-09 | Public client-facing quote view | FOUNDER | Easy sharing, professional presentation |

---

## 🔗 Related

- **Parent:** [[LABS-ROADMAP.md]] — Phase 4: Integrations
- **Depends on:**
  - [[TASK-005]] — Dashboard foundation
  - [[TASK-006]] — Project management core (for conversion)
- **Blocks:** None
