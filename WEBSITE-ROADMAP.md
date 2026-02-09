# 🌐 Pink Beam Website — Comprehensive Development Roadmap

**Vision:** A mature, conversion-optimized SaaS marketing site that fully showcases our AI Employee Platform. Not an MVP — a category-defining experience.

**Timeline:** 8-12 weeks  
**Team:** ENG-FE, ENG-BE, CMO, LUMEN, FLUX  
**Status:** 🟡 Planning

---

## 📊 PHASE 0: Foundation & Architecture (Week 1)

### 0.1 Technical Stack Decisions
- [ ] **Framework:** Next.js 14+ (App Router) vs Astro vs Remix
- [ ] **Styling:** Tailwind CSS + Radix UI primitives
- [ ] **Animation:** Framer Motion + GSAP for complex sequences
- [ ] **CMS:** Sanity vs Contentful vs Strapi (for blog/case studies)
- [ ] **Hosting:** Vercel (primary) + Cloudflare (CDN)
- [ ] **Analytics:** PostHog (product analytics) + Plausible (privacy)
- [ ] **Auth:** Auth0 vs Clerk vs NextAuth
- [ ] **Payments:** Stripe (embedded checkout)

**Assignee:** CTO + ENG-BE  
**Deliverable:** `TECH-STACK.md` with rationale

### 0.2 Design System Foundation
- [ ] **Color system:** Full palette (primary, secondary, semantic, dark mode)
- [ ] **Typography:** Font selection (Inter + display font), type scale
- [ ] **Spacing:** Grid system, spacing tokens
- [ ] **Components:** Button variants, cards, forms, modals, navigation
- [ ] **Animation standards:** Easing curves, durations, entrance patterns
- [ ] **Icon system:** Lucide + custom icons

**Assignee:** LUMEN (visual) + ENG-FE (implementation)  
**Deliverable:** Figma design system + Storybook

### 0.3 Content Architecture
- [ ] **Sitemap:** Complete page hierarchy
- [ ] **Content model:** CMS schemas for blog, case studies, employees
- [ ] **URL structure:** SEO-optimized routing
- [ ] **Metadata strategy:** Title/description templates, OG images

**Assignee:** CMO + ENG-FE  
**Deliverable:** `CONTENT-ARCHITECTURE.md`

### 0.4 Asset Pipeline Setup
- [ ] **Image optimization:** Next.js Image + Cloudflare Images
- [ ] **Video hosting:** Cloudflare Stream vs Mux vs self-hosted
- [ ] **Asset CDN:** Cloudflare R2 for static assets
- [ ] **Build pipeline:** CI/CD (GitHub Actions → Vercel)

**Assignee:** ENG-BE  
**Deliverable:** Working dev environment

---

## 🎨 PHASE 1: Brand & Visual Assets (Week 1-2)

### 1.1 Brand Identity Finalization
- [ ] **Logo system:**
  - [ ] Primary horizontal lockup
  - [ ] Stacked/square version
  - [ ] Icon-only mark
  - [ ] Monochrome versions
  - [ ] Favicon set (16px to 512px)
- [ ] **Logo animations:** SVG morphing for loading states
- [ ] **Brand patterns:** Background textures, grid overlays
- [ ] **Social media kit:** Profile pics, banners, templates

**Assignee:** LUMEN  
**Deliverable:** `~/pinkbeam/Assets/Brand/` complete kit

### 1.2 Marketing Illustrations
- [ ] **Hero illustration:** Cosmic AI workforce scene
- [ ] **Employee avatars:** Abstract representations (6 employees)
- [ ] **Feature spotlights:** 12 feature illustrations
- [ ] **Empty states:** Friendly illustrations for dashboard
- [ ] **Error pages:** 404, 500 with brand character
- [ ] **Blog post headers:** 10 template illustrations

**Assignee:** LUMEN  
**Deliverable:** `/public/illustrations/` (SVG + PNG)

### 1.3 Iconography & Graphics
- [ ] **Custom icon set:** 100+ icons for product features
- [ ] **Integration logos:** Slack, Notion, HubSpot, etc. (partner logos)
- [ ] **Diagram graphics:** System architecture, workflow visuals
- [ ] **Badge collection:** Security badges, feature tags

**Assignee:** LUMEN  
**Deliverable:** `/public/icons/` + component library

