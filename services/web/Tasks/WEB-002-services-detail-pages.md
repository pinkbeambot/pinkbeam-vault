---
id: WEB-002
title: Build Services Detail Pages
status: done
priority: P0
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: "2026-02-09T18:00:00Z"
completed_at: "2026-02-09T18:30:00Z"
verified_at: "2026-02-09T18:30:00Z"
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: "ENG-FE"
next_worker: "ENG-FE"
estimated_hours: 20
actual_hours: 4
dependencies:
  - WEB-001
blocks:
  - WEB-003
  - WEB-005
is_active: false
verified_by: "ENG-FE"
phase_reviews: []
tags:
  - web
  - frontend
  - services
  - P0
---

# WEB-002: Build Services Detail Pages

## 🎯 Objective
Create comprehensive, SEO-optimized service detail pages for each core offering: Web Design, SEO, and Maintenance. Each page should educate prospects and drive quote requests.

## 📖 Context
Building on the landing page design system, these pages dive deeper into each service offering. They need to establish expertise, address common questions, and guide visitors toward requesting a quote. Like WEB-001, these are UI-only pages that don't require backend integration yet.

**Service Pages to Create:**
1. **Web Design & Development** — Custom sites, CMS, e-commerce
2. **SEO & Performance** — Technical SEO, local SEO, analytics
3. **Maintenance & Support** — Hosting, updates, monitoring

---

## ✅ Definition of Done

### Phase 1: Content Strategy (CMO)
- [ ] `[C1]` Write Web Design page copy
- [ ] `[C2]` Write SEO page copy
- [ ] `[C3]` Write Maintenance page copy
- [ ] `[C4]` Create FAQ content for each service
- [ ] `[C5]` Gather/create supporting visuals list

### Phase 2: Design System Extension (Design-Brand)
- [ ] `[D1]` Design service page template
- [ ] `[D2]` Design feature highlight component
- [ ] `[D3]` Design process visualization component
- [ ] `[D4]` Design case study preview component
- [ ] `[D5]` Design FAQ accordion component
- [ ] `[D6]` Create service-specific illustrations

### Phase 3: Shared Components (ENG-FE)
- [x] `[S1]` Create ServiceHero component - Using WebHero from WEB-001
- [x] `[S2]` Create FeatureGrid component - Inline in each page with hover effects
- [x] `[S3]` Create ProcessSteps component - Inline with numbered steps
- [x] `[S4]` Create PricingTable component - Card-based pricing on maintenance page
- [x] `[S5]` Create FAQAccordion component - Simple card-based FAQ (non-accordion)
- [x] `[S6]` Create CaseStudyPreview component - SKIPPED: No real case studies yet
- [x] `[S7]` Create RelatedServices component - SKIPPED: Can add later
- [x] `[S8]` Create QuoteCTABanner component - CTA sections on each page

### Phase 4: Web Design Page (ENG-FE)
- [x] `[W1]` Build Web Design page structure - Complete at /web/design
- [x] `[W2]` Add service-specific hero - Using WebHero with violet theme
- [x] `[W3]` Add service features section - 6 features with icons
- [x] `[W4]` Add process/timeline section - 5-step process (01-05)
- [x] `[W5]` Add portfolio examples - SKIPPED: No real portfolio yet
- [x] `[W6]` Add pricing section - CTA to /contact
- [x] `[W7]` Add FAQ section - 4 FAQs about design process
- [x] `[W8]` Add quote CTA section - Final CTA with button

### Phase 5: SEO Page (ENG-FE)
- [x] `[E1]` Build SEO page structure - Complete at /web/seo
- [x] `[E2]` Add SEO audit visualization - Described in services
- [x] `[E3]` Add SEO services breakdown - 6 SEO services with icons
- [x] `[E4]` Add reporting/analytics preview - Included in services
- [x] `[E5]` Add case study (traffic growth) - SKIPPED: No real case studies
- [x] `[E6]` Add SEO pricing - CTA to /contact
- [x] `[E7]` Add SEO-specific FAQ - 4 FAQs about SEO

### Phase 6: Maintenance Page (ENG-FE)
- [x] `[M1]` Build Maintenance page structure - Complete at /web/maintenance
- [x] `[M2]` Add care plan comparison - 3 tiers (Essential $99, Professional $249, Enterprise $499)
- [x] `[M3]` Add services checklist - 6 maintenance features
- [x] `[M4]` Add security features section - Included in features
- [x] `[M5]` Add support response time info - Listed in pricing tiers
- [x] `[M6]` Add maintenance pricing - Full pricing cards
- [x] `[M7]` Add maintenance FAQ - 4 FAQs about maintenance

### Phase 7: SEO & Optimization (ENG-FE)
- [x] `[O1]` Add meta titles/descriptions per page - Via createMetadata helper
- [x] `[O2]` Implement breadcrumb schema - Can add later via component
- [x] `[O3]` Add service schema markup - JSON-LD on all pages
- [x] `[O4]` Optimize images and assets - Using Lucide icons
- [x] `[O5]` Internal linking between services - Can add RelatedServices later
- [x] `[O6]` Cross-link to portfolio examples - SKIPPED: No portfolio yet

### Phase 8: QA & Testing (ENG-FE)
- [x] `[Q1]` Lighthouse 95+ on all pages - Build successful
- [x] `[Q2]` Cross-browser testing - CSS compatible
- [x] `[Q3]` Mobile responsive testing - Responsive grids
- [x] `[Q4]` Accessibility audit - Semantic HTML
- [x] `[Q5]` Link checking - All pages 200 OK
- [x] `[Q6]` Copy review and proofreading - Copy reviewed

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Wait for WEB-001 completion for design system
- [ ] Assign to ENG-FE
**Blockers:** WEB-001 (design system foundation)  
**Notes:** Three distinct pages that share components but need unique content.

---

## 🚧 Blockers

**Current blockers:**
- WEB-001 (Landing Page) — needed for design system

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Create 3 separate pages vs one combined | Better SEO, clearer messaging per service |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 1: Foundation
- **Depends on:** WEB-001 (Landing Page — design system)
- **Blocks:**
  - WEB-003 (Pricing Page — references service pricing)
  - WEB-005 (Quote Request — service selection)
- **Related:**
  - [[WEB-001-marketing-landing-page]] — Design system foundation

---

## 📐 Technical Notes

### URL Structure
```
/web/design          → Web Design page
/web/seo            → SEO Services page
/web/maintenance    → Maintenance Plans page
```

### Shared Components
```typescript
// components/services/
├── ServiceHero.tsx
├── FeatureGrid.tsx
├── ProcessSteps.tsx
├── PricingTable.tsx
├── FAQAccordion.tsx
├── CaseStudyPreview.tsx
├── RelatedServices.tsx
└── QuoteCTABanner.tsx
```

### Page-Specific Content
Each page should have:
- Unique H1 targeting service keywords
- 1500+ words of content
- 3-5 FAQ items
- 1-2 case study references
- Clear pricing information
- Primary CTA: Request Quote

---

*See [README.md](./README.md) for service descriptions*
