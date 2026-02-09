---
id: TASK-007
title: Task/issue tracking
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
estimated_hours: 32
actual_hours: 0
dependencies:
  - "[[TASK-006]]"
blocks:
  - TASK-014
  - TASK-015
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - backend
  - frontend
  - tasks
  - issues
  - tracking
  - P1
---

# TASK-007: Task/issue tracking

## 🎯 Objective
Build a comprehensive task and issue tracking system for managing work items within projects. Include Kanban board, list views, and detailed task management.

## 📖 Context
Task tracking allows teams to break down projects into manageable pieces and gives clients visibility into what work is happening. Features needed:
- Create and assign tasks within projects
- Track task status through workflow stages
- Support different task types (feature, bug, chore, etc.)
- Priority and severity levels
- Time estimates and actuals
- Labels and categorization
- Comments and attachments
- Subtasks and dependencies

The experience should be comparable to Linear, GitHub Issues, or Jira but simpler and client-friendly.

---

## ✅ Definition of Done

### Phase 1: Design & UX ([[Org Chart/DESIGN-UI/IDENTITY]])
- [ ] `[D1]` Design Kanban board view
- [ ] `[D2]` Design list/table view
- [ ] `[D3]` Design task detail modal/page
- [ ] `[D4]` Design task creation flow
- [ ] `[D5]` Design task card component
- [ ] `[D6]` Design filter and search UI
- [ ] `[D7]` Define task workflow states
- [ ] `[D8]` Design bulk actions UI

### Phase 2: Database Schema ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[DB1]` Create tasks table
- [ ] `[DB2]` Create task_types table
- [ ] `[DB3]` Create task_statuses table (per project)
- [ ] `[DB4]` Create labels table
- [ ] `[DB5]` Create task_labels junction table
- [ ] `[DB6]` Create subtasks table
- [ ] `[DB7]` Create task_dependencies table
- [ ] `[DB8]` Create task_assignees table

### Phase 3: Backend API ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` CRUD endpoints for tasks
- [ ] `[B2]` Task filtering and search endpoints
- [ ] `[B3]` Task assignment endpoints
- [ ] `[B4]` Status transition endpoints
- [ ] `[B5]` Subtask management endpoints
- [ ] `[B6]` Label management endpoints
- [ ] `[B7]` Task dependency endpoints
- [ ] `[B8]` Bulk operation endpoints

### Phase 4: Frontend - Board View ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FB1]` Build KanbanBoard component
- [ ] `[FB2]` Build KanbanColumn component
- [ ] `[FB3]` Build KanbanCard component
- [ ] `[FB4]` Implement drag-and-drop (dnd-kit)
- [ ] `[FB5]` Add column configuration
- [ ] `[FB6]` Implement swimlanes (optional)
- [ ] `[FB7]` Add board filters
- [ ] `[FB8]` Implement real-time updates

### Phase 5: Frontend - List View ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FL1]` Build TaskList page
- [ ] `[FL2]` Build DataTable for tasks
- [ ] `[FL3]` Implement column customization
- [ ] `[FL4]` Add sorting functionality
- [ ] `[FL5]` Implement pagination
- [ ] `[FL6]` Add bulk actions toolbar
- [ ] `[FL7]` Build quick filters
- [ ] `[FL8]` Add saved views

### Phase 6: Frontend - Task Detail ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[TD1]` Build TaskDetail modal/page
- [ ] `[TD2]` Build TaskHeader with status dropdown
- [ ] `[TD3]` Build TaskDescription editor (rich text)
- [ ] `[TD4]` Build TaskMetadata sidebar
- [ ] `[TD5]` Build AssigneeSelector component
- [ ] `[TD6]` Build LabelSelector component
- [ ] `[TD7]` Build DueDate picker
- [ ] `[TD8]` Build TimeEstimate input

### Phase 7: Frontend - Task Creation ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[TC1]` Build CreateTask modal
- [ ] `[TC2]` Implement quick create (just title)
- [ ] `[TC3]` Implement full create (all fields)
- [ ] `[TC4]` Add template tasks
- [ ] `[TC5]` Implement task duplication
- [ ] `[TC6]` Build inline create in board view
- [ ] `[TC7]` Add create from email (optional)
- [ ] `[TC8]` Create keyboard shortcuts

### Phase 8: Advanced Features ([[Org Chart/ENG-FULL/IDENTITY]])
- [ ] `[A1]` Implement subtasks UI
- [ ] `[A2]` Build dependency visualization
- [ ] `[A3]` Add task relationships (blocked by, related to)
- [ ] `[A4]` Implement recurring tasks
- [ ] `[A5]` Build task templates
- [ ] `[A6]` Add @mentions in descriptions
- [ ] `[A7]` Implement task watch/subscribe
- [ ] `[A8]` Add time tracking integration hook

### Phase 9: Search & Automation ([[Org Chart/ENG-FULL/IDENTITY]])
- [ ] `[S1]` Build global task search
- [ ] `[S2]` Implement advanced filters
- [ ] `[S3]` Add search syntax (e.g., "is:open assignee:me")
- [ ] `[S4]` Build recent/quick access
- [ ] `[S5]` Implement notification rules
- [ ] `[S6]` Add webhook support (optional)
- [ ] `[S7]` Performance optimization
- [ ] `[S8]` Testing and bug fixes

---

## 📝 Work Log

### 2026-02-09 12:00 [[Org Chart/CEO/IDENTITY]] — Task Created
- Task and issue tracking system
- Estimated 32 hours
- Comparable to Linear or GitHub Issues
- Must integrate with time tracking and project management

---

## 🚧 Blockers

**Current blockers:**
- TASK-006: Project management core must be complete
- Need to define task workflow states
- Finalize label taxonomy

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09 | Kanban board as primary view | DESIGN-LEAD | Visual, intuitive, industry standard |
| 2026-02-09] | Drag-and-drop using dnd-kit | ENG-FE | Accessible, modern, well-supported |

---

## 🔗 Related

- **Parent:** [[LABS-ROADMAP.md]] — Phase 3: Project Management
- **Depends on:** [[TASK-006]] — Project management core
- **Blocks:**
  - [[TASK-014]] — Sprint/iteration planning
  - [[TASK-015]] — Team workload dashboard
