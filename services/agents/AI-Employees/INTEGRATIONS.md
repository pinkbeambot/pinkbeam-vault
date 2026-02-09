# 🔌 Integrations

**All external services required for AI Employee Platform**

---

## Core Infrastructure

### Supabase
**Purpose:** Database, auth, edge functions, storage
**Free Tier:** 500K edge function calls, 500MB database
**Paid Tier:** $25/mo
**Usage:** All data storage, serverless functions, authentication
**Status:** ✅ Active

---

## AI & ML

### OpenAI
**Purpose:** LLM for all text generation
**Models:** GPT-4o-mini (primary), GPT-4o (complex tasks)
**Free Tier:** $5 credit
**Cost:** ~$0.15/M tokens (mini), ~$5/M tokens (4o)
**Usage:** Briefs, emails, content, support responses
**Status:** ✅ Active

### OpenAI Embeddings
**Purpose:** Vector embeddings for semantic search
**Cost:** ~$0.02/M tokens
**Usage:** Knowledge base search, conversation memory
**Status:** ⏳ Phase 3

### DALL-E 3
**Purpose:** Image generation for Lumen
**Cost:** ~$0.04/image (1024x1024)
**Usage:** Social graphics, marketing assets
**Status:** ⏳ Phase 4

---

## Data & Scraping

### Jina AI Reader
**Purpose:** URL content extraction
**Free Tier:** 1M tokens/day
**Cost:** Free
**Usage:** Sarah's URL monitoring
**Status:** ✅ Active

### Firecrawl
**Purpose:** Advanced web scraping for JS-heavy sites
**Free Tier:** 100 pages
**Cost:** $0.005/page
**Usage:** Competitor websites, complex pages
**Status:** ⏳ Phase 2

### Apollo.io
**Purpose:** Prospecting database for Mike
**Free Tier:** 50 credits/month
**Cost:** $0.10/credit
**Usage:** Lead finding, contact enrichment
**Status:** ⏳ Phase 3

---

## Communication

### Resend
**Purpose:** Transactional email delivery
**Free Tier:** 3,000 emails/month
**Cost:** $0.0001/email after
**Usage:** Brief delivery, notifications, sequences
**Status:** ⏳ Phase 2

### SendGrid (Alternative)
**Purpose:** Email delivery
**Free Tier:** 100 emails/day
**Cost:** $14.95/mo for 50K
**Usage:** Backup email provider
**Status:** ⏳ On demand

### Slack API
**Purpose:** Bot integration for real-time chat
**Free Tier:** Unlimited
**Cost:** Free
**Usage:** Employee interactions, alerts, queries
**Status:** ⏳ Phase 6

---

## Content & Design

### WordPress API
**Purpose:** Blog publishing for Casey
**Free Tier:** N/A (self-hosted)
**Cost:** Free
**Usage:** Automated blog post publishing
**Status:** ⏳ Phase 4

### Buffer API
**Purpose:** Social media scheduling
**Free Tier:** 3 accounts
**Cost:** $5/mo per additional
**Usage:** Social content scheduling
**Status:** ⏳ Phase 4

### Figma API
**Purpose:** Design asset management for Lumen
**Free Tier:** Limited read access
**Cost:** $12/editor/mo
**Usage:** Template storage, asset library
**Status:** ⏳ Phase 5

---

## Video & Media

### Whisper API (OpenAI)
**Purpose:** Speech-to-text for captions
**Cost:** $0.006/minute
**Usage:** Video caption generation for Flux
**Status:** ⏳ Phase 5

### Runway ML
**Purpose:** AI video generation/editing
**Free Tier:** 125 credits
**Cost:** $12/mo for 625 credits
**Usage:** Video effects, editing for Flux
**Status:** ⏳ Phase 5

---

## Analytics & Monitoring

### PostHog
**Purpose:** Product analytics
**Free Tier:** 1M events/month
**Cost:** $0.00025/event
**Usage:** User behavior, feature adoption
**Status:** ⏳ Phase 3

### Sentry
**Purpose:** Error tracking
**Free Tier:** 5K errors/month
**Cost:** $26/mo for 50K
**Usage:** Error monitoring, debugging
**Status:** ⏳ Phase 2

---

## Calendar & Scheduling

### Google Calendar API
**Purpose:** Calendar integration for Mike
**Free Tier:** 1M requests/day
**Cost:** Free
**Usage:** Meeting booking, availability
**Status:** ⏳ Phase 6

### Cal.com (Alternative)
**Purpose:** Scheduling infrastructure
**Free Tier:** Unlimited bookings
**Cost:** Free (self-hosted) or $12/mo
**Usage:** Simplified scheduling
**Status:** ⏳ Phase 6

---

## Payment & Billing

### Stripe
**Purpose:** Payment processing
**Cost:** 2.9% + $0.30/transaction
**Usage:** Subscription billing
**Status:** ⏳ Phase 2

---

## Cost Summary

### Month 1-2 (MVP)
| Service | Cost |
|---------|------|
| Supabase | $0 |
| OpenAI | ~$50 |
| Jina AI | $0 |
| **Total** | **~$50/mo** |

### Month 3-5 (Growth)
| Service | Cost |
|---------|------|
| Supabase | $25 |
| OpenAI | ~$200 |
| Resend | $0 |
| Firecrawl | ~$50 |
| Apollo | ~$50 |
| **Total** | **~$325/mo** |

### Month 6-9 (Scale)
| Service | Cost |
|---------|------|
| Supabase | $25 |
| OpenAI | ~$1,000 |
| Resend | $50 |
| Firecrawl | $200 |
| Apollo | $200 |
| PostHog | $100 |
| Sentry | $26 |
| **Total** | **~$1,600/mo** |

---

## Integration Priority

### Must-Have (Month 1-2)
1. Supabase ✅
2. OpenAI ✅
3. Jina AI ✅

### Should-Have (Month 2-3)
4. Resend
5. Firecrawl
6. Stripe

### Nice-to-Have (Month 4+)
7. Apollo.io
8. Slack API
9. Google Calendar
10. DALL-E
11. Runway ML

---

*Last Updated: 2026-02-07*
