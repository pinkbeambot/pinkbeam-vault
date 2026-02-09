---
id: WEB-015
title: Build Invoicing & Payment System
status: todo
priority: P1
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
estimated_hours: 16
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
  - WEB-009
  - WEB-011
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - payments
  - stripe
  - invoicing
  - P1
---

# WEB-015: Build Invoicing & Payment System

## 🎯 Objective
Create a complete invoicing system with Stripe integration that allows generating invoices, sending them to clients, tracking payments, and managing subscriptions.

## 📖 Context
Reliable billing and payments are essential for cash flow. This system handles one-time project invoices, recurring maintenance subscriptions, and payment tracking.

**Features:**
- Invoice generation and sending
- Stripe payment integration
- Subscription management
- Payment tracking and reminders
- Financial reporting

---

## ✅ Definition of Done

### Phase 1: Stripe Setup (ENG-BE)
- [ ] `[S1]` Create Stripe account
- [ ] `[S2]` Configure webhook endpoint
- [ ] `[S3]` Setup products and prices in Stripe
- [ ] `[S4]` Configure payment methods
- [ ] `[S5]` Setup customer portal

### Phase 2: Database Schema (ENG-BE)
- [ ] `[D1]` Update Invoice model with Stripe fields
- [ ] `[D2]` Create Subscription model
- [ ] `[D3]` Create Payment model
- [ ] `[D4]` Add migrations

### Phase 3: Invoice Generation (ENG-BE)
- [ ] `[I1]` Create invoice generation service
- [ ] `[I2]` Generate invoice numbers (auto-increment)
- [ ] `[I3]` Calculate totals, tax, discounts
- [ ] `[I4]` Support multiple line items
- [ ] `[I5]` Add project reference linking

### Phase 4: Invoice API (ENG-BE)
- [ ] `[API1]` POST /api/invoices — Create invoice
- [ ] `[API2]` GET /api/invoices — List invoices
- [ ] `[API3]` GET /api/invoices/:id — Get invoice detail
- [ ] `[API4]` PUT /api/invoices/:id — Update invoice (draft only)
- [ ] `[API5]` POST /api/invoices/:id/send — Send to client
- [ ] `[API6]` POST /api/invoices/:id/mark-paid — Record payment

### Phase 5: Stripe Integration (ENG-BE)
- [ ] `[ST1]` Create Stripe Checkout sessions
- [ ] `[ST2]` Handle payment success/cancel
- [ ] `[ST3]` Setup webhook handlers:
  - invoice.paid
  - invoice.payment_failed
  - customer.subscription.created
  - customer.subscription.updated
- [ ] `[ST4]` Sync Stripe data to database
- [ ] `[ST5]` Handle idempotency

### Phase 6: Client Invoice UI (ENG-FE)
- [ ] `[CUI1]` Create invoice list in portal
- [ ] `[CUI2]` Build invoice detail view
- [ ] `[CUI3]` Add PDF download
- [ ] `[CUI4]` Integrate "Pay Now" button (Stripe)
- [ ] `[CUI5]` Show payment status
- [ ] `[CUI6]` Display payment history

### Phase 7: Admin Invoice UI (ENG-FE)
- [ ] `[AUI1]` Create invoice list in admin
- [ ] `[AUI2]` Build invoice creation form
- [ ] `[AUI3]` Add invoice editing (draft only)
- [ ] `[AUI4]` Create "Send Invoice" action
- [ ] `[AUI5]` Add record payment manually
- [ ] `[AUI6]` Create invoice template editor

### Phase 8: Subscription Management (ENG-BE)
- [ ] `[SUB1]` Create subscription plans
- [ ] `[SUB2]` Handle subscription signup
- [ ] `[SUB3]` Handle plan changes (upgrade/downgrade)
- [ ] `[SUB4]` Handle cancellation
- [ ] `[SUB5]` Proration calculations
- [ ] `[SUB6]` Trial period handling

