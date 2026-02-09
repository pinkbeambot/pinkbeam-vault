---
id: HOME-011
title: Update Middleware for Auth Protection
status: todo
priority: P1
estimated_hours: 4
assigned_to: ENG-FE
dependencies: [HOME-003, HOME-002]
created_date: 2026-02-09
tags: [middleware, auth, security]
---

# HOME-011: Update Middleware for Auth Protection

## Objective
Update middleware.ts to protect service-specific dashboard routes and handle auth redirects correctly across all four services.

## Context
Each service has its own dashboard at `/agents/dashboard`, `/web/dashboard`, etc. These need auth protection with proper redirect to service-specific sign-in pages.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [ ] Middleware configuration for all services
- [ ] Auth check for dashboard routes
- [ ] Service-aware redirect logic

### Phase 2: Backend/Integration (100%)
- [ ] Session validation
- [ ] Cookie handling
- [ ] Redirect to correct sign-in page

### Phase 3: Testing/QA (100%)
- [ ] Unauthenticated users redirected to sign-in
- [ ] After login, returned to original destination
- [ ] No auth bypass possible
- [ ] Middleware doesn't break static generation

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-003: Shared auth
- HOME-002: Agents migration (for dashboard paths)

## Related
- HOME-009: Dashboard foundation
