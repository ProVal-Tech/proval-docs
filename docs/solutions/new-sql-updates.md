---
id: '08281245-9380-4946-b1a6-099aebfffd6f'
slug: /08281245-9380-4946-b1a6-099aebfffd6f
title: 'New SQL Updates'
title_meta: 'New SQL Updates'
keywords: ['sql', 'sql-server', 'sql-server-patching', 'workflow', 'ticketing', 'bot', 'device-association']
description: 'Automates the detection of new SQL-related Windows Updates using the native Windows Update API and manages the ConnectWise ticket lifecycle via webhooks.'
tags: ['auditing', 'mssql', 'patching', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-07
---

## Purpose

The **New SQL Updates** solution provides an automated, intelligent audit of SQL-related Windows Updates across your managed SQL Server endpoints.

Rather than relying exclusively on third-party PowerShell modules, the solution's core task queries the native Windows Update API (COM object) to find pending updates. It falls back to the `PSWindowsUpdate` module only if the native API scan fails or returns zero results, ensuring maximum compatibility and performance. By leveraging persistent UTC date tracking, the script accurately distinguishes between previously reported patches and genuinely new releases.

Ticketing is decoupled from the native RMM task engine and handled via a structured webhook payload sent to the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. This enables a clean, automated ticket lifecycle:

- **Creation:** A `Create` webhook is fired when SQL updates released *after* the last successful scan are detected.
- **Closure:** A `Close` webhook is fired automatically when the machine is fully patched and zero SQL updates remain available for installation.
- **Suppression:** If pending updates exist but were already reported in a previous run, no webhook is fired, preventing duplicate tickets and comment spam.
- **Device Association:** The audited server is attached to the ticket by the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot, which the workflow calls in place of the native **Create Ticket** action so the server is attached in the same API call that raises the ticket. A native workflow action cannot attach a device to a ticket.
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
| [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) | Creates and closes ConnectWise tickets based on the audit task's webhook payloads, handling device lookups and status updates. New tickets are raised by the create bot, so the audited server is attached in the same API call. |

### Bot

| Name | Purpose |
|---|---|
| [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) | Custom RPA bot called by the workflow on the `toCreate` branch, in place of the native **Create Ticket** action. It raises the ticket with the audited server attached as its primary asset in a single API call, covering the one operation a native workflow action cannot perform. Must be installed and published **before** the workflow is imported. |

### Form

| Name | Purpose |
|---|---|
| [Create ticket with associated device](/docs/8d147440-f887-4c21-8fc8-fb93c0d54c29) | The bot's input form, supplying the company, site, device and ticket details. The bot cannot run without it, and importing the bot brings the form in with it. |

### Custom Fields

| Name | Level | Type | Purpose |
|---|---|---|---|
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | Company | Text Box | Stores the workflow's webhook URL (copied from the trigger's webhook instance) as its Default Value so the task knows where to send payloads. |

## Implementation

Follow these steps in order to deploy the solution.

### Step 1: Create the Dynamic Group

Set up the [SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c) group under `ENDPOINTS` ➞ `Groups` as a dynamic group to automatically include all Microsoft SQL Servers based on their running services.

### Step 2: Verify or Create the Webhook Custom Field

Check if the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field already exists at the **Company** level (it is a shared component used by other monitoring solutions).

- **If it exists:** Verify that its **Default Value** contains a valid webhook URL. If it does, you can skip to Step 3.
- **If it does not exist:** Create it as a **Text Box** at the Company level. This will serve as the global storage location for the workflow's webhook endpoint.

### Step 3: Verify or Install the Ticket Creation Bot and Form

The workflow calls a custom bot to raise the ticket with the audited server already attached, so the bot must exist in the environment **before** the workflow is imported. A workflow that references a bot which is not present cannot be saved.

Check if the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot is already installed (it is a shared component used by other monitoring solutions).

