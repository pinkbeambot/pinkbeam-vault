---
id: "TASK-016"
title: "Build ROI Calculator"
status: "todo"
priority: "P2"
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
  - "TASK-003"
  - "TASK-004"
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
  - "interactive"
  - "P2"
---

# TASK-016: Build ROI Calculator

## 🎯 Objective
Create an interactive ROI calculator that shows visitors exactly how much they'll save with Pink Beam.

## 📖 Context
ROI calculator is a powerful conversion tool. It personalizes the value proposition.

---

## ✅ Definition of Done

### Input Form ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[I1]` Number of employees on team
- [ ] `[I2]` Average salary per role
- [ ] `[I3]` Hours per week spent on:
  - [ ] `[I3a]` Research/market intel
  - [ ] `[I3b]` Sales outreach
  - [ ] `[I3c]` Customer support
  - [ ] `[I3d]` Content creation
- [ ] `[I4]` Company size (for context)
- [ ] `[I5]` Industry (for benchmarks)

### Calculation Logic ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[C1]` Calculate human cost:
  - [ ] `[C1a]` Hourly rate = salary / 2080
  - [ ] `[C1b]` Weekly cost = hours × hourly rate × team size
  - [ ] `[C1c]` Annual cost = weekly × 52
- [ ] `[C2]` Calculate AI employee cost:
  - [ ] `[C2a]` Match AI employees to tasks
  - [ ] `[C2b]` Sum monthly costs
  - [ ] `[C2c]` Annual cost = monthly × 12
- [ ] `[C3]` Calculate savings:
  - [ ] `[C3a]` Annual savings = human cost - AI cost
  - [ ] `[C3b]` Percentage savings
  - [ ] `[C3c]` Time saved (hours/week)

### Visual Output ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[O1]` Animated number counters
- [ ] `[O2]` Bar chart comparing costs
- [ ] `[O3]` Savings highlight (big number)
- [ ] `[O4]` Time saved visualization
- [ ] `[O5]` "This pays for itself in X days"

### Additional Features ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[A1]` Share results button (copy link)
- [ ] `[A2]` Email results to me
- [ ] `[A3]` CTA to start trial
- [ ] `[A4]` Reset button

### Responsiveness ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[R1]` Works on mobile (stacked layout)
- [ ] `[R2]` Works on desktop (side-by-side)

---

## 📝 Work Log

---

## 🚧 Blockers

**Current blockers:**
- Waiting for foundation tasks

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEBSITE-ROADMAP.md]] — Phase 3: Interactive Features
- **Depends on:**
  - [[TASK-003]] — Repo
  - [[TASK-004]] — Design system

---

## 🏁 Completion Notes

*To be filled when complete*
