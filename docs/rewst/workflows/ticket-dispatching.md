---
id: 'd3b9f5a7-2c8e-4d1f-9b6a-4e7c2d8f5b3a'
slug: /d3b9f5a7-2c8e-4d1f-9b6a-4e7c2d8f5b3a
title: 'Automated Ticket Dispatching'
title_meta: 'Automated Ticket Dispatching'
keywords: ['ticket dispatching', 'automation', 'psa', 'routing', 'assignment', 'technician', 'load balancing', 'workflow']
description: 'Automatically dispatch and assign support tickets to the most appropriate technicians based on skills, availability, workload, and SLA requirements. Optimize ticket resolution times with intelligent dispatching.'
tags: ['psa', 'automation', 'ticketing']
draft: false
unlisted: false
---

# Summary

This workflow automates the ticket dispatching process by intelligently assigning incoming support tickets to the most qualified and available technicians. The solution evaluates multiple factors including technician skills, certifications, current workload, availability schedules, historical performance, customer preferences, and SLA requirements to make optimal assignment decisions. By eliminating manual dispatching overhead, the workflow ensures faster ticket response times, balanced workload distribution, and improved customer satisfaction through consistent and fair ticket allocation.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **PSA Integration**: Configure your PSA system integration (ConnectWise Manage, Autotask, Halo PSA, etc.) with the following permissions:
   - Ticket read and update access
   - Technician/resource read access
   - Schedule/calendar read access
   - Service board access
   - Time entry read access (for workload calculation)
   - Company/client read access
   - SLA policy access

2. **Technician Skills Database**: Maintain an updated skills matrix including:
   - Technical competencies and certifications
   - Product/vendor specializations
   - Language capabilities
   - Industry expertise
   - Skill proficiency levels (beginner, intermediate, expert)

3. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `dispatching_enabled`: Boolean to enable/disable automatic dispatching
   - `dispatching_mode`: `skills_based`, `round_robin`, `least_busy`, or `hybrid`
   - `max_tickets_per_technician`: Maximum active tickets per technician
   - `workload_calculation_method`: How to calculate current workload (`ticket_count`, `estimated_hours`, `weighted`)
   - `sla_priority_weight`: How heavily to weight SLA urgency (0.0-1.0)
   - `skill_match_threshold`: Minimum skill match percentage required (0-100)
   - `allow_overflow_assignment`: Assign even if technician is at capacity
   - `business_hours_only`: Only dispatch during business hours
   - `preferred_tech_priority`: Whether to honor customer preferred technician requests

4. **Availability Management**: Ensure the following are configured:
   - Technician work schedules (standard hours, shifts)
   - Time-off and vacation calendars
   - On-call schedules
   - Break schedules
   - Out-of-office status tracking

5. **Assignment Rules**: Define rules for:
   - VIP customer handling
   - Escalation paths
   - Specialized ticket types (e.g., security incidents)
   - Geographic/time zone considerations
   - Account-specific technician assignments

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the required PSA integration
3. Set up the organizational variables listed above
4. Create and maintain technician skills profiles
5. Define ticket category to skill mappings
6. Configure workload calculation parameters
7. Set up availability tracking integrations
8. Define assignment rules and preferences
9. Configure notification settings for assignments
10. Set up fallback/overflow assignment rules
11. Test the workflow with various ticket scenarios

## Workflow Inputs

