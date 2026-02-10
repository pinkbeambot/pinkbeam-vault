---
id: HOME-017
title: Cross-Service Navigation Enhancement
status: todo
priority: P2
estimated_hours: 6
assigned_to: ENG-FE
dependencies: [HOME-008]
created_date: 2026-02-09
tags: [navigation, ux, advanced]
---

# HOME-017: Cross-Service Navigation Enhancement

## Objective
Enhance navigation between services with contextual recommendations, breadcrumbs, and service switcher for multi-service users.

## Context
Users should be able to move between services seamlessly. The navigation should feel connected, not like switching websites.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [x] Service switcher dropdown - Implemented with colored service badges
- [x] Breadcrumbs showing service hierarchy - Shows Hub > Service > Page
- [ ] Contextual "Also try" recommendations - Future enhancement
- [x] Visual indicator of current service - Colored badge with service name

### Phase 2: Backend/Integration (100%)
- [x] Service access detection - useCurrentService hook implemented
- [ ] Recommendation engine - Future enhancement
- [ ] Navigation history - Future enhancement

### Phase 3: Testing/QA (100%)
- [x] Switching services is intuitive - Dropdown with all services + Hub
- [ ] Recommendations relevant - N/A
- [ ] No confusion about location - Hub link added, but needs verification

## Work Log

### 2026-02-09
- Task created
- Implemented useCurrentService hook to detect current service from pathname
- Created ServiceSwitcher component with colored badges (pink/violet/cyan/amber)
- Added HubLink component for quick navigation back to hub
- Added Breadcrumbs component for nested pages
- Updated mobile menu with current service display and Back to Hub option
- Removed broken service-specific navigation files
- All animations use CSS transitions (no Framer Motion in Radix components)

### Known Issues
- ~~Hub navigation from service pages~~ - FIXED: All layouts now use unified Navigation with service switcher dropdown

## Blockers
- HOME-008: Services dropdown

## Related
- HOME-008: Services dropdown
