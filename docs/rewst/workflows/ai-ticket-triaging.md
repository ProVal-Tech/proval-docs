---
id: '8f9a3d72-4b1e-4c9f-9e2a-7c5d8e6f4a2b'
slug: /8f9a3d72-4b1e-4c9f-9e2a-7c5d8e6f4a2b
title: 'AI-Based Ticket Triaging'
title_meta: 'AI-Based Ticket Triaging'
keywords: ['ai', 'ticket triaging', 'automation', 'psa', 'machine learning', 'classification', 'priority', 'routing', 'workflow']
description: 'Automatically classify, prioritize, and route support tickets using AI-powered analysis. Enhance response times and improve ticket management efficiency with intelligent ticket triaging.'
tags: ['ai', 'psa', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow leverages artificial intelligence to automatically classify, prioritize, and route incoming support tickets to the appropriate teams or technicians. By analyzing ticket content, subject lines, and historical patterns, the AI model categorizes tickets by issue type, assigns priority levels, and suggests the best-suited resolver group. This automation reduces manual triage time, ensures consistent ticket handling, and improves overall response times by getting tickets to the right people faster.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **PSA Integration**: Configure your PSA system integration (ConnectWise Manage, Autotask, Halo PSA, etc.) with the following permissions:
   - Ticket read and update access
   - Service board access
   - Company/account read access
   - Technician/resource read access
   - Priority and status management permissions

2. **AI Configuration**: Set up the AI integration in Rewst:
   - Configure OpenAI or other AI provider credentials
   - Set up the AI model to be used for ticket analysis
   - Define token limits and rate limits

3. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `ai_triaging_enabled`: Boolean to enable/disable AI triaging
   - `ai_model`: The AI model to use (e.g., `gpt-4`, `gpt-4-turbo`)
   - `ai_max_tokens`: Maximum tokens for AI responses (recommended: 1000-2000)
   - `ai_temperature`: AI creativity setting (recommended: 0.3 for consistent results)
   - `default_priority_fallback`: Default priority if AI cannot determine (e.g., `Medium`)
   - `triaging_confidence_threshold`: Minimum confidence score to apply AI suggestions (0.0-1.0)

4. **Ticket Categories and Routing Rules**: Define the following in your configuration:
   - List of valid ticket categories/types
   - Service board mappings
   - Team/technician assignments by category
   - Priority level definitions
   - Escalation criteria

5. **Training Data** (Optional but recommended):
   - Historical ticket data for improved accuracy
   - Custom classification rules
   - Company-specific terminology and keywords

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the required PSA and AI integrations
3. Set up the organizational variables listed above
4. Define your ticket categories and routing rules
5. Configure the classification prompt template
6. Set up service board and team mappings
7. Configure notification settings for high-priority tickets
8. Test the workflow with sample tickets before enabling automation
9. Monitor and refine the AI model based on accuracy metrics

## Workflow Inputs

The workflow can be executed with the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ticket_id` | String | Yes | The PSA ticket ID to triage |
| `ticket_subject` | String | Yes | The subject line of the ticket |
| `ticket_description` | String | Yes | The full description/body of the ticket |
| `company_id` | String | Yes | The company/client associated with the ticket |
| `current_priority` | String | No | Current priority (for comparison) |
| `current_board` | String | No | Current service board assignment |
| `requester_email` | String | No | Email of the person who submitted the ticket |
| `override_ai` | Boolean | No | Manual override to skip AI and use defaults. Default: `false` |
| `include_sentiment` | Boolean | No | Perform sentiment analysis on ticket content. Default: `true` |
| `auto_assign` | Boolean | No | Automatically assign to recommended technician. Default: `false` |

## Execution

### Event-Driven Trigger (Recommended)
Configure the workflow to trigger automatically when:
- A new ticket is created in the PSA system
- A ticket is updated (reopened or status changed)
- A ticket is reassigned to a triaging queue

### Scheduled Execution
Run the workflow on a schedule to triage unclassified tickets:
1. Configure the workflow to run every 15-30 minutes
2. Query for tickets without category or in triage status
3. Process tickets in batches to manage API rate limits

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter the ticket ID or provide ticket details
4. Review the configuration and click "Execute"
5. Review the AI recommendations before applying

### API Trigger
Integrate with external systems by calling the Rewst API endpoint with the ticket data in JSON format.

## AI Analysis Process

The workflow performs the following AI-powered analysis:

1. **Content Extraction**: Extracts relevant information from ticket subject and description
2. **Category Classification**: Determines the most appropriate ticket category/type
3. **Priority Assessment**: Evaluates urgency and impact to assign priority level
4. **Sentiment Analysis**: Detects customer sentiment (positive, neutral, negative, urgent)
5. **Routing Recommendation**: Suggests the best team or technician based on expertise
6. **Keyword Extraction**: Identifies key terms for better searchability
7. **Confidence Scoring**: Provides a confidence score for each recommendation

## Post-Execution Steps

After the workflow completes successfully:
1. Review the AI-generated ticket classification in your PSA system
2. Verify that the priority level is appropriate
3. Confirm that the ticket was routed to the correct team/board
4. Monitor for any misclassifications and provide feedback
5. Update the AI prompt or training data if patterns emerge
6. Review sentiment analysis for VIP or urgent customer situations
7. Check the workflow logs for any errors or low-confidence classifications

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "ticket_id": "12345",
  "ai_analysis": {
    "category": {
      "value": "Network Connectivity",
      "confidence": 0.92
    },
    "priority": {
      "value": "High",
      "confidence": 0.87,
      "reasoning": "User reports complete loss of internet access affecting business operations"
    },
    "sentiment": {
      "value": "negative",
      "score": -0.65,
      "urgency_detected": true
    },
    "recommended_routing": {
      "board": "Network Support",
      "board_id": "board-123",
      "team": "Infrastructure Team",
      "team_id": "team-456",
      "suggested_technician": "john.smith@company.com",
      "confidence": 0.85
    },
    "extracted_keywords": [
      "internet",
      "connectivity",
      "offline",
      "network",
      "router"
    ],
    "estimated_resolution_time": "2-4 hours",
    "similar_tickets": [
      {
        "ticket_id": "12301",
        "similarity_score": 0.88,
        "resolution": "Restarted network switch"
      }
    ]
  },
  "actions_taken": {
    "category_updated": true,
    "priority_updated": true,
    "board_assigned": true,
    "technician_assigned": false,
    "notification_sent": true
  },
  "original_values": {
    "category": "General Request",
    "priority": "Medium",
    "board": "Unassigned"
  },
  "processing_time_ms": 1850,
  "timestamp": "2026-01-13T14:30:00Z"
}
```

## Data Structure Details

### Success Indicators
- `success`: Boolean indicating whether the workflow completed successfully
- `ticket_id`: The PSA ticket identifier that was processed

### AI Analysis Results
- **category**: The classified ticket type/category with confidence score
- **priority**: The assigned priority level (Low, Medium, High, Critical) with reasoning
- **sentiment**: Customer sentiment analysis including urgency detection
- **recommended_routing**: Suggested service board, team, and technician assignments
- **extracted_keywords**: Key terms identified for searchability and categorization
- **estimated_resolution_time**: AI-predicted time to resolve based on historical data
- **similar_tickets**: Previously resolved tickets with similar characteristics

### Actions Taken
- **category_updated**: Whether the ticket category was changed
- **priority_updated**: Whether the priority level was modified
- **board_assigned**: Whether the ticket was moved to a different service board
- **technician_assigned**: Whether a specific technician was assigned
- **notification_sent**: Whether notifications were sent to relevant parties

### Original Values
The workflow preserves the original ticket values before AI modifications for audit purposes and potential rollback scenarios.

## Error Handling

If the workflow encounters errors, the returned data includes:

```json
{
  "success": false,
  "error": {
    "type": "AI_ANALYSIS_FAILED",
    "message": "Unable to classify ticket due to insufficient content",
    "ticket_id": "12345",
    "fallback_action": "assigned_to_default_queue"
  },
  "fallback_values": {
    "category": "General Support",
    "priority": "Medium",
    "board": "Triage Queue"
  }
}
```

Common error types:
- `AI_ANALYSIS_FAILED`: AI service unavailable or returned invalid response
- `CONFIDENCE_TOO_LOW`: AI confidence below threshold, manual review required
- `INVALID_TICKET_DATA`: Missing or malformed ticket information
- `PSA_UPDATE_FAILED`: Unable to update ticket in PSA system
- `RATE_LIMIT_EXCEEDED`: AI API rate limit reached

## Best Practices

1. **Confidence Thresholds**: Set appropriate confidence thresholds (recommended: 0.7-0.8) to balance automation with accuracy
2. **Human Review**: Queue low-confidence classifications for manual review
3. **Feedback Loop**: Regularly review AI decisions and provide corrections to improve accuracy
4. **Custom Prompts**: Tailor the AI prompt to your organization's specific terminology and ticket types
5. **Monitor Performance**: Track metrics like classification accuracy, average processing time, and customer satisfaction
6. **VIP Handling**: Configure special routing rules for VIP customers or critical accounts
7. **Escalation Rules**: Set up automatic escalation for high-urgency or negative-sentiment tickets
8. **Testing**: Regularly test with edge cases and unusual ticket types to ensure robust handling
