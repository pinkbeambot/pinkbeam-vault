---
id: "TASK-015"
title: "Build Admin Dashboard - Client Management"
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
  - "TASK-011"
blocks:
  - "TASK-016"
  - "TASK-018"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "admin"
  - "P1"
  - "clients"
  - "crm"
---

# TASK-015: Build Admin Dashboard - Client Management

## 🎯 Objective
Create a comprehensive client management interface for Pink Beam consultants to view all clients, manage organizations, invite users, track engagement history, and maintain client records.

## 📖 Context
The admin client management system is the CRM backbone for Pink Beam. It needs to provide a complete view of client relationships, enable efficient onboarding, and support ongoing account management activities.

---

## ✅ Definition of Done

### Phase 1: Client Database Schema
- [ ] `[1.1]` Extend database for admin:
  - [ ] `[1.1a]` Organizations table
  - [ ] `[1.1b]` Organization profiles
  - [ ] `[1.1c]` Organization settings
  - [ ] `[1.1d]` Client tags/categories
  - [ ] `[1.1e]` Custom fields support
  - [ ] `[1.1f]` Client status tracking

### Phase 2: Clients List View
- [ ] `[2.1]` Build clients dashboard:
  - [ ] `[2.1a]` All clients table/grid
  - [ ] `[2.1b]` Quick stats (total, active, new this month)
  - [ ] `[2.1c]` Filter by status
  - [ ] `[2.1d]` Filter by industry
  - [ ] `[2.1e]` Filter by engagement type
  - [ ] `[2.1f]` Search by name/contact
  - [ ] `[2.1g]` Sort by various columns
  - [ ] `[2.1h]` Pagination
  - [ ] `[2.1i]` Export to CSV
- [ ] `[2.2]` Client card design:
  - [ ] `[2.2a]` Company logo/name
  - [ ] `[2.2b]` Primary contact
  - [ ] `[2.2c]` Active engagements count
  - [ ] `[2.2d]` Last activity date
  - [ ] `[2.2e]` Health/status indicator

### Phase 3: Client Detail Page
- [ ] `[3.1]` Create client profile view:
  - [ ] `[3.1a]` Organization header
  - [ ] `[3.1b]` Company information
  - [ ] `[3.1c]` Industry, size, location
  - [ ] `[3.1d]` Website and social links
  - [ ] `[3.1e]` Notes section
- [ ] `[3.2]` Show engagement history:
  - [ ] `[3.2a]` All engagements list
  - [ ] `[3.2b]` Engagement status
  - [ ] `[3.2c]` Contract values
  - [ ] `[3.2d]` Total lifetime value
- [ ] `[3.3]` Display team members:
  - [ ] `[3.3a]` Client users list
  - [ ] `[3.3b]` Roles and permissions
  - [ ] `[3.3c]` Last login dates
  - [ ] `[3.3d]` Invite new user button

### Phase 4: Client Onboarding
- [ ] `[4.1]` Create onboarding workflow:
  - [ ] `[4.1a]` Add new client form
  - [ ] `[4.1b]` Organization creation
  - [ ] `[4.1c]` Primary contact setup
  - [ ] `[4.1d]` Portal invitation email
  - [ ] `[4.1e]` Welcome sequence trigger
- [ ] `[4.2]` Build invitation system:
  - [ ] `[4.2a]` Generate invite links
  - [ ] `[4.2b]` Bulk invite users
  - [ ] `[4.2c]` Resend invitations
  - [ ] `[4.2d]` Expire old invites

### Phase 5: User Management
- [ ] `[5.1]` Manage client users:
  - [ ] `[5.1a]` View all users
  - [ ] `[5.1b]` Edit user details
  - [ ] `[5.1c]` Change roles/permissions
  - [ ] `[5.1d]` Deactivate users
  - [ ] `[5.1e]` Reset passwords
- [ ] `[5.2]` Role management:
  - [ ] `[5.2a]` Predefined role templates
  - [ ] `[5.2b]` Custom role creation
  - [ ] `[5.2c]` Permission matrix

### Phase 6: Communication Tools
- [ ] `[6.1]` Client communication:
  - [ ] `[6.1a]` Send direct message/email
  - [ ] `[6.1b]` View message history
  - [ ] `[6.1c]` Schedule follow-up reminders
  - [ ] `[6.1d]` Log phone calls/meetings
- [ ] `[6.2]` Notes and activity:
  - [ ] `[6.2a]` Internal notes (consultant-only)
  - [ ] `[6.2b]` Activity timeline
  - [ ] `[6.2c]` Important dates/reminders

### Phase 7: Document Management
- [ ] `[7.1]` Client documents:
  - [ ] `[7.1a]` Upload SOWs and contracts
  - [ ] `[7.1b]` Store NDAs
  - [ ] `[7.1c]` Organize by engagement
  - [ ] `[7.1d]` Version control
  - [ ] `[7.1e]` Document templates

### Phase 8: Reporting & Insights
- [ ] `[8.1]` Client analytics:
  - [ ] `[8.1a]` Client health scores
  - [ ] `[8.1b]` Engagement velocity
  - [ ] `[8.1c]` Payment status overview
  - [ ] `[8.1d]` Activity heatmaps
- [ ] `[8.2]` Lists and segments:
  - [ ] `[8.2a]` Saved filtered views
  - [ ] `[8.2b]` Client segments
  - [ ] `[8.2c]` Bulk actions

### Phase 9: Integrations
- [ ] `[9.1]` CRM integration:
  - [ ] `[9.1a]` HubSpot sync
  - [ ] `[9.1b]` Contact sync
  - [ ] `[9.1c]` Activity logging
- [ ] `[9.2]` Calendar integration:
  - [ ] `[9.2a]` View client meetings
  - [ ] `[9.2b]` Schedule from admin

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

- Waiting for: TASK-012 (Dashboard Foundation), TASK-011 (Workshop Booking)

---

## 🔗 Related

- **Depends on:** TASK-012, TASK-011
- **Blocks:** TASK-016 (Engagement Builder), TASK-018 (Proposal Generation)
- **Related Docs:** ARCHITECTURE.md (Admin section)
