---
id: "TASK-008"
title: "Create Iconography System (100+ Icons)"
status: "todo"
priority: "P2"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
current_worker: ""
next_worker: ""

estimated_hours: 12
actual_hours: 0
dependencies:
  - "TASK-002"
  - "TASK-005"
blocks:
  - "TASK-011"
  - "TASK-012"

is_active: false
verified_by: ""

phase_reviews:
  - phase: "Core Icons"
    worker: "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
    reviewer: "[[Org Chart/ENG-FE/IDENTITY]]"
    status: todo
    submitted_at: ""
    approved_at: ""

tags:
  - "design"
  - "icons"
  - "LUMEN"
  - "P2"
---

# TASK-008: Create Iconography System (100+ Icons)

## 🎯 Objective
Build a comprehensive icon set for the Pink Beam website and product UI — 100+ icons covering all features, integrations, and UI needs.

## 📖 Context
Icons are critical for UI clarity and brand consistency. We'll use Lucide as a base but need custom icons for:
- Employee types (unique visual identifiers)
- Integration logos (Slack, HubSpot, etc.)
- Feature concepts (AI-specific)

**Wait for:**
- [[TASK-002]] — Brand identity (stroke style, colors)
- [[TASK-005]] — Asset pipeline

---

## ✅ Definition of Done

### Phase 1: Core UI Icons (40 icons)
Using Lucide base, verify/curate:
- [ ] Navigation icons (home, menu, close, arrow variants)
- [ ] Action icons (plus, minus, edit, delete, copy)
- [ ] Status icons (check, x, warning, info, loading)
- [ ] Layout icons (grid, list, fullscreen, collapse)
- [ ] Social icons (Twitter/X, LinkedIn, GitHub, Discord)

### Phase 2: Employee Icons (6 custom icons)
Unique icons for each AI employee:
- [ ] `[E1]` Researcher icon — magnifying glass + data
- [ ] `[E2]` SDR icon — handshake + connection
- [ ] `[E3]` Support icon — chat bubble + heart
- [ ] `[E4]` Content icon — pen + broadcast
- [ ] `[E5]` Designer (LUMEN) icon — palette + beam
- [ ] `[E6]` Video (FLUX) icon — play + motion

### Phase 3: Feature Icons (30 icons)
Icons for product features:
- [ ] `[F1-5]` Research features (sources, analysis, brief, alert, report)
- [ ] `[F6-10]` Sales features (lead, outreach, sequence, meeting, CRM)
- [ ] `[F11-15]` Support features (ticket, chat, knowledge base, resolution, escalation)
- [ ] `[F16-20]` Content features (write, repurpose, schedule, publish, analytics)
- [ ] `[F21-25]` Platform features (AI, automation, scheduling, integration, security)
- [ ] `[F26-30]` Analytics features (dashboard, chart, metric, growth, ROI)

### Phase 4: Integration Icons (20 icons)
- [ ] Communication: Slack, Discord, Email, Teams
- [ ] CRM: HubSpot, Salesforce, Pipedrive
- [ ] Productivity: Notion, Linear, Asana, Trello
- [ ] Storage: Google Drive, Dropbox, Box
- [ ] Marketing: Mailchimp, Beehiiv, ConvertKit
- [ ] Dev: GitHub, GitLab, Vercel, AWS

### Phase 5: Implementation ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[I1]` Install Lucide React
- [ ] `[I2]` Create custom icon components (6 employee icons)
- [ ] `[I3]` Set up icon sprite or individual imports
- [ ] `[I4]` Add to design system (Storybook)
- [ ] `[I5]` Document usage guidelines

### Phase 6: Organization
- [ ] `[O1]` Export all custom icons as SVG
- [ ] `[O2]` Organize in `/public/icons/`
- [ ] `[O3]` Create icon reference document

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
  - [[TASK-011]] — Global components (nav uses icons)
  - [[TASK-012]] — Homepage (feature icons)

---

## 🏁 Completion Notes

*To be filled when complete*
