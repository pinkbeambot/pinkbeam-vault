# Home/Hub — Architecture

**Service:** Pink Beam Platform Hub  
**Last Updated:** 2026-02-09

---

## 🏗️ Technical Architecture

### Route Groups Structure

```
app/
├── (main)/                    ← Hub/Root routes
│   ├── layout.tsx             ← Minimal layout (no nav/footer)
│   ├── page.tsx               ← Hub homepage
│   └── layout.tsx             ← Root layout with metadata
│
├── (agents)/                  ← AI Employees service
│   ├── layout.tsx             ← AgentsNavigation, AgentsFooter
│   └── agents/                ← All /agents/* routes
│
├── (web)/                     ← Web agency service
│   ├── layout.tsx             ← WebNavigation, WebFooter
│   └── web/                   ← All /web/* routes
│
├── (labs)/                    ← Software dev service
│   ├── layout.tsx             ← LabsNavigation, LabsFooter
│   └── labs/                  ← All /labs/* routes
│
├── (solutions)/               ← Consulting service
│   ├── layout.tsx             ← SolutionsNavigation, SolutionsFooter
│   └── solutions/             ← All /solutions/* routes
│
├── sign-in/                   ← Shared auth (root level)
├── sign-up/                   ← Shared auth (root level)
├── dashboard/                 ← Redirects to service-specific dashboard
└── api/                       ← API routes
```

### Layout Inheritance

```
Root Layout (app/layout.tsx)
├── Providers (Theme, Auth, Query)
├── Global Styles
└── Route Group Layout
    ├── (main) → No nav/footer (bare)
    ├── (agents) → AgentsNavigation + AgentsFooter
    ├── (web) → WebNavigation + WebFooter
    ├── (labs) → LabsNavigation + LabsFooter
    └── (solutions) → SolutionsNavigation + SolutionsFooter
```

---

## 🎨 Design System Integration

### Shared Components (Top Level)

```
components/
├── ui/                        ← shadcn/ui base components
├── animations/                ← Framer Motion wrappers
│   ├── FadeIn.tsx
│   ├── SlideUp.tsx
│   └── StaggerChildren.tsx
├── layout/
│   ├── Navigation.tsx         ← Base nav (customized per service)
│   ├── Footer.tsx             ← Base footer (customized per service)
│   └── Container.tsx
├── seo/
│   ├── StructuredData.tsx
│   └── OpenGraph.tsx
└── [service]/                 ← Service-specific components
    ├── agents/
    ├── web/
    ├── labs/
    └── solutions/
```

### Color System (Shared)

```typescript
// tailwind.config.ts
const colors = {
  // Brand
  pink: {
    DEFAULT: '#FF006E',
    50: '#FFF0F5',
    100: '#FFE0EB',
    // ... scale
    900: '#990040',
  },
  // Foundation
  void: '#0A0A0F',
  voidLight: '#12121A',
  voidLighter: '#1A1A24',
}
```

---

## 🔐 Authentication Flow

### Shared Auth Architecture

```
User → /sign-in or /sign-up
           ↓
    Supabase Auth
           ↓
    +------------------+    +------------------+
    |   New User       |    |  Existing User   |
    |   (onboarding)   |    |  (redirect)      |
    +------------------+    +------------------+
           ↓                       ↓
    Select service             Last active service
    or platform hub            or /dashboard
```

### Middleware Protection

```typescript
// middleware.ts
export function middleware(request: NextRequest) {
  // Protect service dashboards
  if (request.nextUrl.pathname.startsWith('/agents/dashboard')) {
    return checkAuth(request, '/agents/sign-in')
  }
  if (request.nextUrl.pathname.startsWith('/web/dashboard')) {
    return checkAuth(request, '/web/sign-in')
  }
  // ... etc
}
```

---

## 🗄️ Database Schema (Shared)

### Users Table

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  
  -- Service access flags
  has_agents_access BOOLEAN DEFAULT false,
  has_web_access BOOLEAN DEFAULT false,
  has_labs_access BOOLEAN DEFAULT false,
  has_solutions_access BOOLEAN DEFAULT false,
  
  -- Onboarding state
  onboarding_completed BOOLEAN DEFAULT false,
  preferred_service TEXT -- 'agents', 'web', 'labs', 'solutions'
);
```

### Service Subscriptions

```sql
CREATE TABLE service_subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  service TEXT NOT NULL, -- 'agents', 'web', 'labs', 'solutions'
  status TEXT DEFAULT 'active', -- 'active', 'paused', 'cancelled'
  plan TEXT, -- specific to each service
  started_at TIMESTAMP DEFAULT NOW(),
  expires_at TIMESTAMP,
  metadata JSONB -- service-specific data
);
```

---

## 🔄 Cross-Service Navigation

### Hub Navigation Component

```typescript
// components/layout/Navigation.tsx (Hub version)
const services = [
  { name: 'Agents', href: '/agents', description: 'AI employees' },
  { name: 'Web', href: '/web', description: 'Website & SEO' },
  { name: 'Labs', href: '/labs', description: 'Custom software' },
  { name: 'Solutions', href: '/solutions', description: 'Consulting' },
];

// Services dropdown in navbar
<DropdownMenu>
  <DropdownMenuTrigger>Services</DropdownMenuTrigger>
  <DropdownMenuContent>
    {services.map(service => (
      <DropdownMenuItem key={service.href}>
        <Link href={service.href}>
          <div>{service.name}</div>
          <div>{service.description}</div>
        </Link>
      </DropdownMenuItem>
    ))}
  </DropdownMenuContent>
</DropdownMenu>
```

---

## 📱 Responsive Breakpoints

```typescript
// Tailwind default breakpoints
const breakpoints = {
  sm: '640px',   // Mobile landscape
  md: '768px',   // Tablet
  lg: '1024px',  // Desktop
  xl: '1280px',  // Large desktop
  '2xl': '1536px' // XL desktop
};

// Hub-specific breakpoints
// - Mobile: Stack service cards vertically
// - Tablet: 2-column grid
// - Desktop: 4-column grid or featured layout
```

---

## 🔧 Edge Functions

### Service Detection

```typescript
// app/api/detect-service/route.ts
export async function POST(request: Request) {
  const { email, interests } = await request.json();
  
  // Recommend service based on user input
  const recommendation = recommendService(interests);
  
  return Response.json({ service: recommendation });
}
```

### Cross-Service Analytics

```typescript
// Track user journey across services
// - Which service did they land on first?
// - Which services did they explore?
// - Where did they convert?
```

---

## 🚀 Deployment Strategy

### Monorepo Structure

```
pinkbeam/
├── app/                       ← Next.js app
├── components/                ← Shared components
├── lib/                       ← Utilities, hooks
├── styles/                    ← Global styles
├── public/                    ← Static assets
├── supabase/                  ← DB migrations, edge functions
└── docs/                      ← Documentation
```

### Environment Variables

```env
# Required for all services
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Service-specific (loaded based on active service)
AGENTS_STRIPE_KEY=
WEB_STRIPE_KEY=
# ... etc
```

---

*Part of the Pink Beam Platform Documentation*
