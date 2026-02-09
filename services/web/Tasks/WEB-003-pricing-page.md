---
id: WEB-003
title: Build Pricing Page with Interactive Calculator
status: todo
priority: P0
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 12
actual_hours: 0
dependencies:
  - WEB-001
  - WEB-002
blocks:
  - WEB-005
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - frontend
  - pricing
  - calculator
  - P0
---

# WEB-003: Build Pricing Page with Interactive Calculator

## 🎯 Objective
Create a comprehensive pricing page that clearly communicates service costs and includes an interactive project estimator that helps prospects understand investment ranges.

## 📖 Context
Pricing transparency is a key differentiator for Pink Beam. This page needs to present both project-based and subscription pricing clearly, while the calculator provides instant estimates to qualify leads before they request a formal quote.

**Pricing Models to Present:**
- Project-based: Landing Page ($2,500+), Starter Site ($5,000+), Business Site ($10,000+), E-commerce ($15,000+)
- Monthly: Essential ($500/mo), Growth ($1,500/mo), Scale ($3,000/mo)

---

## ✅ Definition of Done

### Phase 1: Pricing Strategy & Copy (CMO)
- [ ] `[C1]` Finalize all pricing tiers and features
- [ ] `[C2]` Write pricing page copy
- [ ] `[C3]` Create comparison matrix (features per tier)
- [ ] `[C4]` Write FAQ responses about pricing
- [ ] `[C5]` Define calculator logic and ranges

### Phase 2: Design (Design-Brand)
- [ ] `[D1]` Design pricing tier cards
- [ ] `[D2]` Design comparison table
- [ ] `[D3]` Design calculator interface
- [ ] `[D4]` Design "Most Popular" badge treatment
- [ ] `[D5]` Design toggle (monthly vs annual)

### Phase 3: Pricing Display Components (ENG-FE)
- [ ] `[P1]` Create PricingCard component
- [ ] `[P2]` Create PricingGrid component
- [ ] `[P3]` Create FeatureList component
- [ ] `[P4]` Create PricingToggle (project vs monthly)
- [ ] `[P5]` Create ComparisonTable component
- [ ] `[P6]` Create PricingFAQ component

### Phase 4: Interactive Calculator (ENG-FE)
- [ ] `[I1]` Build calculator form with fields:
  - Project type (dropdown)
  - Number of pages (slider/number)
  - E-commerce (toggle)
  - CMS needed (toggle)
  - SEO package (dropdown)
  - Rush timeline (toggle)
- [ ] `[I2]` Implement calculation logic
- [ ] `[I3]` Display price range with breakdown
- [ ] `[I4]` Add "Get Exact Quote" CTA
- [ ] `[I5]` Store calculator state in URL (shareable)
- [ ] `[I6]` Add visual feedback during calculation

### Phase 5: Page Assembly (ENG-FE)
- [ ] `[A1]` Build main pricing page layout
- [ ] `[A2]` Add hero section with pricing overview
- [ ] `[A3]` Add project pricing section
- [ ] `[A4]` Add monthly plans section
- [ ] `[A5]` Add comparison table section
- [ ] `[A6]` Add interactive calculator section
- [ ] `[A7]` Add pricing FAQ section
- [ ] `[A8]` Add final CTA section

### Phase 6: Polish & Interactions (ENG-FE)
- [ ] `[O1]` Add smooth scroll to sections
- [ ] `[O2]` Animate price changes
- [ ] `[O3]` Add hover effects on cards
- [ ] `[O4]` Implement sticky comparison header
- [ ] `[O5]` Add calculator result animations

### Phase 7: SEO & Meta (ENG-FE)
- [ ] `[S1]` Add pricing schema markup
- [ ] `[S2]` Optimize meta title/description
- [ ] `[S3]` Add FAQ schema
- [ ] `[S4]` Create pricing breadcrumb

### Phase 8: Testing (ENG-FE)
- [ ] `[T1]` Test all calculator scenarios
- [ ] `[T2]` Verify price calculations accuracy
- [ ] `[T3]` Test responsive design
- [ ] `[T4]` Lighthouse performance audit
- [ ] `[T5]` Accessibility testing

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Finalize pricing with CMO
- [ ] Wait for design system from WEB-001
**Blockers:** None  
**Notes:** The calculator is key for lead qualification — make it accurate but simple.

---

## 🚧 Blockers

**Current blockers:**
- WEB-001 (design system)
- WEB-002 (service pricing details)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Show ranges, not exact prices | Projects vary; ranges set expectations |
| 2026-02-09 | Include both project and monthly pricing | Some clients prefer one-time, others ongoing |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 1: Foundation
- **Depends on:** 
  - WEB-001 (design system)
  - WEB-002 (service pricing details)
- **Blocks:**
  - WEB-005 (Quote Request — pricing context)
- **Related:**
  - [README.md](./README.md) — Pricing details

---

## 📐 Technical Notes

### Calculator Logic
```typescript
interface CalculatorState {
  projectType: 'landing' | 'starter' | 'business' | 'ecommerce' | 'custom';
  pageCount: number;
  hasEcommerce: boolean;
  needsCMS: boolean;
  seoPackage: 'none' | 'basic' | 'advanced';
  isRush: boolean;
}

// Base prices
const basePrices = {
  landing: { min: 2500, max: 5000 },
  starter: { min: 5000, max: 8000 },
  business: { min: 10000, max: 18000 },
  ecommerce: { min: 15000, max: 30000 },
  custom: { min: 25000, max: 50000 }
};

// Multipliers
const ecommerceMultiplier = 1.4;
const cmsMultiplier = 1.2;
const seoMultipliers = { none: 1, basic: 1.15, advanced: 1.3 };
const rushMultiplier = 1.25;
```

### URL State
```
/pricing?type=starter&pages=10&ecommerce=true&cms=true&seo=basic
```

---

*Calculator should update URL in real-time for shareable estimates*
