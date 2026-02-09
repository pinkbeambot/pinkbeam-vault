---
id: HOME-002
title: Migrate Agents Pages to Route Group
status: todo
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
- [ ] Move `app/agents/employees/*` to `app/(agents)/agents/employees/`
- [ ] Move `app/agents/pricing` to `app/(agents)/agents/pricing`
- [ ] Move `app/agents/calculator` to `app/(agents)/agents/calculator`
- [ ] Move `app/dashboard` to `app/(agents)/agents/dashboard`
- [ ] Update all internal navigation links to use `/agents/*` paths
- [ ] Update SEO canonical URLs

### Phase 2: Backend/Integration (100%)
- [ ] Fix all import paths for shared components
- [ ] Update middleware.ts for new dashboard paths
- [ ] Verify auth redirects work correctly
- [ ] Test employee detail pages load correctly

### Phase 3: Testing/QA (100%)
- [ ] All /agents/* routes work correctly
- [ ] Navigation between agent pages works
- [ ] SEO meta tags render correctly
- [ ] No console errors
- [ ] Mobile navigation works

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-001 must be complete

## Related
- HOME-001: Route groups structure
- HOME-004: Shared auth setup
