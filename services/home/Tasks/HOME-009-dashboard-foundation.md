---
id: HOME-009
title: Dashboard Foundation and Redirects
status: todo
priority: P1
estimated_hours: 8
assigned_to: ENG-FE
dependencies: [HOME-003]
created_date: 2026-02-09
tags: [dashboard, auth, routing]
---

# HOME-009: Dashboard Foundation and Redirects

## Objective
Create the dashboard entry point at `/dashboard` that redirects users to their appropriate service dashboard based on subscription and usage history.

## Context
New users need guidance to their first service. Existing users want to return to where they left off. Multi-service users need a unified view.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [ ] `/dashboard` page with redirect logic
- [ ] First-time user onboarding flow
- [ ] Service selector for multi-service users
- [ ] Loading state while determining destination

### Phase 2: Backend/Integration (100%)
- [ ] User service detection logic
- [ ] Redirect to /agents/dashboard, /web/dashboard, etc.
- [ ] Fallback to hub if no services
- [ ] Onboarding completion tracking

### Phase 3: Testing/QA (100%)
- [ ] New users see onboarding
- [ ] Single-service users redirect correctly
- [ ] Multi-service users see selector
- [ ] No infinite redirect loops

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-003: Shared auth

## Related
- HOME-014: Platform dashboard