### 1.4 Video Assets (FLUX)
- [ ] **Hero explainer video** (90 seconds)
  - [ ] Script (CMO)
  - [ ] Storyboard (FLUX)
  - [ ] Voiceover recording (ElevenLabs)
  - [ ] Motion graphics + screen recordings
  - [ ] Music + sound design
  - [ ] Final edit + color grade
- [ ] **Product demo videos** (one per employee, 60 sec each)
  - [ ] Researcher (Sarah) demo
  - [ ] SDR (Mike) demo
  - [ ] Support (Alex) demo
  - [ ] Content (Casey) demo
- [ ] **Social cuts:** 15-30 sec vertical videos (6 pieces)
- [ ] **Background loops:** Subtle motion for hero sections

**Assignee:** FLUX  
**Deliverable:** `/public/videos/` (multiple formats)

---

## 🏗️ PHASE 2: Core Pages — Structure & Content (Week 2-4)

### 2.1 Global Components
- [ ] **Navigation:**
  - [ ] Desktop mega-menu with product dropdown
  - [ ] Mobile hamburger with sheet overlay
  - [ ] Sticky nav with scroll behavior
  - [ ] CTA buttons (Sign up, Login)
- [ ] **Footer:**
  - [ ] 4-column layout (Product, Resources, Company, Legal)
  - [ ] Newsletter signup
  - [ ] Social links
  - [ ] Status page link
- [ ] **Announcement bar:** Dismissible top banner
- [ ] **Cookie consent:** GDPR-compliant banner

**Assignee:** ENG-FE  
**Deliverable:** Layout components in Storybook

### 2.2 Homepage (`/`)
- [ ] **Hero Section:**
  - [ ] Headline + subheadline (CMO copy)
  - [ ] Primary CTA (Start free trial)
  - [ ] Secondary CTA (Watch demo)
  - [ ] Hero video/animation background
  - [ ] Social proof bar (logos)
  - [ ] Scroll indicator
- [ ] **Problem Section:**
  - [ ] Pain point headline
  - [ ] 3 pain point cards with icons
  - [ ] Statistics/data points
- [ ] **Solution Overview:**
  - [ ] "Meet your AI workforce" headline
  - [ ] Employee grid (6 employees)
  - [ ] Hover interactions showing capabilities
- [ ] **How It Works:**
  - [ ] 3-step process (visual timeline)
  - [ ] Interactive demo preview
- [ ] **Employee Deep-Dive:**
  - [ ] Tabbed interface (Researcher, SDR, Support, Content)
  - [ ] Feature lists per employee
  - [ ] Sample output previews
- [ ] **Use Cases:**
  - [ ] Industry verticals (Startup, Agency, Enterprise)
  - [ ] Role-based (Founder, Sales, Ops, Marketing)
  - [ ] Case study teasers
- [ ] **Integrations:**
  - [ ] Logo cloud (animated)
  - [ ] "Works with your stack" messaging
- [ ] **Security & Trust:**
  - [ ] Compliance badges (SOC 2, GDPR)
  - [ ] Security features list
  - [ ] Data handling diagram
- [ ] **Testimonials:**
  - [ ] Carousel/slider
  - [ ] Video testimonials (if available)
  - [ ] Company logos
- [ ] **FAQ Accordion:**
  - [ ] 8-10 common questions
  - [ ] Expandable answers
- [ ] **Final CTA:**
  - [ ] Big bold headline
  - [ ] Email capture form
  - [ ] Trust badges

**Assignee:** ENG-FE (build) + CMO (copy)  
**Deliverable:** Fully functional homepage

### 2.3 Product Pages

#### 2.3.1 Researcher Employee (`/employees/researcher`)
- [ ] Hero with employee avatar
- [ ] Job description & capabilities
- [ ] Sample brief output (interactive)
- [ ] Source integrations showcase
- [ ] Pricing card (embedded)
- [ ] Demo video embed
- [ ] Testimonials specific to research use case
- [ ] FAQ
- [ ] CTA to configure

#### 2.3.2 SDR Employee (`/employees/sdr`)
- [ ] Similar structure, sales-focused
- [ ] Sample outreach sequence preview
- [ ] ROI calculator
- [ ] Integration with CRMs

#### 2.3.3 Support Employee (`/employees/support`)
- [ ] Ticket resolution preview
- [ ] Knowledge base integration
- [ ] Multichannel support showcase

