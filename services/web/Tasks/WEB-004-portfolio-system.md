---
id: WEB-004
title: Build Portfolio & Case Studies System
status: blocked
priority: P1
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 16
actual_hours: 0
dependencies:
  - WEB-001
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - frontend
  - portfolio
  - case-studies
  - P1
---

# WEB-004: Build Portfolio & Case Studies System

## 🎯 Objective
Create a compelling portfolio section that showcases Pink Beam's work through detailed case studies, building credibility and helping prospects envision what's possible.

## 📖 Context
For a web agency, the portfolio is the primary trust-builder. This needs to go beyond simple screenshots — each case study should tell a story of challenges, solutions, and measurable results.

**Initial Case Studies (placeholder content for now):**
1. **Local Restaurant** — New website + online ordering
2. **Law Firm** — Professional services redesign
3. **E-commerce Brand** — Shopify migration + SEO
4. **SaaS Startup** — Marketing site + blog

---

## ✅ Definition of Done

### Phase 1: Case Study Content (CMO)
- [ ] `[C1]` Write case study template/outline
- [ ] `[C2]` Create 4 sample case studies
- [ ] `[C3]` Gather metrics for each (traffic, conversions, etc.)
- [ ] `[C4]` Write challenge/solution/result narratives
- [ ] `[C5]` Compile testimonials for each project

### Phase 2: Design (Design-Brand)
- [ ] `[D1]` Design portfolio grid layout
- [ ] `[D2]` Design case study card component
- [ ] `[D3]` Design detailed case study page
- [ ] `[D4]` Design before/after comparison component
- [ ] `[D5]` Design results/metrics visualization
- [ ] `[D6]` Design project gallery/lightbox

### Phase 3: Portfolio Grid (ENG-FE)
- [ ] `[G1]` Create PortfolioCard component
- [ ] `[G2]` Create PortfolioGrid component
- [ ] `[G3]` Add filtering by industry (dropdown)
- [ ] `[G4]` Add filtering by service type
- [ ] `[G5]` Implement lazy loading for images
- [ ] `[G6]` Add hover reveal effects
- [ ] `[G7]` Create "View Case Study" link

### Phase 4: Case Study Detail Pages (ENG-FE)
- [ ] `[S1]` Create dynamic route `/portfolio/[slug]`
- [ ] `[S2]` Build case study layout template
- [ ] `[S3]` Add project overview section
- [ ] `[S4]` Add challenge section
- [ ] `[S5]` Add solution/approach section
- [ ] `[S6]` Add results/metrics section
- [ ] `[S7]` Add testimonial quote
- [ ] `[S8]` Add project gallery
- [ ] `[S9]` Add related projects section
- [ ] `[S10]` Add "Start Your Project" CTA

### Phase 5: Components (ENG-FE)
- [ ] `[M1]` Create MetricsDisplay component
- [ ] `[M2]` Create BeforeAfterSlider component
- [ ] `[M3]` Create ProjectGallery component
- [ ] `[M4]` Create TestimonialBlock component
- [ ] `[M5]` Create TechStackDisplay component

### Phase 6: Data Structure (Static)
- [ ] `[D1]` Create caseStudies.ts data file
- [ ] `[D2]` Define TypeScript interfaces
- [ ] `[D3]` Add all sample case studies
- [ ] `[D4]` Add placeholder images

### Phase 7: SEO & Optimization (ENG-FE)
- [ ] `[O1]` Add case study schema markup
- [ ] `[O2]` Optimize images (WebP, lazy load)
- [ ] `[O3]` Add breadcrumb navigation
- [ ] `[O4]` Generate meta descriptions dynamically

### Phase 8: QA (ENG-FE)
- [ ] `[Q1]` Test all case study pages
- [ ] `[Q2]` Verify image loading
- [ ] `[Q3]` Test filtering functionality
- [ ] `[Q4]` Lighthouse audit
- [ ] `[Q5]` Mobile testing

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Create sample case study content
- [ ] Design portfolio layouts
**Blockers:** None  
**Notes:** Start with 4 strong case studies using placeholder/imaginary projects. Replace with real projects as we complete them.

---

## 🚧 Blockers

**Current blockers:**
- WEB-001 (design system)

**Future blockers:**
- Real case studies (need completed projects)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Static content initially | No CMS needed yet; can migrate later |
| 2026-02-09 | 4 sample case studies to start | Enough to show variety without blocking launch |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 1: Foundation
- **Depends on:** WEB-001 (design system)
- **Blocks:** None
- **Related:**
  - [[WEB-001-marketing-landing-page]] — Portfolio section links here

---

## 📐 Technical Notes

### Data Structure
```typescript
interface CaseStudy {
  id: string;
  slug: string;
  title: string;
  client: string;
  industry: string;
  services: string[];
  thumbnail: string;
  challenge: string;
  solution: string;
  results: {
    metric: string;
    value: string;
    description: string;
  }[];
  testimonial?: {
    quote: string;
    author: string;
    role: string;
  };
  gallery: string[];
  techStack: string[];
  duration: string;
  year: number;
}
```

### Routes
```
/portfolio              → Portfolio grid
/portfolio/[slug]       → Individual case study
```

---

*Use high-quality placeholder images initially; replace with actual screenshots as projects complete*
