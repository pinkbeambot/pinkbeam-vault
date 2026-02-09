---
id: HOME-001
title: Initialize Route Groups Structure
status: todo
priority: P0
estimated_hours: 4
assigned_to: ENG-FE
created_date: 2026-02-09
tags: [foundation, architecture, nextjs]
---

# HOME-001: Initialize Route Groups Structure

## Objective
Set up the Next.js Route Groups structure for the unified Pink Beam platform. This enables isolated layouts for each service while sharing authentication and global components.

## Context
The platform needs to support 4 distinct services (Agents, Web, Labs, Solutions) each with their own navigation and branding, while maintaining a cohesive auth experience and shared design system.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [ ] Create `(main)/` route group with minimal layout
- [ ] Create `(agents)/` route group with isolated layout
- [ ] Create `(web)/` route group with isolated layout
- [ ] Create `(labs)/` route group with isolated layout
- [ ] Create `(solutions)/` route group with isolated layout
- [ ] Verify all route groups render without errors

### Phase 2: Backend/Integration (100%)
- [ ] Root `layout.tsx` provides shared providers (Theme, Auth)
- [ ] Each route group has its own `layout.tsx`
- [ ] Route groups don't interfere with each other
- [ ] Static generation works for marketing pages

### Phase 3: Testing/QA (100%)
- [ ] All routes accessible at expected paths
- [ ] No 404 errors on valid routes
- [ ] Layout nesting works correctly
- [ ] Hot reload works across route groups

## Work Log

### 2026-02-09
- Task created as part of home service documentation

## Blockers
None

## Decisions
- Use parentheses naming convention `(service)/` for route groups
- Keep root layout minimal to avoid double navbars

## Related
- HOME-002: Migrate Agents pages
- HOME-003: Create Hub Homepage
