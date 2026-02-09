---
id: "TASK-013"
title: "Build Client Portal - Engagements View"
status: "todo"
priority: "P1"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 12
actual_hours: 0
dependencies:
  - "TASK-012"
blocks:
  - "TASK-014"
  - "TASK-016"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "portal"
  - "P1"
  - "engagements"
  - "client"
---

# TASK-013: Build Client Portal - Engagements View

## 🎯 Objective
Create a comprehensive engagement management view where clients can see all their active and past engagements, track progress, view timelines, access deliverables, and communicate with their consulting team.

## 📖 Context
The engagements view is the heart of the client portal. Clients need visibility into what they're paying for, what's coming next, and how their projects are progressing. Transparency builds trust and reduces status update requests.

---

## ✅ Definition of Done

### Phase 1: Engagements List View
- [ ] `[1.1]` Create engagements listing:
  - [ ] `[1.1a]` Active engagements section
  - [ ] `[1.1b]` Completed engagements section
  - [ ] `[1.1c]` Engagement cards with:
    - [ ] `[1.1c1]` Engagement name
    - [ ] `[1.1c2]` Service type
    - [ ] `[1.1c3]` Status badge
    - [ ] `[1.1c4]` Progress indicator
    - [ ] `[1.1c5]` Start/end dates
    - [ ] `[1.1c6]` Assigned consultant(s)
  - [ ] `[1.1d]` Filter by status
  - [ ] `[1.1e]` Sort by date/status
  - [ ] `[1.1f]` Search engagements
  - [ ] `[1.1g]` Empty state for new clients

### Phase 2: Engagement Detail Page
- [ ] `[2.1]` Build engagement overview:
  - [ ] `[2.1a]` Engagement header (name, type, status)
  - [ ] `[2.1b]` Description and objectives
  - [ ] `[2.1c]` Key metrics/progress summary
  - [ ] `[2.1d]` Timeline visualization
  - [ ] `[2.1e]` Team members involved
- [ ] `[2.2]` Create phases/milestones view:
  - [ ] `[2.2a]` Phase list with status
  - [ ] `[2.2b]` Milestone markers
  - [ ] `[2.2c]` Completion percentages
  - [ ] `[2.2d]` Upcoming deadlines

### Phase 3: Progress Tracking
- [ ] `[3.1]` Implement progress visualization:
  - [ ] `[3.1a]` Overall progress bar
  - [ ] `[3.1b]` Phase-by-phase progress
  - [ ] `[3.1c]` Milestone completion indicators
  - [ ] `[3.1d]` Estimated completion date
  - [ ] `[3.1e]` Days remaining counter
- [ ] `[3.2]` Add status updates:
  - [ ] `[3.2a]` Latest update from consultant
  - [ ] `[3.2b]` Update history/timeline
  - [ ] `[3.2c]` Status change notifications

### Phase 4: Deliverables Summary
- [ ] `[4.1]` Show engagement deliverables:
  - [ ] `[4.1a]` Deliverables list
  - [ ] `[4.1b]` Status (pending/review/approved)
  - [ ] `[4.1c]` Due dates
  - [ ] `[4.1d]` Quick access links
  - [ ] `[4.1e]` Deliverable preview thumbnails

### Phase 5: Team & Communication
- [ ] `[5.1]` Display team information:
  - [ ] `[5.1a]` Pink Beam team members
  - [ ] `[5.1b]` Client team members
  - [ ] `[5.1c]` Contact information
  - [ ] `[5.1d]` Roles/responsibilities
- [ ] `[5.2]` Add communication hub:
  - [ ] `[5.2a]` Comments/notes section
  - [ ] `[5.2b]` @mentions for team members
  - [ ] `[5.2c]` File attachments in comments
  - [ ] `[5.2d]` Email notification toggle

### Phase 6: Documents & Files
- [ ] `[6.1]` Create documents section:
  - [ ] `[6.1a]` Shared files list
  - [ ] `[6.1b]` Folder organization
  - [ ] `[6.1c]` File upload (client → consultant)
  - [ ] `[6.1d]` Download functionality
  - [ ] `[6.1e]` File version history
  - [ ] `[6.1f]` Recent activity feed

### Phase 7: Timeline & Calendar
- [ ] `[7.1]` Build timeline view:
  - [ ] `[7.1a]` Visual timeline component
  - [ ] `[7.1b]` Phase markers
  - [ ] `[7.1c]` Milestone dates
  - [ ] `[7.1d]` Meetings/calls scheduled
  - [ ] `[7.1e]` Deliverable due dates
- [ ] `[7.2]` Integrate calendar:
  - [ ] `[7.2a]` Upcoming meetings view
  - [ ] `[7.2b]` Calendar sync (Google/Outlook)
  - [ ] `[7.2c]` Add to calendar buttons

### Phase 8: Engagement Settings
- [ ] `[8.1]` Create settings panel:
  - [ ] `[8.1a]` Notification preferences
  - [ ] `[8.1b]` Team member management (add/remove)
  - [ ] `[8.1c]` Engagement details view
  - [ ] `[8.1d]` Contract/SOW access

### Phase 9: Mobile Responsiveness
- [ ] `[9.1]` Optimize for mobile:
  - [ ] `[9.1a]` Stacked card layout
  - [ ] `[9.1b]` Collapsible sections
  - [ ] `[9.1c]` Touch-optimized timeline
  - [ ] `[9.1d]` Bottom sheet for details

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

- Waiting for: TASK-012 (Dashboard Foundation)

---

## 🔗 Related

- **Depends on:** TASK-012
- **Blocks:** TASK-014 (Deliverables Viewer), TASK-016 (Engagement Builder)
- **Related Docs:** ARCHITECTURE.md (Portal section)
