---
id: "TASK-005"
title: "Project Management Core"
status: "todo"
priority: "P1"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
  - "[[Org Chart/DESIGN/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 40
actual_hours: 0
dependencies:
  - "TASK-004"
blocks:
  - "TASK-006"
  - "TASK-009"

is_active: false
verified_by: ""

phase_reviews:
  - phase: "Backend"
    worker: "[[Org Chart/ENG-BE/IDENTITY]]"
    reviewer: "[[Org Chart/CTO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""
  - phase: "Frontend"
    worker: "[[Org Chart/ENG-FE/IDENTITY]]"
    reviewer: "[[Org Chart/CTO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""
  - phase: "Design"
    worker: "[[Org Chart/DESIGN/IDENTITY]]"
    reviewer: "[[Org Chart/CDO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "engineering"
  - "backend"
  - "frontend"
  - "P1"
---

# TASK-005: Project Management Core

## 🎯 Objective
Build the core project management functionality including project CRUD, status tracking, timeline visualization, and basic project overview.

## 📖 Context
Projects are the primary organizing entity in the Labs platform. Each client organization can have multiple projects. This task establishes the project data model and management interface.

Features include:
- Project creation and configuration
- Status tracking (planning, active, on-hold, completed)
- Timeline/Gantt view
- Project details and settings
- Activity feed per project

---

## ✅ Definition of Done

### Backend Implementation ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` Database schema:
  - [ ] `[B1a]` projects table with full schema
  - [ ] `[B1b]` project_members table (access control)
  - [ ] `[B1c]` project_settings JSON structure
  - [ ] `[B1d]` Indexes for performance
- [ ] `[B2]` tRPC routers:
  - [ ] `[B2a]` project.list (with pagination, filters)
  - [ ] `[B2b]` project.getById
  - [ ] `[B2c]` project.create
  - [ ] `[B2d]` project.update
  - [ ] `[B2e]` project.archive
  - [ ] `[B2f]` project.delete (soft delete)
- [ ] `[B3]` Validation schemas (Zod):
  - [ ] `[B3a]` Project creation schema
  - [ ] `[B3b]` Project update schema
- [ ] `[B4]` Authorization:
  - [ ] `[B4a]` Project access middleware
  - [ ] `[B4b]` Role-based permissions
- [ ] `[B5]` Activity logging:
  - [ ] `[B5a]` Log project creation
  - [ ] `[B5b]` Log status changes
  - [ ] `[B5c]` Log setting updates

### Frontend Implementation ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[F1]` Project list page (`/dashboard/projects`):
  - [ ] `[F1a]` Data table with sorting/filtering
  - [ ] `[F1b]` Status badges
  - [ ] `[F1c]` Progress indicators
  - [ ] `[F1d]` Quick actions menu
  - [ ] `[F1e]` Empty state
  - [ ] `[F1f]` Create project button
- [ ] `[F2]` Project detail page (`/dashboard/projects/[id]`):
  - [ ] `[F2a]` Project header with status
  - [ ] `[F2b]` Overview tab
  - [ ] `[F2c]` Timeline/Gantt view
  - [ ] `[F2d]` Team members section
  - [ ] `[F2e]` Settings tab
- [ ] `[F3]` Project creation modal:
  - [ ] `[F3a]` Multi-step form
  - [ ] `[F3b]` Project name & description
  - [ ] `[F3c]` Date range picker
  - [ ] `[F3d]` Budget hours input
  - [ ] `[F3e]` Team member selection
- [ ] `[F4]` Project editing:
  - [ ] `[F4a]` Inline editing for simple fields
  - [ ] `[F4b]` Full edit modal
  - [ ] `[F4c]` Status change workflow
- [ ] `[F5]` Timeline/Gantt component:
  - [ ] `[F5a]` Horizontal bar chart for phases
  - [ ] `[F5b]` Today marker
  - [ ] `[F5c]` Date range selection
  - [ ] `[F5d]` Milestone markers
- [ ] `[F6]` Dashboard widgets:
  - [ ] `[F6a]` Recent projects list
  - [ ] `[F6b]` Active projects count
  - [ ] `[F6c]` Projects by status chart

### Design Phase ([[Org Chart/DESIGN/IDENTITY]])
- [ ] `[D1]` Project list page design
- [ ] `[D2]` Project detail page layout
- [ ] `[D3]` Project creation flow
- [ ] `[D4]` Timeline/Gantt visualization
- [ ] `[D5]` Status badge system
- [ ] `[D6]` Empty states

### Integration ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[I1]` E2E test: Create project flow
- [ ] `[I2]` E2E test: Edit project flow
- [ ] `[I3]` E2E test: Archive project
- [ ] `[I4]` Activity feed integration

---

## 📝 Work Log

---

## 🚧 Blockers

**Current blockers:**
- Waiting for [[TASK-004]] — Dashboard foundation and auth

**Potential blockers:**
- Complex permission model may need refinement

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[ROADMAP.md]] — Phase 3: Project Management Core
- **Depends on:** [[TASK-004]] — Dashboard foundation
- **Blocks:**
  - [[TASK-006]] — Tasks need projects
  - [[TASK-009]] — GitHub sync needs project structure

---

## 🏁 Completion Notes

*To be filled when complete*
