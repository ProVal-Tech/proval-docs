---
id: '08281245-9380-4946-b1a6-099aebfffd6f'
slug: /08281245-9380-4946-b1a6-099aebfffd6f
title: 'New SQL Updates'
title_meta: 'New SQL Updates'
keywords: ['sql', 'sql-server', 'sql-server-patching', 'workflow', 'ticketing']
description: 'Automates the detection of new SQL-related Windows Updates using the native Windows Update API and manages the ConnectWise ticket lifecycle via webhooks.'
tags: ['auditing', 'mssql', 'patching', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-08-12
---

## Purpose

The **New SQL Updates** solution provides an automated, intelligent audit of SQL-related Windows Updates across your managed SQL Server endpoints.

Rather than relying exclusively on third-party PowerShell modules, the solution's core task queries the native Windows Update API (COM object) to find pending updates. It falls back to the `PSWindowsUpdate` module only if the native API scan fails or returns zero results, ensuring maximum compatibility and performance. By leveraging persistent UTC date tracking, the script accurately distinguishes between previously reported patches and genuinely new releases.

Ticketing is decoupled from the native RMM task engine and handled via a structured webhook payload sent to the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. This enables a clean, automated ticket lifecycle:

- **Creation:** A `Create` webhook is fired when SQL updates released *after* the last successful scan are detected.
- **Closure:** A `Close` webhook is fired automatically when the machine is fully patched and zero SQL updates remain available for installation.
- **Suppression:** If pending updates exist but were already reported in a previous run, no webhook is fired, preventing duplicate tickets and comment spam.
- **Cumulative Ticketing:** Because the script evaluates release dates against the last run date, a server can legitimately have multiple open tickets if Microsoft releases SQL patches on different days (e.g., a standard Tuesday patch opens Ticket A; a subsequent out-of-band Friday patch opens Ticket B).

## Associated Content

### Group

| Name | Purpose |
|---|---|
| [SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c) | Dynamic group that targets Windows servers running a service with a display name containing "SQL Server". |

### Task

| Name | Purpose |
|---|---|
| [Get New SQL Updates](/docs/3b44e58d-1764-414b-94fd-05fedddd511d) | Audits the native Windows Update API (with a module fallback) for new SQL patches, tracks state via persistent storage, and fires Create/Close webhooks to the ticketing workflow. |

### Trigger

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) | Webhook trigger that receives `Create` and `Close` payloads from the audit task and starts the ticketing workflow. |

### Workflow

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) | Creates and closes ConnectWise tickets based on the audit task's webhook payloads, handling device lookups and status updates. |

### Custom Fields

| Name | Level | Type | Purpose |
|---|---|---|---|
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | Company | Text Box | Stores the workflow's webhook URL (copied from the trigger's webhook instance) as its Default Value so the task knows where to send payloads. |

## Implementation

Follow these steps in order to deploy the solution.

### Step 1: Create the Dynamic Group

Set up the [SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c) group under `ENDPOINTS` ➞ `Groups` as a dynamic group to automatically include all Microsoft SQL Servers based on their running services.

### Step 2: Verify or Create the We~bhook Custom Field

Check if the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field already exists at the **Company** level (it is a shared component used by other monitoring solutions).

- **If it exists:** Verify that its **Default Value** contains a valid webhook URL. If it does, you can skip to Step 3.
- **If it does not exist:** Create it as a **Text Box** at the Company level. This will serve as the global storage location for the workflow's webhook endpoint.

### Step 3: Verify or Install and Configure the Workflow

Check if the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow and its associated [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) are already installed in your environment.

- **If already installed and configured:** Verify that the webhook URL in the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field matches an active webhook instance in the trigger, and that the workflow's **Create Ticket** action is configured for your Service Board. Then skip to Step 4.
- **If not installed:**
  1. Install the workflow from the `ProVal - Content` Community. This automatically installs the associated trigger.
  2. Open the workflow, click the **Trigger** node, and create a new webhook instance named `CWRMM Ticket Management for Monitors`.
  3. **Copy the generated URL** and paste it into the **Default Value** of the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field, then save the field.
  4. Open the workflow's **Create Ticket** action node and configure the **Service Board** and assignment rules to match your environment's standards.

> **Important — user permissions:** The workflow runs under the context of the user account that creates it. Ensure the workflow was created (or is owned) by an account that has access to **all** SQL servers you intend to monitor; otherwise, ticket creation/closure will silently fail for devices that user cannot access.

### Step 4: Create the Task

Add the [Get New SQL Updates](/docs/3b44e58d-1764-414b-94fd-05fedddd511d) task under `AUTOMATION` ➞ `Tasks`. During the task creation, ensure that Step 1 maps the `@workflowWebhookUrl@` variable to the `Ticket_Mgmt_Webhook_Url` custom field so the script can retrieve the endpoint URL at runtime.

### Step 5: Schedule the Task

Configure the task to run daily against the [SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c) group, following the instructions in the [Schedule Task](/docs/3b44e58d-1764-414b-94fd-05fedddd511d#schedule-task) section of the script documentation.

## FAQ

### Q: How does the script detect SQL updates?

> The script primarily queries the native Windows Update API (COM object) for uninstalled, unhidden updates and filters them by the "SQL" title. If the native scan fails or returns zero results, it dynamically installs and falls back to the `PSWindowsUpdate` module to ensure no updates are missed.

### Q: How does the ticketing lifecycle work?

> The script maintains the last run date in persistent storage.
>
> - If it finds SQL updates released *after* that date, it fires a `Create` webhook.
> - If it finds zero SQL updates available on the machine at all, it fires a `Close` webhook.
> - If it finds SQL updates, but they were already reported on a previous run, it does nothing (preventing duplicate tickets and comment spam).

### Q: Can a server have multiple open SQL update tickets?

> Yes. Because the script keys off the update's *release date* compared to the *last run date*, a server can legitimately accumulate multiple open tickets if Microsoft releases patches on different days. For example, a standard Tuesday patch opens Ticket A. If the server isn't patched and Microsoft releases an out-of-band SQL patch on Friday, the next daily scan will detect the new release date and open Ticket B.

### Q: What happens on the first run of the script?

> On its initial execution, the script has no previous run date to compare against. It defaults to a 90-day lookback window, meaning it will detect and ticket any SQL updates released within the past 90 days that are still pending installation.

### Q: Why isn't the ticket closing when I install the updates?

> Work through this checklist:
>
> 1. The updates were fully installed and no longer show as pending in Windows Update.
> 2. The daily scheduled task has run *since* the updates were installed.
> 3. The [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field contains the correct, real webhook URL.
> 4. The user who created the workflow has permission to access the SQL server and update its tickets in ConnectWise.

### Q: What are the prerequisites for running the script?

> The script requires PowerShell 5.1 or higher, Administrator privileges, and internet access to download the Strapper module (for persistent state tracking) and potentially the `PSWindowsUpdate` module (as a fallback).

## Changelog

### 2026-08-12

- Transitioned from native RMM task ticketing to webhook-based ticketing using the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. This enables clean ticket creation, automatic closure when fully patched, and eliminates duplicate tickets/comment spam for already-reported updates.
- Replaced the module-only approach with a native Windows Update API (COM object) scan for better performance and reliability. The `PSWindowsUpdate` module is now installed and queried only as a fallback mechanism.

### 2025-08-13

- Initial version of the document