- **If it exists:** Verify that it is published and that its [form](/docs/8d147440-f887-4c21-8fc8-fb93c0d54c29) is attached. Then skip to Step 4.
- **If it does not exist:**
  1. Install the [Create ticket with associated device](/docs/8d147440-f887-4c21-8fc8-fb93c0d54c29) form from the `ProVal - Content` Community, selecting the **Forms** repository. Installing the bot in the next step brings the form with it, so this step is only needed if you are installing the form on its own.
  2. Install the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot from the `ProVal - Content` Community, selecting the **Bots** repository.
  3. **Publish the bot**. (See the bot document's *Implementation* section.)

### Step 4: Verify or Install and Configure the Workflow

Check if the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow and its associated [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) are already installed in your environment.

- **If already installed and configured:** Verify that the webhook URL in the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field matches an active webhook instance in the trigger, and that the bot node on the `toCreate` branch has its **ServiceBoard**, **Priority** and **Team** set for your environment. Then skip to Step 5.
- **If not installed:**
  1. Install the workflow from the `ProVal - Content` Community. This automatically installs the associated trigger.
  2. Open the workflow, click the **Trigger** node, and create a new webhook instance named `CWRMM Ticket Management for Monitors`.
  3. **Copy the generated URL** and paste it into the **Default Value** of the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field, then save the field.
  4. Open the **Bot** node on the `toCreate` branch and set **ServiceBoard**, **Priority** and **Team** to match your environment's standards. These replace the Service Board and assignment settings that a native **Create Ticket** action would have carried. (See the workflow document's *Configure the Bot Action* section.)
  5. Verify the workflow is published.

> **Important — user permissions:** The workflow runs under the context of the user account that creates it. Ensure the workflow was created (or is owned) by an account that has access to **all** SQL servers you intend to monitor; otherwise, ticket creation/closure will silently fail for devices that user cannot access.

### Step 5: Create the Task

Add the [Get New SQL Updates](/docs/3b44e58d-1764-414b-94fd-05fedddd511d) task under `AUTOMATION` ➞ `Tasks`. During the task creation, ensure that Step 1 maps the `@workflowWebhookUrl@` variable to the `Ticket_Mgmt_Webhook_Url` custom field so the script can retrieve the endpoint URL at runtime.

### Step 6: Schedule the Task

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

### Q: Is the audited server attached to the ticket?

> Yes. A native workflow action cannot attach a device to a ticket, so the workflow calls the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot in place of the native **Create Ticket** action, and the server travels in the same API call that raises the ticket. This is deliberate: a device attached by a separate follow‑up call does not carry through to the configuration on the ticket once it syncs to CW Manage, while a device supplied at creation does. If the bot or its [form](/docs/8d147440-f887-4c21-8fc8-fb93c0d54c29) is missing or unpublished, no ticket is created at all and the audit task logs the webhook failure.

### Q: The server is attached in CW RMM but the configuration is missing on the CW Manage ticket. Why?

> This is the failure mode the create bot exists to avoid. A device attached to a ticket by a separate follow‑up call does not carry through to the configuration once the ticket syncs to CW Manage, while a device supplied in the original create call does. If you see it, confirm the workflow's `toCreate` branch calls the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot rather than creating the ticket natively and attaching the server in a later step.

### Q: Can a server have multiple open SQL update tickets?

> Yes. Because the script keys off the update's *release date* compared to the *last run date*, a server can legitimately accumulate multiple open tickets if Microsoft releases patches on different days. For example, a standard Tuesday patch opens Ticket A. If the server isn't patched and Microsoft releases an out-of-band SQL patch on Friday, the next daily scan will detect the new release date and open Ticket B. Each ticket is raised by its own call to the bot, so each is created with the server already attached.

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

### 2026-09-07

- **Device Association:** The [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow now raises new tickets through the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot instead of the native **Create Ticket** action, so the audited server is attached in the same API call. A device attached by a separate follow‑up call does not carry through to the configuration on the CW Manage synced ticket, while a device supplied at creation does.
- **New Components:** Added the [Create ticket with associated device](/docs/cf8a2c3d-456c-4567-8039-97e89f894ac5) bot and its [form](/docs/8d147440-f887-4c21-8fc8-fb93c0d54c29) to Associated Content and to the Implementation steps.
- **Install Order:** Added a new Step 3 that installs the bot **before** the workflow, because a workflow referencing a bot that is not present in the environment cannot be saved. The workflow, task, and schedule steps are renumbered accordingly.
- **Configuration Moved:** The service board, priority and team for new tickets are now set on the workflow's bot node rather than in a **Create Ticket** action.
- Added FAQ entries covering device association and the CW Manage configuration sync.

### 2026-08-12

- Transitioned from native RMM task ticketing to webhook-based ticketing using the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. This enables clean ticket creation, automatic closure when fully patched, and eliminates duplicate tickets/comment spam for already-reported updates.
- Replaced the module-only approach with a native Windows Update API (COM object) scan for better performance and reliability. The `PSWindowsUpdate` module is now installed and queried only as a fallback mechanism.

### 2025-08-13

- Initial version of the document
