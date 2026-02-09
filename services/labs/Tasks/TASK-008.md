---
id: TASK-008
title: Time tracking system
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
  - "[[Org Chart/PM/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 28
actual_hours: 0
dependencies:
  - "[[TASK-006]]"
blocks:
  - TASK-009
  - TASK-015
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - backend
  - frontend
  - time-tracking
  - billing
  - P1
---

# TASK-008: Time tracking system

## 🎯 Objective
Implement a time tracking system for logging hours against projects and tasks. Include timer functionality, manual entry, reporting, and integration with invoicing.

## 📖 Context
Accurate time tracking is essential for:
- Billing clients accurately
- Understanding project profitability
- Tracking team productivity
- Estimating future projects
- Providing transparency to clients

The system should be easy to use (not burdensome) while capturing accurate data. It should support both real-time tracking (timer) and manual entry (after the fact).

---

## ✅ Definition of Done

### Phase 1: Design & UX ([[Org Chart/DESIGN-UI/IDENTITY]])
- [ ] `[D1]` Design timer interface
- [ ] `[D2]` Design time entry form
- [ ] `[D3]` Design timesheet view (daily/weekly)
- [ ] `[D4]` Design time reports and analytics
- [ ] `[D5]` Design project time summary view
- [ ] `[D6]` Design team time dashboard
- [ ] `[D7]` Define time entry categories
- [ ] `[D8]` Design time approval workflow

### Phase 2: Database Schema ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[DB1]` Create time_entries table
- [ ] `[DB2]` Create timers table (for active tracking)
- [ ] `[DB3]` Create time_categories table
- [ ] `[DB4]` Create time_approvals table
- [ ] `[DB5]` Add time tracking columns to tasks
- [ ] `[DB6]` Add time tracking columns to projects
- [ ] `[DB7]` Create time_entry_tags table
- [ ] `[DB8]` Set up indexes for reporting queries

### Phase 3: Backend API ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` CRUD endpoints for time entries
- [ ] `[B2]` Timer start/pause/stop endpoints
- [ ] `[B3]` Time entry reporting endpoints
- [ ] `[B4]` Project time summary endpoints
- [ ] `[B5]` Team time reporting endpoints
- [ ] `[B6]` Time approval workflow endpoints
- [ ] `[B7]` Export endpoints (CSV, PDF)
- [ ] `[B8]` Validation and conflict detection

### Phase 4: Frontend - Timer ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FT1]` Build TimerWidget component
- [ ] `[FT2]` Build TimerDisplay with play/pause/stop
- [ ] `[FT3]` Implement project/task selector for timer
- [ ] `[FT4]` Add timer description/note field
- [ ] `[FT5]` Build recent tasks quick-select
- [ ] `[FT6]` Implement idle detection warning
- [ ] `[FT7]` Add keyboard shortcuts
- [ ] `[FT8]` Build timer in header (persistent)

### Phase 5: Frontend - Time Entry ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FE1]` Build TimeEntryForm component
- [ ] `[FE2]` Implement date picker
- [ ] `[FE3]` Build duration input (hours:minutes)
- [ ] `[FE4]` Add start/end time inputs (alternative)
- [ ] `[FE5]` Build project/task selector
- [ ] `[FE6]` Add billable/non-billable toggle
- [ ] `[FE7]` Implement description field
- [ ] `[FE8]` Add category selector

### Phase 6: Frontend - Timesheet Views ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FS1]` Build DailyTimesheet view
- [ ] `[FS2]` Build WeeklyTimesheet view
- [ ] `[FS3]` Build MonthlyTimesheet view
- [ ] `[FS4]` Implement time entry editing inline
- [ ] `[FS5]` Add bulk edit functionality
- [ ] `[FS6]` Build timesheet submission flow
- [ ] `[FS7]` Add timesheet status indicators
- [ ] `[FS8]` Implement copy from previous week

### Phase 7: Frontend - Reporting ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FR1]` Build TimeReports page
- [ ] `[FR2]` Build ProjectTimeReport component
- [ ] `[FR3]` Build TeamTimeReport component
- [ ] `[FR4]` Build IndividualTimeReport component
- [ ] `[FR5]` Implement date range filtering
- [ ] `[FR6]` Add export to CSV/PDF
- [ ] `[FR7]` Build time breakdown charts
- [ ] `[FR8]` Add saved report templates

### Phase 8: Integrations & Polish ([[Org Chart/ENG-FULL/IDENTITY]])
- [ ] `[I1]` Integrate with task tracking (log time on tasks)
- [ ] `[I2]` Integrate with project management (show time on projects)
- [ ] `[I3]` Build time approval workflow UI
- [ ] `[I4]` Add notifications for time submission
- [ ] `[I5]` Implement time rounding rules
- [ ] `[I6]` Add overtime calculations
- [ ] `[I7]` Performance optimization for reports
- [ ] `[I8]` Testing and bug fixes

---

## 📝 Work Log

### 2026-02-09 12:00 [[Org Chart/CEO/IDENTITY]] — Task Created
- Time tracking system for accurate billing
- Estimated 28 hours
- Must be easy to use to encourage adoption
- Foundation for invoicing system

---

## 🚧 Blockers

**Current blockers:**
- TASK-006: Project management core must be complete
- Need to define billable vs non-billable categories
- Finalize time rounding rules

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09] | Support both timer and manual entry | FOUNDER | Flexibility for different work styles |
| 2026-02-09] | Billable/non-billable distinction | PM | Some work may be internal or fixed-price |

---

## 🔗 Related

- **Parent:** [[LABS-ROADMAP.md]] — Phase 3: Project Management
- **Depends on:** [[TASK-006]] — Project management core
- **Blocks:**
  - [[TASK-009]] — Invoice generation
  - [[TASK-015]] — Team workload dashboard
