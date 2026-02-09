---
id: "TASK-002"
title: "Configure Design System with shadcn/ui"
status: "todo"
priority: "P0"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 4
actual_hours: 0
dependencies:
  - "TASK-001"
blocks:
  - "TASK-005"
  - "TASK-008"
  - "TASK-013"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "foundation"
  - "P0"
  - "design-system"
---

# TASK-002: Configure Design System with shadcn/ui

## 🎯 Objective
Set up a comprehensive design system using shadcn/ui with custom theming to match Pink Beam brand identity. This provides the UI foundation for all marketing pages and portal interfaces.

## 📖 Context
A consistent, accessible design system is critical for professional credibility in consulting. We'll use shadcn/ui for its accessibility, customization, and modern React patterns. The system must work across marketing (public) and portal (authenticated) contexts.

---

## ✅ Definition of Done

### Phase 1: shadcn/ui Setup
- [ ] `[1.1]` Initialize shadcn/ui:
  - [ ] `[1.1a]` Run `npx shadcn@latest init`
  - [ ] `[1.1b]` Configure base color (neutral or zinc)
  - [ ] `[1.1c]` Set up CSS variables for theming
- [ ] `[1.2]` Configure custom theme:
  - [ ] `[1.2a]` Pink Beam primary color (pink-500/pink-600)
  - [ ] `[1.2b]` Secondary/accent colors
  - [ ] `[1.2c]` Dark mode support
  - [ ] `[1.2d]` Typography scale

### Phase 2: Core Component Installation
- [ ] `[2.1]` Install base components:
  - [ ] `[2.1a]` Button (all variants)
  - [ ] `[2.1b]` Card, CardHeader, CardContent
  - [ ] `[2.1c]` Input, Textarea, Label
  - [ ] `[2.1d]` Select, Checkbox, RadioGroup
  - [ ] `[2.1e]` Dialog, Sheet, Popover
  - [ ] `[2.1f]` DropdownMenu
  - [ ] `[2.1g]` Tabs, Accordion
  - [ ] `[2.1h]` Badge, Avatar, Separator
  - [ ] `[2.1i]` Skeleton, Progress
  - [ ] `[2.1j]` Toast/Notification system
- [ ] `[2.2]` Install data display components:
  - [ ] `[2.2a]` Table, DataTable
  - [ ] `[2.2b]` Calendar, DatePicker
  - [ ] `[2.2c]` Chart components (if available)

### Phase 3: Custom Components
- [ ] `[3.1]` Create marketing-specific components:
  - [ ] `[3.1a]` Hero section component
  - [ ] `[3.1b]` Feature card grid
  - [ ] `[3.1c]` Testimonial carousel
  - [ ] `[3.1d]` Pricing card
  - [ ] `[3.1e]` CTA section
- [ ] `[3.2]` Create portal-specific components:
  - [ ] `[3.2a]` Sidebar navigation
  - [ ] `[3.2b]` Dashboard card/stat
  - [ ] `[3.2c]` Status badge variants
  - [ ] `[3.2d]` Timeline component
  - [ ] `[3.2e]` File upload area

### Phase 4: Animation Setup
- [ ] `[4.1]` Configure Framer Motion:
  - [ ] `[4.1a]` Install framer-motion
  - [ ] `[4.1b]` Create animation variants library
  - [ ] `[4.1c]` Page transition wrapper
  - [ ] `[4.1d]` Scroll animations

### Phase 5: Documentation
- [ ] `[5.1]` Document the design system:
  - [ ] `[5.1a]` Component usage examples
  - [ ] `[5.1b]` Color palette reference
  - [ ] `[5.1c]` Typography scale
  - [ ] `[5.1d]` Spacing system

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

- Waiting for: TASK-001 (Initialize Project)

---

## 🔗 Related

- **Depends on:** TASK-001
- **Blocks:** TASK-005 (Landing Page), TASK-008 (Onboarding), TASK-013 (Navigation)
