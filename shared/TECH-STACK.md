# TECH-STACK.md — Pink Beam Website Architecture

**Version:** 1.0  
**Decided:** 2026-02-07  
**Decided By:** CTO  
**Reviewed By:** FOUNDER (via delegation)  
**Status:** ✅ Approved

---

## 🎯 Executive Summary

This document records all technology decisions for the Pink Beam marketing website. Each decision includes rationale, alternatives considered, and migration paths.

**Quick Reference:**

| Layer | Choice | Rationale |
|-------|--------|-----------|
| **Framework** | Next.js 14 (App Router) | Industry standard, Vercel optimization, rich ecosystem |
| **Styling** | Tailwind CSS + shadcn/ui | Rapid development, consistent design system |
| **CMS** | Sanity | Structured content, real-time previews, cost-effective |
| **Auth** | Clerk | Modern DX, built for React, reasonable pricing |
| **Payments** | Stripe | Industry standard, excellent APIs |
| **Analytics** | PostHog | Product analytics, session recordings, privacy-friendly |
| **Hosting** | Vercel | Optimal for Next.js, edge network, zero config |

---

## 1. Frontend Framework

### Decision: Next.js 14 (App Router)

```yaml
framework: Next.js 14
router: App Router (app/ directory)
language: TypeScript
```

### Alternatives Considered

| Framework | Pros | Cons | Verdict |
|-----------|------|------|---------|
| **Astro** | Static-first, fast builds, islands architecture | Newer, smaller ecosystem, less animation support | ❌ Not suitable for rich interactions |
| **Remix** | Web standards, excellent forms/data loading | Smaller ecosystem, Vercel not optimized | ❌ Good but Next.js wins on ecosystem |
| **Gatsby** | Static site generation, GraphQL | Slow builds, declining popularity | ❌ Legacy choice |
| **SvelteKit** | Fast, minimal JS | Smaller ecosystem, harder to hire for | ❌ Risky for team scaling |

### Why Next.js Wins

1. **Vercel Optimization**: We're hosting on Vercel — Next.js is built by Vercel
2. **Ecosystem**: Largest React framework ecosystem
3. **App Router**: Modern architecture, server components, streaming
4. **Team Velocity**: shadcn/ui, NextAuth, most libraries target Next.js first
5. **AI Employee Compatible**: Extensive docs, predictable patterns

### Performance Strategy

- Server Components by default (zero client JS)
- Client Components only for interactivity
- Route-level code splitting
- Image optimization via next/image
- Font optimization via next/font

### Migration Path

If we outgrow Next.js:
- Astro for pure static (marketing sites)
- Custom React + Vite (full control)

---

## 2. Styling & UI

### Decision: Tailwind CSS + shadcn/ui

```yaml
css_framework: Tailwind CSS 3.4+
ui_library: shadcn/ui
animation: Framer Motion + GSAP
icons: Lucide React
```

### Tailwind CSS

**Why:**
- Utility-first = rapid development
- Design system tokens built-in
- Tree-shaking = minimal CSS bundle
- AI employees write predictable classes

**Configuration:**
```javascript
// tailwind.config.ts
colors: {
  beam: {
    DEFAULT: '#FF006E',
    50: '#FFE5F0',
    500: '#FF006E',
    900: '#66002C',
  },
  void: {
    DEFAULT: '#0A0A0F',
    50: '#1A1A2E',
    900: '#0A0A0F',
  }
}
```

### shadcn/ui

**Why:**
- Copy-paste components (full ownership)
- Built on Radix UI (accessibility)
- Tailwind-native styling
- Easy customization

**Components to Install:**
- Button, Card, Dialog, Dropdown
- Tabs, Accordion, Form elements
- Navigation, Sheet (mobile menu)

### Animation Strategy

**Framer Motion**: Primary animation library
- Component animations
- Page transitions
- Gesture support

**GSAP**: Complex sequences
- Hero animations
- Scroll-triggered reveals
- Timeline control

### Alternatives Rejected