#### 2.3.4 Content Employee (`/employees/content`)
- [ ] Content repurposing examples
- [ ] Before/after comparisons
- [ ] Platform-specific previews

#### 2.3.5 Creative Employees (LUMEN + FLUX) — Premium Tier
- [ ] `/employees/design` — Brand assets, illustrations
- [ ] `/employees/video` — Motion graphics, video production

**Assignee:** ENG-FE + CMO  
**Deliverable:** 6 employee product pages

### 2.4 Pricing Page (`/pricing`)
- [ ] **Pricing toggle:** Monthly/Annual (show savings)
- [ ] **3 Tiers:**
  - [ ] Starter (1 employee, $500/mo)
  - [ ] Growth (3 employees, $1,200/mo)
  - [ ] Scale (Unlimited, custom pricing)
- [ ] **Feature comparison table:**
  - [ ] All features listed
  - [ ] Checkmarks per tier
  - [ ] Sticky header on scroll
- [ ] **Add-ons:**
  - [ ] Extra sources
  - [ ] Priority support
  - [ ] Custom training
- [ ] **Enterprise CTA:**
  - [ ] Contact sales form
  - [ ] "Custom deployment" messaging
- [ ] **FAQ:** Pricing-specific questions
- [ ] **Money-back guarantee:** Trust signal

**Assignee:** ENG-FE + CMO  
**Deliverable:** Pricing page with Stripe integration

### 2.5 About/Company Pages
- [ ] **About Us (`/about`):**
  - [ ] Mission statement
  - [ ] Company story
  - [ ] Team section (AI employees as team!)
  - [ ] Office/remote culture
  - [ ] Values
- [ ] **Careers (`/careers`):**
  - [ ] Open positions (if hiring humans)
  - [ ] Culture highlights
  - [ ] Benefits
- [ ] **Contact (`/contact`):**
  - [ ] Contact form
  - [ ] Support email
  - [ ] Sales email
  - [ ] Office address (if applicable)

**Assignee:** CMO (copy) + ENG-FE (build)  
**Deliverable:** Static pages

---

## 🔧 PHASE 3: Interactive Features (Week 4-6)

### 3.1 Interactive Demo Environment
- [ ] **Demo modal/lightbox:**
  - [ ] Sample researcher brief (real data)
  - [ ] Interactive elements (expand sections)
  - [ ] "Configure your own" CTA
- [ ] **Live playground:**
  - [ ] Input: Competitors, focus areas
  - [ ] Output: Generated sample brief
  - [ ] Rate limit: 1 per email

**Assignee:** ENG-BE + ENG-FE  
**Deliverable:** Working demo experience

### 3.2 ROI Calculator
- [ ] **Input form:**
  - [ ] Current team size
  - [ ] Average salary per role
  - [ ] Tasks per week (research, outreach, support)
- [ ] **Calculation logic:**
  - [ ] Cost comparison (human vs AI)
  - [ ] Time savings
  - [ ] Annual savings
- [ ] **Visual output:**
  - [ ] Animated numbers
  - [ ] Bar charts
  - [ ] Share results button

**Assignee:** ENG-FE  
**Deliverable:** Interactive calculator component

### 3.3 Employee Configurator
- [ ] **Step-by-step wizard:**
  - [ ] Step 1: Select employee type
  - [ ] Step 2: Configure (name, sources, competitors)
  - [ ] Step 3: Delivery preferences
  - [ ] Step 4: Review & pricing
- [ ] **Live preview:**
  - [ ] Show configured employee
  - [ ] Sample output based on config
- [ ] **CTA to signup:** Pass config to registration

**Assignee:** ENG-FE + ENG-BE  
**Deliverable:** Configurator flow

### 3.4 Chat Widget (Dogfooding)
- [ ] **Embed Support Employee:**
  - [ ] Chat bubble (bottom right)
  - [ ] Welcome message
  - [ ] FAQ suggestions
  - [ ] Live handoff to human
- [ ] **Styling:** On-brand, customizable position

**Assignee:** ENG-BE + ENG-FE  
**Deliverable:** Working chat widget

### 3.5 Testimonial Engine
- [ ] **Video testimonials:**
  - [ ] Lightbox player
  - [ ] Transcript below
- [ ] **Written testimonials:**
  - [ ] Carousel with auto-advance
  - [ ] Company logos
  - [ ] Verified badges

**Assignee:** ENG-FE  
**Deliverable:** Testimonial components

