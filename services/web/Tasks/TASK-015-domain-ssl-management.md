---
id: "TASK-015"
title: "Domain/SSL Management"
status: "todo"
priority: "P2"
created_at: "2026-02-09T12:51:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: ""
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 14
actual_hours: 0
dependencies:
  - "TASK-014"
blocks: []

is_active: false
verified_by: ""

phase_reviews: []

tags:
  - "web"
  - "domains"
  - "ssl"
  - "P2"
  - "integration"
---

# TASK-015: Domain/SSL Management

## 🎯 Objective
Build a domain and SSL certificate management system that tracks client domains, monitors SSL expiration, and manages DNS configurations for websites under maintenance.

## 📖 Context
Domain and SSL management is often overlooked until something breaks. Proactive monitoring and management prevents downtime from expired certificates and DNS issues.

**Management Features:**
- Domain expiration tracking
- SSL certificate monitoring
- DNS record management
- Registrar integration
- SSL auto-renewal coordination

**Wait for:**
- [[TASK-014]] — Maintenance plan management (SSL included in plans)

---

## ✅ Definition of Done

### Phase 1: UI - Domain Management
- [ ] `[1.1]` Domain list view:
  - [ ] `[1.1a]` Domain name and status
  - [ ] `[1.1b]` Expiration date with warning indicators
  - [ ] `[1.1c]` SSL status
  - [ ] `[1.1d]` DNS health check
  - [ ] `[1.1e]` Registrar information
- [ ] `[1.2]` Domain detail view:
  - [ ] `[1.2a]` Domain overview card
  - [ ] `[1.2b]` Expiration timeline
  - [ ] `[1.2c]` SSL certificate details
  - [ ] `[1.2d]` DNS records table
  - [ ] `[1.2e]` Nameserver information
- [ ] `[1.3]` Add domain flow:
  - [ ] `[1.3a]` Domain input and validation
  - [ ] `[1.3b]` Auto-discovery of records
  - [ ] `[1.3c]` Registrar information capture
  - [ ] `[1.3d]` SSL certificate import

### Phase 2: Backend - Monitoring
- [ ] `[2.1]` Database schema:
  - [ ] `[2.1a]` Domains table
    - id, client_id, domain_name, registrar, registrar_url
    - registration_date, expiration_date, auto_renew
    - nameservers, status
  - [ ] `[2.1b]` SSL certificates table
    - id, domain_id, issuer, issued_date, expiration_date
    - certificate_type, auto_renew, last_checked
  - [ ] `[2.1c]` DNS records table
    - id, domain_id, record_type, name, value, ttl, priority
- [ ] `[2.2]` WHOIS monitoring:
  - [ ] `[2.2a]` WHOIS data fetching
  - [ ] `[2.2b]` Expiration date tracking
  - [ ] `[2.2c]` Registrar change detection
  - [ ] `[2.2d]` Daily checks
- [ ] `[2.3]` SSL monitoring:
  - [ ] `[2.3a]` Certificate fetching and parsing
  - [ ] `[2.3b]` Expiration tracking
  - [ ] `[2.3c]` Certificate chain validation
  - [ ] `[2.3d]` Daily health checks
- [ ] `[2.4]` DNS monitoring:
  - [ ] `[2.4a]` DNS resolution checks
  - [ ] `[2.4b]` Record change detection
  - [ ] `[2.4c]` Propagation monitoring
  - [ ] `[2.4d]` MX/SPF/DKIM validation

### Phase 3: Alerts & Notifications
- [ ] `[3.1]` Expiration alerts:
  - [ ] `[3.1a]` Domain expiration (90, 60, 30, 14, 7 days)
  - [ ] `[3.1b]` SSL expiration (30, 14, 7, 1 days)
  - [ ] `[3.1c]` Alert to both client and admin
  - [ ] `[3.1d]` Escalation for critical dates
- [ ] `[3.2]` Issue alerts:
  - [ ] `[3.2a]` SSL certificate errors
  - [ ] `[3.2b]` DNS resolution failures
  - [ ] `[3.2c]` Nameserver changes
  - [ ] `[3.2d]` Domain status changes
- [ ] `[3.3]` Renewal coordination:
  - [ ] `[3.3a]` Auto-renewal verification
  - [ ] `[3.3b]` Manual renewal reminders
  - [ ] `[3.3c]` Renewal completion tracking

### Phase 4: Management Tools
- [ ] `[4.1]` DNS management:
  - [ ] `[4.1a]` View current DNS records
  - [ ] `[4.1b]` Record change recommendations
  - [ ] `[4.1c]` DNS propagation checker
  - [ ] `[4.1d]` Common record templates
- [ ] `[4.2]` SSL management:
  - [ ] `[4.2a]` SSL certificate details
  - [ ] `[4.2b]` Let's Encrypt integration (if applicable)
  - [ ] `[4.2c]` Certificate installation guide
  - [ ] `[4.2d]` Mixed content scanner
- [ ] `[4.3]` Domain tools:
  - [ ] `[4.3a]` Domain availability checker
  - [ ] `[4.3b]` Domain transfer assistance
  - [ ] `[4.3c]` Privacy protection status
  - [ ] `[4.3d]` Domain lock status

---

## 📝 Work Log

*No work logged yet*

---

## 🚧 Blockers

**Current blockers:**
- Waiting for [[TASK-014]] — Maintenance plan management

---

## 💬 Decisions

| Date | Decision | Made By | Rationale |
|------|----------|---------|-----------|
| | | | |

---

## 🔗 Related

- **Parent:** [[WEB-ROADMAP.md]] — Phase 3: Integration
- **Depends on:**
  - [[TASK-014]] — Maintenance plan management
- **Blocks:** None
- **Related Docs:** Domain registrar APIs, SSL certificate authorities
