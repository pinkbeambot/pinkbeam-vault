---
id: "TASK-005"
title: "Set Up Asset Pipeline & CDN"
status: "todo"
priority: "P1"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 6
actual_hours: 0
dependencies:
  - "TASK-001"
  - "TASK-003"
blocks:
  - "TASK-006"
  - "TASK-007"
  - "TASK-009"

is_active: false
verified_by: ""

phase_reviews:
  - phase: "Setup"
    worker: "[[Org Chart/ENG-BE/IDENTITY]]"
    reviewer: "[[Org Chart/CTO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "engineering"
  - "backend"
  - "infrastructure"
  - "P1"
---

# TASK-005: Set Up Asset Pipeline & CDN

## 🎯 Objective
Configure image optimization, video hosting, and CDN for fast global delivery of all assets.

## 📖 Context
Performance is critical. We need:
- Optimized images (WebP/AVIF, responsive sizes)
- Fast video delivery
- Global CDN caching
- Efficient build pipeline

**Wait for:**
- [[TASK-001]] — Tech stack decisions (hosting/CDN choice)
- [[TASK-003]] — Repo initialized

---

## ✅ Definition of Done

### Image Optimization ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[I1]` Configure Next.js Image component:
  - [ ] `[I1a]` Set up Cloudflare Images loader (or chosen provider)
  - [ ] `[I1b]` Configure responsive breakpoints
  - [ ] `[I1c]` Enable WebP/AVIF formats
  - [ ] `[I1d]` Set up blur placeholders
- [ ] `[I2]` Create image optimization script:
  - [ ] `[I2a]` Batch convert images to WebP
  - [ ] `[I2b]` Generate multiple sizes
  - [ ] `[I2c]` Add to build pipeline

### Video Hosting ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[V1]` Set up video hosting:
  - [ ] `[V1a]` Cloudflare Stream OR Mux account
  - [ ] `[V1b]` Configure API keys (in `.env`)
  - [ ] `[V1c]` Test video upload
- [ ] `[V2]` Create video component:
  - [ ] `[V2a]` Lazy loading
  - [ ] `[V2b]` Poster image support
  - [ ] `[V2c]` Multiple format support (MP4, WebM)

### CDN & Caching ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[C1]` Configure Cloudflare (or chosen CDN):
  - [ ] `[C1a]` Set up domain
  - [ ] `[C1b]` Configure caching rules
  - [ ] `[C1c]` Enable Brotli compression
  - [ ] `[C1d]` Configure edge caching
- [ ] `[C2]` Set up R2 bucket (or S3) for assets:
  - [ ] `[C2a]` Create bucket
  - [ ] `[C2b]` Configure public access
  - [ ] `[C2c]` Set up custom domain

### Asset Organization ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[A1]` Create asset folder structure:
  - [ ] `[A1a]` `/public/images/brand/` — Logo, patterns
  - [ ] `[A1b]` `/public/images/illustrations/` — Marketing illustrations
  - [ ] `[A1c]` `/public/images/icons/` — Icon set
  - [ ] `[A1d]` `/public/images/blog/` — Blog post images
  - [ ] `[A1e]` `/public/videos/` — All video files
- [ ] `[A2]` Create asset manifest/documentation
- [ ] `[A3]` Document naming conventions

### Build Pipeline ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` Add asset optimization to CI:
  - [ ] `[B1a]` Image optimization on build
  - [ ] `[B1b]` Video upload to CDN
  - [ ] `[B1c]` Cache busting
- [ ] `[B2]` Test build pipeline end-to-end

---

## 📝 Work Log

---

## 🚧 Blockers

**Current blockers:**
- Waiting for [[TASK-001]] — Hosting/CDN decisions
- Waiting for [[TASK-003]] — Repo initialized

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEBSITE-ROADMAP.md]] — Phase 0: Foundation
- **Depends on:**
  - [[TASK-001]] — Tech stack
  - [[TASK-003]] — Repo initialized
- **Blocks:**
  - [[TASK-006]] — Hero illustration (needs CDN)
  - [[TASK-007]] — Marketing illustrations
  - [[TASK-009]] — Video assets

---

## 🏁 Completion Notes

*To be filled when complete*