The workflow can be executed with the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ticket_id` | String | Yes | The PSA ticket ID to dispatch |
| `ticket_category` | String | Yes | Ticket category/type for skill matching |
| `ticket_priority` | String | Yes | Priority level (Low, Medium, High, Critical) |
| `ticket_board` | String | Yes | Service board the ticket belongs to |
| `company_id` | String | Yes | Company/client ID for preferred tech lookup |
| `required_skills` | Array | No | Specific skills required for the ticket |
| `sla_due_date` | String | No | SLA deadline for the ticket (ISO 8601) |
| `customer_preferred_tech` | String | No | Customer's preferred technician ID |
| `geographic_location` | String | No | Location for geographic routing |
| `language_requirement` | String | No | Required language (e.g., `Spanish`, `French`) |
| `exclude_technicians` | Array | No | Technician IDs to exclude from assignment |
| `force_assignment` | Boolean | No | Assign even if no perfect match. Default: `true` |
| `override_workload_limit` | Boolean | No | Allow assignment over workload limit. Default: `false` |
| `dispatch_immediately` | Boolean | No | Dispatch immediately or queue for next cycle. Default: `true` |

## Execution

### Event-Driven Trigger (Recommended)
Configure the workflow to trigger automatically when:
- A new ticket is created in unassigned status
- A ticket is moved to a dispatching queue
- A ticket is escalated and needs reassignment
- A ticket is returned/rejected by a technician
- SLA deadline is approaching on unassigned ticket

### Scheduled Batch Processing
Run the workflow on a schedule to process unassigned tickets:
1. Configure the workflow to run every 5-15 minutes
2. Query for all unassigned tickets in dispatch queues
3. Process tickets in priority order
4. Dispatch multiple tickets in a single execution

### Manual Dispatch
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter the ticket ID and any specific requirements
4. Review recommended technicians before confirming
5. Click "Execute" to assign the ticket

### API Trigger
Integrate with external dispatch systems or custom interfaces by calling the Rewst API endpoint with ticket details in JSON format.

## Dispatching Logic

The workflow evaluates technicians using the following criteria:

### 1. Skills Matching
- Matches ticket category/type to technician skills
- Evaluates required certifications or specializations
- Considers skill proficiency levels
- Calculates skill match percentage

### 2. Availability Assessment
- Checks current work schedule and shift status
- Verifies not on vacation or time off
- Confirms not in meetings or training
- Validates within working hours (if configured)

### 3. Workload Evaluation
- Counts current active tickets
- Calculates total estimated hours remaining
- Considers ticket priorities and deadlines
- Applies weighted scoring if configured

### 4. Performance Metrics
- Reviews average resolution time for similar tickets
- Considers customer satisfaction scores
- Evaluates ticket completion rate
- Factors in escalation history

### 5. Customer Preferences
- Honors customer-requested technicians
- Considers previous technician assignments
- Respects account-specific technician assignments
- Applies VIP customer preferences

### 6. SLA Compliance
- Prioritizes tickets approaching SLA breach
- Assigns to technicians with best on-time performance
- Considers timezone alignment for global support

### 7. Geographic/Language Factors
- Matches technician location to ticket location (if applicable)
- Ensures language requirements are met
- Considers on-site vs remote support capabilities

## Scoring Algorithm

Each technician receives a composite score based on weighted factors:

```
Total Score = (Skill Match × 0.30) + 
              (Availability × 0.25) + 
              (Workload × 0.20) + 
              (Performance × 0.15) + 
              (Customer Preference × 0.10)
