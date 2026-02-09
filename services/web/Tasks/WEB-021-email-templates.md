---
id: WEB-021
title: Implement Email Template System
status: todo
priority: P2
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/DESIGN-BRAND/IDENTITY]]"
  - "[[Org Chart/CMO/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 8
actual_hours: 0
dependencies:
  - WEB-007
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - email
  - templates
  - resend
  - P2
---

# WEB-021: Implement Email Template System

## 🎯 Objective
Create a comprehensive email template system using React Email and Resend that ensures consistent, branded communication across all automated and manual emails.

## 📖 Context
Email is a primary touchpoint with clients. Professional, consistent emails reinforce our brand and build trust. This system provides reusable templates for all communication needs.

**Email Types:**
- Transactional: Invoices, password resets, notifications
- Marketing: Newsletters, promotions
- Automated: Welcome sequences, reminders

---

## ✅ Definition of Done

### Phase 1: Setup (ENG-BE)
- [ ] `[S1]` Install React Email
- [ ] `[S2]` Install Resend SDK
- [ ] `[S3]` Setup email preview server
- [ ] `[S4]` Configure Resend API keys
- [ ] `[S5]` Setup email sending service

### Phase 2: Base Components (ENG-BE)
- [ ] `[B1]` Create EmailLayout component
- [ ] `[B2]` Create EmailHeader component (with logo)
- [ ] `[B3]` Create EmailFooter component
- [ ] `[B4]` Create Button component
- [ ] `[B5]` Create Text components (heading, paragraph)
- [ ] `[B6]` Create Divider component

### Phase 3: Transactional Templates (ENG-BE)
- [ ] `[T1]` Welcome email template
- [ ] `[T2]` Password reset template
- [ ] `[T3]` Invoice notification template
- [ ] `[T4]` Payment confirmation template
- [ ] `[T5]` Payment reminder template
- [ ] `[T6]` Quote received confirmation
- [ ] `[T7]` Project status update template
- [ ] `[T8]` File uploaded notification

### Phase 4: Marketing Templates (ENG-BE)
- [ ] `[M1]` Newsletter template
- [ ] `[M2]` Promotional email template
- [ ] `[M3]` Event invitation template

### Phase 5: Automated Sequence Templates (ENG-BE)
- [ ] `[A1]` Quote follow-up (day 1)
- [ ] `[A2]` Quote follow-up (day 3)
- [ ] `[A3]` Quote follow-up (day 7)
- [ ] `[A4]` Onboarding sequence emails
- [ ] `[A5]` Project completion follow-up

### Phase 6: Admin Templates (ENG-BE)
- [ ] `[AD1]` New quote notification (admin)
- [ ] `[AD2]` New ticket notification (admin)
- [ ] `[AD3]` Daily summary email
- [ ] `[AD4]` Weekly report email

### Phase 7: Template Management (ENG-FE)
- [ ] `[TM1]` Create template preview page
- [ ] `[TM2]` Add template variables documentation
- [ ] `[TM3]` Create template testing interface

### Phase 8: Styling & Branding (Design-Brand)
- [ ] `[ST1]` Apply brand colors
- [ ] `[ST2]` Add logo to header
- [ ] `[ST3]` Style buttons with brand colors
- [ ] `[ST4]` Create dark mode variants
- [ ] `[ST5]` Ensure mobile responsiveness

### Phase 9: Testing (ENG-BE)
- [ ] `[TEST1]` Test all templates in email preview
- [ ] `[TEST2]` Test email rendering in major clients (Gmail, Outlook, Apple)
- [ ] `[TEST3]` Send test emails
- [ ] `[TEST4]` Verify all variables render correctly

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Get Resend API key
- [ ] Review email copy with CMO
**Blockers:** 
- WEB-007 (Database — for template storage if needed)  
**Notes:** React Email lets us use React components for emails with great developer experience.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | React Email + Resend | Modern stack, great DX, good deliverability |
| 2026-02-09 | Inline styles for emails | Best email client compatibility |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** WEB-007 (Database)
- **Blocks:** None
- **Related:**
  - [[WEB-019-notification-system]] — Uses these templates
  - [[WEB-015-invoicing-payment-system]] — Sends invoice emails

---

## 📐 Technical Notes

### React Email Structure
```
emails/
├── components/
│   ├── EmailLayout.tsx
│   ├── EmailHeader.tsx
│   ├── EmailFooter.tsx
│   ├── Button.tsx
│   └── Text.tsx
├── templates/
│   ├── WelcomeEmail.tsx
│   ├── PasswordResetEmail.tsx
│   ├── InvoiceEmail.tsx
│   └── ...
└── index.ts
```

### Email Component Example
```tsx
// emails/templates/WelcomeEmail.tsx
import { Html, Head, Preview, Body, Container } from '@react-email/components';
import { EmailLayout } from '../components/EmailLayout';
import { Button } from '../components/Button';

interface WelcomeEmailProps {
  name: string;
  loginUrl: string;
}

export function WelcomeEmail({ name, loginUrl }: WelcomeEmailProps) {
  return (
    <Html>
      <Head />
      <Preview>Welcome to Pink Beam!</Preview>
      <Body>
        <EmailLayout>
          <Heading>Welcome, {name}!</Heading>
          <Text>
            Your account is ready. Get started by exploring your client portal.
          </Text>
          <Button href={loginUrl}>Go to Portal</Button>
        </EmailLayout>
      </Body>
    </Html>
  );
}
```

### Sending Email
```typescript
import { Resend } from 'resend';
import { WelcomeEmail } from './emails/templates/WelcomeEmail';

const resend = new Resend(process.env.RESEND_API_KEY);

async function sendWelcomeEmail(user: User) {
  await resend.emails.send({
    from: 'Pink Beam <hello@pinkbeam.ai>',
    to: user.email,
    subject: 'Welcome to Pink Beam!',
    react: WelcomeEmail({ name: user.name, loginUrl: '...' })
  });
}
```

---

*Every email is a brand touchpoint — make it count*
