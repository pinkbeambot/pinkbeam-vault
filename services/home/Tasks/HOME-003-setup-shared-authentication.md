---
id: HOME-003
title: Setup Shared Authentication
status: done
priority: P0
estimated_hours: 6
assigned_to: ENG-FE
dependencies: [HOME-001]
created_date: 2026-02-09
tags: [auth, supabase, security]
---

# HOME-003: Setup Shared Authentication

## Objective
Implement shared authentication flows at the root level (`/sign-in`, `/sign-up`) that work across all Pink Beam services, with proper session management and service-aware redirects.

## Context
Users should have a single Pink Beam account that grants access to all services. Auth should be seamless when navigating between services.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [x] Create `/sign-in` page with service-aware redirect
- [x] Create `/sign-up` page with onboarding flow
- [x] Create `/reset-password` page
- [x] Design auth pages with Pink Beam branding
- [x] Mobile-responsive auth forms

### Phase 2: Backend/Integration (100%)
- [x] Supabase Auth integration (new project: pmdlurfrwuvljkmnfwom)
- [x] Session persistence across services
- [x] Service-aware redirect after login (/agents/dashboard)
- [x] Auth middleware for protected routes
- [ ] User metadata schema for service access (future)

### Phase 3: Testing/QA (100%)
- [x] Sign up flow works end-to-end
- [x] Sign in works from any service
- [x] Password reset works
- [x] Session persists across page refreshes
- [x] Auth redirects work correctly

## Work Log

### 2026-02-09
- Task created
- **Completed:** Auth configured with new Supabase project
  - Updated .env.local with new project credentials (pmdlurfrwuvljkmnfwom)
  - Verified all auth routes working:
    - /sign-in → 200 OK
    - /sign-up → 200 OK
    - /agents/dashboard → redirects to sign-in when not authenticated
  - Updated all redirect paths to /agents/dashboard
  - Code committed: 2d7884f

## Blockers
- HOME-001: Route groups structure

## Related
- HOME-009: Dashboard foundation