```

The technician with the highest score is assigned the ticket. Weights can be customized in the workflow configuration.

## Post-Execution Steps

After the workflow completes successfully:

1. **Verify Assignment**:
   - Confirm the ticket was assigned to a technician in the PSA
   - Verify the assignment shows in the technician's queue
   - Check that assignment timestamp is recorded

2. **Notification Confirmation**:
   - Verify technician received assignment notification
   - Confirm ticket details are accessible to technician
   - Check that customer received assignment notification (if configured)

3. **Monitor Response**:
   - Track time to first response
   - Monitor for technician acceptance/rejection
   - Watch for SLA compliance

4. **Handle Exceptions**:
   - Review any tickets that couldn't be dispatched
   - Address technicians who are over capacity
   - Investigate failed assignments

5. **Reporting**:
   - Update dispatch metrics dashboard
   - Track assignment distribution across technicians
   - Monitor average time-to-dispatch

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "ticket_id": "12345",
  "ticket_info": {
    "subject": "Email connection issues in Outlook",
    "category": "Email Support",
    "priority": "High",
    "board": "Service Desk",
    "company": "Acme Corporation",
    "sla_due": "2026-01-13T18:00:00Z",
    "sla_hours_remaining": 2.5
  },
  "dispatching_results": {
    "assigned": true,
    "assigned_technician": {
      "technician_id": "tech-456",
      "name": "Sarah Johnson",
      "email": "sarah.johnson@company.com",
      "phone": "+1-555-0123",
      "specialization": "Email & Communication"
    },
    "assignment_timestamp": "2026-01-13T15:30:00Z",
    "time_to_dispatch_seconds": 12,
    "assignment_method": "skills_based"
  },
  "evaluation_summary": {
    "candidates_evaluated": 8,
    "candidates_available": 6,
    "candidates_qualified": 4,
    "top_candidate_score": 87.5,
    "assignment_confidence": "high"
  },
  "assigned_technician_details": {
    "current_workload": {
      "active_tickets": 7,
      "capacity_percentage": 70,
      "estimated_hours_remaining": 14.5
    },
    "skill_match": {
      "primary_skills_matched": ["Email Support", "Office 365", "Exchange"],
      "skill_match_percentage": 95,
      "certifications": ["Microsoft 365 Certified", "CompTIA A+"]
    },
    "availability": {
      "status": "available",
      "current_shift": "Morning (8:00 AM - 4:00 PM)",
      "breaks_scheduled": [],
      "next_meeting": "2026-01-13T16:00:00Z"
    },
    "performance_metrics": {
      "average_resolution_time_hours": 3.2,
      "customer_satisfaction_score": 4.7,
      "tickets_resolved_this_week": 12,
      "on_time_resolution_rate": 94.5
    },
    "customer_history": {
      "previous_tickets_for_company": 15,
      "customer_satisfaction_avg": 4.8,
      "preferred_technician": true
    }
  },
  "alternative_candidates": [
    {
      "technician_id": "tech-789",
      "name": "Michael Chen",
      "score": 82.3,
      "skill_match_percentage": 90,
      "current_workload": 8,
      "reason_not_selected": "Slightly lower skill match and higher workload"
    },
    {
      "technician_id": "tech-234",
      "name": "Emily Rodriguez",
      "score": 78.9,
      "skill_match_percentage": 85,
      "current_workload": 5,
      "reason_not_selected": "Not customer's preferred technician"
    }
  ],
  "dispatching_rules_applied": [
    {
      "rule": "customer_preferred_technician",
      "applied": true,
      "impact": "+10 points to score"
    },
    {
      "rule": "sla_urgency_boost",
      "applied": true,
      "impact": "Prioritized high-score available technicians"
    },
    {
      "rule": "workload_balancing",
      "applied": true,
      "impact": "Excluded technicians over 85% capacity"
    }
  ],
  "notifications_sent": {
    "technician_notification": {
      "sent": true,
      "recipient": "sarah.johnson@company.com",
      "channels": ["email", "mobile_push"],
      "timestamp": "2026-01-13T15:30:05Z"
    },
    "customer_notification": {
      "sent": true,
      "recipient": "contact@acmecorp.com",
      "message": "Your ticket has been assigned to Sarah Johnson",
      "timestamp": "2026-01-13T15:30:10Z"
    },
    "manager_notification": {
      "sent": false,
      "reason": "High priority threshold not met"
    }
  },
  "sla_tracking": {
    "sla_policy": "4-Hour Response Time",
    "sla_deadline": "2026-01-13T18:00:00Z",
    "time_remaining_hours": 2.5,
    "expected_first_response": "2026-01-13T15:45:00Z",
    "sla_risk_level": "medium",
    "on_track": true
  },
  "audit_trail": {
    "workflow_run_id": "dispatch-12345-run-001",
    "initiated_by": "system_automation",
    "initiated_timestamp": "2026-01-13T15:29:48Z",
    "completed_timestamp": "2026-01-13T15:30:00Z",
    "duration_seconds": 12,
    "algorithm_version": "v2.5.1"
  }
}
```

## Data Structure Details

### Success Indicators
- `success`: Boolean indicating whether dispatching was successful
- `ticket_id`: The ticket that was dispatched
- `ticket_info`: Summary of ticket details including SLA information

### Dispatching Results
- **assigned**: Whether the ticket was successfully assigned
- **assigned_technician**: Complete details of the assigned technician
- **assignment_timestamp**: When the assignment was made
- **time_to_dispatch_seconds**: Processing time from trigger to assignment
- **assignment_method**: The dispatching algorithm used

### Evaluation Summary
- **candidates_evaluated**: Total technicians considered
- **candidates_available**: Technicians currently available
- **candidates_qualified**: Technicians meeting skill requirements
- **top_candidate_score**: Highest scoring technician's score
- **assignment_confidence**: Confidence level in the assignment (low, medium, high)

### Assigned Technician Details
Comprehensive information about the assigned technician including:
- **current_workload**: Active tickets, capacity, and estimated hours
- **skill_match**: Matched skills, percentage, and certifications
- **availability**: Current status, shift, breaks, and schedule
- **performance_metrics**: Historical performance data
- **customer_history**: Previous work with this customer

