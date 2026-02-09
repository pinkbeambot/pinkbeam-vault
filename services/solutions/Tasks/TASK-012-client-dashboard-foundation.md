---
id: "TASK-012"
title: "Build Client Dashboard Foundation"
status: "todo"
priority: "P0"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 10
actual_hours: 0
dependencies:
  - "TASK-001"
blocks:
  - "TASK-013"
  - "TASK-014"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "portal"
  - "P0"
  - "foundation"
  - "auth"
---

# TASK-012: Build Client Dashboard Foundation

## 🎯 Objective
Create the foundational architecture for the client portal including authentication, authorization, dashboard layout, navigation, and user context management that all client-facing features will build upon.

## 📖 Context
The client portal is where engaged clients interact with Pink Beam—viewing deliverables, tracking progress, and accessing resources. This foundation must be secure, scalable, and provide a premium experience that reflects our consulting brand.

---

## ✅ Definition of Done

### Phase 1: Authentication System
- [ ] `[1.1]` Set up Supabase Auth:
  - [ ] `[1.1a]` Email/password login
  - [ ] `[1.1b]` Magic link option
  - [ ] `[1.1c]` Google OAuth for enterprise SSO
  - [ ] `[1.1d]` Password reset flow
  - [ ] `[1.1e]` Session management
- [ ] `[1.2]` Create auth UI components:
  - [ ] `[1.2a]` Login page
  - [ ] `[1.2b]` Signup page (invitation-only)
  - [ ] `[1.2c]` Forgot password page
  - [ ] `[1.2d]` Password reset page
  - [ ] `[1.2e]` Auth error states

### Phase 2: Authorization & Roles
- [ ] `[2.1]` Define user roles:
  - [ ] `[2.1a]` Client Admin (full access)
  - [ ] `[2.1b]` Client Member (view-only or limited)
  - [ ] `[2.1c]` Consultant (Pink Beam team)
  - [ ] `[2.1d]` Admin (Pink Beam admin)
- [ ] `[2.2]` Implement role-based access:
  - [ ] `[2.2a]` Route guards middleware
  - [ ] `[2.2b]` UI element visibility by role
  - [ ] `[2.2c]` API permission checks
  - [ ] `[2.2d]` Organization isolation

### Phase 3: Dashboard Layout
- [ ] `[3.1]` Create portal shell:
  - [ ] `[3.1a]` Sidebar navigation
  - [ ] `[3.1b]` Header with user menu
  - [ ] `[3.1c]` Breadcrumb navigation
  - [ ] `[3.1d]` Page content area
  - [ ] `[3.1e]` Collapsible sidebar (mobile)
- [ ] `[3.2]` Build navigation structure:
  - [ ] `[3.2a]` Dashboard home
  - [ ] `[3.2b]` Engagements
  - [ ] `[3.2c]` Deliverables
  - [ ] `[3.2d]` Resources
  - [ ] `[3.2e]` Team/Contacts
  - [ ] `[3.2f]` Settings

### Phase 4: User Context
- [ ] `[4.1]` Set up user state:
  - [ ] `[4.1a]` User profile context
  - [ ] `[4.1b]` Organization context
  - [ ] `[4.1c]` Active engagement context
  - [ ] `[4.1d]` Notifications state
- [ ] `[4.2]` Create user menu:
  - [ ] `[4.2a]` Profile link
  - [ ] `[4.2b]` Organization switcher (if multiple)
  - [ ] `[4.2c]` Settings link
  - [ ] `[4.2d]` Logout

### Phase 5: Dashboard Home Page
- [ ] `[5.1]` Build dashboard overview:
  - [ ] `[5.1a]` Welcome message with user name
  - [ ] `[5.1b]` Active engagements summary
  - [ ] `[5.1c]` Recent deliverables
  - [ ] `[5.1d]` Upcoming milestones
  - [ ] `[5.1e]` Notifications/alerts
  - [ ] `[5.1f]` Quick actions
- [ ] `[5.2]` Add empty states:
  - [ ] `[5.2a]` New client onboarding
  - [ ] `[5.2b]` No active engagements

### Phase 6: Route Structure
- [ ] `[6.1]` Create route groups:
  - [ ] `[6.1a]` (marketing) - public pages
  - [ ] `[6.1b]` (portal) - authenticated client area
  - [ ] `[6.1c]` (admin) - consultant/admin area
- [ ] `[6.2]` Set up route guards:
  - [ ] `[6.2a]` Protect portal routes
  - [ ] `[6.2b]` Protect admin routes
  - [ ] `[6.2c]` Redirect unauthenticated users
  - [ ] `[6.2d]` Handle role-based redirects

### Phase 7: Loading & Error States
- [ ] `[7.1]` Create loading UI:
  - [ ] `[7.1a]` Page loading skeletons
  - [ ] `[7.1b]` Component loading states
  - [ ] `[7.1c]` Suspense boundaries
- [ ] `[7.2]` Create error handling:
  - [ ] `[7.2a]` Error boundaries
  - [ ] `[7.2b]` 404 pages
  - [ ] `[7.2c]` Auth error handling
  - [ ] `[7.2d]` Generic error page

### Phase 8: Responsive Design
- [ ] `[8.1]` Mobile adaptation:
  - [ ] `[8.1a]` Mobile navigation drawer
  - [ ] `[8.1b]` Touch-friendly targets
  - [ ] `[8.1c]` Responsive layouts
  - [ ] `[8.1d]` Tablet optimization

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

- Waiting for: TASK-001 (Initialize Project)

---

## 🔗 Related

- **Depends on:** TASK-001
- **Blocks:** TASK-013 (Engagements View), TASK-014 (Deliverables Viewer)
- **Related Docs:** ARCHITECTURE.md (Portal section)
