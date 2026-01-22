---
id: 'c9e5b3d7-4f2a-4e8b-9c6d-5a8f3b7e9d2c'
slug: /c9e5b3d7-4f2a-4e8b-9c6d-5a8f3b7e9d2c
title: 'AI-Powered Ticket Solution Recommendations'
title_meta: 'AI-Powered Ticket Solution Recommendations'
keywords: ['ai', 'ticket solutions', 'automation', 'psa', 'machine learning', 'knowledge base', 'resolution', 'workflow']
description: 'Automatically generate intelligent solution recommendations for support tickets using AI analysis of historical resolutions and knowledge base articles. Accelerate ticket resolution with AI-powered suggestions.'
tags: ['ai', 'psa', 'automation', 'knowledge base']
draft: false
unlisted: false
---

# Summary

This workflow leverages artificial intelligence to automatically analyze incoming support tickets and generate intelligent solution recommendations based on historical ticket resolutions, knowledge base articles, and documented best practices. By examining ticket content, identifying similar past issues, and matching problems to known solutions, the AI provides technicians with instant access to relevant troubleshooting steps, resolution procedures, and knowledge articles. This automation significantly reduces research time, standardizes resolution approaches, improves first-contact resolution rates, and enables less experienced technicians to resolve complex issues by learning from historical successes and organizational knowledge.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **PSA Integration**: Configure your PSA system integration (ConnectWise Manage, Autotask, Halo PSA, etc.) with the following permissions:
   - Ticket read access
   - Ticket update access (to add notes with suggestions)
   - Historical ticket data access
   - Service board access
   - Time entry read access (for solution verification)
   - Knowledge base read access

2. **AI Configuration**: Set up the AI integration in Rewst:
   - Configure OpenAI or other AI provider credentials
   - Set up the AI model (GPT-4 recommended for best accuracy)
   - Define token limits and rate limits
   - Configure context window size

3. **Knowledge Base Integration**: Ensure access to:
   - Internal knowledge base or wiki
   - Documentation repositories
   - Vendor knowledge bases (Microsoft, Cisco, etc.)
   - Runbook and procedure libraries
   - Best practices documentation

4. **Organizational Variables**: Configure the following organizational variables in your Rewst environment:
   - `ai_solutions_enabled`: Boolean to enable/disable AI solution recommendations
   - `ai_model`: The AI model to use (e.g., `gpt-4`, `gpt-4-turbo`)
   - `ai_max_tokens`: Maximum tokens for AI responses (recommended: 2000-3000)
   - `ai_temperature`: AI creativity setting (recommended: 0.3-0.5 for consistent solutions)
   - `similarity_threshold`: Minimum similarity score to suggest past tickets (0.0-1.0)
   - `max_similar_tickets`: Maximum number of similar tickets to analyze (recommended: 5-10)
   - `include_unsuccessful_resolutions`: Include tickets marked as not resolved
   - `solution_confidence_threshold`: Minimum confidence to display suggestions (0.0-1.0)
   - `auto_add_suggestions_to_ticket`: Automatically add suggestions as internal notes

5. **Historical Data Requirements**:
   - Minimum 6 months of historical ticket data recommended
   - Resolution notes and closure descriptions
   - Time to resolution metrics
   - Customer satisfaction scores
   - Root cause analysis documentation

6. **Knowledge Base Structure**:
   - Well-organized article categories
   - Regularly updated content
   - Clear solution steps
   - Tagged and searchable articles
   - Version control for procedures

## Configuration Steps

1. Import the workflow into your Rewst environment
2. Configure the required PSA and AI integrations
3. Set up the organizational variables listed above
4. Configure knowledge base connections
5. Define solution quality criteria
6. Set up the solution recommendation prompt template
7. Configure similarity matching algorithms
8. Define filtering rules for irrelevant historical data
9. Set up feedback collection mechanisms
10. Test the workflow with various ticket scenarios
11. Monitor and refine based on technician feedback

## Workflow Inputs

