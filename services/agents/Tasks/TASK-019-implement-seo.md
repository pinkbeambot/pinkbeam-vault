---
id: "TASK-019"
title: "Implement SEO & Metadata"
status: "todo"
priority: "P1"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 8
actual_hours: 0
dependencies:
  - "TASK-012"
  - "TASK-013"
  - "TASK-014"
blocks: []

is_active: false
verified_by: ""

phase_reviews:
  - phase: "Implementation"
    worker: "[[Org Chart/ENG-FE/IDENTITY]]"
    reviewer: "[[Org Chart/CMO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "engineering"
  - "frontend"
  - "seo"
  - "P1"
---

# TASK-019: Implement SEO & Metadata

## 🎯 Objective
Implement comprehensive SEO for organic discovery — technical, on-page, and social.

## 📖 Context
SEO is a key acquisition channel. We need to rank for "AI employees", "AI workforce", etc.

---

## ✅ Definition of Done

### Technical SEO ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[T1]` XML sitemap generation:
  - [ ] `[T1a]` All pages included
  - [ ] `[T1b]` Dynamic sitemap for blog
  - [ ] `[T1c]` Lastmod dates
  - [ ] `[T1d]` Submit to Google Search Console
- [ ] `[T2]` Robots.txt:
  - [ ] `[T2a]` Allow all important pages
  - [ ] `[T2b]` Disallow admin/api
  - [ ] `[T2c]` Sitemap reference
- [ ] `[T3]` Canonical URLs:
  - [ ] `[T3a]` Self-referencing canonicals
  - [ ] `[T3b]` No duplicate content
- [ ] `[T4]` Structured data (JSON-LD):
  - [ ] `[T4a]` Organization schema
  - [ ] `[T4b]` Product schema (employees)
  - [ ] `[T4c]` FAQ schema
  - [ ] `[T4d]` Breadcrumb schema

### On-Page SEO ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[O1]` Title tags (all pages):
  - [ ] `[O1a]` Homepage: "Pink Beam | AI Employee Platform"
  - [ ] `[O1b]` Product pages: "AI [Employee] | Pink Beam"
  - [ ] `[O1c]` Pricing: "Pricing | Pink Beam"
- [ ] `[O2]` Meta descriptions (all pages)
- [ ] `[O3]` Header hierarchy (H1-H6)
- [ ] `[O4]` Image alt texts
- [ ] `[O5]` Internal linking strategy

### Social SEO ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[S1]` Open Graph tags (all pages):
  - [ ] `[S1a]` og:title
  - [ ] `[S1b]` og:description
  - [ ] `[S1c]` og:image (dynamic OG images)
  - [ ] `[S1d]` og:url
- [ ] `[S2]` Twitter Cards:
  - [ ] `[S2a]` twitter:card (summary_large_image)
  - [ ] `[S2b]` twitter:title
  - [ ] `[S2c]` twitter:description
  - [ ] `[S2d]` twitter:image
- [ ] `[S3]` Dynamic OG image generation:
  - [ ] `[S3a]` Template design (LUMEN)
  - [ ] `[S3b]` API endpoint for generation
  - [ ] `[S3c]` Per-page customization

### Performance SEO ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[P1]` Core Web Vitals:
  - [ ] `[P1a]` LCP < 2.5s
  - [ ] `[P1b]` FID < 100ms
  - [ ] `[P1c]` CLS < 0.1
- [ ] `[P2]` Mobile-first indexing
- [ ] `[P3]` HTTPS enforced

### Content SEO ([[Org Chart/CMO/IDENTITY]])
- [ ] `[C1]` Keyword research document
- [ ] `[C2]` Content briefs for blog
- [ ] `[C3]` Landing pages for key terms

---

## 📝 Work Log

---

## 🚧 Blockers

**Current blockers:**
- Waiting for pages to be built

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEBSITE-ROADMAP.md]] — Phase 6: Polish
- **Depends on:**
  - [[TASK-012]] — Homepage
  - [[TASK-013]] — Product pages
  - [[TASK-014]] — Pricing page

---

## 🏁 Completion Notes

*To be filled when complete*
