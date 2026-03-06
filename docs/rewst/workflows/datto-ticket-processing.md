---
id: 'b9c3d5e7-2f4a-4b6c-8d9e-6f7a8b9c0d1e'
slug: /b9c3d5e7-2f4a-4b6c-8d9e-6f7a8b9c0d1e
title: 'Datto Ticket Processing'
title_meta: 'Datto Ticket Processing'
keywords: ['datto', 'ticket processing', 'backup', 'alerts', 'PSA', 'automation', 'workflow']
description: 'Automatically process Datto alerts and events into PSA tickets with intelligent deduplication, severity mapping, and contextual enrichment. Streamline Datto backup and device alert management.'
tags: ['datto', 'automation', 'ticketing', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-03-04
---

# Summary

This workflow automates the processing of Datto alerts and events into PSA tickets. The solution ingests alerts from Datto BCDR, SIRIS, and cloud products, evaluates severity, deduplicates against existing tickets, creates new tickets with full contextual information, and routes them to the appropriate service board and team. By automating Datto ticket creation, the workflow ensures consistent alert handling, reduces manual effort, prevents duplicate tickets, and provides technicians with the information needed to resolve issues quickly.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **Datto Integration**: Configure the Datto API integration in Rewst
2. **PSA Integration**: For ticket creation and management
3. **Email Integration**: For notifications

4. **Organizational Variables**:
   - `datto_ticket_board`: PSA service board for Datto tickets
   - `datto_severity_mapping`: Map Datto alert severity to PSA priority
   - `datto_dedup_enabled`: Enable ticket deduplication
   - `datto_dedup_window_hours`: Deduplication window (e.g., 24)
   - `datto_auto_resolve_alerts`: List of alert types to auto-resolve

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `alert_id` | String | Yes | Datto alert identifier |
| `alert_type` | String | Yes | Type of Datto alert |
| `device_id` | String | Yes | Datto device identifier |
| `severity` | String | Yes | Alert severity level |
| `company_id` | String | Yes | PSA company ID |
| `alert_message` | String | No | Alert description/message |
| `create_ticket` | Boolean | No | Create PSA ticket. Default: `true` |
| `force_new_ticket` | Boolean | No | Skip dedup check. Default: `false` |

## Execution

### Event-Driven Trigger (Recommended)
- Webhook from Datto triggers processing for each alert

### Scheduled Processing
- Poll Datto API every 15-30 minutes for new alerts

## Processing Flow

1. **Alert Ingestion**: Receive and parse Datto alert
2. **Device Lookup**: Retrieve device details and associated company
3. **Deduplication**: Check for existing open tickets for same device/alert
4. **Severity Mapping**: Map Datto severity to PSA priority
5. **Context Enrichment**: Add device details, backup status, and agent info
6. **Ticket Creation**: Create or update PSA ticket
7. **Assignment**: Route to appropriate board and team
8. **Notification**: Alert team for high-severity alerts
9. **Documentation**: Log processing details

# Returned Data

```json
{
  "success": true,
  "alert_id": "DATTO-2026-001",
  "alert_type": "backup_failure",
  "device": {
    "device_name": "SERVER-DC01",
    "device_id": "dev-12345",
    "serial_number": "DATTO-SN-12345",
    "model": "SIRIS 4",
    "company": "Acme Corp"
  },
  "processing_results": {
    "duplicate_found": false,
    "ticket_created": true,
    "ticket_id": "BCK-2026-015",
    "ticket_priority": "High",
    "ticket_board": "Backup & DR",
    "assigned_team": "Infrastructure Team"
  },
  "alert_context": {
    "description": "Backup failed for agent DC01-FullSystem",
    "last_successful_backup": "2026-03-03T02:00:00Z",
    "consecutive_failures": 2,
    "recommended_action": "Check agent connectivity and storage space"
  }
}
```

## Changelog

### 2026-03-04

- Initial version of the document
