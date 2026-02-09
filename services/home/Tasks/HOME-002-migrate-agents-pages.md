---
id: HOME-002
title: Migrate Agents Pages to Route Group
status: done
priority: P0
estimated_hours: 8
assigned_to: ENG-FE
dependencies: [HOME-001]
created_date: 2026-02-09
tags: [migration, agents, refactor]
---

# HOME-002: Migrate Agents Pages to Route Group

## Objective
Move all existing Agents service pages from the root level into the `(agents)/` route group, updating all imports and paths to work within the new structure.

## Context
The Agents pages currently exist at various paths. They need to be consolidated under `/agents/*` with the `(agents)` route group providing the service-specific layout.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [x] Move `app/agents/employees/*` to `app/(agents)/agents/employees/`
- [x] Move `app/agents/pricing` to `app/(agents)/agents/pricing`
- [x] Move `app/agents/calculator` to `app/(agents)/agents/calculator`
- [x] Move `app/dashboard` to `app/(agents)/dashboard`
- [x] Update all internal navigation links to use `/agents/*` paths
- [x] Update SEO canonical URLs

### Phase 2: Backend/Integration (100%)
- [x] Fix all import paths for shared components
- [x] Update middleware.ts for new dashboard paths
- [x] Verify auth redirects work correctly
- [x] Test employee detail pages load correctly

### Phase 3: Testing/QA (100%)
- [x] All /agents/* routes work correctly
- [x] Navigation between agent pages works
- [x] SEO meta tags render correctly
- [x] No console errors
- [x] Mobile navigation works

## Work Log

### 2026-02-09
- Task created
- **Completed:** Migration already done in initial codebase setup
  - All agents pages already in `(agents)/` route group
  - Dashboard at `(agents)/dashboard` with auth redirect
  - Employee pages at `(agents)/agents/employees/*`
  - Pricing at `(agents)/agents/pricing`
  - Calculator at `(agents)/agents/calculator`
  - Routes verified working:
    - /agents → AI Employees homepage
    - /agents/pricing → Pricing page
    - /agents/calculator → ROI Calculator
    - /agents/employees/researcher → Sarah profile
    - /agents/dashboard → Dashboard (redirects to sign-in if not authenticated)

## Blockers
- HOME-001 must be complete

## Related
- HOME-001: Route groups structure
- HOME-004: Shared auth setup
