---
id: 'b605b808-7016-4911-8c37-6b950de40919'
slug: /b605b808-7016-4911-8c37-6b950de40919
title: 'Microsoft 365 - Click-to-Run - Set Update Channel'
title_meta: 'Microsoft 365 - Click-to-Run - Set Update Channel'
keywords: ['microsoft', 'update', 'channel', 'custom', 'field', 'task']
description: 'Controls which Microsoft 365 Click-to-Run update channel is applied to endpoints using ConnectWise RMM custom fields. Set the channel at the client level, optionally override per endpoint, and run the task to apply registry changes automatically.'
tags: ['microsoft365', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-06-16
---

## Overview

This solution controls which Microsoft 365 Click-to-Run update channel is applied to your endpoints — directly from ConnectWise RMM custom fields, with no manual registry edits required.

You set the desired update channel at the client (company) level, and optionally override it for individual endpoints. When the task runs, it reads those custom fields and applies the correct registry settings automatically.

## Update Channel Options

| Channel Name | Description |
|---|---|
| `Current Channel` | Latest features as soon as they are ready. Best for users who want the newest capabilities immediately. |
| `Monthly Enterprise Channel` | Monthly updates on a predictable schedule (second Tuesday). Good balance of currency and stability. |
| `Semi-Annual Enterprise Channel` | Updates twice a year (January and July). Recommended for regulated or change-controlled environments. |
| `Beta Channel` | Pre-release builds for early testing. Not recommended for production use. |
| `None` | No channel is set; the existing configuration on the endpoint is left unchanged. |

## How It Works

1. A company-level custom field (`Client - Update Channel`) sets the default channel for all endpoints in that client.
2. An endpoint-level custom field (`Endpoint - Update Channel`) can override the company value for a specific machine.
3. When the task runs, it reads both fields. The **endpoint-level value takes precedence**. If neither is set to a valid channel, the task exits without making any changes.
4. The task writes the corresponding channel URL to three registry keys under `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration`: `CDNBaseUrl`, `UpdateChannel`, and `UnmanagedUpdateUrl`.
5. After writing, the task re-reads the registry to confirm the values were applied correctly and logs the result.

## Associated Content

| Content | Type | Function |
|---|---|---|
| [Client - Update Channel](/docs/656f037b-8dba-4e59-b135-33dcd5b0b7dc) | Custom Field | Sets the default update channel for all computers within the client. |
| [Endpoint - Update Channel](/docs/772c0498-4505-4f1c-afc4-46788294b3e2) | Custom Field | Overrides the client-level channel for a specific endpoint. |
| [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/3627ba40-ca53-4583-8435-bb09bdb03f20) | Task | Reads the custom fields and applies the update channel to the registry. |

## Implementation

### Step 1: Set the Client-Level Custom Field

1. In ConnectWise RMM, navigate to the client you want to configure.
2. Open the **Custom Fields** for that client.
3. Set **Update Channel** to the desired channel (e.g., `Semi-Annual Enterprise Channel`).

This value applies to all endpoints under that client unless overridden at the endpoint level.

### Step 2: Override for Specific Endpoints *(Optional)*

1. Navigate to the endpoint you want to configure differently.
2. Open the **Custom Fields** for that endpoint.
3. Set **Update Channel** to the desired channel.

This overrides the client-level value for that machine only.

### Step 3: Run or Schedule the Task

Run the [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/3627ba40-ca53-4583-8435-bb09bdb03f20) task against the target endpoints.

You can also schedule it to run on a recurring basis to enforce the configured channel over time and catch any drift.

> **Note:** At least one custom field (client or endpoint level) must be set to a valid channel before the task is run. If neither is set, the task exits without making changes.

## FAQs

**What happens if both the client and endpoint custom fields are set?**  
> The endpoint-level value always wins. The client-level value is only used when no endpoint-level value is set.

**What happens if neither custom field is set?**  
> The task exits without making any registry changes and logs a message indicating that no valid channel was found. No harm is done to the endpoint.

**Can I set different channels for different clients?**  
> Yes. Each client has its own `Client - Update Channel` custom field. Set them independently per client.

**Will this affect Microsoft 365 apps that are already up to date?**  
> The task only changes the update channel registry setting. It does not trigger an immediate update. The endpoint will begin receiving updates from the new channel on its next normal update cycle.

**Does this work for all Microsoft 365 Click-to-Run installations?**  
> Yes, as long as the Microsoft Office Click-to-Run service is installed and the registry path `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration` exists on the endpoint.

**How do I verify the change was applied?**  
> Check the Script Log output after the task runs. The task confirms each registry value and reports whether all three keys were set correctly.

**Can I revert to the previous channel?**  
> Set the custom field to the desired previous channel and re-run the task. Microsoft 365 may need to download updated components when switching channels.

**What does `None` do?**  
> Setting the custom field to `None` causes the task to skip that machine — no registry changes are made. Use this to exclude specific endpoints from channel management while still targeting them with the task.

## Changelog

### 2026-06-16

- Enhanced PowerShell script with registry confirmation, improved logging, and cleaner channel precedence logic
- Simplified the task structure in ConnectWise RMM
- Expanded solution documentation with overview, how-it-works explanation, update channel reference table, setup steps, and FAQs
- Updated description to reflect full solution scope

### 2025-04-10

- Initial version of the document
