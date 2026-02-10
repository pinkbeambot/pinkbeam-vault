---
id: WEB-011
title: Build Core REST API
status: done
priority: P0
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
estimated_hours: 20
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
blocks:
  - WEB-012
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - api
  - rest
  - P0
---

# WEB-011: Build Core REST API

## 🎯 Objective
Build a comprehensive REST API that powers the client portal and admin dashboard, handling all CRUD operations for projects, clients, files, comments, and invoices.

## 📖 Context
The API is the backbone of the platform. It needs to be well-designed, properly authenticated, and handle all business logic. This task creates the endpoints that the frontend will consume.

**API Principles:**
- RESTful design
- Proper HTTP status codes
- Consistent error responses
- Input validation
- Authorization checks

---

## ✅ Definition of Done

### Phase 1: API Foundation (ENG-BE)
- [ ] `[F1]` Setup API route structure
- [ ] `[F2]` Create request validation middleware (zod)
- [ ] `[F3]` Create error handling middleware
- [ ] `[F4]` Setup response formatting utilities
- [ ] `[F5]` Create authentication middleware
- [ ] `[F6]` Create authorization middleware

### Phase 2: Project API (ENG-BE)
- [ ] `[P1]` GET /api/projects — List projects (with filters)
- [ ] `[P2]` GET /api/projects/:id — Get project detail
- [ ] `[P3]` POST /api/projects — Create project (admin only)
- [ ] `[P4]` PUT /api/projects/:id — Update project
- [ ] `[P5]` DELETE /api/projects/:id — Delete project (admin only)
- [ ] `[P6]` GET /api/projects/:id/phases — Get project phases
- [ ] `[P7]` POST /api/projects/:id/phases — Add phase (admin)
- [ ] `[P8]` PUT /api/projects/:id/phases/:phaseId — Update phase

### Phase 3: Task API (ENG-BE)
- [ ] `[T1]` GET /api/projects/:id/tasks — List tasks
- [ ] `[T2]` POST /api/projects/:id/tasks — Create task
- [ ] `[T3]` GET /api/tasks/:id — Get task detail
- [ ] `[T4]` PUT /api/tasks/:id — Update task
- [ ] `[T5]` DELETE /api/tasks/:id — Delete task
- [ ] `[T6]` POST /api/tasks/:id/complete — Mark complete
- [ ] `[T7]` POST /api/tasks/:id/assign — Assign to user

### Phase 4: Client API (ENG-BE)
- [ ] `[C1]` GET /api/clients — List clients
- [ ] `[C2]` POST /api/clients — Create client
- [ ] `[C3]` GET /api/clients/:id — Get client detail
- [ ] `[C4]` PUT /api/clients/:id — Update client
- [ ] `[C5]` DELETE /api/clients/:id — Delete client
- [ ] `[C6]` GET /api/clients/:id/projects — Get client projects

### Phase 5: File API (ENG-BE)
- [ ] `[F1]` GET /api/projects/:id/files — List files
- [ ] `[F2]` POST /api/files/upload — Get presigned URL
- [ ] `[F3]` POST /api/files — Record uploaded file
- [ ] `[F4]` GET /api/files/:id — Get file info
- [ ] `[F5]` DELETE /api/files/:id — Delete file
- [ ] `[F6]` POST /api/files/:id/approve — Approve file

### Phase 6: Comments API (ENG-BE)
- [ ] `[CM1]` GET /api/projects/:id/comments — List comments
- [ ] `[CM2]` POST /api/projects/:id/comments — Add comment
- [ ] `[CM3]` PUT /api/comments/:id — Edit comment
- [ ] `[CM4]` DELETE /api/comments/:id — Delete comment

### Phase 7: Invoice API (ENG-BE)
- [ ] `[I1]` GET /api/invoices — List invoices
- [ ] `[I2]` GET /api/invoices/:id — Get invoice detail
- [ ] `[I3]` POST /api/invoices — Create invoice (admin)
- [ ] `[I4]` PUT /api/invoices/:id — Update invoice (admin)
- [ ] `[I5]` POST /api/invoices/:id/send — Send invoice
- [ ] `[I6]` POST /api/invoices/:id/mark-paid — Mark as paid