### Alternative Candidates
List of other qualified technicians with scores and reasons they weren't selected, useful for reassignment scenarios

### Dispatching Rules Applied
Details of which assignment rules were triggered and their impact on the final decision

### Notifications Sent
Confirmation of all notifications sent to technicians, customers, and managers

### SLA Tracking
SLA policy details, deadlines, and compliance tracking information

## Error Handling

If the workflow encounters errors or cannot find a suitable technician:

```json
{
  "success": false,
  "ticket_id": "12345",
  "dispatching_results": {
    "assigned": false,
    "reason": "NO_QUALIFIED_TECHNICIANS_AVAILABLE"
  },
  "error_details": {
    "type": "DISPATCHING_FAILED",
    "message": "No technicians available with required skills during business hours",
    "code": "ERR-DISPATCH-001",
    "timestamp": "2026-01-13T15:30:00Z"
  },
  "evaluation_summary": {
    "candidates_evaluated": 12,
    "candidates_available": 0,
    "candidates_qualified": 3,
    "blocking_factors": [
      {
        "factor": "availability",
        "details": "All qualified technicians are out of office or at capacity"
      }
    ]
  },
  "fallback_action": {
    "action_taken": "escalated_to_manager",
    "escalated_to": "dispatch.manager@company.com",
    "notification_sent": true,
    "ticket_status": "Pending Dispatch",
    "manual_assignment_required": true
  },
  "recommended_actions": [
    "Review technician schedules and availability",
    "Consider expanding skill requirements",
    "Enable override_workload_limit to assign to busy technicians",
    "Wait for next dispatch cycle (15 minutes)"
  ]
}
```

Common error types:
- `NO_QUALIFIED_TECHNICIANS_AVAILABLE`: No technicians with required skills
- `ALL_TECHNICIANS_AT_CAPACITY`: All qualified technicians have full workload
- `BUSINESS_HOURS_RESTRICTION`: Outside configured business hours
- `SKILL_MATCH_BELOW_THRESHOLD`: No technicians meet minimum skill match
- `SLA_ALREADY_BREACHED`: Ticket SLA already violated, escalation needed
- `INVALID_TICKET_DATA`: Missing required ticket information
- `PSA_UPDATE_FAILED`: Unable to update ticket assignment in PSA
- `TECHNICIAN_UNAVAILABLE`: Selected technician went offline before assignment

## Dispatching Strategies

The workflow supports multiple dispatching strategies:

### Skills-Based Routing
Prioritizes skill matching above all other factors. Best for specialized technical support where expertise is critical.

### Round Robin
Distributes tickets evenly across all qualified technicians in rotation. Best for general support with similar skill levels.

### Least Busy
Assigns to the technician with the lowest current workload. Best for balancing team utilization.

### Hybrid (Recommended)
Combines multiple factors with configurable weights. Balances skills, availability, workload, and performance for optimal assignments.

### SLA-Driven
Prioritizes technicians with best on-time performance for high-priority or deadline-sensitive tickets.

### Customer Preference
Honors customer-requested technicians when available and qualified.

## Best Practices

1. **Regular Skills Updates**: Keep technician skill profiles current with training and certifications
2. **Workload Monitoring**: Regularly review and adjust maximum ticket thresholds
3. **Performance Reviews**: Use dispatching data to identify training needs and top performers
4. **SLA Configuration**: Set realistic SLA policies and ensure technicians understand priorities
5. **Availability Accuracy**: Ensure calendars and schedules are kept up-to-date
6. **Fair Distribution**: Monitor assignment patterns to prevent burnout or underutilization
7. **Customer Communication**: Notify customers of assignments and expected response times
8. **Escalation Paths**: Define clear escalation procedures when dispatching fails
9. **After-Hours Strategy**: Configure on-call rotation or after-hours dispatching rules
10. **Metrics Tracking**: Monitor key metrics like time-to-assignment, first-response time, and workload balance
11. **Feedback Loop**: Collect feedback from technicians on assignment quality and workload
12. **Override Capabilities**: Allow dispatchers to manually override when needed
13. **Geographic Consideration**: Factor in time zones for global support operations
14. **Specialization Balance**: Ensure specialist technicians aren't overwhelmed while generalists are underutilized
15. **Continuous Improvement**: Regularly review and refine dispatching rules based on outcomes