### Phase 9: PDF Generation (ENG-BE)
- [ ] `[PDF1]` Design invoice PDF template
- [ ] `[PDF2]` Generate PDFs dynamically
- [ ] `[PDF3]` Include company branding
- [ ] `[PDF4]` Add payment instructions

### Phase 10: Payment Reminders (ENG-BE)
- [ ] `[R1]` Schedule payment reminder emails
- [ ] `[R2]` Send 7-day reminder
- [ ] `[R3]` Send 1-day reminder
- [ ] `[R4]` Send overdue notice
- [ ] `[R5]` Track email opens

### Phase 11: Financial Reporting (ENG-FE)
- [ ] `[REP1]` Create revenue dashboard
- [ ] `[REP2]` Show outstanding invoices
- [ ] `[REP3]` Display monthly revenue chart
- [ ] `[REP4]` Show payment method breakdown
- [ ] `[REP5]` Export to CSV/Excel

### Phase 12: Testing (ENG-BE)
- [ ] `[T1]` Test invoice creation
- [ ] `[T2]` Test Stripe checkout flow
- [ ] `[T3]` Test webhook handling
- [ ] `[T4]` Test PDF generation
- [ ] `[T5]` Test subscription flows
- [ ] `[T6]` Test in Stripe test mode

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Create Stripe account
- [ ] Design invoice template
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)
- WEB-009 (Client Portal)
- WEB-011 (API)  
**Notes:** Always use Stripe test mode during development. Never test with real cards.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)
- WEB-009 (Client Portal Dashboard)
- WEB-011 (Core REST API)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Stripe Checkout (hosted) | PCI compliance handled by Stripe, secure, conversion-optimized |
| 2026-02-09 | Stripe Customer Portal | Self-service subscription management reduces support load |
| 2026-02-09 | PDF invoice generation | Professional, printable, common client expectation |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 7: Advanced Financials
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
  - WEB-009 (Client Portal)
  - WEB-011 (API)
- **Blocks:** None
- **Related:**
  - [[WEB-009-client-portal-dashboard]] — Invoices displayed here
  - [[WEB-010-admin-dashboard]] — Invoice management here

---

## 📐 Technical Notes

### Stripe Checkout Flow
```
1. Admin creates invoice → Status: DRAFT
2. Admin sends invoice → Status: SENT
3. Client clicks "Pay Now"
4. Create Stripe Checkout Session
5. Redirect to Stripe
6. Payment success → Webhook → Status: PAID
7. Payment failure → Webhook → Status: OVERDUE
```

### Invoice Model
```typescript
interface Invoice {
  id: string;
  invoiceNumber: string;
  status: InvoiceStatus;
  
  // Amounts
  subtotal: number;
  taxRate?: number;
  taxAmount?: number;
  total: number;
  amountPaid: number;
  amountDue: number;
  
  // Dates
  issueDate: Date;
  dueDate: Date;
  paidAt?: Date;
  
  // Relations
  clientId: string;
  projectId?: string;
  items: InvoiceItem[];
  
  // Stripe
  stripeInvoiceId?: string;
  stripeCheckoutSessionId?: string;
}

type InvoiceStatus = 'DRAFT' | 'SENT' | 'VIEWED' | 'PARTIAL' | 'PAID' | 'OVERDUE' | 'CANCELLED';
```

### Webhook Handler
```typescript
// app/api/webhooks/stripe/route.ts
export async function POST(req: Request) {
  const payload = await req.text();
  const sig = req.headers.get('stripe-signature');
  
  const event = stripe.webhooks.constructEvent(
    payload, 
    sig!, 
    process.env.STRIPE_WEBHOOK_SECRET!
  );
  
  switch (event.type) {
    case 'invoice.paid':
      await handleInvoicePaid(event.data.object);
      break;
    case 'invoice.payment_failed':
      await handlePaymentFailed(event.data.object);
      break;
    // ... other events
  }
  
  return Response.json({ received: true });
}
```

### Invoice Number Format
```
YYYY-XXXX where XXXX is sequential
2026-0001, 2026-0002, etc.
```

---

*Never store raw credit card numbers — always use Stripe tokens*
