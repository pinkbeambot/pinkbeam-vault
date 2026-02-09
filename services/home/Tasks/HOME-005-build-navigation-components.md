---
id: HOME-005
title: Build Navigation Components
status: todo
priority: P0
estimated_hours: 12
assigned_to: ENG-FE
dependencies: [HOME-001]
created_date: 2026-02-09
tags: [navigation, components, ui]
---

# HOME-005: Build Navigation Components

## Objective
Create a flexible navigation system with a base component that can be customized for each service, including services dropdown, auth state, and mobile menu.

## Context
Each service needs its own navbar (showing "Agents", "Web", etc.) but they should share 80% of the code. The hub needs a special version that shows the services dropdown prominently.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [ ] Base Navigation component with slots
- [ ] Services dropdown with descriptions
- [ ] Auth state display (sign in / user menu)
- [ ] Mobile hamburger menu
- [ ] Service-specific navigation variants:
  - [ ] AgentsNavigation
  - [ ] WebNavigation
  - [ ] LabsNavigation
  - [ ] SolutionsNavigation
  - [ ] HubNavigation

### Phase 2: Backend/Integration (100%)
- [ ] Auth state integration
- [ ] Active route highlighting
- [ ] Service badge display
- [ ] Dropdown animation

### Phase 3: Testing/QA (100%)
- [ ] All nav variants render correctly
- [ ] Mobile menu works on all services
- [ ] Active state shows correctly
- [ ] Dropdown accessible (keyboard nav)
- [ ] No layout shift on load

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-001: Route groups structure

## Related
- HOME-006: Service layouts
