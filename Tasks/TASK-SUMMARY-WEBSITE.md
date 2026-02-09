# Website Development Tasks — Summary

**Created:** 2026-02-07  
**Total Tasks:** 24  
**Total Estimated Hours:** 254 hours (~6-8 weeks with parallel work)

---

## 📊 Task Overview

### By Phase

| Phase | Tasks | Est Hours |
|-------|-------|-----------|
| Foundation (Week 1) | 5 tasks | 32h |
| Visual Assets (Week 1-2) | 4 tasks | 46h |
| Core Pages (Week 2-4) | 4 tasks | 64h |
| Interactive Features (Week 4-6) | 2 tasks | 24h |
| Backend (Week 6-8) | 2 tasks | 24h |
| Content (Week 5-7) | 2 tasks | 24h |
| Polish & QA (Week 8-11) | 4 tasks | 38h |
| Launch (Week 12) | 1 task | 12h |

### By Priority

| Priority | Count | Hours |
|----------|-------|-------|
| P0 (Critical) | 10 tasks | 118h |
| P1 (Important) | 8 tasks | 82h |
| P2 (Nice-to-have) | 6 tasks | 54h |

### By Owner

| Owner | Tasks | Hours |
|-------|-------|-------|
| ENG-FE | 13 tasks | 150h |
| ENG-BE | 3 tasks | 30h |
| LUMEN | 4 tasks | 42h |
| FLUX | 1 task | 12h |
| CMO | 1 task | 6h |
| CTO | 1 task | 4h |
| CEO | 1 task | 12h |

---

## 🎯 First 5 Tasks (Start Here)

These have no dependencies and can start immediately:

1. **TASK-001** — Finalize Tech Stack (CTO, 4h)
2. **TASK-002** — Create Brand Identity (LUMEN, 8h)
3. **TASK-010** — Write Homepage Copy (CMO, 6h)
4. **TASK-003** — Initialize Repo (ENG-FE, 4h) — *waits for TASK-001*
5. **TASK-004** — Design System (ENG-FE, 8h) — *waits for TASK-001,002,003*

---

## 🔗 Task Dependencies Graph

```
WEEK 1: Foundation
├── TASK-001 (Tech Stack) ──┬──► TASK-003 (Repo)
│                           ├──► TASK-004 (Design System)
│                           ├──► TASK-005 (Asset Pipeline)
│                           ├──► TASK-017 (Auth)
│                           └──► TASK-018 (Analytics)
│
├── TASK-002 (Brand) ───────┬──► TASK-004 (Design System)
│                           ├──► TASK-006 (Hero Image)
│                           ├──► TASK-007 (Illustrations)
│                           └──► TASK-008 (Icons)
│
└── TASK-010 (Copy) ────────► TASK-012 (Homepage)

WEEK 2-3: Assets
├── TASK-005 ───────────────┬──► TASK-006 (Hero)
│                           ├──► TASK-007 (Illustrations)
│                           └──► TASK-009 (Video)
│
├── TASK-006 ───────────────► TASK-012 (Homepage)
├── TASK-007 ───────────────┬──► TASK-012 (Homepage)
│                           ├──► TASK-013 (Product Pages)
│                           └──► TASK-022 (About)
├── TASK-008 ───────────────┬──► TASK-011 (Global Components)
│                           └──► TASK-012 (Homepage)
└── TASK-009 ───────────────► TASK-012 (Homepage)

WEEK 3-4: Core Components & Pages
├── TASK-003 ───────────────► TASK-011 (Global Components)
├── TASK-004 ───────────────┬──► TASK-011 (Global Components)
│                           ├──► TASK-012 (Homepage)
│                           ├──► TASK-013 (Product Pages)
│                           ├──► TASK-014 (Pricing)
│                           ├──► TASK-015 (Demo)
│                           ├──► TASK-016 (ROI Calc)
│                           ├──► TASK-022 (About)
│                           ├──► TASK-023 (Blog)
│                           └──► TASK-024 (Dark Mode)
├── TASK-011 ───────────────┬──► TASK-012 (Homepage)
│                           ├──► TASK-013 (Product Pages)
│                           ├──► TASK-014 (Pricing)
│                           ├──► TASK-022 (About)
│                           └──► TASK-023 (Blog)
└── TASK-012 ───────────────┬──► TASK-019 (SEO)
                            ├──► TASK-020 (Performance)
                            └──► TASK-021 (Launch)

WEEK 4-8: Remaining pages & features
├── TASK-013 ───────────────► TASK-019 (SEO)
├── TASK-014 ───────────────► TASK-021 (Launch)
├── TASK-017 ───────────────► (enables user features)
└── TASK-018 ───────────────► (enables tracking)

WEEK 8-12: Polish, QA, Launch
├── TASK-019 ───────────────► TASK-021 (Launch)
├── TASK-020 ───────────────► TASK-021 (Launch)
└── TASK-021 ───────────────► 🚀 LAUNCH
```

---

## 📁 Task Files Created

All tasks are in `~/pinkbeam/Tasks/`:

| File | Description |
|------|-------------|
| TASK-001-finalize-tech-stack.md | Tech stack decisions |
| TASK-002-create-brand-identity.md | Brand identity system |
| TASK-003-init-website-repo.md | Project initialization |
| TASK-004-setup-design-system.md | Design system & components |
| TASK-005-setup-asset-pipeline.md | CDN & asset optimization |
| TASK-006-create-hero-illustration.md | Hero image |
| TASK-007-create-marketing-illustrations.md | 12 illustrations |
| TASK-008-create-iconography.md | 100+ icons |
| TASK-009-produce-explainer-video.md | 90-sec video |
| TASK-010-write-homepage-copy.md | Homepage content |
| TASK-011-build-global-components.md | Nav & footer |
| TASK-012-build-homepage.md | Full homepage |
| TASK-013-build-employee-pages.md | 6 product pages |
| TASK-014-build-pricing-page.md | Pricing page |
| TASK-015-build-interactive-demo.md | Demo environment |
| TASK-016-build-roi-calculator.md | ROI calculator |
| TASK-017-implement-authentication.md | Auth system |
| TASK-018-implement-analytics.md | Analytics tracking |
| TASK-019-implement-seo.md | SEO implementation |
| TASK-020-performance-qa.md | Performance & QA |
| TASK-021-launch-website.md | Launch campaign |
| TASK-022-build-about-pages.md | About/Contact pages |
| TASK-023-build-blog-system.md | Blog with 10 posts |
| TASK-024-implement-dark-mode.md | Dark mode support |

---

## 🚀 Activation Ready

To start work, the CEO should:

1. Set `WORK-LOCK.active_task` to the first task
2. Set `task.is_active: true`
3. Trigger the assigned employee

**Recommended first task:** TASK-001 (Tech Stack) — unblocks everything else.

---

*All tasks follow the Pink Beam Task System format from TASKS.md*
