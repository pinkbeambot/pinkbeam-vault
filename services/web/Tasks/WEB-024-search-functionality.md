---
id: WEB-024
title: Build Search Functionality Across Platform
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
estimated_hours: 10
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
  - WEB-011
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - search
  - algolia
  - meilisearch
  - P2
---

# WEB-024: Build Search Functionality Across Platform

## 🎯 Objective
Implement comprehensive search functionality across the platform, enabling users to quickly find projects, clients, files, and content with fast, relevant results.

## 📖 Context
As the platform grows, finding information quickly becomes critical. A good search experience saves time and reduces frustration for both clients and internal teams.

**Search Scopes:**
- Global search (across all entities)
- Contextual search (within projects, clients, etc.)
- Content search (blog, documentation)

---

## ✅ Definition of Done

### Phase 1: Search Infrastructure (ENG-BE)
- [ ] `[I1]` Evaluate search options (Algolia vs Meilisearch)
- [ ] `[I2]` Setup search provider
- [ ] `[I3]` Configure index settings
- [ ] `[I4]` Setup search API keys
- [ ] `[I5]` Create search indexing service

### Phase 2: Index Configuration (ENG-BE)
- [ ] `[IC1]` Create projects index
- [ ] `[IC2]` Create clients index
- [ ] `[IC3]` Create files index
- [ ] `[IC4]` Create users index
- [ ] `[IC5]` Create content index (blog)
- [ ] `[IC6]` Configure searchable attributes
- [ ] `[IC7]` Configure ranking/faceting

### Phase 3: Indexing Pipeline (ENG-BE)
- [ ] `[IP1]` Index existing projects
- [ ] `[IP2]` Index existing clients
- [ ] `[IP3]` Index existing files
- [ ] `[IP4]` Setup real-time indexing hooks
- [ ] `[IP5]` Handle index updates on changes
- [ ] `[IP6]` Add index rebuild capability

### Phase 4: Search API (ENG-BE)
- [ ] `[API1]` GET /api/search — Global search
- [ ] `[API2]` Add search query parameter
- [ ] `[API3]` Add filters (entity type, date, etc.)
- [ ] `[API4]` Add pagination
- [ ] `[API5]` Add highlighting
- [ ] `[API6]` Implement search suggestions

### Phase 5: Global Search UI (ENG-FE)
- [ ] `[UI1]` Create search input (cmd+k shortcut)
- [ ] `[UI2]` Build search modal/dropdown
- [ ] `[UI3]` Show results by category
- [ ] `[UI4]` Add result previews
- [ ] `[UI5]` Implement keyboard navigation
- [ ] `[UI6]` Add recent searches
- [ ] `[UI7]` Add search history

### Phase 6: Contextual Search (ENG-FE)
- [ ] `[CS1]` Add project search in admin
- [ ] `[CS2]` Add client search in admin
- [ ] `[CS3]` Add file search in projects
- [ ] `[CS4]` Add user search in team
- [ ] `[CS5]` Add content search in blog

### Phase 7: Advanced Features (ENG-FE)
- [ ] `[AF1]` Add search filters UI
- [ ] `[AF2]` Implement faceted search
- [ ] `[AF3]` Add sorting options
- [ ] `[AF4]` Create saved searches
- [ ] `[AF5]` Add search analytics

### Phase 8: Mobile Search (ENG-FE)
- [ ] `[M1]` Optimize search for mobile
- [ ] `[M2]` Add mobile search icon
- [ ] `[M3]` Implement mobile search overlay
- [ ] `[M4]` Test touch interactions

### Phase 9: Testing (ENG-BE + ENG-FE)
- [ ] `[T1]` Test search relevance
- [ ] `[T2]` Test search performance
- [ ] `[T3]` Test filtering
- [ ] `[T4]` Test mobile search
- [ ] `[T5]` Load test search API

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Evaluate Algolia vs Meilisearch
- [ ] Test search providers
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)
- WEB-011 (API)  
**Notes:** Meilisearch is cheaper for self-hosting; Algolia has better managed service.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)
- WEB-011 (Core REST API)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Meilisearch (tentative) | Open source, can self-host, good relevance |
| 2026-02-09 | Real-time indexing | Changes should reflect in search immediately |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 6: Automation
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
  - WEB-011 (API)
- **Blocks:** None
- **Related:**
  - [[WEB-010-admin-dashboard]] — Search used heavily here

---

## 📐 Technical Notes

### Meilisearch Setup
```typescript
// lib/meilisearch.ts
import { MeiliSearch } from 'meilisearch';

export const meilisearch = new MeiliSearch({
  host: process.env.MEILISEARCH_HOST!,
  apiKey: process.env.MEILISEARCH_API_KEY
});

// Indexes
export const indexes = {
  projects: meilisearch.index('projects'),
  clients: meilisearch.index('clients'),
  files: meilisearch.index('files'),
  users: meilisearch.index('users'),
  content: meilisearch.index('content')
};
```

### Indexing Documents
```typescript
// After project creation
await indexes.projects.addDocuments([{
  id: project.id,
  name: project.name,
  description: project.description,
  clientName: project.client.companyName,
  status: project.status,
  createdAt: project.createdAt
}]);
```

### Search Component
```typescript
// components/search/GlobalSearch.tsx
export function GlobalSearch() {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<SearchResults>();
  
  useEffect(() => {
    const search = async () => {
      const res = await fetch(`/api/search?q=${encodeURIComponent(query)}`);
      const data = await res.json();
      setResults(data);
    };
    
    if (query.length > 2) {
      const timer = setTimeout(search, 300);
      return () => clearTimeout(timer);
    }
  }, [query]);
  
  // Render search UI...
}
```

### Keyboard Shortcut
```typescript
// hooks/useCommandK.ts
useEffect(() => {
  const handleKeyDown = (e: KeyboardEvent) => {
    if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
      e.preventDefault();
      openSearch();
    }
  };
  
  window.addEventListener('keydown', handleKeyDown);
  return () => window.removeEventListener('keydown', handleKeyDown);
}, []);
```

---

*Search should be fast (< 100ms) and relevant*
