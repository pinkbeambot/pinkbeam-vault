---
id: TASK-011
title: Slack notifications
status: backlog
priority: P2
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
  - "[[Org Chart/PM/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 20
actual_hours: 0
dependencies:
  - "[[TASK-005]]"
  - "[[TASK-006]]"
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - backend
  - frontend
  - integration
  - slack
  - notifications
  - P2
---

# TASK-011: Slack notifications

## 🎯 Objective
Integrate Slack for real-time notifications about project updates, task changes, and important events. Enable both workspace-wide and per-project notifications.

## 📖 Context
Slack integration keeps teams informed without requiring them to check the dashboard constantly:
- Notify channels of project status changes
- Alert on task assignments and completions
- Share deliverable approvals
- Report time tracking summaries
- Send invoice notifications
- Allow creating tasks from Slack

Teams can configure which events trigger notifications and to which channels.

---

## ✅ Definition of Done

### Phase 1: Design & Planning ([[Org Chart/PM/IDENTITY]])
- [ ] `[D1]` Define notification event types
- [ ] `[D2]` Design Slack message templates
- [ ] `[D3]` Plan notification routing (which events → which channels)
- [ ] `[D4]` Design Slack App installation flow
- [ ] `[D5]` Define Slack slash commands (optional)
- [ ] `[D6]` Design notification preferences UI
- [ ] `[D7]` Plan @mention handling
- [ ] `[D8]` Security review for workspace access

### Phase 2: Slack App Setup ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[S1]` Create Slack App
- [ ] `[S2]` Configure OAuth scopes
- [ ] `[S3]` Set up slash commands (if applicable)
- [ ] `[S4]` Configure interactive components
- [ ] `[S5]` Set up event subscriptions
- [ ] `[S6]` Test OAuth installation flow
- [ ] `[S7]` Document Slack App setup

### Phase 3: Database Schema ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[DB1]` Create slack_connections table
- [ ] `[DB2]` Create slack_channels table
- [ ] `[DB3]` Create slack_notification_rules table
- [ ] `[DB4]` Create slack_notification_logs table
- [ ] `[DB5]` Link channels to projects (optional)
- [ ] `[DB6]` Add user notification preferences
- [ ] `[DB7]` Create indexes for rule lookups

### Phase 4: Backend - Notification Service ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[B1]` Build Slack API client
- [ ] `[B2]` Create notification event bus
- [ ] `[B3]` Implement notification rule engine
- [ ] `[B4]` Build message formatter service
- [ ] `[B5]` Handle rate limiting
- [ ] `[B6]` Implement retry logic
- [ ] `[B7]` Add notification logging
- [ ] `[B8]` Build test notification endpoint

### Phase 5: Frontend - Connection Setup ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FC1]` Build SlackConnect button
- [ ] `[FC2]` Handle OAuth callback
- [ ] `[FC3]` Display connected workspace
- [ ] `[FC4]` Show available channels
- [ ] `[FC5]` Build channel selector for projects
- [ ] `[FC6]` Add disconnect functionality
- [ ] `[FC7]` Display connection status
- [ ] `[FC8]` Handle connection errors

### Phase 6: Frontend - Notification Settings ([[Org Chart/ENG-FE/IDENTITY]])
- [ ] `[FN1]` Build NotificationSettings page
- [ ] `[FN2]` Create notification rule builder
- [ ] `[FN3]` Build event type selector
- [ ] `[FN4]` Add channel destination selector
- [ ] `[FN5]` Implement project-specific rules
- [ ] `[FN6]` Add notification preview
- [ ] `[FN7]` Build rule enable/disable toggle
- [ ] `[FN8]` Add test notification button

### Phase 7: Message Templates ([[Org Chart/ENG-BE/IDENTITY]])
- [ ] `[MT1]` Create project status change template
- [ ] `[MT2]` Create task assigned template
- [ ] `[MT3]` Create task completed template
- [ ] `[MT4]` Create deliverable ready template
- [ ] `[MT5]` Create comment mention template
- [ ] `[MT6]` Create invoice sent template
- [ ] `[MT7]` Create milestone reached template
- [ ] `[MT8]` Add rich formatting (buttons, blocks)

### Phase 8: Advanced Features ([[Org Chart/ENG-FULL/IDENTITY]])
- [ ] `[A1]` Implement thread replies for updates
- [ ] `[A2]` Add unfurling for dashboard links
- [ ] `[A3]` Build message action buttons
- [ ] `[A4]` Implement slash command: /pinkbeam task
- [ ] `[A5]` Add user mapping (Slack ↔ Dashboard)
- [ ] `[A6]` Handle @mention notifications
- [ ] `[A7]` Add DM notifications for urgent items
- [ ] `[A8]` Testing and polish

---

## 📝 Work Log

### 2026-02-09 12:00 [[Org Chart/CEO/IDENTITY]] — Task Created
- Slack integration for notifications
- Estimated 20 hours
- Keeps teams informed in real-time
- Configurable notification rules

---

## 🚧 Blockers

**Current blockers:**
- TASK-005: Dashboard foundation (for auth)
- TASK-006: Project management (for events)
- Need Slack App credentials
- Finalize notification event types

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| 2026-02-09 | Configurable notification rules | PM | Teams have different notification preferences |
| 2026-02-09 | Start with core events only | FOUNDER | Can add more event types over time |

---

## 🔗 Related

- **Parent:** [[LABS-ROADMAP.md]] — Phase 4: Integrations
- **Depends on:**
  - [[TASK-005]] — Dashboard foundation
  - [[TASK-006]] — Project management core (for events)
- **Blocks:** None