| Option | Why Rejected |
|--------|--------------|
| Chakra UI | Larger bundle, harder to customize |
| Material UI | Too opinionated, not modern aesthetic |
| Bootstrap | Legacy, not suitable for brand |
| Styled Components | Runtime overhead, Tailwind is faster |

---

## 3. Content Management (CMS)

### Decision: Sanity

```yaml
cms: Sanity
version: Sanity v3
hosting: Sanity Cloud (free tier → $99/mo)
```

### Alternatives Considered

| CMS | Pros | Cons | Verdict |
|-----|------|------|---------|
| **Contentful** | Enterprise features, robust | Expensive ($489/mo), complex | ❌ Overkill for now |
| **Strapi** | Self-hosted, open-source | Self-hosting overhead, less polished | ❌ Operational burden |
| **Prismic** | Good DX, slices | Smaller ecosystem, less flexible | ❌ Good but Sanity wins |
| **Notion as CMS** | Free, familiar | Not a real CMS, rate limits | ❌ Not professional |
| **Markdown files** | Simple, git-tracked | No real-time previews, no UI | ❌ Doesn't scale to team |

### Why Sanity Wins

1. **Real-time Previews**: Content editors see changes instantly
2. **Structured Content**: Portable, API-first
3. **GROQ Query Language**: Powerful, typed queries
4. **Cost**: Free tier generous, $99/mo for team
5. **AI Employee Friendly**: Clear schema, predictable API

### Content Models

```typescript
// schemas/post.ts
export default {
  name: 'post',
  type: 'document',
  fields: [
    { name: 'title', type: 'string' },
    { name: 'slug', type: 'slug', options: { source: 'title' } },
    { name: 'content', type: 'array', of: [{ type: 'block' }] },
    { name: 'author', type: 'reference', to: [{ type: 'author' }] },
    { name: 'publishedAt', type: 'datetime' },
    { name: 'excerpt', type: 'text' },
    { name: 'coverImage', type: 'image' },
    { name: 'tags', type: 'array', of: [{ type: 'string' }] },
  ]
}
```

### Migration Path

If we outgrow Sanity:
- Contentful (enterprise features)
- Strapi (self-hosted control)
- Custom CMS (if we have unique needs)

---

## 4. Authentication

### Decision: Clerk

```yaml
auth: Clerk
features: Email + OAuth (Google, GitHub), MFA, session management
pricing: Free tier (10K MAU) → $25/mo (growth)
```

### Alternatives Considered

| Provider | Pros | Cons | Verdict |
|----------|------|------|---------|
| **Auth0** | Enterprise features, mature | Expensive, complex pricing | ❌ Overkill and costly |
| **NextAuth.js** | Free, flexible | Self-hosted, maintenance burden | ❌ Operational overhead |
| **Supabase Auth** | Free, database included | Tied to Supabase ecosystem | ❌ Lock-in concern |
| **Firebase Auth** | Free, Google backing | Vendor lock-in, limited customization | ❌ Not ideal |

### Why Clerk Wins

1. **Modern DX**: Drop-in components for React/Next.js
2. **Pricing**: Free tier generous, reasonable growth pricing
3. **Features**: Built-in MFA, org support, session management
4. **UI Components**: Pre-built, customizable auth UI
5. **Webhooks**: Easy integration with our backend

### Implementation

```typescript
// middleware.ts
import { authMiddleware } from '@clerk/nextjs'

export default authMiddleware({
  publicRoutes: ['/', '/pricing', '/blog', '/about'],
})
```

### Migration Path

If we outgrow Clerk:
- Auth0 (enterprise needs)
- Custom auth (with auth.js or custom JWT)

---

## 5. Payments

### Decision: Stripe

```yaml
payments: Stripe
features: Checkout, Customer Portal, Subscriptions, Webhooks
pricing: 2.9% + $0.30 per transaction
```

### Why Stripe (No Alternatives Considered)

Stripe is the **industry standard** for SaaS payments. Alternatives like Paddle or Lemon Squeezy are valid but Stripe offers:

- Best developer experience
- Most comprehensive API
- Excellent documentation
- Global support
- Customer portal (self-service)

