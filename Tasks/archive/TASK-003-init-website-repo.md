---
id: "TASK-003"
title: "Initialize Website Project Repo"
status: "completed"
priority: "P0"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: "2026-02-07T10:33:00Z"
completed_at: "2026-02-07T10:50:00Z"
verified_at: "2026-02-07T10:50:00Z"

assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-BE/IDENTITY]]"
current_worker: "[[Org Chart/CEO/IDENTITY]]"
next_worker: ""

estimated_hours: 4
actual_hours: 1.0
dependencies:
  - "TASK-001"
blocks:
  - "TASK-004"
  - "TASK-011"
  - "TASK-012"

is_active: false
verified_by: "FOUNDER"

phase_reviews:
  - phase: "Setup"
    worker: "[[Org Chart/ENG-FE/IDENTITY]]"
    reviewer: "[[Org Chart/CTO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "engineering"
  - "frontend"
  - "setup"
  - "P0"
---

# TASK-003: Initialize Website Project Repo

## 🎯 Objective
Create the foundation repository for the Pink Beam website with all tooling, configuration, and folder structure ready for development.

## 📖 Context
This is the starting point for all website development. Must be done right from day one to avoid technical debt.

**Wait for:** [[TASK-001]] to complete (need tech stack decisions)

---

## ✅ Definition of Done

### Repository Setup ([[Org Chart/ENG-FE/IDENTITY]])
- [x] `[R1]` Create GitHub repo `pinkbeam-website`
- [x] `[R2]` Initialize with chosen framework (from TASK-001)
- [x] `[R3]` Set up folder structure:
  - [x] `[R3a]` `/app` — Next.js App Router pages
  - [x] `[R3b]` `/components` — React components
  - [x] `[R3c]` `/components/ui` — shadcn/ui components
  - [x] `[R3d]` `/lib` — Utilities, helpers
  - [x] `[R3e]` `/hooks` — Custom React hooks
  - [x] `[R3f]` `/types` — TypeScript types
  - [x] `[R3g]` `/public` — Static assets
  - [x] `[R3h]` `/public/images` — Optimized images
  - [x] `[R3i]` `/public/videos` — Video assets
  - [x] `[R3j]` `/styles` — Global styles, Tailwind config
  - [x] `[R3k]` `/content` — CMS content (if applicable)

### Tooling Setup ([[Org Chart/ENG-FE/IDENTITY]])
- [x] `[T1]` Install and configure TypeScript
- [x] `[T2]` Install and configure Tailwind CSS
- [x] `[T3]` Install and configure chosen UI library (shadcn/ui)
- [x] `[T4]` Install animation library (Framer Motion + GSAP)
- [x] `[T5]` Configure ESLint + Prettier
- [x] `[T6]` Set up path aliases (`@/components`, `@/lib`, etc.)
- [x] `[T7]` Install testing framework (Vitest + React Testing Library)

### Development Environment ([[Org Chart/ENG-FE/IDENTITY]])
- [x] `[D1]` Create `.env.example` with all required variables
- [x] `[D2]` Create `README.md` with setup instructions
- [x] `[D3]` Create `CONTRIBUTING.md` with coding standards
- [x] `[D4]` Verify `npm run dev` starts without errors
- [x] `[D5]` Verify build succeeds (`npm run build`)

### CI/CD Pipeline ([[Org Chart/ENG-BE/IDENTITY]])
- [x] `[C1]` Create GitHub Actions workflow:
  - [x] `[C1a]` Lint check on PR
  - [x] `[C1b]` Type check on PR
  - [x] `[C1c]` Build check on PR
- [x] `[C2]` Set up Vercel deployment:
  - [x] `[C2a]` Connect repo to Vercel
  - [x] `[C2b]` Configure preview deployments
  - [~] `[C2c]` Configure custom domain (pinkbeam.ai) — DEFERRED to later (not blocking)

### Initial Commit ([[Org Chart/ENG-FE/IDENTITY]])
- [x] `[I1]` Create placeholder homepage
- [x] `[I2]` Push to GitHub
- [x] `[I3]` Verify deployment on Vercel
- [x] `[I4]` Share repo URL with team

---

## 📝 Work Log

### 2026-02-07 10:33 [[Org Chart/CEO/IDENTITY]] — Task Activated
- CEO verified and approved TASK-001
- Dependency resolved: Tech stack finalized
- TASK-003 activated and assigned to ENG-FE
- Ready for repository initialization

### 2026-02-07 10:36 [[Org Chart/ENG-FE/IDENTITY]] — Repository Setup Complete
**Completed:**
- [x] `[R1]` Created GitHub repo: https://github.com/pinkbeambot/pinkbeam-website
- [x] `[R2]` Initialized with Next.js 16 + App Router + TypeScript
- [x] `[R3]` Full folder structure created:
  - `/app`, `/components`, `/components/ui`, `/lib`, `/hooks`, `/types`
  - `/public/images`, `/public/videos`, `/styles`, `/content`