### Phase 8: User API (ENG-BE)
- [ ] `[U1]` GET /api/users/me — Get current user
- [ ] `[U2]` PUT /api/users/me — Update current user
- [ ] `[U3]` GET /api/users — List users (admin)
- [ ] `[U4]` GET /api/users/:id — Get user (admin)

### Phase 9: Quote API (ENG-BE)
- [ ] `[Q1]` POST /api/quotes — Submit quote request
- [ ] `[Q2]` GET /api/quotes — List quote requests (admin)
- [ ] `[Q3]` GET /api/quotes/:id — Get quote detail (admin)
- [ ] `[Q4]` PUT /api/quotes/:id — Update quote status (admin)

### Phase 10: Validation & Security (ENG-BE)
- [ ] `[V1]` Add input validation to all endpoints
- [ ] `[V2]` Add authorization checks
- [ ] `[V3]` Implement rate limiting
- [ ] `[V4]` Add request logging
- [ ] `[V5]` Sanitize user inputs

### Phase 11: API Documentation (ENG-BE)
- [ ] `[DOC1]` Document all endpoints
- [ ] `[DOC2]` Create request/response examples
- [ ] `[DOC3]` Document error codes
- [ ] `[DOC4]` Create API testing guide

### Phase 12: Testing (ENG-BE)
- [ ] `[TEST1]` Unit test all handlers
- [ ] `[TEST2]` Integration test API flows
- [ ] `[TEST3]` Test authorization rules
- [ ] `[TEST4]` Test validation logic
- [ ] `[TEST5]` Load testing

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Design API contract
- [ ] Setup Postman/Insomnia collection
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)  
**Notes:** API endpoints should follow REST conventions consistently. Document as you build.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Route-based API structure | Standard Next.js pattern, colocated with pages |
| 2026-02-09| Zod for validation | Type-safe, great error messages, integrates with TypeScript |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
- **Blocks:**
  - WEB-012 (Quote System Backend — needs API)
- **Related:**
  - [ARCHITECTURE.md](./ARCHITECTURE.md) — API architecture

---

## 📐 Technical Notes

### API Structure
```
app/api/
├── health/
│   └── route.ts
├── webhooks/
│   └── clerk/
│       └── route.ts
├── projects/
│   ├── route.ts          # GET, POST
│   └── [id]/
│       ├── route.ts      # GET, PUT, DELETE
│       ├── phases/
│       │   └── route.ts
│       ├── tasks/
│       │   └── route.ts
│       ├── files/
│       │   └── route.ts
│       └── comments/
│           └── route.ts
├── clients/
│   ├── route.ts
│   └── [id]/
│       └── route.ts
├── tasks/
│   └── [id]/
│       └── route.ts
├── files/
│   └── [id]/
│       └── route.ts
├── invoices/
│   ├── route.ts
│   └── [id]/
│       └── route.ts
├── users/
│   ├── me/
│   │   └── route.ts
│   └── route.ts
└── quotes/
    ├── route.ts
    └── [id]/
        └── route.ts
```

### Response Format
```typescript
// Success
{
  success: true,
  data: { ... }
}

// Error
{
  success: false,
  error: {
    code: 'VALIDATION_ERROR',
    message: 'Invalid input',
    details: { ... }
  }
}
```

### Validation Pattern
```typescript
// app/api/projects/route.ts
import { z } from 'zod';

const createProjectSchema = z.object({
  name: z.string().min(1),
  description: z.string().optional(),
  clientId: z.string(),
  budget: z.number().optional(),
});

export async function POST(req: Request) {
  const body = await req.json();
  const result = createProjectSchema.safeParse(body);
  
  if (!result.success) {
    return Response.json(
      { success: false, error: result.error },
      { status: 400 }
    );
  }
  
  // Create project...
}
```

---

*Test each endpoint with curl/Postman before marking complete*
