---
id: WEB-018
title: Implement Analytics & Tracking Integration
status: todo
priority: P2
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 8
actual_hours: 0
dependencies:
  - WEB-001
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - analytics
  - tracking
  - posthog
  - P2
---

# WEB-018: Implement Analytics & Tracking Integration

## 🎯 Objective
Integrate PostHog for product analytics and Plausible for privacy-friendly web analytics to track user behavior, measure conversions, and inform product decisions.

## 📖 Context
Data-driven decisions require good analytics. We need to understand how users interact with our platform, where they drop off, and what features they use most.

**Tools:**
- **PostHog**: Product analytics, funnels, session recordings
- **Plausible**: Privacy-friendly, cookie-free web analytics

---

## ✅ Definition of Done

### Phase 1: PostHog Setup (ENG-BE)
- [ ] `[P1]` Create PostHog account
- [ ] `[P2]` Setup PostHog project
- [ ] `[P3]` Install PostHog JS SDK
- [ ] `[P4]` Configure posthog-js initialization
- [ ] `[P5]` Setup autocapture
- [ ] `[P6]` Configure session recordings

### Phase 2: Custom Events (ENG-FE)
- [ ] `[E1]` Track page views manually (SPA navigation)
- [ ] `[E2]` Track quote form submissions
- [ ] `[E3]` Track portal logins
- [ ] `[E4]` Track project views
- [ ] `[E5]` Track file downloads
- [ ] `[E6]` Track invoice views
- [ ] `[E7]` Track feature usage

### Phase 3: User Identification (ENG-FE)
- [ ] `[U1]` Identify users on login
- [ ] `[U2]` Set user properties (role, plan, etc.)
- [ ] `[U3]` Group analytics by agency
- [ ] `[U4]` Respect user privacy settings

### Phase 4: Funnels & Goals (ENG-BE)
- [ ] `[F1]` Create quote submission funnel
- [ ] `[F2]` Create signup funnel
- [ ] `[F3]` Create project creation funnel
- [ ] `[F4]` Setup conversion goals
- [ ] `[F5]` Create retention charts

### Phase 5: Plausible Setup (ENG-FE)
- [ ] `[PL1]` Create Plausible account
- [ ] `[PL2]` Add Plausible script to layout
- [ ] `[PL3]` Configure custom events
- [ ] `[PL4]` Setup goals in Plausible

### Phase 6: Dashboard Configuration (ENG-BE)
- [ ] `[D1]` Create PostHog dashboards
- [ ] `[D2]` Setup automated reports
- [ ] `[D3]` Configure alerts for anomalies
- [ ] `[D4]` Create team analytics views

### Phase 7: Privacy & Compliance (ENG-FE)
- [ ] `[PR1]` Add cookie consent banner
- [ ] `[PR2]` Respect Do Not Track
- [ ] `[PR3]` Provide opt-out option
- [ ] `[PR4]` Document data collection
- [ ] `[PR5]` Ensure GDPR compliance

### Phase 8: Testing (ENG-FE)
- [ ] `[T1]` Verify events firing correctly
- [ ] `[T2]` Test user identification
- [ ] `[T3]` Verify session recordings
- [ ] `[T4]` Test in private browsing

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Create PostHog account
- [ ] Create Plausible account
**Blockers:** 
- WEB-001 (Marketing Website — tracking starts here)  
**Notes:** Analytics should be implemented early to establish baselines.

---

## 🚧 Blockers

**Current blockers:**
- WEB-001 (Marketing Landing Page)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | PostHog + Plausible combo | PostHog for product analytics, Plausible for privacy-friendly web stats |
| 2026-02-09 | Manual page view tracking | Next.js App Router needs manual tracking for accurate SPA navigation |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 1: Foundation
- **Depends on:** WEB-001 (Marketing Website)
- **Blocks:** None
- **Related:**
  - [ARCHITECTURE.md](./ARCHITECTURE.md) — Analytics stack

---

## 📐 Technical Notes

### PostHog Initialization
```typescript
// lib/posthog.ts
import posthog from 'posthog-js';

export const initPostHog = () => {
  if (typeof window !== 'undefined') {
    posthog.init(process.env.NEXT_PUBLIC_POSTHOG_KEY!, {
      api_host: process.env.NEXT_PUBLIC_POSTHOG_HOST,
      capture_pageview: false, // We'll handle manually
      loaded: (posthog) => {
        if (process.env.NODE_ENV === 'development') {
          posthog.opt_out_capturing();
        }
      }
    });
  }
};

export const captureEvent = (event: string, properties?: Record<string, any>) => {
  posthog.capture(event, properties);
};
```

### Page View Tracking
```typescript
// hooks/usePageView.ts
import { usePathname } from 'next/navigation';
import { useEffect } from 'react';
import posthog from 'posthog-js';

export function usePageView() {
  const pathname = usePathname();
  
  useEffect(() => {
    posthog.capture('$pageview', { pathname });
  }, [pathname]);
}
```

### Custom Events
```typescript
// Quote form submission
captureEvent('quote_submitted', {
  project_type: formData.projectType,
  budget_range: formData.budget,
  has_website: !!formData.website
});

// Portal login
captureEvent('portal_login', {
  user_role: user.role
});
```

### Plausible Script
```html
<script 
  defer 
  data-domain="pinkbeam.ai" 
  src="https://plausible.io/js/script.js"
></script>
```

---

*Track everything, but respect user privacy*
