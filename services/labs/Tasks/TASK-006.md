---
id: TASK-006
title: Project management core
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
estimated_hours: 36
actual_hours: 0
dependencies:
  - "[[TASK-005]]"
blocks:
  - TASK-007
  - TASK-008
  - TASK-009
  - TASK-014
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - backend
  - frontend
  - project-management
  - core
  - P1
---

# TASK-006: Project management core

## 🎯 Objective
Implement the core project management functionality including project creation, status tracking, milestones, and client collaboration features.

## 📖 Context
The project management system is the heart of the client dashboard. It needs to:
- Allow PMs to create and manage projects
- Give clients visibility into project status
- Track milestones and deliverables
- Support file attachments and comments
- Enable feedback loops and approvals
- Show project timeline and progress

This system should feel familiar (like Trello/Linear) but be tailored for agency-client collaboration.

---

## ✅ Definition of Done

### Phase 1: Requirements & Design ([[Org Chart/PM/IDENTITY]])
- [ ] `[R1]` Define project lifecycle stages
- [ ] `[R2]` Design project status workflow
- [ ] `[R3]` Define milestone structure
- [ ] `[R4]` Plan client feedback/approval flow
- [ ] `[R5]` Design notification triggers
- [ ] `[R6]` Create project templates for common engagements
- [ ] `[R7]` Define permissions matrix (PM vs Client vs Admin)

### Phase 2: Database Schema ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[D1]` Create projects table
- [ ] `[D2]` Create project_members table (linking users to projects)
- [ ] `[D3]` Create milestones table
- [ ] `[D4]` Create deliverables table
- [ ] `[D5]` Create project_status_history table (audit trail)
- [ ] `[D6]` Create project_templates table
- [ ] `[D7]` Set up relationships and constraints
- [ ] `[D8]` Create indexes for performance

### Phase 3: Backend API Development ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` CRUD endpoints for projects
- [ ] `[B2]` Project membership management endpoints
- [ ] `[B3]` Milestone management endpoints
- [ ] `[B4]` Deliverable management endpoints
- [ ] `[B5]` Project status transition endpoints
- [ ] `[B6]` Project search and filtering endpoints
- [ ] `[B7]` Activity logging endpoints
- [ ] `[B8]` Template application endpoints

### Phase 4: Frontend - Project List ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[F1]` Build ProjectsList page
- [ ] `[F2]` Build ProjectCard component
- [ ] `[F3]` Implement project filtering (status, client, date)
- [ ] `[F4]` Add project search
- [ ] `[F5]` Build project creation modal
- [ ] `[F6]` Implement project archive/delete
- [ ] `[F7]` Add sorting options
- [ ] `[F8]` Build empty state and onboarding

### Phase 5: Frontend - Project Detail ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[PD1]` Build ProjectDetail page layout
- [ ] `[PD2]` Build ProjectHeader with status controls
- [ ] `[PD3]` Build MilestonesSection component
- [ ] `[PD4]` Build DeliverablesList component
- [ ] `[PD5]` Build Timeline/Gantt view component
- [ ] `[PD6]` Build ProjectActivity feed
- [ ] `[PD7]` Build TeamMembers section
- [ ] `[PD8]` Build ClientInfo section

### Phase 6: Frontend - Milestones & Deliverables ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[M1]` Build MilestoneCard component
- [ ] `[M2]` Build MilestoneCreation modal
- [ ] `[M3]` Build MilestoneProgress visualization
- [ ] `[M4]` Build DeliverableCard component
- [ ] `[M5]` Build DeliverableUpload/attachment flow
- [ ] `[M6]` Implement deliverable status updates
- [ ] `[M7]` Build dependency linking UI
- [ ] `[M8]` Add drag-and-drop reordering

### Phase 7: Collaboration Features ([[Org Chart/ENG-FULL/IDENTITY]])
- [ ] `[C1]` Build Comments system on projects
- [ ] `[C2]` Build Comments on deliverables
- [ ] `[C3]` Implement @mentions
- [ ] `[C4]` Build Approval workflow UI
- [ ] `[C5]` Implement notification triggers
- [ ] `[C6]` Add email notification templates
- [ ] `[C7]` Build real-time updates (WebSocket)
- [ ] `[C8]` Implement activity logging display

### Phase 8: Templates & Polish ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[T1]` Build ProjectTemplates page
- [ ] `[T2]` Build TemplateCard component
- [ ] `[T3]` Implement template application flow
- [ ] `[T4]` Create default templates (AI Dev, Web App, etc.)
- [ ] `[T5]` Add project duplication
- [ ] `[T6]` Performance optimization
- [ ] `[T7]` Responsive design review
- [ ] `[T8]` Accessibility audit

---

## 📝 Work Log

### 2026-02-09 12:00 [[Org Chart/CEO/IDENTITY]] — Task Created
- Core project management functionality
- Estimated 36 hours
- Requires PM input for workflow design
- Foundation for task tracking, time tracking, and invoicing

---

## 🚧 Blockers

**Current blockers:**
- TASK-005: Dashboard foundation must be complete
- Need PM to define project workflow
- Finalize project template types

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09 | Include project templates | PM | Speeds up project creation for common engagements |
| 2026-02-09 | Activity logging for audit trail | ENG-LEAD | Important for accountability and dispute resolution |

---

## 🔗 Related

- **Parent:** [[LABS-ROADMAP.md]] — Phase 3: Project Management
- **Depends on:** [[TASK-005]] — Dashboard foundation
- **Blocks:**
  - [[TASK-007]] — Task/issue tracking
  - [[TASK-008]] — Time tracking
  - [[TASK-009]] — Invoice generation
  - [[TASK-014]] — Sprint planning
