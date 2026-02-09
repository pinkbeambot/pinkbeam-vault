---
id: HOME-003
title: Setup Shared Authentication
status: todo
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
- [ ] Create `/sign-in` page with service-aware redirect
- [ ] Create `/sign-up` page with onboarding flow
- [ ] Create `/reset-password` page
- [ ] Design auth pages with Pink Beam branding
- [ ] Mobile-responsive auth forms

### Phase 2: Backend/Integration (100%)
- [ ] Supabase Auth integration
- [ ] Session persistence across services
- [ ] Service-aware redirect after login
- [ ] Auth middleware for protected routes
- [ ] User metadata schema for service access

### Phase 3: Testing/QA (100%)
- [ ] Sign up flow works end-to-end
- [ ] Sign in works from any service
- [ ] Password reset works
- [ ] Session persists across page refreshes
- [ ] Auth redirects work correctly

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-001: Route groups structure

## Related
- HOME-009: Dashboard foundation
