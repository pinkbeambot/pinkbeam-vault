# Pink Beam

**Building intelligent systems for businesses**

Pink Beam is a unified platform offering four specialized services to help businesses grow and operate more efficiently through technology.

---

## Services

### 🌐 Pink Beam Web (/web)
**Website Design & SEO Services**
- Custom website development
- Search engine optimization
- Performance optimization
- Content strategy

### 🤖 Pink Beam Agents (/agents)
**AI Employee Solutions**
- Autonomous AI employees for research, sales, support, content, and design
- Custom AI workforce development
- Integration with existing business tools
- Starting at $500/month per AI employee

### 🧪 Pink Beam Labs (/labs)
**Custom Software Development**
- Bespoke software solutions for any business need
- Web applications, mobile apps, internal tools
- API development and integrations
- Technical consulting and architecture

### 💡 Pink Beam Solutions (/solutions)
**Strategic Consulting**
- Digital transformation strategy
- Technology stack recommendations
- Process automation consulting
- Growth and scaling advisory

---

## Architecture

Each service operates as a distinct product with:
- **Dedicated navigation** - Service-specific navbars and layouts
- **Shared authentication** - One Pink Beam account across all services
- **Unified brand** - Consistent design system, colors, typography
- **Cross-service navigation** - Easy movement between services via service switcher

---

## Repository Structure

```
pinkbeam/
├── home/           # Landing page and service hub (/)
├── web/            # Web design & SEO service (/web)
├── agents/         # AI employees service (/agents) - MIGRATED FROM pinkbeam-agency
├── labs/           # Custom software service (/labs)
├── solutions/      # Consulting service (/solutions)
└── shared/         # Shared resources, design system, auth
```

---

## Development Status

| Service | Status | Notes |
|---------|--------|-------|
| Home | 🟡 Planned | Service hub landing page |
| Web | 🟡 Planned | Website & SEO service |
| Agents | 🟢 In Progress | AI employees - migrating from pinkbeam-agency |
| Labs | 🟡 Planned | Custom software service |
| Solutions | 🟡 Planned | Consulting service |

---

## Design System

All services use the same design system:
- **Colors**: Pink Beam palette (primary #FF006E, void #0A0A0F)
- **Typography**: Space Grotesk (display), Inter (body), JetBrains Mono (mono)
- **Components**: shadcn/ui with custom theming
- **Animations**: Framer Motion + GSAP

See [shared/DESIGN-SYSTEM.md](shared/DESIGN-SYSTEM.md) for complete specifications.

---

## Next Steps

1. Create unified homepage at `/` with service selector
2. Migrate existing /agents code from pinkbeam-agency
3. Stub placeholder routes for /web, /labs, /solutions
4. Implement shared authentication across all services
5. Build service-specific dashboards
