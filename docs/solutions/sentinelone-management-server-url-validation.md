---
id: '5c97a683-f12f-4fb0-bc18-1720a561da93'
slug: /5c97a683-f12f-4fb0-bc18-1720a561da93
title: 'SentinelOne Management Server Url Validation'
title_meta: 'SentinelOne Management Server Url Validation'
keywords: ['sentinelone', 's1', 'management-console', 'management-server-url']
description: This solution validates whether the SentinelOne Management Server URL detected on endpoints matches the value configured for the client in NinjaRMM, automatically flagging discrepancies and generating remediation tickets.'
tags: ['antivirus', 'auditing', 'ticketing']
draft: false
unlisted: false
---

## Purpose

This solution validates whether the SentinelOne Management Server URL detected on endpoints matches the value configured for the client in NinjaRMM. It automatically flags discrepancies and generates remediation tickets through ConnectWise Manage when mismatches are detected.

## Associated Content

### Custom Fields

| Content | Definition Scope | Required | Type | Applicable OS | Function |
| ------- | ---------------- | -------- | ---- | ------------- | -------- |
| [cPVAL SentinelOne Key](/docs/44561301-d22b-4013-86af-d1842773d2ca) | `Organization` | Conditional | Text | All | Stores the SentinelOne Site Key for endpoint organization (only required if not using existing field) |
| [cPVAL SentinelOne Mgmt Server Discrepancy](/docs/1de41dd5-c222-45cb-9b74-5ae45bb86dd8) | `Device` | True | CheckBox | Windows | Flags when endpoint's management URL differs from configured value |
| [cPVAL SentinelOne Mgmt Server Url](/docs/0691fe63-dd6b-4f15-8b39-dce377d9064a) | `Device` | True | Text | Windows | Stores actual management URL detected on endpoint |

### Automation

| Content | Function |
| ------- | -------- |
| [SentinelOne Management Console Validation](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e) | Compares endpoint's S1 management URL with configured value and flags discrepancies |

### Condition

| Content | Function |
| ------- | -------- |
| [SentinelOne Management Console Validation](/docs/a947cc93-68a2-4ddc-a6dc-ae2cf4422c66) | Triggers daily validation and ticket creation for discrepancies |

### CW Manage Ticket Template

| Content | Function |
| ------- | -------- |
| [SentinelOne Management Console](/docs/3adab4f1-a92c-4004-aa3f-365bacc3b74b) | Configures how tickets are generated in ConnectWise Manage |

## Implementation

### Step 1: Create Custom Fields

1. **[cPVAL SentinelOne Mgmt Server Discrepancy](/docs/1de41dd5-c222-45cb-9b74-5ae45bb86dd8)**
2. **[cPVAL SentinelOne Mgmt Server Url](/docs/0691fe63-dd6b-4f15-8b39-dce377d9064a)**
3. **Optional**: [cPVAL SentinelOne Key](/docs/44561301-d22b-4013-86af-d1842773d2ca)  
   *Only create this if you don't already have a custom field storing SentinelOne installation tokens*

### Step 2: Import Automation

Import the [SentinelOne Management Console Validation](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e) automation

### Step 3: Create Validation Condition

Create the [SentinelOne Management Console Validation](/docs/a947cc93-68a2-4ddc-a6dc-ae2cf4422c66) condition

### Step 4: Configure CW Manage Template

1. Ensure ConnectWise Manage app is enabled
2. Configure [SentinelOne Management Console](/docs/3adab4f1-a92c-4004-aa3f-365bacc3b74b) ticket template  
   *Verify field mappings with your consultant as environments vary*

## FAQ

### 1. Do I need to create the 'cPVAL SentinelOne Key' custom field?

Only create this field if you don't already have a custom field storing SentinelOne installation tokens. If you have an existing field, use its name in the automation's `S1 Key Custom Field Name` parameter instead.

### 2. How often does the validation run?

The condition runs the automation once per day. Discrepancies are flagged immediately upon detection.

### 3. Where are discrepancies shown?

Discrepancies appear in:

- Device's `cPVAL SentinelOne Mgmt Server Discrepancy` checkbox
- Generated ConnectWise Manage tickets
- Automation activity details

### 4. Why are my CW Manage tickets not generating correctly?

Verify:

1. ConnectWise Manage app is properly connected
2. Ticket template field mappings match your environment
3. Required custom fields exist and have values
4. Technician permissions allow ticket creation

### 5. Can I use existing custom fields instead of creating new ones?

Yes, for the Site Key/Token field. Specify your existing field name in the `S1 Key Custom Field Name` parameter. The discrepancy and URL fields are required as they're updated by the automation.

### 6. Can I run the validation manually?

Yes, execute the [automation](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e) manually on any endpoint to validate its configuration immediately.

### 7 How to use the script's runtime parameter?

Set runtime parameters:

- **S1 Key Custom Field Name**:  
  - *Leave blank* if using `cPVAL SentinelOne Key`  
  - *Enter name* of existing custom field if storing token elsewhere
