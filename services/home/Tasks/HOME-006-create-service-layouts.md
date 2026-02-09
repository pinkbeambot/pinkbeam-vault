---
id: HOME-006
title: Create Service-Specific Layouts
status: todo
priority: P1
estimated_hours: 8
assigned_to: ENG-FE
dependencies: [HOME-001, HOME-005]
created_date: 2026-02-09
tags: [layout, components, ui]
---

# HOME-006: Create Service-Specific Layouts

## Objective
Create layout.tsx files for each route group that include the appropriate navigation, footer, and any service-specific wrappers.

## Context
Each service should feel like its own mini-site while maintaining the shared auth and design system. Layouts provide this isolation.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [ ] `(agents)/layout.tsx` with AgentsNavigation, AgentsFooter
- [ ] `(web)/layout.tsx` with WebNavigation, WebFooter
- [ ] `(labs)/layout.tsx` with LabsNavigation, LabsFooter
- [ ] `(solutions)/layout.tsx` with SolutionsNavigation, SolutionsFooter
- [ ] `(main)/layout.tsx` minimal/no nav for hub
- [ ] Footer component variants

### Phase 2: Backend/Integration (100%)
- [ ] Layouts don't cause double renders
- [ ] Metadata configured per service
- [ ] Analytics context per service

### Phase 3: Testing/QA (100%)
- [ ] Each service has correct nav
- [ ] Footers show correct links
- [ ] Layout persists on navigation
- [ ] No hydration errors

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-001: Route groups
- HOME-005: Navigation components

## Related
- HOME-007: Stub service pages
