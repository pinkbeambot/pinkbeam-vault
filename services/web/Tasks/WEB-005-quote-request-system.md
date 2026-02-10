---
id: WEB-005
title: Build Quote Request System
status: done
priority: P0
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: "2026-02-09T22:00:00Z"
completed_at: "2026-02-09T22:30:00Z"
verified_at: "2026-02-09T22:30:00Z"
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: "ENG-FE"
next_worker: "ENG-FE"
estimated_hours: 12
actual_hours: 3
dependencies:
  - WEB-001
  - WEB-002
  - WEB-003
blocks:
  - WEB-011
is_active: false
verified_by: "ENG-FE"
phase_reviews: []
tags:
  - web
  - frontend
  - forms
  - lead-generation
  - P0
---

# WEB-005: Build Quote Request System

## 🎯 Objective
Create a multi-step quote request form that captures project details and sends leads to the sales pipeline. Form submissions should be stored locally (JSON/file) until the backend is ready.

## 📖 Context
The quote request is the primary conversion goal for the marketing site. It needs to balance detail (to qualify leads) with simplicity (to maximize completion). Until the backend API is ready, we'll store submissions locally and email notifications.

**Form Strategy:**
- Multi-step (3 steps) to reduce perceived complexity
- Progress indicator
- Smart defaults from pricing calculator
- Save and resume capability (localStorage)

---

## ✅ Definition of Done

### Phase 1: Form Strategy & Copy (CMO)
- [ ] `[C1]` Define form fields and questions
- [ ] `[C2]` Write form copy and labels
- [ ] `[C3]` Create help text and tooltips
- [ ] `[C4]` Design email notification template
- [ ] `[C5]` Create auto-responder email copy

### Phase 2: Form Design (Design-Brand)
- [ ] `[D1]` Design multi-step form layout
- [ ] `[D2]` Design progress indicator
- [ ] `[D3]` Design input states (default, focus, error, success)
- [ ] `[D4]` Design step transitions
- [ ] `[D5]` Design success/confirmation page

### Phase 3: Form Components (ENG-FE)
- [ ] `[F1]` Create FormStep wrapper component
- [ ] `[F2]` Create ProgressBar component
- [ ] `[F3]` Create FormInput component (with validation)
- [ ] `[F4]` Create FormTextarea component
- [ ] `[F5]` Create FormSelect component
- [ ] `[F6]` Create FormCheckbox component
- [ ] `[F7]` Create FormRadioGroup component
- [ ] `[F8]` Create FormFileUpload component (optional)
- [ ] `[F9]` Create validation error display

### Phase 4: Multi-Step Logic (ENG-FE)
- [ ] `[M1]` Create form state management (React Hook Form)
- [ ] `[M2]` Implement step navigation (next/prev)
- [ ] `[M3]` Add step validation before advance
- [ ] `[M4]` Implement localStorage auto-save
- [ ] `[M5]` Add "save and continue later" feature
- [ ] `[M6]` Handle browser back/forward buttons

### Step 1: Contact Information
- [ ] `[S1]` Full name (required)
- [ ] `[S2]` Email address (required, validation)
- [ ] `[S3]` Phone number (optional, validation)
- [ ] `[S4]` Company name (optional)
- [ ] `[S5]` Website URL (optional, validation)

### Step 2: Project Details
- [ ] `[S6]` Project type (select: new site, redesign, migration, etc.)
- [ ] `[S7]` Service interest (multi-select: design, SEO, maintenance)
- [ ] `[S8]` Estimated pages (number input)
- [ ] `[S9]` E-commerce needed (yes/no)
- [ ] `[S10]` CMS preference (select: WordPress, custom, etc.)
- [ ] `[S11]` Budget range (select: ranges)
- [ ] `[S12]` Timeline (select: urgent, 1-3 months, 3-6 months, flexible)

### Step 3: Additional Information
- [ ] `[S13]` Project description (textarea)
- [ ] `[S14]` How did you hear about us? (select)
- [ ] `[S15]` Upload relevant files (optional, file input)
- [ ] `[S16]` Terms agreement (checkbox)
- [ ] `[S17]` Marketing consent (checkbox, optional)

### Phase 5: Submission Handling (ENG-FE)
- [ ] `[H1]` Create submission handler
- [ ] `[H2]` Store submission to local JSON file
- [ ] `[H3]` Send email notification (Resend API)
- [ ] `[H4]` Send auto-responder to client
- [ ] `[H5]` Clear localStorage on success
- [ ] `[H6]` Show success confirmation page
- [ ] `[H7]` Handle submission errors gracefully

### Phase 6: Integration Points (ENG-FE)
- [ ] `[I1]` Pre-fill from pricing calculator URL params
- [ ] `[I2]` Track form funnel in PostHog
- [ ] `[I3]` Add UTM parameter capture
- [ ] `[I4]` Integrate with reCAPTCHA v3

### Phase 7: Testing & QA (ENG-FE)
- [ ] `[T1]` Test all validation rules
- [ ] `[T2]` Test step navigation
- [ ] `[T3]` Test localStorage save/restore
- [ ] `[T4]` Test email delivery
- [ ] `[T5]` Test file upload (if implemented)
- [ ] `[T6]` Mobile form testing
- [ ] `[T7]` Accessibility audit

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Finalize form fields with CMO
- [ ] Get Resend API key for email notifications
**Blockers:** None  
**Notes:** Store submissions locally until WEB-011 (API) is complete. Then migrate to database storage.

---

## 🚧 Blockers

**Current blockers:**
- WEB-001 (design system)
- WEB-002 (service details for pre-fill)
- WEB-003 (pricing calculator integration)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Multi-step form (3 steps) | Higher completion rate than long single page |
| 2026-02-09 | Local storage save/restore | Reduces abandonment from interruptions |
| 2026-02-09 | Local JSON storage initially | Backend not ready; easy to migrate later |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 1: Foundation
- **Depends on:** 
  - WEB-001 (design system)
  - WEB-002 (service details)
  - WEB-003 (pricing calculator pre-fill)
- **Blocks:**
  - WEB-011 (API — will replace local storage)
- **Related:**
  - [[WEB-003-pricing-page]] — Calculator links to this form

---

## 📐 Technical Notes

### Form State Structure
```typescript
interface QuoteFormData {
  // Step 1: Contact
  fullName: string;
  email: string;
  phone?: string;
  company?: string;
  website?: string;
  
  // Step 2: Project
  projectType: string;
  services: string[];
  pageCount?: number;
  needsEcommerce: boolean;
  cmsPreference?: string;
  budgetRange: string;
  timeline: string;
  
  // Step 3: Details
  description: string;
  referralSource: string;
  attachments?: File[];
  agreedToTerms: boolean;
  marketingConsent: boolean;
  
  // Metadata
  submittedAt?: string;
  utmSource?: string;
  utmMedium?: string;
  utmCampaign?: string;
}
```

### Storage Strategy
```typescript
// Until API is ready:
1. Save to localStorage (auto-save every 30s)
2. On submit: append to local JSON file via API route
3. Send email via Resend
4. Clear localStorage on success

// Later (WEB-011):
Replace local JSON with POST to /api/quotes
```

### Email Templates
- Admin notification: New lead alert with all details
- Client auto-responder: Thank you + next steps timeline

---

*Form should pre-fill from URL: /quote?type=starter&budget=5k-10k*
