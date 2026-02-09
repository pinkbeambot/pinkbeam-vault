---
id: "TASK-004"
title: "Set Up Supabase Project"
status: "todo"
priority: "P0"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 3
actual_hours: 0
dependencies:
  - "TASK-001"
blocks:
  - "TASK-009"
  - "TASK-010"
  - "TASK-011"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "foundation"
  - "P0"
  - "database"
---

# TASK-004: Set Up Supabase Project

## 🎯 Objective
Create and configure Supabase project for Solutions service, including database setup, authentication configuration, and storage buckets for document management.

## 📖 Context
Supabase provides PostgreSQL, authentication, and storage in one platform. We'll use it for all backend data needs, following the same pattern as other Pink Beam services.

---

## ✅ Definition of Done

### Phase 1: Project Creation
- [ ] `[1.1]` Create Supabase project:
  - [ ] `[1.1a]` Name: pinkbeam-solutions
  - [ ] `[1.1b]` Region: US West (or closest)
  - [ ] `[1.1c]` Set strong database password
- [ ] `[1.2]` Configure environments:
  - [ ] `[1.2a]` Development project (or use local)
  - [ ] `[1.2b]` Staging project
  - [ ] `[1.2c]` Production project

### Phase 2: Authentication Setup
- [ ] `[2.1]` Configure auth providers:
  - [ ] `[2.1a]` Email/password authentication
  - [ ] `[2.1b]` Magic link option
  - [ ] `[2.1c]` Google OAuth (for enterprise clients)
- [ ] `[2.2]` Configure email templates:
  - [ ] `[2.2a]` Confirmation email
  - [ ] `[2.2b]` Magic link email
  - [ ] `[2.2c]` Password reset email
  - [ ] `[2.2d]` Custom branding

### Phase 3: Storage Setup
- [ ] `[3.1]` Create storage buckets:
  - [ ] `[3.1a]` documents/ - Client deliverables
  - [ ] `[3.1b]` uploads/ - Client file uploads
  - [ ] `[3.1c]` templates/ - Document templates
  - [ ] `[3.1d]` assets/ - Static assets
- [ ] `[3.2]` Configure bucket policies:
  - [ ] `[3.2a]` Public read for templates/assets
  - [ ] `[3.2b]` Private access for documents
  - [ ] `[3.2c]` Upload permissions per user role

### Phase 4: Client Integration
- [ ] `[4.1]` Install Supabase client:
  - [ ] `[4.1a]` @supabase/supabase-js
  - [ ] `[4.1b]` @supabase/ssr for Next.js
- [ ] `[4.2]` Create client utilities:
  - [ ] `[4.2a]` Browser client
  - [ ] `[4.2b]` Server client
  - [ ] `[4.2c]` Admin client

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

- Waiting for: TASK-001 (Initialize Project)

---

## 🔗 Related

- **Depends on:** TASK-001
- **Blocks:** TASK-009 (Database Schema), TASK-010 (RLS Policies), TASK-011 (Auth Integration)
