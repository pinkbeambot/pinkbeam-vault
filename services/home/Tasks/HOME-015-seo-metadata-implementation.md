---
id: HOME-015
title: SEO and Metadata Implementation
status: done
priority: P1
estimated_hours: 6
actual_hours: 4
assigned_to: ENG-FE
dependencies: [HOME-004]
created_date: 2026-02-09
completed_date: 2026-02-09
tags: [seo, metadata, marketing]
---

# HOME-015: SEO and Metadata Implementation

## Objective
Implement comprehensive SEO for the hub including meta tags, Open Graph, structured data, and sitemap generation.

## Context
The hub needs to rank for "AI employees," "web design agency," etc. Good SEO is critical for organic discovery.

## Definition of Done

### Phase 1: UI/Foundation ✅
- [x] Title templates for all pages - via createMetadata() helper
- [x] Meta descriptions - unique per service
- [x] Open Graph tags - full OG support with generated images
- [x] Twitter Card tags - summary_large_image cards
- [x] Canonical URLs - alternates.canonical on all pages
- [x] Structured data - JSON-LD for Organization, Service, WebPage, SoftwareApplication

### Phase 2: Backend/Integration ✅
- [x] Dynamic metadata per page - lib/metadata.ts with serviceMetadata
- [x] OG image generation - opengraph-image.tsx (edge runtime)
- [x] Sitemap.xml - app/sitemap.ts with all routes
- [x] Robots.txt - app/robots.ts blocking private routes

### Phase 3: Testing/QA ⏳
- [x] Build passes with no errors
- [ ] Social sharing previews correct - test after deploy
- [ ] Google Search Console verification - need to add site
- [ ] Structured data validates - test with Google's tool
- [ ] No duplicate content issues - canonicals set

## Implementation Details

### Files Created
- `lib/metadata.ts` - Centralized metadata configuration
- `app/opengraph-image.tsx` - Dynamic OG image generation
- `app/sitemap.ts` - Dynamic sitemap generation
- `app/robots.ts` - Robots.txt configuration
- `app/sign-in/layout.tsx` - Auth page metadata
- `app/sign-up/layout.tsx` - Auth page metadata

### Metadata System
```typescript
// Reusable metadata creator
export const createMetadata = ({ title, description, path, ... }) => Metadata

// Service-specific presets
export const serviceMetadata = {
  home: { title: "Pink Beam", path: "/" },
  agents: { title: "AI Employees", path: "/agents" },
  web: { title: "Web Services", path: "/web" },
  // ...
}

// JSON-LD generators
export const structuredData = {
  organization: () => {...},
  service: () => {...},
  webPage: () => {...},
  softwareApplication: () => {...},
}
```

### Open Graph Image
- Generated at build time using Next.js ImageResponse
- 1200x630px standard size
- Pink Beam branding with gradient background
- Shows service badges (Agents, Web, Labs, Solutions)

### Sitemap
Includes all public routes with priorities:
- `/` - priority 1.0 (daily)
- `/agents` - priority 0.9 (weekly)
- `/web`, `/labs`, `/solutions` - priority 0.8 (weekly)
- Employee pages - priority 0.6 (monthly)

### Robots.txt
- Allows all crawlers to index public pages
- Blocks dashboard routes, auth pages, API routes
- References sitemap.xml

## Work Log

### 2026-02-09
- Task created
- Built lib/metadata.ts with centralized config
- Created opengraph-image.tsx for OG images
- Added JSON-LD structured data to all pages
- Created sitemap.ts with all routes
- Created robots.ts with proper disallow rules
- Build successful

## Next Steps (Post-Deploy)
1. Test social sharing previews (Facebook, Twitter, LinkedIn)
2. Submit sitemap to Google Search Console
3. Validate structured data with Google's Rich Results Test
4. Set up Google Analytics (HOME-016)

## Related
- HOME-004: Hub homepage
- HOME-016: Analytics (next task)
