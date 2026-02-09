# Pink Beam — Home/Hub Service

**Service:** Pink Beam Platform Hub  
**Purpose:** Unified entry point and service discovery for all Pink Beam offerings  
**Last Updated:** 2026-02-09

---

## 🎯 Overview

The Home/Hub service is the central entry point for the Pink Beam platform. It serves as:

1. **Brand Hub** — Establishes Pink Beam as a unified platform
2. **Service Discovery** — Helps visitors find the right service (Agents, Web, Labs, Solutions)
3. **Shared Infrastructure** — Provides authentication, navigation, and design system
4. **Cross-Sell Engine** — Surfaces relevant services to existing customers

Unlike the sub-services (Agents, Web, Labs, Solutions) which each feel like their own websites, the Home service ties them together into a cohesive platform experience.

---

## 🏗️ Platform Architecture

```
pinkbeam.io/
├── /                    ← Hub homepage (service selector)
├── /sign-in             ← Shared auth
├── /sign-up             ← Shared auth
├── /dashboard           ← Service-aware dashboard redirect
│
├── /agents/*            ← AI Employees service (isolated layout)
├── /web/*               ← Web agency service (isolated layout)
├── /labs/*              ← Software dev service (isolated layout)
└── /solutions/*         ← Consulting service (isolated layout)
```

Each service path has its own:
- Layout (navbar, footer)
- Navigation branding ("Agents", "Web", etc.)
- Service-specific content
- Shared auth state

---

## 🎨 Design Philosophy

### Unified But Distinct

**Shared elements:**
- Color system (Pink #FF006E on Void #0A0A0F)
- Typography (Space Grotesk, Inter, JetBrains Mono)
- Component library (shadcn/ui)
- Auth flows (/sign-in, /sign-up)
- Session management

**Service-specific:**
- Navigation (each service has its own navbar)
- Footer links
- Hero messaging
- CTA buttons

---

## 📊 Competitive Analysis

| Platform | Approach | What We Learn |
|----------|----------|---------------|
| **Vercel** | Clean hub, product-specific sub-paths | Simple navigation between products |
| **Stripe** | Unified nav, product landing pages | Consistent brand, distinct offerings |
| **Notion** | Single product, feature-focused | Not applicable (we're multi-service) |
| **Linear** | Single product, deep focus | Not applicable |
| **Webflow** | Product tabs in nav | Good for 3-4 products, gets crowded |
| **Shopify** | Solutions dropdown | Scales well for many offerings |

**Our approach:** Shopify-style solutions dropdown with clear service cards on homepage.

---

## 🎯 Target Audiences

### Primary: First-Time Visitors
- Don't know which service they need
- Need clear differentiation between offerings
- Want to understand "what is Pink Beam?"

### Secondary: Existing Customers
- Already using one service
- Might be interested in others
- Need easy navigation between services

### Tertiary: Partners/Investors
- Understanding the full platform
- Evaluating business model
- Looking for growth opportunities

---

## 💰 Revenue Model

The Hub itself doesn't generate direct revenue—it's a funnel to the four monetized services:

| Service | Model | Price Range |
|---------|-------|-------------|
| Agents | SaaS subscription | $400-600/employee/month |
| Web | Retainer + project | $500-5000/month |
| Labs | Time & materials | $150-250/hour |
| Solutions | Project-based | $5K-50K engagements |

---

## 🚀 Key Success Metrics

1. **Service Selection Rate** — % of visitors who click into a service
2. **Cross-Service Discovery** — % of users who visit multiple service pages
3. **Conversion to Signup** — % who create accounts
4. **Time to Value** — Time from landing to first service interaction

---

## 📋 Development Priorities

1. **MVP:** Basic hub with service cards, shared auth
2. **V1:** Polished animations, service detail pages
3. **V2:** Personalized recommendations, cross-sell features
4. **V3:** Platform dashboard, unified billing

---

*Part of the Pink Beam Platform Documentation*