---

## 📝 PHASE 4: Content & Resources (Week 5-7)

### 4.1 Blog System (`/blog`)
- [ ] **Blog index:**
  - [ ] Featured post (large)
  - [ ] Post grid (filterable by category)
  - [ ] Search functionality
  - [ ] Category sidebar
  - [ ] Newsletter signup
- [ ] **Blog post template:**
  - [ ] Rich text rendering
  - [ ] Code blocks with syntax highlighting
  - [ ] Images with captions
  - [ ] Author bio (AI employee as author!)
  - [ ] Related posts
  - [ ] Social sharing
  - [ ] Comments (optional)
- [ ] **Categories:**
  - [ ] Product updates
  - [ ] AI industry insights
  - [ ] Customer stories
  - [ ] Engineering
  - [ ] Operations

**Assignee:** ENG-FE (CMS integration) + Content Employee (posts)  
**Deliverable:** 10 launch posts + working blog

### 4.2 Case Studies (`/case-studies`)
- [ ] **Case study index:**
  - [ ] Filter by industry
  - [ ] Filter by use case
  - [ ] Results metrics
- [ ] **Case study template:**
  - [ ] Client intro
  - [ ] Challenge
  - [ ] Solution (our employee)
  - [ ] Results (metrics)
  - [ ] Quote
  - [ ] Next steps

**Assignee:** CMO + ENG-FE  
**Deliverable:** 3-5 detailed case studies

### 4.3 Resource Library (`/resources`)
- [ ] **Templates:**
  - [ ] Email templates
  - [ ] Brief templates
  - [ ] Checklists
- [ ] **Guides:**
  - [ ] Getting started
  - [ ] Best practices
  - [ ] ROI measurement
- [ ] **Webinars:**
  - [ ] Recorded sessions
  - [ ] Registration for upcoming

**Assignee:** CMO  
**Deliverable:** Resource hub with 10+ assets

### 4.4 Documentation (`/docs`)
- [ ] **Help Center:**
  - [ ] Search-first interface
  - [ ] Category navigation
  - [ ] Quick start guide
  - [ ] FAQ database
- [ ] **API Documentation:**
  - [ ] Interactive API reference
  - [ ] Code examples
  - [ ] Authentication guide
- [ ] **Integration guides:**
  - [ ] Slack setup
  - [ ] HubSpot setup
  - [ ] Notion setup

**Assignee:** ENG-BE + CMO  
**Deliverable:** Full docs site

---

## 🛠️ PHASE 5: Backend & Integrations (Week 6-8)

### 5.1 Authentication System
- [ ] **Sign up:**
  - [ ] Email + password
  - [ ] Google OAuth
  - [ ] GitHub OAuth
  - [ ] Magic link option
- [ ] **Login:**
  - [ ] All auth methods
  - [ ] Forgot password flow
  - [ ] Session management
- [ ] **Dashboard redirect:** Post-auth routing

**Assignee:** ENG-BE  
**Deliverable:** Working auth system

### 5.2 Payment Integration (Stripe)
- [ ] **Checkout:**
  - [ ] Embedded checkout
  - [ ] Plan selection
  - [ ] Add-on selection
  - [ ] Promo code support
- [ ] **Customer portal:**
  - [ ] Manage subscription
  - [ ] Update payment method
  - [ ] View invoices
  - [ ] Cancel/pause
- [ ] **Webhooks:**
  - [ ] Subscription events
  - [ ] Payment failures
  - [ ] Invoice generation

**Assignee:** ENG-BE  
**Deliverable:** Full Stripe integration

### 5.3 Email System
- [ ] **Transactional:**
  - [ ] Welcome email
  - [ ] Verification email
  - [ ] Password reset
  - [ ] Invoice receipts
  - [ ] Usage alerts
- [ ] **Marketing:**
  - [ ] Newsletter (weekly)
  - [ ] Product updates
  - [ ] Onboarding sequence
- [ ] **Provider:** Resend vs SendGrid vs Postmark

**Assignee:** ENG-BE + CMO  
**Deliverable:** Email templates + automation

### 5.4 Analytics & Tracking
- [ ] **Product analytics:**
  - [ ] PostHog event tracking
  - [ ] Funnel analysis
  - [ ] Session recordings (sample)
- [ ] **Marketing analytics:**
  - [ ] UTM tracking
  - [ ] Channel attribution
  - [ ] Conversion tracking
