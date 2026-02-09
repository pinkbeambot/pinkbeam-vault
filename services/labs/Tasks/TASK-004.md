---
id: "TASK-004"
title: "Client Dashboard Foundation"
status: "todo"
priority: "P0"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-BE/IDENTITY]]"
  - "[[Org Chart/DESIGN/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 32
actual_hours: 0
dependencies:
  - "TASK-001"
blocks:
  - "TASK-005"
  - "TASK-006"
  - "TASK-007"

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
  - "frontend"
  - "backend"
  - "P0"
---

# TASK-004: Client Dashboard Foundation

## 🎯 Objective
Build the foundational architecture for the client dashboard including authentication, layout shell, organization context, and basic navigation.

## 📖 Context
This is the first client-facing functional feature. It establishes the architecture for all future dashboard features. The dashboard will be a single-page application feel within Next.js App Router.

Key requirements:
- Magic link authentication (passwordless)
- Organization switching
- Responsive sidebar navigation
- Real-time updates foundation

---

## ✅ Definition of Done

### Backend Implementation ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` Database setup:
  - [ ] `[B1a]` Create organizations table
  - [ ] `[B1b]` Create users table (sync with Clerk)
  - [ ] `[B1c]` Create memberships table (user-org relationship)
  - [ ] `[B1d]` Set up RLS policies
- [ ] `[B2]` Clerk integration:
  - [ ] `[B2a]` Configure Clerk application
  - [ ] `[B2b]` Set up webhook handlers
  - [ ] `[B2c]` User sync webhook (Clerk → Database)
  - [ ] `[B2d]` Organization sync webhook
- [ ] `[B3]` API routes:
  - [ ] `[B3a]` GET /api/user/me
  - [ ] `[B3b]` GET /api/organizations
  - [ ] `[B3c]` POST /api/organizations/switch
- [ ] `[B4]` Middleware:
  - [ ] `[B4a]` Auth middleware
  - [ ] `[B4b]` Org context middleware

### Frontend Implementation ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[F1]` Authentication setup:
  - [ ] `[F1a]` Install @clerk/nextjs
  - [ ] `[F1b]` Configure ClerkProvider
  - [ ] `[F1c]` Create auth layout
  - [ ] `[F1d]` Sign-in page with magic link
  - [ ] `[F1e]` Sign-up flow
- [ ] `[F2]` Dashboard layout shell:
  - [ ] `[F2a]` Sidebar navigation component
  - [ ] `[F2b]` Top header with user menu
  - [ ] `[F2c]` Organization switcher dropdown
  - [ ] `[F2d]` Breadcrumb navigation
  - [ ] `[F2e]` Mobile navigation (drawer)
- [ ] `[F3]` Core pages structure:
  - [ ] `[F3a]` `/dashboard` — Overview/home
  - [ ] `[F3b]` `/dashboard/projects` — Project list
  - [ ] `[F3c]` `/dashboard/settings` — User settings
  - [ ] `[F3d]` `/dashboard/billing` — Billing overview
- [ ] `[F4]` State management:
  - [ ] `[F4a]` Organization context
  - [ ] `[F4b]` User context
  - [ ] `[F4c]` Navigation state
- [ ] `[F5]` Protected routes:
  - [ ] `[F5a]` Auth middleware
  - [ ] `[F5b]` Org membership check
  - [ ] `[F5c]` Role-based access (basic)

### Design Phase ([[Org Chart/DESIGN/IDENTITY]])
- [ ] `[D1]` Dashboard layout design:
  - [ ] `[D1a]` Desktop sidebar layout
  - [ ] `[D1b]` Collapsed sidebar state
  - [D1c]` Mobile navigation
  - [ ] `[D1d]` Header component specs
- [ ] `[D2]` Component library for dashboard:
  - [ ] `[D2a]` Card components
  - [ ] `[D2b]` Data table base
  - [ ] `[D2c]` Form inputs
  - [ ] `[D2d]` Button variants
  - [ ] `[D2e]` Modal/Dialog
  - [ ] `[D2f]` Dropdown menu
  - [ ] `[D2g]` Toast notifications
  - [ ] `[D2h]` Loading skeletons

### Integration ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[I1]` End-to-end auth flow test
- [ ] `[I2]` Org switching verification
- [ ] `[I3]` Session persistence
- [ ] `[I4]` Logout flow

---

## 📝 Work Log

---

## 🚧 Blockers

**Current blockers:**
- Waiting for [[TASK-001]] — Landing page for navigation patterns

**Potential blockers:**
- Clerk setup and configuration time

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09 | Use Clerk for auth | @FOUNDER | Handles OAuth, MFA, orgs out of box |
| 2026-02-09 | Magic links primary | @FOUNDER | Better UX, no password management |

---

## 🔗 Related

- **Parent:** [[ROADMAP.md]] — Phase 2: Client Dashboard Foundation
- **Depends on:** [[TASK-001]] — Landing page layout patterns
- **Blocks:**
  - [[TASK-005]] — Project management needs auth
  - [[TASK-006]] — Task tracking needs auth
  - [[TASK-007]] — Time tracking needs auth

---

## 🏁 Completion Notes

*To be filled when complete*
