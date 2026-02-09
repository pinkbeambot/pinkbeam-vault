---
id: "TASK-015"
title: "Build Interactive Demo Environment"
status: "todo"
priority: "P1"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-BE/IDENTITY]]"
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 16
actual_hours: 0
dependencies:
  - "TASK-003"
  - "TASK-004"
blocks:
  - "TASK-012"

is_active: false
verified_by: ""

phase_reviews:
  - phase: "Frontend"
    worker: "[[Org Chart/ENG-FE/IDENTITY]]"
    reviewer: "[[Org Chart/CTO/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "engineering"
  - "frontend"
  - "backend"
  - "interactive"
  - "P1"
---

# TASK-015: Build Interactive Demo Environment

## 🎯 Objective
Create an interactive demo that lets visitors experience a sample researcher brief without signing up.

## 📖 Context
Demo is our best conversion tool. It needs to:
- Show real value in 30 seconds
- Feel like the actual product
- Capture emails for follow-up
- Be rate-limited to prevent abuse

---

## ✅ Definition of Done

### Demo Modal Component ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[M1]` Modal/lightbox component
- [ ] `[M2]` Open from "Watch Demo" CTA
- [ ] `[M3]` Close button + click outside to close
- [ ] `[M4]` Responsive sizing

### Sample Brief Display ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[B1]` Brief header (date, period)
- [ ] `[B2]` Executive Summary section
- [ ] `[B3]` Competitor Moves section
- [ ] `[B4]` Industry Trends section
- [ ] `[B5]` Opportunities section
- [ ] `[B6]` Key Readings section
- [ ] `[B7]` Expandable sections
- [ ] `[B8]` Sample data (use real TechCrunch articles)

### "Configure Your Own" Flow ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[C1]` Multi-step wizard:
  - [ ] `[C1a]` Step 1: Select employee type
  - [ ] `[C1b]` Step 2: Enter competitors (3 max for demo)
  - [ ] `[C1c]` Step 3: Select focus areas
  - [ ] `[C1d]` Step 4: Email capture
- [ ] `[C2]` Progress indicator
- [ ] `[C3]` Form validation

### Backend API ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[API1]` Generate sample brief endpoint:
  - [ ] `[API1a]` Accept competitors + focus areas
  - [ ] `[API1b]` Query vector DB (real data)
  - [ ] `[API1c]` Generate brief via Claude
  - [ ] `[API1d]` Return formatted brief
- [ ] `[API2]` Rate limiting (1 per email per day)
- [ ] `[API3]` Store demo requests (for follow-up)

### Email Capture ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[E1]` Email validation
- [ ] `[E2]` Add to newsletter list
- [ ] `[E3]` Trigger welcome email
- [ ] `[E4]` Mark as "demo requested" in CRM

### Live Playground ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[P1]` Standalone page `/demo`
- [ ] `[P2]` Full-screen demo experience
- [ ] `[P3]` Side-by-side: config + output
- [ ] `[P4]` Regenerate button

### UX Polish ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[UX1]` Loading states (skeleton)
- [ ] `[UX2]` Error handling
- [ ] `[UX3]` Success animations
- [ ] `[UX4]` Share results (optional)

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
- **Blocks:**
  - [[TASK-012]] — Homepage (needs demo modal)

---

## 🏁 Completion Notes

*To be filled when complete*