- [ ] **Privacy:**
  - [ ] GDPR-compliant
  - [ ] No third-party cookies option
  - [ ] Data retention policies

**Assignee:** ENG-BE + CMO  
**Deliverable:** Analytics dashboard

### 5.5 CRM Integration
- [ ] **HubSpot:**
  - [ ] Form submissions → contacts
  - [ ] Lead scoring
  - [ ] Deal pipeline
- [ ] **Salesforce:** (Enterprise)
  - [ ] Contact sync
  - [ ] Opportunity creation

**Assignee:** ENG-BE  
**Deliverable:** CRM connections

---

## ⚡ PHASE 6: Performance & Polish (Week 8-10)

### 6.1 Performance Optimization
- [ ] **Core Web Vitals:**
  - [ ] LCP < 2.5s
  - [ ] FID < 100ms
  - [ ] CLS < 0.1
- [ ] **Image optimization:**
  - [ ] WebP/AVIF formats
  - [ ] Lazy loading
  - [ ] Responsive images
  - [ ] Blur placeholders
- [ ] **Code splitting:**
  - [ ] Route-based splitting
  - [ ] Component lazy loading
- [ ] **Caching:**
  - [ ] Edge caching (Cloudflare)
  - [ ] Stale-while-revalidate
  - [ ] Cache headers

**Assignee:** ENG-FE + ENG-BE  
**Deliverable:** Lighthouse 90+ score

### 6.2 SEO & Metadata
- [ ] **Technical SEO:**
  - [ ] XML sitemap
  - [ ] Robots.txt
  - [ ] Canonical URLs
  - [ ] Structured data (JSON-LD)
  - [ ] Breadcrumbs
- [ ] **On-page SEO:**
  - [ ] Title/descriptions on all pages
  - [ ] Header hierarchy
  - [ ] Internal linking
  - [ ] Image alt texts
- [ ] **Social cards:**
  - [ ] Open Graph images (dynamic)
  - [ ] Twitter cards
  - [ ] LinkedIn sharing

**Assignee:** ENG-FE + CMO  
**Deliverable:** SEO audit pass

### 6.3 Accessibility (WCAG 2.1 AA)
- [ ] **Keyboard navigation:** Full site operable
- [ ] **Screen reader support:** ARIA labels, alt text
- [ ] **Color contrast:** 4.5:1 minimum
- [ ] **Focus indicators:** Visible focus states
- [ ] **Reduced motion:** Respect `prefers-reduced-motion`
- [ ] **Form labels:** All inputs labeled

**Assignee:** ENG-FE  
**Deliverable:** Accessibility audit pass

### 6.4 Dark Mode
- [ ] **System preference detection:** Auto-switch
- [ ] **Manual toggle:** Navbar button
- [ ] **Persistent preference:** LocalStorage
- [ ] **All components:** Dark variants

**Assignee:** ENG-FE  
**Deliverable:** Full dark mode support

### 6.5 Mobile Responsiveness
- [ ] **Breakpoints:**
  - [ ] Mobile (< 640px)
  - [ ] Tablet (640-1024px)
  - [ ] Desktop (> 1024px)
  - [ ] Wide (> 1440px)
- [ ] **Touch interactions:** Optimized for touch
- [ ] **Mobile navigation:** Hamburger + sheet
- [ ] **Typography scaling:** Readable on all sizes

**Assignee:** ENG-FE  
**Deliverable:** Device testing pass

### 6.6 Error Handling
- [ ] **404 page:** On-brand, helpful links
- [ ] **500 page:** Error reporting, recovery options
- [ ] **Form validation:** Inline errors, clear messaging
- [ ] **Loading states:** Skeletons, spinners
- [ ] **Empty states:** Helpful illustrations

**Assignee:** ENG-FE  
**Deliverable:** Error scenarios covered

---

## 🚀 PHASE 7: Pre-Launch & QA (Week 10-11)

### 7.1 Content Review
- [ ] **Copy editing:** All text reviewed
- [ ] **Legal review:** Terms, privacy policy
- [ ] **Image rights:** All assets licensed/owned
- [ ] **Video captions:** Subtitles for all videos
- [ ] **Link checking:** No broken links

**Assignee:** CMO + FOUNDER  
**Deliverable:** Content sign-off