### Architecture

```
Frontend → Stripe Checkout → Success/Cancel URLs
                ↓
         Webhook → Our API → Update user subscription
```

### Implementation Notes

- Use Stripe Checkout (hosted) for security
- Customer Portal for subscription management
- Webhook endpoint for async events
- Idempotency keys for retry safety

---

## 6. Analytics

### Decision: PostHog (Primary) + Plausible (Privacy)

```yaml
product_analytics: PostHog
privacy_analytics: Plausible
```

### PostHog

**Why:**
- Product analytics (funnels, retention, user paths)
- Session recordings (see real user behavior)
- Feature flags (for gradual rollouts)
- Self-hostable (future option)
- Generous free tier (1M events/mo)

### Plausible

**Why:**
- Privacy-friendly (no cookies, GDPR compliant)
- Public dashboards (transparency)
- Simple metrics (pageviews, referrers)
- Lightweight (< 1KB script)

### Alternatives Rejected

| Tool | Why Rejected |
|------|--------------|
| Google Analytics | Privacy concerns, cookie banners, complex |
| Mixpanel | Expensive, similar features to PostHog |
| Amplitude | Enterprise pricing, overkill |
| Heap | Auto-capture is heavy, expensive |

### Implementation

```typescript
// PostHog initialization
import posthog from 'posthog-js'

posthog.init(process.env.NEXT_PUBLIC_POSTHOG_KEY, {
  api_host: process.env.NEXT_PUBLIC_POSTHOG_HOST,
  capture_pageview: false, // We'll handle manually
})
```

---

## 7. Hosting & Deployment

### Decision: Vercel

```yaml
hosting: Vercel
plan: Pro ($20/mo per team member)
cdn: Vercel Edge Network (Cloudflare under hood)
```

### Why Vercel

1. **Next.js Optimization**: Built by Vercel, perfect integration
2. **Edge Network**: Global CDN, automatic
3. **Preview Deployments**: Every PR gets a URL
4. **Analytics**: Built-in Web Vitals tracking
5. **Serverless Functions**: API routes, edge functions
6. **Zero Config**: Push to Git, auto-deploy

### Alternatives Rejected

| Platform | Why Rejected |
|----------|--------------|
| Netlify | Good, but Vercel better for Next.js |
| AWS Amplify | Complex, vendor lock-in |
| Cloudflare Pages | Good, but Vercel has better Next.js support |
| Self-hosted | Operational burden, not our core competency |

### Domain Setup

```
Production: pinkbeam.ai
Staging: staging.pinkbeam.ai
Previews: *.vercel.app
```

### Migration Path

If we outgrow Vercel:
- Cloudflare Pages + Workers (edge computing)
- AWS (full control, higher operational cost)

---

## 8. Asset Storage & CDN

### Decision: Cloudflare R2 + Cloudflare Images

```yaml
object_storage: Cloudflare R2 (S3-compatible)
image_optimization: Cloudflare Images (or Vercel's built-in)
video_hosting: Cloudflare Stream (or Mux)
```

### Why Cloudflare

