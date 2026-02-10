---
id: WEB-009
title: Build Client Portal Dashboard
status: done
priority: P0
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-BE/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 24
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
blocks:
  - WEB-013
  - WEB-014
  - WEB-015
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - frontend
  - client-portal
  - dashboard
  - P0
---

# WEB-009: Build Client Portal Dashboard

## 🎯 Objective
Create a comprehensive client portal where clients can view their projects, track progress, access deliverables, communicate with the team, and view invoices.

## 📖 Context
The client portal is the primary value delivery mechanism for Pink Beam Web Services. It transforms the client experience from email chains to a professional, transparent dashboard. This is where clients spend most of their time post-sale.

**Key Features:**
- Project overview and status
- Timeline and milestone tracking
- File sharing and approvals
- Communication/commenting
- Invoice viewing

---

## ✅ Definition of Done

### Phase 1: Portal Layout & Navigation (ENG-FE)
- [ ] `[L1]` Create portal layout with sidebar
- [ ] `[L2]` Create responsive mobile navigation
- [ ] `[L3]` Build top navigation bar (user menu, notifications)
- [ ] `[L4]` Create breadcrumb component
- [ ] `[L5]` Design empty states for all sections

### Phase 2: Dashboard Home (ENG-FE)
- [ ] `[D1]` Create dashboard stats cards
- [ ] `[D2]` Build active projects list
- [ ] `[D3]` Add recent activity feed
- [ ] `[D4]` Add upcoming deadlines section
- [ ] `[D5]` Add quick actions (new ticket, message)
- [ ] `[D6]` Create notification center

### Phase 3: Projects List (ENG-FE)
- [ ] `[PL1]` Create projects list view
- [ ] `[PL2]` Add project status filters
- [ ] `[PL3]` Add search functionality
- [ ] `[PL4]` Create project cards with progress
- [ ] `[PL5]` Add sort options (date, status, name)

### Phase 4: Project Detail View (ENG-FE)
- [ ] `[PD1]` Create project header with status
- [ ] `[PD2]` Build project timeline component
- [ ] `[PD3]` Create phases/milestones display
- [ ] `[PD4]` Add team member display
- [ ] `[PD5]` Create project overview tab
- [ ] `[PD6]` Create deliverables/files tab
- [ ] `[PD7]` Create activity/comments tab
- [ ] `[PD8]` Add project settings/info

### Phase 5: File Management (ENG-FE)
- [ ] `[F1]` Create file list component
- [ ] `[F2]` Build file upload interface
- [ ] `[F3]` Add file preview (images, PDFs)
- [ ] `[F4]` Create approval workflow UI
- [ ] `[F5]` Add version history display
- [ ] `[F6]` Implement drag-and-drop upload

### Phase 6: Communication (ENG-FE)
- [ ] `[C1]` Create comments thread component
- [ ] `[C2]` Build comment input with @mentions
- [ ] `[C3]` Add file attachments to comments
- [ ] `[C4]` Create notification badges
- [ ] `[C5]` Add real-time updates (polling initially)

### Phase 7: Invoice Viewing (ENG-FE)
- [ ] `[I1]` Create invoice list view
- [ ] `[I2]` Build invoice detail view
- [ ] `[I3]` Add PDF viewer or download
- [ ] `[I4]` Show payment status
- [ ] `[I5]` Add pay now button (Stripe link)

### Phase 8: Profile & Settings (ENG-FE)
- [ ] `[S1]` Create profile page
- [ ] `[S2]` Add company info editing
- [ ] `[S3]` Create notification preferences
- [ ] `[S4]` Add billing info view
- [ ] `[S5]` Create security settings

### Phase 9: API Integration (ENG-BE + ENG-FE)
- [ ] `[A1]` Create API hooks (SWR/React Query)
- [ ] `[A2]` Fetch projects data
- [ ] `[A3]` Fetch files data
- [ ] `[A4]` Fetch comments data
- [ ] `[A5]` Fetch invoices data
- [ ] `[A6]` Implement mutations (create comment, upload file)
- [ ] `[A7]` Add optimistic updates
- [ ] `[A8]` Handle loading and error states

### Phase 10: Onboarding Flow (ENG-FE)
- [ ] `[O1]` Create welcome modal
- [ ] `[O2]` Build profile completion steps
- [ ] `[O3]` Add tooltips for key features
- [ ] `[O4]` Create getting started guide

### Phase 11: Responsive & Polish (ENG-FE)
- [ ] `[R1]` Mobile layout optimization
- [ ] `[R2]` Tablet layout optimization
- [ ] `[R3]` Loading skeletons
- [ ] `[R4]` Error boundary implementation
- [ ] `[R5]` Empty state illustrations

### Phase 12: QA & Testing (ENG-FE)
- [ ] `[Q1]` Test all portal routes
- [ ] `[Q2]` Test responsive layouts
- [ ] `[Q3]` Test file upload flows
- [ ] `[Q4]` Test comment functionality
- [ ] `[Q5]` Accessibility audit
- [ ] `[Q6]` Performance testing

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Design portal mockups
- [ ] Define project data structure
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)  
**Notes:** This is the main client-facing feature. Invest in UX and polish.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Use SWR for data fetching | Caching, revalidation, simple API |
| 2026-02-09 | Start with polling for real-time | Simple implementation, upgrade to WebSockets later |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
- **Blocks:**
  - WEB-013 (Support Tickets — lives in portal)
  - WEB-014 (Analytics Dashboard — extends portal)
  - WEB-015 (File Approvals — part of portal)
- **Related:**
  - [ARCHITECTURE.md](./ARCHITECTURE.md) — Database schema

---

## 📐 Technical Notes

### Portal Routes
```
/portal                    → Dashboard home
/portal/projects           → Projects list
/portal/projects/[id]      → Project detail
/portal/files              → All files
/portal/invoices           → Invoices list
/portal/invoices/[id]      → Invoice detail
/portal/support            → Support tickets
/portal/settings           → Profile & settings
```

### Layout Structure
```
PortalLayout
├── Sidebar (navigation)
├── TopBar (search, notifications, user menu)
└── MainContent
    └── Page content
```

### Data Fetching Pattern
```typescript
// hooks/useProjects.ts
import useSWR from 'swr';

export function useProjects() {
  return useSWR('/api/projects', fetcher, {
    refreshInterval: 30000, // 30s polling
  });
}
```

### Key Components
```
components/portal/
├── layout/
│   ├── PortalLayout.tsx
│   ├── Sidebar.tsx
│   └── TopBar.tsx
├── dashboard/
│   ├── StatsCards.tsx
│   ├── ProjectsList.tsx
│   └── ActivityFeed.tsx
├── projects/
│   ├── ProjectCard.tsx
│   ├── ProjectTimeline.tsx
│   └── PhaseProgress.tsx
├── files/
│   ├── FileList.tsx
│   ├── FileUpload.tsx
│   └── FilePreview.tsx
└── shared/
    ├── EmptyState.tsx
    ├── LoadingSkeleton.tsx
    └── ErrorBoundary.tsx
```

---

*Portal should feel fast and professional — this is our product*