- [x] `[T1-T7]` All tooling configured:
  - TypeScript with strict config
  - Tailwind CSS v4 with shadcn/ui
  - Framer Motion + GSAP for animations
  - ESLint + Prettier
  - Path aliases (@/components, @/lib)
  - Vitest + React Testing Library
- [x] `[D1-D5]` Dev environment complete:
  - `.env.example` with all service placeholders
  - `README.md` with setup instructions
  - `CONTRIBUTING.md` with coding standards
  - `npm run dev` verified working
  - `npm run build` verified working (static export)
- [x] `[C2a-C2b]` Vercel deployment configured:
  - Production: https://pinkbeam-website.vercel.app
  - Preview deployments enabled
- [x] `[I1-I4]` Initial commit pushed, deployment verified

**Progress:**
- [ ] `[C1]` GitHub Actions workflows (0% — pending ENG-BE)
- [ ] `[C2c]` Production domain config (0% — pending custom domain)

**Blockers:**
- None

**Next:**
- Hand off CI/CD pipeline (GitHub Actions) to [[Org Chart/ENG-BE/IDENTITY]]
- Or: ENG-FE continues with placeholder homepage polish
- Task ~85% complete — remaining work is ENG-BE domain

### 2026-02-07 10:44 [[Org Chart/ENG-BE/IDENTITY]] — CI/CD Pipeline Complete
**Completed:**
- [x] `[C1a]` Created GitHub Actions workflow with lint check on PR
- [x] `[C1b]` Type check job configured (TypeScript --noEmit)
- [x] `[C1c]` Build check job with artifact upload
- [x] Workflow file: `.github/workflows/ci.yml`
- [x] Committed and pushed to main branch
- [x] Workflow active at: https://github.com/pinkbeambot/pinkbeam-website/actions

**Progress:**
- [ ] `[C2c]` Production domain configuration — blocked pending FOUNDER approval for domain purchase

**Notes:**
- C2c (custom domain) deferred — using Vercel preview domain for now
- Development can continue locally and on preview deployments
- Custom domain to be configured later when purchased

**Next:**
- Task ready for CEO review/verification
- C2c can be completed once domain is purchased and DNS records provided
- Recommend: Create FOUNDER task for domain purchase decision

---

## 🚧 Blockers

**Current blockers:**
- None — C2c (custom domain) is NOT a blocker

**Deferred Items:**
- `[C2c]` Custom domain (pinkbeam.ai) — waiting on FOUNDER purchase decision
- Using `https://pinkbeam-website.vercel.app` for development and previews
- No impact on local development or other tasks

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEBSITE-ROADMAP.md]] — Phase 0: Foundation
- **Depends on:** [[TASK-001]] — Tech stack
- **Blocks:**
  - [[TASK-004]] — Design system
  - [[TASK-011]] — Global components
  - All page building tasks

---

### 2026-02-07 10:50 [[Org Chart/FOUNDER/IDENTITY]] — Domain Decision
**Decision:** Defer custom domain (pinkbeam.ai) purchase to later date.

**Rationale:**
- Development can continue using Vercel preview domain (pinkbeam-website.vercel.app)
- No technical blockers — all code works on any domain
- Domain purchase can happen closer to public launch
- Avoid spending money before revenue validation

**Impact:**
- ✅ All development work can proceed
- ✅ Preview deployments work perfectly
- ✅ No code changes needed when domain is added later
- ⏸️ Custom domain deferred to FOUNDER timeline

**This completes TASK-003.** All critical functionality is operational. Custom domain is a cosmetic/launch item, not a development blocker.

---

## 🏁 Completion Notes

**Summary:** Website repository fully initialized with Next.js 14, TypeScript, Tailwind, shadcn/ui, and all tooling. CI/CD pipeline active. Vercel deployment working.

**Metrics:**
- Actual hours: 1.0
- Estimated hours: 4
- Variance: -3 hours (AI acceleration)

**Deliverables:**
- [x] GitHub repo: https://github.com/pinkbeambot/pinkbeam-website
- [x] Vercel deployment: https://pinkbeam-website.vercel.app
- [x] All tooling configured and tested
- [x] CI/CD pipeline with GitHub Actions
- [x] Local development environment ready

**Deferred (Non-Blocking):**
- `[C2c]` Custom domain (pinkbeam.ai) — waiting on FOUNDER purchase decision
- This does NOT block any other tasks
- Preview domain sufficient for development and testing

**Status:** ✅ Ready to mark complete — all critical work done

**Next Steps:**
- Activate TASK-004 (Design System) for ENG-FE
- Or activate TASK-002 (Brand Identity) for LUMEN if visual work needed first
- Custom domain can be added later without code changes
