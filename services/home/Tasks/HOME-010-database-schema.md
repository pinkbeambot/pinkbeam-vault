---
id: HOME-010
title: Database Schema for Platform
status: todo
priority: P1
estimated_hours: 6
assigned_to: ENG-BE
dependencies: [HOME-003]
created_date: 2026-02-09
tags: [database, supabase, schema]
---

# HOME-010: Database Schema for Platform

## Objective
Design and implement the database schema for platform-wide features including users, service subscriptions, and cross-service data.

## Context
Each service has its own data model, but the platform needs shared tables for users, billing, and service access management.

## Definition of Done

### Phase 1: UI/Foundation (100%)
- [ ] Users table extensions (service flags, preferences)
- [ ] Service subscriptions table
- [ ] Waitlist table (for web/labs/solutions)
- [ ] Cross-service activity log

### Phase 2: Backend/Integration (100%)
- [ ] Supabase migrations
- [ ] Row Level Security policies
- [ ] Edge functions for cross-service queries
- [ ] Indexes for performance

### Phase 3: Testing/QA (100%)
- [ ] Migrations run successfully
- [ ] RLS policies tested
- [ ] Queries performant
- [ ] Data integrity constraints work

## Work Log

### 2026-02-09
- Task created

## Blockers
- HOME-003: Shared auth (for user model)

## Related
- HOME-009: Dashboard foundation
