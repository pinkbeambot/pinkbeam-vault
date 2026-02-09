---
id: "TASK-011"
title: "Build Workshop Booking Integration"
status: "todo"
priority: "P1"
created_at: "2026-02-09T12:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 8
actual_hours: 0
dependencies:
  - "TASK-007"
blocks:
  - "TASK-015"

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "marketing"
  - "P1"
  - "booking"
  - "integration"
---

# TASK-011: Build Workshop Booking Integration

## 🎯 Objective
Integrate a professional booking system for workshop scheduling that allows prospects to view availability, book sessions, receive confirmations, and manage their appointments with automated reminders.

## 📖 Context
Frictionless booking removes a major barrier to conversion. The system needs to handle different workshop types, multiple consultants' calendars, time zones, and integrate with our CRM for follow-up workflows.

---

## ✅ Definition of Done

### Phase 1: Booking Platform Selection
- [ ] `[1.1]` Evaluate and select platform:
  - [ ] `[1.1a]` Calendly (Team/Enterprise)
  - [ ] `[1.1b]` SavvyCal
  - [ ] `[1.1c]` Cal.com (self-hosted option)
  - [ ] `[1.1d]` Custom-built solution
- [ ] `[1.2]` Configure selected platform:
  - [ ] `[1.2a]` Connect consultant calendars
  - [ ] `[1.2b]` Set availability rules
  - [ ] `[1.2c]` Configure buffer times
  - [ ] `[1.2d]` Set up time zone handling

### Phase 2: Workshop Event Types
- [ ] `[2.1]` Create booking event types:
  - [ ] `[2.1a]` Discovery Call (30 min, free)
  - [ ] `[2.1b]` AI Strategy Workshop (half-day)
  - [ ] `[2.1c]` Digital Transformation Workshop (full-day)
  - [ ] `[2.1d]` Process Automation Workshop (half-day)
  - [ ] `[2.1e]` Custom Workshop Consultation (45 min)
- [ ] `[2.2]` Configure each event type:
  - [ ] `[2.2a]` Duration and description
  - [ ] `[2.2b]` Pre-booking questions
  - [ ] `[2.2c]` Pricing (if applicable)
  - [ ] `[2.2d]` Confirmation settings
  - [ ] `[2.2e]` Cancellation policy

### Phase 3: Embedded Booking Widget
- [ ] `[3.1]` Integrate booking on site:
  - [ ] `[3.1a]` Embed on workshop pages
  - [ ] `[3.1b]` Modal popup option
  - [ ] `[3.1c]` Inline embed styling
  - [ ] `[3.1d]` Mobile-responsive design
  - [ ] `[3.1e]` Loading states
- [ ] `[3.2]` Create booking CTAs throughout site:
  - [ ] `[3.2a]` Service pages
  - [ ] `[3.2b]` Case study pages
  - [ ] `[3.2c]` Blog posts (contextual)

### Phase 4: Pre-Booking Questions
- [ ] `[4.1]` Create intake forms:
  - [ ] `[4.1a]` Company name and size
  - [ ] `[4.1b]` Industry
  - [ ] `[4.1c]` Current challenges/goals
  - [ ] `[4.1d]` Budget range
  - [ ] `[4.1e]` Timeline
  - [ ] `[4.1f]` How they heard about us
- [ ] `[4.2]` Configure conditional logic:
  - [ ] `[4.2a]` Show relevant questions per workshop type
  - [ ] `[4.2b]` Skip irrelevant sections

### Phase 5: Notifications & Reminders
- [ ] `[5.1]` Set up email communications:
  - [ ] `[5.1a]` Booking confirmation email
  - [ ] `[5.1b]` Calendar invite (.ics)
  - [ ] `[5.1c]` 24-hour reminder
  - [ ] `[5.1d]` 1-hour reminder
  - [ ] `[5.1e]` Post-meeting follow-up
  - [ ] `[5.1f]` Cancellation notification
- [ ] `[5.2]` Customize email templates:
  - [ ] `[5.2a]` Pink Beam branding
  - [ ] `[5.2b]` Workshop-specific details
  - [ ] `[5.2c]` Preparation instructions
  - [ ] `[5.2d]` Video call links (Zoom/Meet)

### Phase 6: CRM Integration
- [ ] `[6.1]` Connect to HubSpot:
  - [ ] `[6.1a]` Create contact on booking
  - [ ] `[6.1b]` Log booking activity
  - [ ] `[6.1c]` Add to appropriate list/workflow
  - [ ] `[6.1d]` Trigger follow-up sequences
- [ ] `[6.2]` Set up workflows:
  - [ ] `[6.2a]` Post-booking nurture sequence
  - [ ] `[6.2b]` No-show follow-up
  - [ ] `[6.2c]` Rescheduling flow

### Phase 7: Payment Integration (Optional)
- [ ] `[7.1]` Configure paid bookings:
  - [ ] `[7.1a]` Stripe integration
  - [ ] `[7.1b]` Require payment before confirmation
  - [ ] `[7.1c]` Invoice generation
  - [ ] `[7.1d]` Refund handling

### Phase 8: Team Scheduling
- [ ] `[8.1]` Set up round-robin:
  - [ ] `[8.1a]` Distribute bookings across team
  - [ ] `[8.1b]` Priority assignment rules
  - [ ] `[8.1c]` Specialty-based routing
- [ ] `[8.2]` Add team member profiles:
  - [ ] `[8.2a]` Photos and bios
  - [ ] `[8.2b]` Specializations
  - [ ] `[8.2c]` Availability per person

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

- Waiting for: TASK-007 (Engagement Models Pages)

---

## 🔗 Related

- **Depends on:** TASK-007
- **Blocks:** TASK-015 (Admin - Client Management)
- **Related Docs:** README.md (Integrations section)
