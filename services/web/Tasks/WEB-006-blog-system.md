---
id: WEB-006
title: Build Blog & Content Marketing System
status: todo
priority: P1
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 16
actual_hours: 0
dependencies:
  - WEB-001
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - frontend
  - blog
  - content
  - seo
  - P1
---

# WEB-006: Build Blog & Content Marketing System

## 🎯 Objective
Create a fast, SEO-optimized blog system to drive organic traffic and establish Pink Beam as a thought leader in web design and SEO.

## 📖 Context
Content marketing is essential for SEO and lead generation. This blog system should be built for performance (static generation) while providing a great reading experience and easy content management.

**Content Strategy:**
- 2 posts per week target
- Mix of educational (how-to), thought leadership, and case studies
- SEO-optimized for long-tail keywords
- Evergreen content prioritized

---

## ✅ Definition of Done

### Phase 1: Content Strategy (CMO)
- [ ] `[C1]` Define content categories/tags
- [ ] `[C2]` Create editorial calendar template
- [ ] `[C3]` Write 10 seed articles
- [ ] `[C4]` Define SEO keyword targets per article
- [ ] `[C5]` Create content guidelines document

### Phase 2: Design (Design-Brand)
- [ ] `[D1]` Design blog index/listing page
- [ ] `[D2]` Design article detail page
- [ ] `[D3]` Design author bio component
- [ ] `[D4]` Design related articles section
- [ ] `[D5]` Design category/tag pages
- [ ] `[D6]` Design newsletter signup component

### Phase 3: Content Infrastructure (ENG-FE)
- [ ] `[I1]` Setup MDX support for articles
- [ ] `[I2]` Create article frontmatter schema
- [ ] `[I3]` Setup content directory structure
- [ ] `[I4]` Create image optimization pipeline
- [ ] `[I5]` Setup syntax highlighting for code

### Phase 4: Blog Components (ENG-FE)
- [ ] `[B1]` Create BlogCard component
- [ ] `[B2]` Create BlogGrid component
- [ ] `[B3]` Create ArticleHeader component
- [ ] `[B4]` Create ArticleContent component (MDX renderer)
- [ ] `[B5]` Create TableOfContents component
- [ ] `[B6]` Create AuthorBio component
- [ ] `[B7]` Create RelatedArticles component
- [ ] `[B8]` Create NewsletterSignup component
- [ ] `[B9]` Create ShareButtons component
- [ ] `[B10]` Create ReadingProgress component

### Phase 5: Pages (ENG-FE)
- [ ] `[P1]` Build /blog index page
- [ ] `[P2]` Build /blog/[slug] article page (SSG)
- [ ] `[P3]` Build /blog/category/[category] page
- [ ] `[P4]` Build /blog/tag/[tag] page
- [ ] `[P5]` Build /blog/author/[author] page
- [ ] `[P6]` Add pagination for index pages
- [ ] `[P7]` Add search functionality (client-side)

### Phase 6: SEO & Performance (ENG-FE)
- [ ] `[S1]` Generate dynamic meta tags per article
- [ ] `[S2]` Implement Article schema markup
- [ ] `[S3]` Generate Open Graph images dynamically
- [ ] `[S4]` Create RSS feed (/rss.xml)
- [ ] `[S5]` Optimize images (WebP, srcset)
- [ ] `[S6]` Implement reading time calculation
- [ ] `[S7]` Add canonical URLs
- [ ] `[S8]` Generate sitemap with blog posts

### Phase 7: Content Publishing (CMO)
- [ ] `[P1]` Publish 10 seed articles
- [ ] `[P2]` Add featured images for each
- [ ] `[P3]` Setup author profiles
- [ ] `[P4]` Add tags and categories
- [ ] `[P5]` Internal linking between articles

### Phase 8: Engagement Features (ENG-FE)
- [ ] `[E1]` Add newsletter signup form
- [ ] `[E2]` Integrate with ConvertKit/Beehiiv
- [ ] `[E3]` Add social share buttons
- [ ] `[E4]` Add "copy link" functionality

### Phase 9: QA (ENG-FE)
- [ ] `[Q1]` Test all article pages
- [ ] `[Q2]` Verify image loading
- [ ] `[Q3]` Test pagination
- [ ] `[Q4]` Test search functionality
- [ ] `[Q5]` Lighthouse audit
- [ ] `[Q6]` Mobile testing

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Create editorial calendar
- [ ] Write first 10 articles
- [ ] Design blog layouts
**Blockers:** None  
**Notes:** Using static generation (SSG) for fast loading and SEO. MDX allows rich content with React components.

---

## 🚧 Blockers

**Current blockers:**
- WEB-001 (design system)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Use MDX for content | Rich formatting, component embedding, developer-friendly |
| 2026-02-09| Static generation (SSG) | Fastest load times, best SEO, works without CMS |
| 2026-02-09 | Local content files initially | Simple, fast, git-tracked; migrate to CMS later if needed |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 1: Foundation
- **Depends on:** WEB-001 (design system)
- **Blocks:** None
- **Related:**
  - [[WEB-001-marketing-landing-page]] — Blog linked from main nav

---

## 📐 Technical Notes

### Content Structure
```
content/
├── blog/
│   ├── 2026-02-09-why-core-web-vitals-matter.mdx
│   ├── 2026-02-12-seo-checklist-2026.mdx
│   └── ...
├── authors/
│   └── authors.json
└── categories/
    └── categories.json
```

### Frontmatter Schema
```typescript
interface BlogPost {
  title: string;
  description: string;
  publishedAt: string;
  updatedAt?: string;
  author: string;
  category: string;
  tags: string[];
  featured: boolean;
  image: string;
  readingTime?: number;
  canonical?: string;
}
```

### Routes
```
/blog                        → Blog index (paginated)
/blog/[slug]                 → Individual article
/blog/category/[category]    → Category archive
/blog/tag/[tag]              → Tag archive
/blog/author/[author]        → Author archive
/rss.xml                     → RSS feed
```

### Performance Strategy
- Static generation at build time
- Incremental Static Regeneration (ISR) for updates
- Image optimization with next/image
- Code splitting per article

---

*Target: 2 posts/week after launch, building to 50+ articles by month 6*