1. **R2 Pricing**: Zero egress fees (vs AWS S3's expensive egress)
2. **Images**: Automatic optimization, responsive images
3. **Stream**: Video hosting with adaptive bitrate
4. **Integration**: Works well with Vercel (both use Cloudflare CDN)

### Cost Comparison

| Service | Storage | Egress | Notes |
|---------|---------|--------|-------|
| **Cloudflare R2** | $0.015/GB | $0 | Zero egress is huge |
| **AWS S3** | $0.023/GB | $0.09/GB | Expensive egress |
| **Vercel Blob** | $0.15/GB | Included | Simple but pricier |

### Implementation

```typescript
// Image optimization with Cloudflare
<Image
  src="https://imagedelivery.net/ACCOUNT/IMAGE_ID/public"
  alt="Description"
  width={800}
  height={600}
/>
```

---

## 9. Email

### Decision: Resend

```yaml
transactional_email: Resend
marketing_email: ConvertKit (or Beehiiv)
```

### Why Resend

- Built by Vercel team
- Excellent deliverability
- Great DX (React Email)
- Generous free tier (3K emails/day)
- Affordable ($20/mo for 50K emails)

### Email Types

**Transactional (Resend):**
- Welcome emails
- Password reset
- Invoice receipts
- Account notifications

**Marketing (ConvertKit):**
- Newsletter
- Product updates
- Drip campaigns

---

## 10. Development Tools

### Code Quality

```yaml
linter: ESLint (Next.js config)
formatter: Prettier
 types: TypeScript (strict)
testing: Vitest + React Testing Library
e2e: Playwright (future)
```

### Git Workflow

```yaml
platform: GitHub
trunk: main
branching: Feature branches + PRs
ci: GitHub Actions → Vercel
```

### CI/CD Pipeline

```yaml
on: pull_request
jobs:
  quality:
    - Type check
    - Lint
    - Unit tests
  deploy:
    - Deploy to preview
    - Comment preview URL
```

---

## 📊 Cost Summary

### Monthly Costs (Estimated)

| Service | Free Tier | Growth (Month 6) | Scale (Month 12) |
|---------|-----------|------------------|------------------|
| **Vercel Pro** | $0 | $40 (2 seats) | $60 (3 seats) |
| **Sanity** | $0 | $99 | $199 |
| **Clerk** | $0 | $25 | $100 |
| **PostHog** | $0 | $0 | $50 |
| **Plausible** | $0 | $9 | $9 |
| **Stripe** | $0 | ~$50 (fees) | ~$200 (fees) |
| **Cloudflare R2** | $0 | $5 | $20 |
| **Cloudflare Images** | $0 | $5 | $20 |
| **Resend** | $0 | $0 | $20 |
| **ConvertKit** | $0 | $29 | $79 |
| **Total** | **$0** | **~$262/mo** | **~$757/mo** |

### One-Time Costs

| Item | Cost |
|------|------|
| Domain (pinkbeam.ai) | ~$50/year |
| Logo/assets (LUMEN) | $0 (AI-generated) |
| Stock photos (if needed) | ~$100 |
| **Total** | **~$150** |

---

## 🔄 Migration Paths

### If We Outgrow Current Stack

| Component | Current | Migration To | Trigger |
|-----------|---------|--------------|---------|
| **CMS** | Sanity | Contentful | Need enterprise features |
| **Auth** | Clerk | Auth0 | Enterprise SSO requirements |
| **Analytics** | PostHog | Amplitude | Need advanced cohort analysis |
| **Hosting** | Vercel | Cloudflare Pages | Need edge computing |
| **Database** | N/A (static) | PostgreSQL | Need user data persistence |

### Data Portability

- **CMS**: Export to JSON, import to new system
- **Auth**: Clerk supports user export
- **Analytics**: Event export available
- **Code**: Framework-agnostic business logic

---

## 🚀 Next Steps

1. ✅ **Tech Stack Decided** — This document
2. ⏳ **Initialize Repo** — ENG-FE creates Next.js project
3. ⏳ **Setup CI/CD** — GitHub Actions → Vercel
4. ⏳ **Create Accounts**:
   - [ ] Vercel (with Pro plan)
   - [ ] Sanity project
   - [ ] Clerk application
   - [ ] Stripe account
   - [ ] PostHog project
   - [ ] Cloudflare (R2, Images)
   - [ ] Resend

---

## ✅ Sign-Off

| Role | Name | Date | Status |
|------|------|------|--------|
| **Decided By** | CTO | 2026-02-07 | ✅ Approved |
| **Reviewed By** | FOUNDER (delegated) | 2026-02-07 | ✅ Approved |
| **Implementation** | ENG-FE | Pending | ⏳ Ready |

---

**Questions?** See individual sections for detailed rationale.

**Changes?** Document in Decisions log below.

---

## 📝 Change Log

| Date | Change | Reason |
|------|--------|--------|
| 2026-02-07 | Initial stack decided | Foundation for website build |

---

*Last updated: 2026-02-07 by CTO*
