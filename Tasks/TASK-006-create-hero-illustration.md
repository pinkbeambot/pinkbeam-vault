---
id: "TASK-006"
title: "Create Hero Illustration"
status: "todo"
priority: "P1"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 6
actual_hours: 0
dependencies:
  - "TASK-002"
  - "TASK-005"
blocks:
  - "TASK-012"

is_active: false
verified_by: ""

phase_reviews:
  - phase: "Concepts"
    worker: "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
    reviewer: "[[Org Chart/CMO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""
  - phase: "Final"
    worker: "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
    reviewer: "[[Org Chart/CMO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "design"
  - "illustration"
  - "LUMEN"
  - "P1"
---

# TASK-006: Create Hero Illustration

## 🎯 Objective
Create the primary hero illustration for the website homepage — a striking visual that captures the essence of AI employees working together.

## 📖 Context
This is the first thing visitors see. Must be:
- Cosmic and tech-forward
- Show AI workforce collaboration
- On-brand (pink beam aesthetic)
- Work in both light and dark modes
- Responsive (works at multiple sizes)

**Wait for:**
- [[TASK-002]] — Brand identity (colors, style established)
- [[TASK-005]] — Asset pipeline (know where to save)

---

## ✅ Definition of Done

### Phase 1: Concept Development ([[Org Chart/DESIGN-BRAND/IDENTITY]])
- [ ] `[C1]` Review brand guidelines from TASK-002
- [ ] `[C2]` Generate 10+ concept sketches using Gemini API
- [ ] `[C3]` Create mood board with references
- [ ] `[C4]` Present 3 top concepts to CMO with rationale
- [ ] `[C5]` Get feedback and select direction

### Phase 2: Illustration Production ([[Org Chart/DESIGN-BRAND/IDENTITY]])
- [ ] `[P1]` Generate high-res base image (2K or 4K)
- [ ] `[P2]` Iterate based on feedback (2-3 rounds)
- [ ] `[P3]` Create variations:
  - [ ] `[P3a]` Dark mode version
  - [ ] `[P3b]` Simplified version (for mobile)
  - [ ] `[P3c]` Background-only version (no foreground elements)
- [ ] `[P4]` Add subtle animation elements (if applicable):
  - [ ] `[P4a]` Particle effects
  - [ ] `[P4b]` Beam glow

### Phase 3: Export & Optimization ([[Org Chart/DESIGN-BRAND/IDENTITY]])
- [ ] `[E1]` Export in multiple formats:
  - [ ] `[E1a]` SVG (if vector)
  - [ ] `[E1b]` PNG (high-res)
  - [ ] `[E1c]` WebP (optimized)
  - [ ] `[E1d]` AVIF (next-gen)
- [ ] `[E2]` Create responsive sizes:
  - [ ] `[E2a]` 2400px (desktop wide)
  - [ ] `[E2b]` 1200px (desktop)
  - [ ] `[E2c]` 800px (tablet)
  - [ ] `[E2d]` 400px (mobile)
- [ ] `[E3]` Generate blur placeholder (base64)
- [ ] `[E4]` Optimize file sizes (< 500KB for largest)

### Phase 4: Handoff ([[Org Chart/DESIGN-BRAND/IDENTITY]])
- [ ] `[H1]` Upload to CDN (`/public/images/illustrations/hero/`)
- [ ] `[H2]` Document usage in `ASSETS.md`
- [ ] `[H3]` Provide CSS background-position recommendations
- [ ] `[H4]` Handoff to ENG-FE for implementation

---

## 📝 Work Log

---

## 🚧 Blockers

**Current blockers:**
- Waiting for [[TASK-002]] — Brand identity
- Waiting for [[TASK-005]] — Asset pipeline

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEBSITE-ROADMAP.md]] — Phase 1: Visual Assets
- **Depends on:**
  - [[TASK-002]] — Brand identity
  - [[TASK-005]] — Asset pipeline
- **Blocks:**
  - [[TASK-012]] — Homepage (needs hero image)

---

## 🏁 Completion Notes

*To be filled when complete*
