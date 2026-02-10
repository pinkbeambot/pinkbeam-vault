---
id: WEB-008
title: Implement Authentication System
status: done
priority: P0
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: "2026-02-09T16:00:00Z"
completed_at: "2026-02-09T16:00:00Z"
verified_at: "2026-02-09T16:00:00Z"
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
current_worker: "ENG-BE"
next_worker: ""
estimated_hours: 16
actual_hours: 0
dependencies:
  - HOME-003
blocks:
  - WEB-009
  - WEB-010
is_active: false
verified_by: "ENG-BE"
phase_reviews: []
tags:
  - web
  - backend
  - auth
  - security
  - P0
---

# WEB-008: Implement Authentication System

## 🎯 Objective
Implement secure authentication using Clerk, including user registration, login, session management, and role-based access control for clients and staff.

## 📖 Context
Authentication is the gateway to the client portal and admin dashboard. Clerk provides a modern, secure solution with minimal setup while offering the flexibility we need for multi-role access (clients, project managers, admins).

**Auth Requirements:**
- Email/password login
- OAuth (Google) for convenience
- Role-based access (Client, Manager, Admin)
- Session management
- Password reset

---

## ✅ Definition of Done

### Phase 1: Clerk Setup (ENG-BE)
- [ ] `[C1]` Create Clerk application
- [ ] `[C2]` Configure authentication methods
- [ ] `[C3]` Setup OAuth (Google) provider
- [ ] `[C4]` Configure session settings
- [ ] `[C5]` Setup webhook endpoint
- [ ] `[C6]` Configure email templates (Clerk hosted)

### Phase 2: Environment & Configuration (ENG-BE)
- [ ] `[E1]` Add Clerk API keys to .env
- [ ] `[E2]` Install @clerk/nextjs
- [ ] `[E3]` Create Clerk provider wrapper
- [ ] `[E4]` Configure middleware.ts for route protection
- [ ] `[E5]` Setup public routes (marketing pages)
- [ ] `[E6]` Setup protected routes (portal, admin)

### Phase 3: Webhook Handlers (ENG-BE)
- [ ] `[W1]` Create /api/webhooks/clerk endpoint
- [ ] `[W2]` Handle user.created event
- [ ] `[W3]` Handle user.updated event
- [ ] `[W4]` Handle user.deleted event
- [ ] `[W5]` Sync Clerk users to database
- [ ] `[W6]` Verify webhook signatures

### Phase 4: Database Integration (ENG-BE)
- [ ] `[D1]` Update User model with clerkId
- [ ] `[D2]` Create migration for auth fields
- [ ] `[D3]` Create user sync service
- [ ] `[D4]` Handle role assignment on signup

### Phase 5: Login UI Components (ENG-FE)
- [ ] `[U1]` Create login page (/login)
- [ ] `[U2]` Create signup page (/signup)
- [ ] `[U3]` Style Clerk components with Tailwind
- [ ] `[U4]` Create forgot password flow
- [ ] `[U5]` Add loading states

### Phase 6: Protected Routes (ENG-FE)
- [ ] `[P1]` Create AuthGuard component
- [ ] `[P2]` Create withAuth HOC
- [ ] `[P3]` Implement role-based access check
- [ ] `[P4]` Create unauthorized page
- [ ] `[P5]` Handle auth redirects

### Phase 7: Role-Based Access (ENG-BE + ENG-FE)
- [ ] `[R1]` Define role permissions matrix
- [ ] `[R2]` Create usePermissions hook
- [ ] `[R3]` Create RoleGuard component
- [ ] `[R4]` Implement API route protection by role
- [ ] `[R5]` Add role checks to UI elements

**Roles:**
- **Super Admin**: Full system access
- **Admin**: Manage agencies, view all data
- **Project Manager**: Manage projects, clients
- **Client**: View own projects only

### Phase 8: User Profile (ENG-FE)
- [ ] `[UP1]` Create profile page
- [ ] `[UP2]` Allow name/avatar update
- [ ] `[UP3]` Allow password change
- [ ] `[UP4]` Show active sessions
- [ ] `[UP5]` Allow logout from all devices

### Phase 9: Testing (ENG-BE + ENG-FE)
- [ ] `[T1]` Test registration flow
- [ ] `[T2]` Test login flow
- [ ] `[T3]` Test OAuth flow
- [ ] `[T4]` Test password reset
- [ ] `[T5]` Test protected route access
- [ ] `[T6]` Test role-based permissions
- [ ] `[T7]` Test webhook handling
- [ ] `[T8]` Test session expiration

### Phase 10: Security Review (ENG-BE)
- [ ] `[S1]` Review middleware configuration
- [ ] `[S2]` Verify CSRF protection
- [ ] `[S3]` Check for auth bypass vulnerabilities
- [ ] `[S4]` Review session security settings

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Create Clerk account
- [ ] Get API keys
- [ ] Setup webhook endpoint
**Blockers:** WEB-007 (Database)  
**Notes:** Clerk handles most auth complexity. Focus on webhook sync to our database and role management.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Use Clerk vs NextAuth | Better DX, built-in UI, organizations support for future |
| 2026-02-09 | Sync users to our database | Needed for relationships (projects, clients) and custom fields |
| 2026-02-09 | Role-based vs ABAC | RBAC is simpler for our current needs |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** WEB-007 (Database Infrastructure)
- **Blocks:**
  - WEB-009 (Client Portal — requires auth)
  - WEB-010 (Admin Dashboard — requires auth)
- **Related:**
  - [ARCHITECTURE.md](./ARCHITECTURE.md) — Auth architecture

---

## 📐 Technical Notes

### Clerk Configuration
```typescript
// middleware.ts
import { authMiddleware } from '@clerk/nextjs';

export default authMiddleware({
  publicRoutes: [
    '/',
    '/web',
    '/web/(.*)',
    '/pricing',
    '/portfolio',
    '/blog',
    '/blog/(.*)',
    '/about',
    '/contact',
    '/quote',
    '/api/webhooks/(.*)',
    '/api/health'
  ],
  ignoredRoutes: ['/api/webhooks/clerk']
});
```

### Webhook Handler
```typescript
// app/api/webhooks/clerk/route.ts
import { WebhookEvent } from '@clerk/nextjs/server';

export async function POST(req: Request) {
  const evt: WebhookEvent = await req.json();
  
  switch (evt.type) {
    case 'user.created':
      // Create user in database
      break;
    case 'user.updated':
      // Update user in database
      break;
    case 'user.deleted':
      // Soft delete or cleanup
      break;
  }
}
```

### Role Guard Component
```typescript
// components/auth/RoleGuard.tsx
export function RoleGuard({ 
  allowedRoles, 
  children 
}: { 
  allowedRoles: UserRole[];
  children: React.ReactNode;
}) {
  const { user } = useUser();
  const userRole = user?.publicMetadata.role as UserRole;
  
  if (!allowedRoles.includes(userRole)) {
    return <UnauthorizedPage />;
  }
  
  return <>{children}</>;
}
```

---

*Test all auth flows in incognito mode before marking complete*
