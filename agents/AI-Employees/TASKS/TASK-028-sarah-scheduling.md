---
id: "TASK-028"
title: "Sarah Weekly Scheduling"
status: "todo"
priority: "P1"
created_at: "2026-02-07T22:00:00Z"
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""

assigned_to: "[[Org Chart/ENG-FE/IDENTITY]]"
collaborators: []
current_worker: ""
next_worker: ""

estimated_hours: 6
actual_hours: 0
dependencies:
  - "TASK-027"
blocks: []

is_active: false
verified_by: ""

tags:
  - "engineering"
  - "ai"
  - "sarah"
  - "P1"
---

# TASK-028: Sarah Weekly Scheduling

## 🎯 Objective
Set up automated weekly brief generation using pg_cron.

## Implementation

1. **Enable pg_cron**
   - Install extension in Supabase
   - Configure cron job

2. **Create Scheduled Function**
   - Query all active Sarah configs
   - Generate brief for each user
   - Handle errors gracefully

3. **Add Scheduling UI**
   - Day selector (Monday-Friday)
   - Time selector
   - Timezone support

4. **Test**
   - Schedule test briefs
   - Verify timing accuracy
   - Monitor for failures

## Success Criteria
- [ ] Briefs generate automatically on schedule
- [ ] Users can configure day/time
- [ ] Failed jobs are retried
- [ ] Delivery notifications sent

## Output

Automated weekly scheduling system.
