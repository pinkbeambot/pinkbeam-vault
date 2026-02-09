---
id: WEB-019
title: Build Notification System
status: todo
priority: P2
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
estimated_hours: 12
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - notifications
  - email
  - P2
---

# WEB-019: Build Notification System

## 🎯 Objective
Create a comprehensive notification system that keeps users informed through in-app notifications, email alerts, and push notifications (future) for important events.

## 📖 Context
Timely notifications keep clients engaged and informed. This system handles everything from project updates to payment reminders, ensuring nothing falls through the cracks.

**Channels:**
- In-app notification center
- Email notifications
- Push notifications (Phase 2)

---

## ✅ Definition of Done

### Phase 1: Database Schema (ENG-BE)
- [ ] `[D1]` Create Notification model
- [ ] `[D2]` Create NotificationPreference model
- [ ] `[D3]` Add migration
- [ ] `[D4]` Create indexes for querying

### Phase 2: Notification Service (ENG-BE)
- [ ] `[S1]` Create notification service
- [ ] `[S2]` Implement notification types enum
- [ ] `[S3]` Add notification creation methods
- [ ] `[S4]` Implement notification dispatch
- [ ] `[S5]` Add batch notification support

### Phase 3: Notification Types (ENG-BE)
- [ ] `[T1]` PROJECT_STATUS_CHANGED
- [ ] `[T2]` TASK_ASSIGNED
- [ ] `[T3]` COMMENT_ADDED
- [ ] `[T4]` FILE_UPLOADED
- [ ] `[T5]` FILE_APPROVED
- [ ] `[T6]` INVOICE_CREATED
- [ ] `[T7]` INVOICE_PAID
- [ ] `[T8]` PAYMENT_DUE
- [ ] `[T9]` TICKET_UPDATED
- [ ] `[T10]` MILESTONE_REACHED

### Phase 4: Email Notifications (ENG-BE)
- [ ] `[E1]` Setup Resend templates for each type
- [ ] `[E2]` Create email sending service
- [ ] `[E3]` Add email queue (BullMQ)
- [ ] `[E4]` Implement digest emails (daily/weekly)
- [ ] `[E5]` Add email open tracking

### Phase 5: In-App Notifications (ENG-FE)
- [ ] `[I1]` Create notification bell icon
- [ ] `[I2]` Build notification dropdown/panel
- [ ] `[I3]` Show unread count badge
- [ ] `[I4]` Create notification list view
- [ ] `[I5]` Add mark as read functionality
- [ ] `[I6]` Add mark all as read
- [ ] `[I7]` Implement real-time updates (polling)

### Phase 6: Preferences (ENG-FE)
- [ ] `[P1]` Create notification settings page
- [ ] `[P2]` Add per-type preferences
- [ ] `[P3]` Add channel preferences (in-app, email)
- [ ] `[P4]` Add digest frequency settings

### Phase 7: API Endpoints (ENG-BE)
- [ ] `[API1]` GET /api/notifications — List notifications
- [ ] `[API2]` PUT /api/notifications/:id/read — Mark read
- [ ] `[API3]` PUT /api/notifications/read-all — Mark all read
- [ ] `[API4]` GET /api/notifications/unread-count
- [ ] `[API5]` GET /api/notification-preferences
- [ ] `[API6]` PUT /api/notification-preferences

### Phase 8: Trigger Points (ENG-BE)
- [ ] `[TR1]` Hook into project status changes
- [ ] `[TR2]` Hook into task assignments
- [ ] `[TR3]` Hook into comment creation
- [ ] `[TR4]` Hook into file uploads
- [ ] `[TR5]` Hook into invoice events
- [ ] `[TR6]` Hook into ticket updates

### Phase 9: Templates (ENG-BE)
- [ ] `[TMP1]` Create email HTML templates
- [ ] `[TMP2]` Add plain text versions
- [ ] `[TMP3]` Style with brand colors
- [ ] `[TMP4]` Add call-to-action buttons

### Phase 10: Testing (ENG-BE + ENG-FE)
- [ ] `[TEST1]` Test each notification type
- [ ] `[TEST2]` Test email delivery
- [ ] `[TEST3]` Test preference changes
- [ ] `[TEST4]` Test real-time updates

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Design notification UI
- [ ] Write email templates
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)  
**Notes:** Start with email + in-app. Push notifications can be Phase 2.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Start with polling for real-time | Simpler than WebSockets, upgrade later if needed |
| 2026-02-09 | Queue emails with BullMQ | Don't block API requests, handle retries |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
- **Blocks:** None
- **Related:**
  - [[WEB-009-client-portal-dashboard]] — Notification bell lives here

---

## 📐 Technical Notes

### Notification Model
```typescript
interface Notification {
  id: string;
  userId: string;
  type: NotificationType;
  
  title: string;
  message: string;
  data: Record<string, any>; // Link IDs, etc.
  
  // Status
  isRead: boolean;
  readAt?: Date;
  
  // Channels sent
  channels: {
    inApp: boolean;
    email: boolean;
  };
  
  createdAt: Date;
}

type NotificationType = 
  | 'PROJECT_STATUS_CHANGED'
  | 'TASK_ASSIGNED'
  | 'COMMENT_ADDED'
  | 'FILE_UPLOADED'
  | 'FILE_APPROVED'
  | 'INVOICE_CREATED'
  | 'INVOICE_PAID'
  | 'PAYMENT_DUE'
  | 'TICKET_UPDATED'
  | 'MILESTONE_REACHED';
```

### Notification Preferences
```typescript
interface NotificationPreferences {
  userId: string;
  
  // Per-type settings
  projectUpdates: {
    inApp: boolean;
    email: boolean;
  };
  taskAssignments: {
    inApp: boolean;
    email: boolean;
  };
  // ... etc for each type
  
  // Digest settings
  digestFrequency: 'never' | 'daily' | 'weekly';
  digestDay?: 'monday' | 'friday';
}
```

### Creating Notifications
```typescript
// After project status change
await notificationService.create({
  userId: project.clientId,
  type: 'PROJECT_STATUS_CHANGED',
  title: 'Project Status Updated',
  message: `Your project "${project.name}" is now ${newStatus}`,
  data: {
    projectId: project.id,
    status: newStatus
  }
});
```

---

*Don't over-notify — respect user attention*