### 7.2 QA Testing
- [ ] **Cross-browser:** Chrome, Safari, Firefox, Edge
- [ ] **Cross-device:** iOS, Android, desktop
- [ ] **User flows:**
  - [ ] Sign up → Onboarding → First brief
  - [ ] Pricing → Checkout → Payment
  - [ ] Demo → Sign up → Dashboard
- [ ] **Edge cases:**
  - [ ] Slow connection
  - [ ] JavaScript disabled
  - [ ] Ad blockers
- [ ] **Security:**
  - [ ] XSS prevention
  - [ ] CSRF tokens
  - [ ] Input sanitization

**Assignee:** ENG-FE + ENG-BE  
**Deliverable:** QA sign-off

### 7.3 Launch Preparation
- [ ] **Domain:** DNS configured
- [ ] **SSL:** HTTPS enforced
- [ ] **Monitoring:** Uptime alerts (BetterUptime)
- [ ] **Analytics:** Events verified
- [ ] **Backups:** Database + assets
- [ ] **Rollback plan:** If issues arise

**Assignee:** ENG-BE  
**Deliverable:** Launch-ready infrastructure

---

## 🎉 PHASE 8: Launch & Post-Launch (Week 12+)

### 8.1 Launch Day
- [ ] **Deploy:** Production release
- [ ] **Smoke tests:** Critical paths
- [ ] **Monitoring:** Real-time alerts
- [ ] **Announcements:**
  - [ ] Product Hunt launch
  - [ ] Twitter announcement
  - [ ] LinkedIn post
  - [ ] Email to waitlist

**Assignee:** CEO + CMO  
**Deliverable:** Live website

### 8.2 Post-Launch Iteration
- [ ] **Analytics review:** Heatmaps, funnels
- [ ] **User feedback:** Survey, interviews
- [ ] **A/B tests:** Headlines, CTAs, pricing
- [ ] **Bug fixes:** Priority issues
- [ ] **Content additions:** Blog posts, case studies

**Assignee:** Full team  
**Deliverable:** Continuous improvement

---

## 📋 Asset Inventory

### Visual Assets (LUMEN)
| Asset | Quantity | Format |
|-------|----------|--------|
| Logo variations | 6 | SVG, PNG |
| Hero illustrations | 3 | SVG, PNG, WebP |
| Employee avatars | 6 | SVG, PNG |
| Feature illustrations | 12 | SVG, PNG |
| Icons | 100+ | SVG (component) |
| Blog headers | 10 | PNG, WebP |
| Social graphics | 20 | PNG |
| OG images | 20 | PNG |

### Video Assets (FLUX)
| Asset | Duration | Format |
|-------|----------|--------|
| Hero explainer | 90s | MP4, WebM |
| Product demos | 4 x 60s | MP4, WebM |
| Social cuts | 6 x 15-30s | MP4 (vertical) |
| Background loops | 3 x 30s | MP4 (muted) |

### Copy Assets (CMO)
| Asset | Pages | Word Count |
|-------|-------|------------|
| Homepage copy | 1 | 2,000 |
| Product pages | 6 | 6,000 |
| Pricing page | 1 | 800 |
| About pages | 3 | 2,000 |
| Blog posts | 10 | 15,000 |
| Case studies | 5 | 7,500 |
| Docs | 20 | 10,000 |
| Emails | 10 | 3,000 |
| **Total** | | **~46,300** |

---

## 📊 Success Metrics

### Launch Metrics
| Metric | Target |
|--------|--------|
| Lighthouse Score | > 90 |
| Page Load (LCP) | < 2.5s |
| Mobile Responsiveness | 100% |
| Accessibility (WCAG) | AA compliant |
| SEO Score | > 90 |

### Business Metrics
| Metric | Target (Month 1) |
|--------|------------------|
| Unique Visitors | 10,000 |
| Signups | 500 |
| Demo Requests | 200 |
| Paid Conversions | 50 |
| Bounce Rate | < 40% |
| Time on Site | > 3 min |

---

## 🎯 Immediate Next Steps (This Week)

1. **CTO + ENG-BE:** Finalize tech stack → `TECH-STACK.md`
2. **LUMEN:** Generate first logo concepts (3 directions)
3. **CMO:** Write homepage hero copy (3 variations)
4. **FLUX:** Draft explainer video script
5. **ENG-FE:** Set up project repo + design system scaffold

---

*Comprehensive? Yes. Overwhelming? Only if we don't execute. Let's ship.*
