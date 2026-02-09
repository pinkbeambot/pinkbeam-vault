---
id: WEB-007
title: Initialize Database & Backend Infrastructure
status: todo
priority: P0
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/CTO/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 12
actual_hours: 0
dependencies: []
blocks:
  - WEB-008
  - WEB-009
  - WEB-010
  - WEB-011
  - WEB-012
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - database
  - infrastructure
  - P0
---

# WEB-007: Initialize Database & Backend Infrastructure

## 🎯 Objective
Set up the foundational backend infrastructure including PostgreSQL database, Prisma ORM, and basic API structure. This is the foundation for all client portal functionality.

## 📖 Context
While the marketing site can run without a backend, the client portal and admin dashboard require a robust database and API. This task establishes the core infrastructure that all subsequent backend tasks will build upon.

**Key Decisions:**
- PostgreSQL via Supabase (managed, scalable)
- Prisma ORM (type-safe, excellent DX)
- Next.js API routes (same codebase as frontend)

---

## ✅ Definition of Done

### Phase 1: Database Setup (ENG-BE)
- [ ] `[D1]` Create Supabase project
- [ ] `[D2]` Configure database regions/settings
- [ ] `[D3]` Setup connection pooling (PgBouncer)
- [ ] `[D4]` Create initial database
- [ ] `[D5]` Configure backup policies
- [ ] `[D6]` Setup monitoring alerts

### Phase 2: Schema Design & Migration (ENG-BE)
- [ ] `[S1]` Initialize Prisma in project
- [ ] `[S2]` Define User model
- [ ] `[S3]` Define Agency model
- [ ] `[S4]` Define Client model
- [ ] `[S5]` Define Project model
- [ ] `[S6]` Create initial migration
- [ ] `[S7]` Apply migration to database
- [ ] `[S8]` Generate Prisma client

### Phase 3: Environment Configuration (ENG-BE)
- [ ] `[E1]` Setup .env.example with all required vars
- [ ] `[E2]` Configure DATABASE_URL
- [ ] `[E3]` Configure DIRECT_URL (for migrations)
- [ ] `[E4]` Document environment setup in README
- [ ] `[E5]` Add environment validation (zod)

### Phase 4: API Structure (ENG-BE)
- [ ] `[A1]` Create API route structure
- [ ] `[A2]` Setup API error handling middleware
- [ ] `[A3]` Create API response utilities
- [ ] `[A4]` Setup request validation (zod)
- [ ] `[A5]` Create authentication middleware placeholder
- [ ] `[A6]` Create logging middleware

### Phase 5: Health Checks & Monitoring (ENG-BE)
- [ ] `[H1]` Create /api/health endpoint
- [ ] `[H2]` Add database connectivity check
- [ ] `[H3]` Setup basic logging (Pino or Winston)
- [ ] `[H4]` Configure error tracking (Sentry setup)

### Phase 6: Development Tools (ENG-BE)
- [ ] `[T1]` Setup Prisma Studio (npx prisma studio)
- [ ] `[T2]` Create database seed script
- [ ] `[T3]` Add Prisma generate to build script
- [ ] `[T4]` Create database reset script
- [ ] `[T5]` Document common Prisma commands

### Phase 7: Documentation (ENG-BE)
- [ ] `[DOC1]` Document database schema
- [ ] `[DOC2]` Create ER diagram
- [ ] `[DOC3]` Document API conventions
- [ ] `[DOC4]` Add setup instructions to README

### Phase 8: Testing (ENG-BE)
- [ ] `[TEST1]` Test database connection
- [ ] `[TEST2]` Test migrations up/down
- [ ] `[TEST3]` Verify Prisma client generation
- [ ] `[TEST4]` Test seed script
- [ ] `[TEST5]` Test health endpoint

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Get Supabase API keys
- [ ] Setup local development environment
**Blockers:** None  
**Notes:** This is the foundation task. All backend work depends on this being complete.

---

## 🚧 Blockers

**Current blockers:**
- None

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Supabase for PostgreSQL | Managed, has free tier, excellent DX, built-in auth if needed |
| 2026-02-09 | Prisma ORM | Type-safe, great migrations, excellent VS Code extension |
| 2026-02-09 | Next.js API routes | Single codebase, serverless scaling, no separate backend server |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** None (foundation task)
- **Blocks:**
  - WEB-008 (Authentication — needs User model)
  - WEB-009 (Client Portal — needs all models)
  - WEB-010 (Admin Dashboard — needs all models)
  - WEB-011 (API Development — needs database)
  - WEB-012 (Quote System Backend — needs database)
- **Related:**
  - [ARCHITECTURE.md](./ARCHITECTURE.md) — Database schema details

---

## 📐 Technical Notes

### Database Schema (Initial)
```prisma
// schema.prisma (initial version)
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
  directUrl = env("DIRECT_URL")
}

model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  role      UserRole @default(CLIENT)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}

enum UserRole {
  ADMIN
  MANAGER
  CLIENT
}

// Additional models added in subsequent tasks
```

### Environment Variables
```bash
# Database
DATABASE_URL="postgresql://postgres:[password]@db.[project].supabase.co:5432/postgres"
DIRECT_URL="postgresql://postgres:[password]@db.[project].supabase.co:5432/postgres"

# App
NEXT_PUBLIC_APP_URL="http://localhost:3000"
```

### File Structure
```
├── prisma/
│   ├── schema.prisma
│   ├── migrations/
│   └── seed.ts
├── src/
│   ├── lib/
│   │   ├── prisma.ts        # Prisma client singleton
│   │   └── env.ts           # Environment validation
│   └── app/
│       └── api/
│           ├── health/
│           │   └── route.ts
│           └── ...
```

---

*Verify DATABASE_URL works before marking this task complete*