The workflow can be executed with the following input parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ticket_id` | String | Yes | The PSA ticket ID to analyze |
| `ticket_subject` | String | Yes | The subject line of the ticket |
| `ticket_description` | String | Yes | The full description/body of the ticket |
| `ticket_category` | String | No | Ticket category/type for context |
| `company_id` | String | Yes | The company/client associated with the ticket |
| `priority` | String | No | Ticket priority level |
| `environment_info` | Object | No | System/environment details (OS, applications, etc.) |
| `error_messages` | Array | No | Specific error messages or codes |
| `troubleshooting_performed` | String | No | Steps already attempted by user or initial responder |
| `max_suggestions` | Number | No | Maximum number of solutions to suggest. Default: 3 |
| `include_kb_articles` | Boolean | No | Include knowledge base articles. Default: `true` |
| `include_similar_tickets` | Boolean | No | Include similar historical tickets. Default: `true` |
| `include_vendor_docs` | Boolean | No | Search vendor documentation. Default: `false` |
| `solution_detail_level` | String | No | `brief`, `standard`, `detailed`. Default: `standard` |
| `add_to_ticket_notes` | Boolean | No | Add suggestions to ticket as internal note. Default: `true` |

## Execution

### Event-Driven Trigger (Recommended)
Configure the workflow to trigger automatically when:
- A new ticket is created in the PSA system
- A ticket is updated with additional information
- A ticket is reassigned to a new technician
- A technician requests AI assistance (via button or command)
- A ticket remains unresolved for X hours

### Scheduled Batch Processing
Run the workflow on a schedule for unresolved tickets:
1. Configure the workflow to run every 30-60 minutes
2. Query for open tickets without solution suggestions
3. Prioritize by SLA deadline or priority level
4. Process tickets in batches to manage API limits

### Manual Trigger
1. Navigate to the workflow in the Rewst platform
2. Click "Run Workflow"
3. Enter the ticket ID
4. Review generated recommendations
5. Select solutions to apply or add to ticket

### API Trigger
Integrate with PSA interfaces or custom portals by calling the Rewst API endpoint with ticket details in JSON format.

### Technician Portal Integration
Embed in technician tools:
- Add "Get AI Suggestions" button in PSA interface
- Create browser extension for quick access
- Integrate with helpdesk chat tools
- Add to mobile technician apps

## AI Analysis Process

The workflow performs the following intelligent analysis:

1. **Ticket Content Analysis**: Extracts key information from subject and description including symptoms, error messages, affected systems, and user impact

2. **Historical Ticket Search**: Queries resolved tickets with similar characteristics including same symptoms, similar error messages, matching categories, and comparable customer environments

3. **Knowledge Base Search**: Searches internal and external knowledge bases for relevant articles matching ticket symptoms and keywords

4. **Solution Extraction**: Identifies successful resolution steps from similar tickets including time to resolution, customer satisfaction scores, and technician notes

5. **Relevance Scoring**: Evaluates each potential solution for applicability using similarity scores, success rates, and environmental match

6. **Solution Generation**: Creates comprehensive recommendations combining proven solutions, knowledge base guidance, and best practices

7. **Confidence Assessment**: Assigns confidence scores based on similarity strength, solution success rate, and environmental compatibility

8. **Contextualization**: Adapts solutions to current ticket context including customer-specific configurations, known environmental factors, and recent changes

## Solution Recommendation Criteria

Recommendations are prioritized based on:

### Similarity Matching
- Semantic similarity of problem descriptions
- Error message matching
- Affected system/application matching
- User impact similarity

### Historical Success
- Resolution success rate
- Time to resolution
- Customer satisfaction scores
- No reopens or escalations

### Environmental Relevance
- Operating system compatibility
- Application version matching
- Infrastructure similarities
- Company-specific configurations

### Recency
- Recent successful resolutions weighted higher
- Current product versions
- Up-to-date documentation
- Recent vendor advisories

## Post-Execution Steps

After the workflow completes successfully:

1. **Review Recommendations**:
   - Examine suggested solutions and confidence scores
   - Review similar historical tickets
   - Check referenced knowledge base articles
   - Validate environmental compatibility

2. **Apply Solutions**:
   - Follow suggested troubleshooting steps
   - Implement recommended fixes
   - Document any modifications needed
   - Update ticket with actions taken

3. **Provide Feedback**:
   - Rate solution usefulness
   - Mark if suggestion resolved the issue
   - Report incorrect or unhelpful suggestions
   - Suggest improvements to recommendations

4. **Update Documentation**:
   - Create new knowledge base articles for novel solutions
   - Update existing articles with improvements
   - Document edge cases or special considerations
   - Link tickets to knowledge base articles

5. **Track Metrics**:
   - Monitor first-contact resolution improvements
   - Track time saved per ticket
   - Measure technician satisfaction
   - Analyze AI suggestion accuracy rates

# Returned Data

The workflow returns the following data upon completion:

```json
{
  "success": true,
  "ticket_id": "12345",
  "ticket_info": {
    "subject": "Outlook keeps crashing when opening emails with attachments",
    "category": "Email Support",
    "priority": "High",
    "company": "Acme Corporation",
    "reported_by": "john.doe@acmecorp.com",
    "environment": {
      "os": "Windows 11",
      "application": "Microsoft Outlook",
      "version": "2024"
    }
  },
  "analysis_results": {
    "problem_classification": {
      "primary_issue": "Application crash",
      "affected_component": "Microsoft Outlook",
      "trigger": "Opening emails with attachments",
      "symptoms": ["Crashes", "Freezing", "Not responding"],
      "impact": "User cannot access important emails with attachments"
    },
    "extracted_keywords": [
      "outlook",
      "crash",
      "attachments",
      "email",
      "not responding",
      "freezing"
    ],
    "error_patterns_detected": [
      "Application crash on specific action",
      "Attachment rendering issue"
    ]
  },
  "solution_recommendations": [
    {
      "recommendation_id": "SOL-001",
      "title": "Clear Outlook Attachment Temporary Folder",
      "confidence_score": 0.92,
      "confidence_level": "High",
      "estimated_resolution_time": "5-10 minutes",
      "difficulty": "Easy",
      "success_rate": 87.5,
      "based_on": {
        "similar_tickets_resolved": 14,
        "knowledge_base_articles": 2,
        "vendor_documentation": 1
      },
      "solution_steps": [
        {
          "step": 1,
          "action": "Close Outlook completely",
          "details": "Ensure Outlook is fully closed. Check Task Manager to verify no outlook.exe processes are running.",
          "expected_result": "Outlook process terminated"
        },
        {
          "step": 2,
          "action": "Navigate to Outlook temporary folder",
          "details": "Press Win+R, type: %LOCALAPPDATA%\\Microsoft\\Windows\\INetCache\\Content.Outlook",
          "command": "%LOCALAPPDATA%\\Microsoft\\Windows\\INetCache\\Content.Outlook",
          "expected_result": "Folder opens showing temporary attachment files"
        },
        {
          "step": 3,
          "action": "Delete all contents of the folder",
          "details": "Select all files (Ctrl+A) and delete them. If files are locked, restart the computer first.",
          "caution": "Ensure Outlook is closed before deleting",
          "expected_result": "Folder is empty"
        },
        {
          "step": 4,
          "action": "Restart Outlook",
          "details": "Open Outlook normally and test by opening an email with an attachment",
          "expected_result": "Outlook opens successfully and attachments can be viewed"
        },
        {
          "step": 5,
          "action": "Verify resolution",
          "details": "Open multiple emails with different attachment types (PDF, DOCX, XLSX) to confirm stability",
          "expected_result": "No crashes, all attachments open correctly"
        }
      ],
      "why_this_works": "Corrupted temporary attachment files can cause Outlook to crash when trying to render attachments. Clearing this cache forces Outlook to re-download and re-cache attachments, resolving corruption issues.",
      "prevention_tips": [
        "Regularly clear Outlook cache",
        "Keep Outlook and Office updated",
        "Scan system for malware that may corrupt files"
      ],
      "related_kb_articles": [
        {
          "article_id": "KB-2345",
          "title": "Outlook Crashes When Opening Attachments",
          "url": "https://kb.company.com/2345",
          "relevance_score": 0.95
        },
        {
          "article_id": "KB-8901",
          "title": "Managing Outlook Temporary Files",
          "url": "https://kb.company.com/8901",
          "relevance_score": 0.82
        }
      ],
      "similar_resolved_tickets": [
        {
          "ticket_id": "11892",
          "resolved_date": "2026-01-05",
          "resolution_time_minutes": 8,
          "customer_satisfaction": 5,
          "similarity_score": 0.94,
          "technician_notes": "Cleared attachment cache, issue resolved immediately"
        },
        {
          "ticket_id": "11654",
          "resolved_date": "2025-12-28",
          "resolution_time_minutes": 12,
          "customer_satisfaction": 5,
          "similarity_score": 0.89,
          "technician_notes": "Same issue, clearing temp folder fixed it"
        }
      ],
      "vendor_resources": [
        {
          "title": "Outlook crashes or stops responding",
          "source": "Microsoft Support",
          "url": "https://support.microsoft.com/en-us/outlook-crashes",
          "relevance": "High"
        }
      ]
    },
    {
      "recommendation_id": "SOL-002",
      "title": "Disable Hardware Graphics Acceleration in Outlook",
      "confidence_score": 0.78,
      "confidence_level": "Medium",
      "estimated_resolution_time": "3-5 minutes",
      "difficulty": "Easy",
      "success_rate": 71.2,
      "based_on": {
        "similar_tickets_resolved": 9,
        "knowledge_base_articles": 1,
        "vendor_documentation": 1
      },
      "solution_steps": [
        {
          "step": 1,
          "action": "Open Outlook and go to File > Options",
          "details": "Click File tab in top-left, then Options at the bottom of the left menu"
        },
        {
          "step": 2,
          "action": "Navigate to Advanced settings",
          "details": "In Options window, click Advanced in the left sidebar"
        },
        {
          "step": 3,
          "action": "Disable hardware graphics acceleration",
          "details": "Scroll to Display section, check 'Disable hardware graphics acceleration'",
          "setting_path": "File > Options > Advanced > Display"
        },
        {
          "step": 4,
          "action": "Restart Outlook",
          "details": "Click OK to save changes and restart Outlook for changes to take effect"
        },
        {
          "step": 5,
          "action": "Test attachment functionality",
          "details": "Open emails with various attachment types to verify stability"
        }
      ],
      "why_this_works": "Graphics driver issues or GPU conflicts can cause Outlook to crash when rendering attachments. Disabling hardware acceleration forces software rendering, which is more stable on systems with problematic graphics drivers.",
      "trade_offs": [
        "Slightly reduced performance for graphics-heavy operations",
        "Minor impact on animations and transitions"
      ],
      "when_to_use": "If clearing attachment cache didn't resolve the issue, or if graphics driver updates are not possible",
      "related_kb_articles": [
        {
          "article_id": "KB-5612",
          "title": "Disabling Hardware Acceleration in Office Applications",
          "url": "https://kb.company.com/5612",
          "relevance_score": 0.88
        }
      ],
      "similar_resolved_tickets": [
        {
          "ticket_id": "11201",
          "resolved_date": "2025-11-15",
          "resolution_time_minutes": 5,
          "customer_satisfaction": 4,
          "similarity_score": 0.81
        }
      ]
    },
    {
      "recommendation_id": "SOL-003",
      "title": "Repair Office Installation",
      "confidence_score": 0.65,
      "confidence_level": "Medium",
      "estimated_resolution_time": "15-30 minutes",
      "difficulty": "Medium",
      "success_rate": 68.4,
      "based_on": {
        "similar_tickets_resolved": 11,
        "knowledge_base_articles": 1,
        "vendor_documentation": 1
      },
      "solution_steps": [
        {
          "step": 1,
          "action": "Open Windows Settings",
          "details": "Press Win+I or click Start > Settings"
        },
        {
          "step": 2,
          "action": "Navigate to Apps",
          "details": "Click Apps > Apps & features"
        },
        {
          "step": 3,
          "action": "Find Microsoft Office",
          "details": "Search or scroll to find Microsoft 365 Apps or Office installation"
        },
        {
          "step": 4,
          "action": "Initiate repair",
          "details": "Click the three dots (...) next to Office, select Modify, then choose Online Repair",
          "caution": "Online repair requires internet connection and may take 20-30 minutes"
        },
        {
          "step": 5,
          "action": "Complete repair process",
          "details": "Follow prompts to complete the repair. Computer may need to restart."
        },
        {
          "step": 6,
          "action": "Test Outlook",
          "details": "After repair completes, open Outlook and verify attachment handling"
        }
      ],
      "why_this_works": "Repairs corrupted Office files, missing components, or broken registry entries that may cause instability.",
      "when_to_use": "If simpler solutions don't work, or if multiple Office applications are experiencing issues",
      "time_consideration": "This solution takes longer but addresses deeper corruption issues",
      "related_kb_articles": [
        {
          "article_id": "KB-3456",
          "title": "How to Repair Office 365 Installation",
          "url": "https://kb.company.com/3456",
          "relevance_score": 0.79
        }
      ]
    }
  ],
  "additional_troubleshooting": {
    "if_solutions_dont_work": [
      "Check Windows Event Viewer for specific error codes",
      "Test Outlook in Safe Mode (outlook.exe /safe)",
      "Create a new Outlook profile",
      "Check for conflicting add-ins and disable them",
      "Verify antivirus isn't interfering with attachment scanning",
      "Update graphics drivers"
    ],
    "diagnostic_commands": [
      {
        "command": "outlook.exe /safe",
        "purpose": "Start Outlook in Safe Mode to test without add-ins",
        "expected_result": "Outlook starts with add-ins disabled"
      },
      {
        "command": "outlook.exe /cleanviews",
        "purpose": "Reset Outlook views to default",
        "expected_result": "Custom views are reset"
      }
    ],
    "escalation_criteria": [
      "Issue persists after trying all suggested solutions",
      "Event Viewer shows critical errors requiring advanced analysis",
      "Corruption affects multiple users in the organization",
      "Problem appears related to Exchange server issues"
    ]
  },
  "risk_assessment": {
    "data_loss_risk": "Low",
    "system_impact": "Minimal",
    "reversibility": "High - All solutions are reversible",
    "backup_required": false,
    "admin_rights_required": false
  },
  "alternative_workarounds": [
    {
      "workaround": "Use Outlook Web Access (OWA) temporarily",
      "duration": "Until issue is resolved",
      "limitations": "Reduced functionality compared to desktop app"
    },
    {
      "workaround": "Save attachments to disk before opening",
      "duration": "Temporary measure",
      "limitations": "Extra steps required for each attachment"
    }
  ],
  "learning_resources": [
    {
      "title": "Outlook Troubleshooting Best Practices",
      "type": "Internal Training",
      "url": "https://training.company.com/outlook-troubleshooting"
    },
    {
      "title": "Microsoft Outlook Administrator Guide",
      "type": "Vendor Documentation",
      "url": "https://learn.microsoft.com/en-us/outlook"
    }
  ],
  "feedback_request": {
    "solution_applied": null,
    "was_successful": null,
    "time_to_resolve": null,
    "technician_rating": null,
    "feedback_url": "https://feedback.company.com/ai-solution-12345"
  },
  "processing_metadata": {
    "analysis_timestamp": "2026-01-13T16:45:00Z",
    "processing_time_ms": 3240,
    "ai_model_used": "gpt-4-turbo",
    "similar_tickets_analyzed": 34,
    "kb_articles_searched": 156,
    "recommendations_generated": 3,
    "average_confidence_score": 0.78
  }
}
```

## Data Structure Details

### Success Indicators
- `success`: Boolean indicating whether analysis completed successfully
- `ticket_id`: The ticket that was analyzed
- `ticket_info`: Summary of ticket details and environment

### Analysis Results
- **problem_classification**: AI's understanding of the core issue
- **extracted_keywords**: Key terms identified for matching
- **error_patterns_detected**: Common patterns recognized

### Solution Recommendations
Each recommendation includes:
- **confidence_score**: AI confidence in solution relevance (0.0-1.0)
- **estimated_resolution_time**: Expected time to implement
- **difficulty**: Complexity level (Easy, Medium, Hard)
- **success_rate**: Historical success percentage
- **solution_steps**: Detailed step-by-step instructions
- **why_this_works**: Technical explanation
- **related_kb_articles**: Linked knowledge base resources
- **similar_resolved_tickets**: Historical tickets with same solution
- **vendor_resources**: Official documentation links

### Additional Troubleshooting
- **if_solutions_dont_work**: Next steps if suggestions fail
- **diagnostic_commands**: Commands for further investigation
- **escalation_criteria**: When to escalate to senior technicians

### Risk Assessment
Safety evaluation of suggested solutions including data loss risk and system impact

### Alternative Workarounds
Temporary measures if permanent solution requires time

## Error Handling

If the workflow encounters errors or cannot generate recommendations:

```json
{
  "success": false,
  "ticket_id": "12345",
  "error": {
    "type": "INSUFFICIENT_CONTEXT",
    "message": "Ticket description lacks sufficient detail to generate meaningful recommendations",
    "code": "ERR-AI-001",
    "timestamp": "2026-01-13T16:45:00Z"
  },
  "suggestions_for_improvement": [
    "Ask user for specific error messages",
    "Request screenshots of the issue",
    "Gather environment details (OS version, application version)",
    "Ask what troubleshooting steps have already been attempted"
  ],
  "generic_recommendations": [
    {
      "title": "Gather More Information",
      "steps": [
        "Contact user for detailed error messages",
        "Request screenshots or screen recordings",
        "Ask about recent changes (updates, new software)",
        "Determine if issue affects multiple users"
      ]
    }
  ],
  "fallback_resources": [
    {
      "title": "General Troubleshooting Guide",
      "url": "https://kb.company.com/general-troubleshooting"
    }
  ]
}
```

Common error types:
- `INSUFFICIENT_CONTEXT`: Ticket lacks detail for meaningful analysis
- `NO_SIMILAR_TICKETS_FOUND`: No historical matches found
- `AI_SERVICE_UNAVAILABLE`: AI service error or rate limit
- `LOW_CONFIDENCE_ALL_SOLUTIONS`: No high-confidence recommendations available
- `KNOWLEDGE_BASE_UNAVAILABLE`: Cannot access KB articles
- `TICKET_NOT_FOUND`: Invalid ticket ID provided

## Solution Quality Scoring

Solutions are scored based on multiple factors:

### Historical Performance (40%)
- Resolution success rate
- Average time to resolution
- Customer satisfaction scores
- No reopen rate

### Similarity Matching (30%)
- Semantic similarity to current ticket
- Environmental match
- Error message matching
- Symptom alignment

### Recency (15%)
- Recent successful resolutions weighted higher
- Current documentation
- Up-to-date product versions

### Comprehensiveness (15%)
- Detailed step-by-step instructions
- Clear expected results
- Troubleshooting alternatives
- Risk assessment included

## Best Practices

1. **Detailed Ticket Descriptions**: Encourage users and technicians to provide comprehensive initial descriptions for better AI analysis
2. **Feedback Loop**: Always rate AI suggestions to improve future recommendations
3. **Update Knowledge Base**: Convert successful novel solutions into KB articles
4. **Test Before Applying**: Review suggestions before implementing, especially for production systems
5. **Document Results**: Note which solution worked for future reference
6. **Continuous Learning**: AI improves with more historical data and feedback
7. **Combine with Expertise**: Use AI suggestions as a starting point, apply professional judgment
8. **Share Successes**: When AI suggestions work well, share with the team
9. **Report Issues**: Flag incorrect or unhelpful suggestions for refinement
10. **Customize Prompts**: Tailor AI prompts to your organization's specific environment
11. **Regular Review**: Periodically review AI performance metrics and adjust thresholds
12. **Training Integration**: Use AI suggestions as training material for new technicians
13. **Security Awareness**: Validate suggested commands and scripts before execution
14. **Environment Specifics**: Add company-specific configuration details to improve accuracy
15. **Escalation Path**: Define clear criteria for when to escalate beyond AI suggestions
