---
id: "TASK-022"
title: "Build About & Company Pages"
status: "completed"
priority: "P2"
created_at: "2026-02-07T04:30:00Z"
created_by: "@FOUNDER"
started_at: "2026-02-07T13:35:00Z"
completed_at: "2026-02-07T13:43:00Z"
verified_at: ""

assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: "[[Org Chart/ENG-FE/IDENTITY]]"
next_worker: ""

estimated_hours: 8
actual_hours: 0
dependencies:
  - "TASK-011"
  - "TASK-012"
blocks: []

is_active: true
verified_by: ""

tags:
  - "engineering"
  - "frontend"
  - "static-pages"
  - "P2"
---

# TASK-022: Build About & Company Pages

## 🎯 Objective
Build About Us, Careers, and Contact pages for the Pink Beam website.

## Prerequisites (All Ready)
- Repo: `~/code/pinkbeam-website`
- Design system: Complete
- Global components: Navigation, Footer ready
- Homepage: Complete (reference styling)

## Pages to Build

### 1. About Us Page (`app/about/page.tsx`)

**Sections:**
- [ ] Hero: "We're Building the Future of Work"
- [ ] Mission statement section
- [ ] Company story (founded 2026, AI-first, etc.)
- [ ] Team section - showcase AI employees as the team:
  - Grid of 6 employee cards (Sarah, Mike, Alex, Casey, LUMEN, FLUX)
  - Each with avatar, role, brief description
- [ ] Values section (4-5 core values with icons)
- [ ] Office/remote culture mention

### 2. Careers Page (`app/careers/page.tsx`)

**Sections:**
- [ ] Hero: "Join the Pink Beam Team"
- [ ] Why work here section
- [ ] Open positions (if any - placeholder)
- [ ] Culture highlights
- [ ] Benefits section
- [ ] CTA to apply/contact

### 3. Contact Page (`app/contact/page.tsx`)

**Sections:**
- [ ] Hero: "Get in Touch"
- [ ] Contact form:
  - Name, Email, Company, Message
  - Department select (Sales, Support, General)
  - Submit button
- [ ] Direct contact info:
  - Support email
  - Sales email
  - Response time expectations
- [ ] FAQ sidebar (3 common questions)

## Styling

- Use design system (colors, typography)
- Consistent with homepage
- Responsive design
- FadeIn animations on scroll

## Output Location

All code in `~/code/pinkbeam-website/`

## Success Criteria

- [ ] All 3 pages render correctly
- [ ] Forms have validation states
- [ ] Mobile responsive
- [ ] `npm run build` succeeds

## Constraints

- NO backend API calls
- NO actual form submission (frontend only)
- NO external integrations
- Pure local development

Begin with About page, then Careers, then Contact.