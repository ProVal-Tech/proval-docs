---
id: '05c811e6-c6d0-4652-b4b6-2aa83f9605c7'
slug: /05c811e6-c6d0-4652-b4b6-2aa83f9605c7
title: 'CWRMM Ticket Management for Monitors'
title_meta: 'CWRMM Ticket Management for Monitors'
keywords: ['trigger', 'ticketing', 'ticket-management', 'webhook', 'workflow', 'automation', 'monitors']
description: 'Automates ConnectWise ticket lifecycle management directly from CW RMM monitors via webhook. Receives JSON payloads to Create, Close, or Comment on tickets, eliminating the need for separate RMM ticketing tasks and ensuring clean, duplicate-free alerting.'
tags: ['api', 'automation', 'ticketing']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Summary

The **CWRMM Ticket Management for Monitors** trigger serves as a dedicated webhook endpoint designed to bridge CW RMM monitoring scripts and ConnectWise ticketing workflows.

Instead of relying on native RMM ticketing tasks, monitoring scripts (such as Enhanced Drive Space, CPU Threshold, and Memory Threshold monitors) evaluate device telemetry locally and send a structured JSON payload to this trigger only when a ticket state change is required. This allows monitors to implement a robust local state machine, tracking which alerts already have open tickets and firing webhooks exclusively to create new tickets or close resolved ones.

**Key Benefits:**

- **Prevents Ticket Duplication:** By offloading ticket tracking to the monitor's local state files, it ensures that sustained alerts (e.g., a drive sitting at 95% full for hours) do not generate duplicate tickets on every monitor run.
- **Automated Resolution:** When an alert condition clears (e.g., CPU drops below the low threshold), the monitor automatically fires a `Close` action webhook, allowing ConnectWise to auto-resolve the ticket without technician intervention.
- **Decoupled Architecture:** Monitoring logic and ticketing actions are cleanly separated. Monitors focus purely on threshold evaluation and state management, while the ConnectWise workflow handles the API calls to Create, Close, or Comment on tickets based on the payload.

Valid actions recognized by this trigger are **Create**, **Close**, and **Comment**.

## Details

| Trigger Name | Description | Tags | Secure user access |
| ------------ | ----------- | ---- | ------------------ |
| CWRMM Ticket Management For Monitors | Create and Close a Ticket based on Action from a monitor. Valid actions are Create, Close and Comment. | Ticketing | No Auth |

## Request Body

These are the fields that will be collected in order for the custom workflow action to get executed.

### Payload Schema

| Field Type | Setup option | Field Caption |
| ---------- | ------------ | ------------- |
| Json/complex data | | Payload Schema |

### Data

| Json Path Name | Display Name | Required | Data Format | Default Value | Valid Options | Visibility |
| -------------- | ------------ | ---------| ----------- | ------------- | ------------- | ---------- |
| Action | Action | True | String | | Create, Close, Comment | Shown |
| TicketBody | TicketBody | True | String | |  | Shown |
| TicketSubject | TicketSubject | True | String | | | Shown |
| DeviceId | DeviceId | True | String | | | Shown |

## Usage Example

```PowerShell
$webhookUrl = 'https://webhook.xyz.net/sampleUrl'

$action = 'Create'
$ticketSubject = 'A Sample Ticket for {0}' -f $env:ComputerName
$ticketBody = 'This ticket is created to test the functionality of the trigger'

$deviceId = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\ITSPlatform').privateendpointid

$payload = [ordered]@{
    Action        = $action
    TicketSubject = $ticketSubject
    TicketBody    = $ticketBody
    DeviceId      = $deviceId
}
$jsonPayload = $payload | ConvertTo-Json -Depth 2

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $jsonPayload -ContentType 'application/json'
```

## Dependencies

- [Workflow: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## Trigger Setup Path

- **Tasks Path:** `Automation` ➞ `Workflows` ➞ `Custom Triggers`

## Trigger Creation

Install the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow from the `ProVal - Content` Community to automatically install this trigger as well.

## Changelog

### 2025-07-23

- Initial version of the document
