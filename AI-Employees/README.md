# 🧠 AI Employee Platform

**The Future of Work at Pink Beam**

---

## Vision

### What is an AI Employee?

An AI Employee is a software agent that operates like a human team member — with defined roles, responsibilities, and workflows. Unlike traditional automation (scripts, cron jobs), AI Employees:

- **Think** — They use LLMs to understand context and make decisions
- **Communicate** — They send emails, chat messages, and updates
- **Learn** — They remember past interactions and preferences
- **Deliver** — They produce tangible outputs (reports, designs, responses)
- **Collaborate** — They work with humans and other AI Employees

### The Two Modes

Our platform supports two operational modes:

| Mode | Description | Best For |
|------|-------------|----------|
| **Batch (v1)** | Scheduled, pull-based execution | Research, reports, content generation |
| **Autonomous (v2)** | Event-driven, real-time interaction | Support, sales, live assistance |

**Batch Mode** runs on a schedule (daily, weekly) and "pulls" data from sources, processing it into deliverables like briefs or blog posts.

**Autonomous Mode** responds to events in real-time (emails, messages, webhooks) and engages in ongoing conversations with users.

---

## The Team

We have 6 AI Employees, each specializing in a different function:

| Employee | Role | Batch Capabilities | Autonomous Capabilities |
|----------|------|-------------------|-------------------------|
| **Sarah** | Market Intelligence Analyst | Weekly competitor briefs | Real-time alerts, research queries |
| **Mike** | Sales Development Rep | Outbound prospecting | Lead qualification, meeting booking |
| **Alex** | Customer Support Specialist | Ticket responses (batched) | Live chat, instant replies |
| **Casey** | Content Marketing Specialist | Blog posts, social content | Real-time social engagement |
| **Lumen** | Visual Designer | Asset creation, variations | On-demand design requests |
| **Flux** | Motion Designer | Video content, animations | Live video editing assistance |

---

## Current Status

### ✅ Completed
- **Sarah MVP (Batch Mode)** — Core infrastructure, brief generation, dashboard
- **Database Schema** — PostgreSQL with pgvector support
- **Edge Functions** — Supabase Deno runtime infrastructure

### 🚧 In Progress
- Email delivery system (Resend integration)
- Weekly scheduling (pg_cron)

### 📋 Next Up
- Mike (SDR) batch mode
- Alex (Support) batch mode
- Usage tracking and cost monitoring

---

## How to Use This Documentation

### For Leadership
Start with **[ARCHITECTURE.md](./ARCHITECTURE.md)** for the big picture, then **[ROADMAP.md](./ROADMAP.md)** for timeline.

### For Engineers
Read **[TECH-SPECS.md](./TECH-SPECS.md)** for implementation details, then individual employee specs in **[EMPLOYEES/](./EMPLOYEES/)**.

### For Operations
Check **[INTEGRATIONS.md](./INTEGRATIONS.md)** for all external services and costs.

### For Project Management
Track progress in **[TASKS/](./TASKS/)** — each task follows our standard format.

---

## Quick Links

| Document | Purpose |
|----------|---------|
| [ARCHITECTURE.md](./ARCHITECTURE.md) | System design and technical architecture |
| [TECH-SPECS.md](./TECH-SPECS.md) | Detailed API specs and data models |
| [EMPLOYEES/](./EMPLOYEES/) | Individual employee capabilities and specs |
| [ROADMAP.md](./ROADMAP.md) | Development phases and timeline |
| [SUCCESS-CRITERIA.md](./SUCCESS-CRITERIA.md) | Quality metrics and KPIs |
| [INTEGRATIONS.md](./INTEGRATIONS.md) | External APIs and services |
| [TASKS/](./TASKS/) | Development task tracking |

---

## Platform Principles

### 1. Human-in-the-Loop
AI Employees augment humans, they don't replace them. Every significant action can be reviewed, and humans can take over at any point.

### 2. Source of Truth
All data lives in our PostgreSQL database. No hidden state in external systems. Full audit trail for every action.

### 3. Cost Transparency
Every API call, every token, every operation is tracked. We know exactly what each AI Employee costs to operate.

### 4. Incremental Complexity
Start simple (batch mode), add complexity only when needed (autonomous mode). Each employee can evolve independently.

### 5. Composability
AI Employees can hand off work to each other. Sarah can brief Casey on content topics. Casey can request assets from Lumen.

---

## Getting Started

1. **Read the architecture** — Understand the two modes and core concepts
2. **Explore Sarah** — She's our reference implementation (see [EMPLOYEES/Sarah.md](./EMPLOYEES/Sarah.md))
3. **Check the roadmap** — See what's coming and when
4. **Review open tasks** — See [TASKS/](./TASKS/) for current work

---

*Last Updated: 2026-02-07*
*Platform Version: 1.0 (Batch Mode)*
*Next Milestone: Email Delivery + Weekly Scheduling (v1.1)*
