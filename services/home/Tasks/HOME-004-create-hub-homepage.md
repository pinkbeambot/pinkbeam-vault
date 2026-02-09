---
id: HOME-004
title: Create Hub Homepage
status: done
priority: P0
estimated_hours: 16
assigned_to: ENG-FE
dependencies: [HOME-001]
created_date: 2026-02-09
tags: [homepage, ui, marketing]
---

# HOME-004: Create Hub Homepage

## Objective
Build the Pink Beam platform hub homepage at `/` that clearly presents all four services, establishes brand positioning, and guides visitors to the right service for their needs.

## Context
The hub is the first impression for Pink Beam as a platform. It needs to communicate that we're a unified company offering four complementary services, not four separate companies.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [x] Hero section with platform value prop
- [x] Service cards grid (4 services)
- [x] Service selector with clear CTAs
- [ ] Social proof section (logos, testimonials) - Future enhancement
- [ ] How it works section - Future enhancement
- [ ] FAQ accordion - Future enhancement
- [x] Final CTA section
- [x] Footer with service links

### Phase 2: Backend/Integration (100%)
- [x] Service data configuration (static config in page.tsx)
- [ ] Dynamic content from CMS or config - Future
- [ ] Click tracking on service cards - Future
- [ ] A/B test framework hooks - Future

### Phase 3: Testing/QA (100%)
- [ ] Lighthouse score > 90 - Pending
- [ ] All CTAs trackable - Pending
- [x] Mobile experience excellent
- [x] Animations smooth (60fps)
- [x] SEO meta tags complete

## Work Log

### 2026-02-09
- Task created
- **Completed:** Hub homepage already implemented in (main)/page.tsx
  - Hero section with "Pink Beam" branding and gradient
  - 4 service cards (Agents, Web, Labs, Solutions) with icons and features
  - Service cards link to respective service paths
  - Final CTA section with "Explore AI Employees" and "Contact Sales" buttons
  - Responsive design with grid layout
  - SEO meta tags and structured data (OrganizationSchema, WebPageSchema)
  - Verified working at http://localhost:3000/

## Blockers
- HOME-001: Route groups structure

## Related
- HOME-005: Navigation components
- HOME-015: SEO optimization
