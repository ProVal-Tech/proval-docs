---
id: 'd3e7f9a1-6b8c-4d0e-2f4a-0b1c2d3e4f5a'
slug: /d3e7f9a1-6b8c-4d0e-2f4a-0b1c2d3e4f5a
title: 'Sync Contacts from CW Manage to HubSpot'
title_meta: 'Sync Contacts from CW Manage to HubSpot'
keywords: ['connectwise', 'manage', 'hubspot', 'contact sync', 'CRM', 'PSA', 'automation', 'workflow']
description: 'Automatically synchronize contacts from ConnectWise Manage PSA to HubSpot CRM. Maintain accurate contact records, company associations, and custom field mappings between platforms.'
tags: ['connectwise', 'hubspot', 'sync', 'crm', 'automation']
draft: false
unlisted: false
---

# Summary

This workflow automates the synchronization of contact records from ConnectWise Manage to HubSpot CRM. The solution retrieves contacts from CW Manage, maps them to corresponding HubSpot contacts, creates new HubSpot contacts for unmatched records, updates existing contact attributes, manages company associations, and synchronizes custom field values. By automating this synchronization, the workflow ensures sales and marketing teams have up-to-date client contact information in HubSpot, eliminates duplicate data entry, and maintains consistency between PSA and CRM platforms.

# Usage

## Prerequisites

Before using this workflow, ensure the following requirements are met:

1. **ConnectWise Manage Integration**: Configure CW Manage API integration with contact read access
2. **HubSpot Integration**: Configure HubSpot API integration with contact and company write access
3. **PSA Integration**: For sync status tracking (optional)

4. **Organizational Variables**:
   - `hubspot_sync_contact_types`: CW Manage contact types to include
   - `hubspot_sync_company_mapping`: Map CW Manage companies to HubSpot companies
   - `hubspot_sync_field_mapping`: Map CW Manage fields to HubSpot properties
   - `hubspot_sync_create_companies`: Auto-create HubSpot companies
   - `hubspot_sync_notification_recipients`: Alert recipients

## Workflow Inputs

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `company_ids` | Array | No | Specific CW Manage company IDs (defaults to all) |
| `contact_types` | Array | No | Filter by contact type |
| `sync_direction` | String | No | Direction: `manage_to_hubspot`. Default: `manage_to_hubspot` |
| `include_inactive` | Boolean | No | Include inactive contacts. Default: `false` |
| `create_missing_companies` | Boolean | No | Create HubSpot companies. Default: `true` |
| `dry_run` | Boolean | No | Preview changes. Default: `false` |

## Execution

### Scheduled Execution (Recommended)
- Run daily for contact synchronization
- Run hourly for near real-time sync

## Sync Process Flow

1. **CW Manage Contact Retrieval**: Fetch contacts from ConnectWise Manage
2. **HubSpot Contact Retrieval**: Fetch existing contacts from HubSpot
3. **Company Matching**: Match CW Manage companies to HubSpot companies
4. **Company Creation**: Create missing HubSpot companies if enabled
5. **Contact Matching**: Match contacts by email address
6. **Contact Creation**: Create HubSpot contacts for unmatched records
7. **Attribute Update**: Sync name, title, phone, and custom fields
8. **Company Association**: Link contacts to their HubSpot companies
9. **Deduplication**: Identify and flag potential duplicates
10. **Report Generation**: Generate sync summary
11. **Notification**: Alert on sync completion and issues

# Returned Data

```json
{
  "success": true,
  "sync_summary": {
    "cw_contacts_found": 850,
    "hubspot_contacts_found": 820,
    "contacts_matched": 790,
    "contacts_created": 60,
    "contacts_updated": 125,
    "companies_created": 5,
    "companies_matched": 45,
    "duplicates_flagged": 8,
    "sync_timestamp": "2026-03-04T17:00:00Z"
  },
  "contacts_created": [
    {
      "email": "jane.smith@clientcorp.com",
      "first_name": "Jane",
      "last_name": "Smith",
      "company": "Client Corp",
      "title": "IT Director",
      "phone": "555-0100",
      "hubspot_contact_id": "hs-12345",
      "hubspot_company_id": "hs-comp-456"
    }
  ],
  "contacts_updated": {
    "titles_updated": 35,
    "phones_updated": 22,
    "emails_updated": 8,
    "custom_fields_updated": 60
  },
  "companies_created": [
    {
      "name": "New Client LLC",
      "cw_company_id": 1234,
      "hubspot_company_id": "hs-comp-789"
    }
  ],
  "potential_duplicates": [
    {
      "email": "john.doe@shared-domain.com",
      "hubspot_matches": 2,
      "action": "Flagged for manual review"
    }
  ]
}
```
