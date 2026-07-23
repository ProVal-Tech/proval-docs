---
id: 'cda6ee21-e70f-45c3-868c-1800d4aa26d7'
slug: /cda6ee21-e70f-45c3-868c-1800d4aa26d7
title: 'Memory Threshold Violation Monitoring'
title_meta: 'Memory Threshold Violation Monitoring'
keywords: ['memory', 'monitoring', 'windows', 'alerts', 'thresholds', 'performance', 'workflow', 'trigger']
description: 'Intelligently monitors sustained high Memory usage using hierarchical custom thresholds. Offers a choice of built‑in or workflow‑based ticketing, both with automatic ticket resolution.'
tags: ['performance', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Purpose

The **Memory Threshold Violation Monitoring** solution continuously tracks Memory usage (specifically `% Committed Bytes In Use`) on Windows endpoints and alerts you only when a sustained, high‑load condition persists for a configurable amount of time. It is designed to ignore brief, harmless spikes and only generate tickets when a true performance issue requires your attention.

Unlike traditional monitoring that looks at a single fixed percentage, this solution uses a **two‑threshold logic**:

1. **High Threshold** – the Memory percentage that starts the timer.
2. **Low Threshold** – the percentage that resets the timer if the Memory falls below it.
3. **Sustained Minutes** – the number of minutes the Memory must remain above the low threshold (after first exceeding the high threshold) before an alert is raised.

The actual monitoring is performed by a lightweight monitor that reads a local JSON configuration file every 15 minutes. A separate daily configuration writer task pulls the threshold values from ConnectWise RMM custom fields and writes that file, allowing you to manage policies entirely through custom fields without touching scripts.

The solution ships with **two monitor sets** that detect sustained high Memory identically but handle ticketing differently. You choose the one that fits the partner — see [Ticketing Options](#ticketing-options).

### Key Capabilities

- **Two‑Threshold Alerting with Automatic Reset** – Alert only on sustained high Memory. Brief spikes that drop back below the low threshold reset the timer automatically.
- **Choice of Ticketing Approach** – Use the monitor's **built‑in ticketing** for zero extra setup, or the optional **[Workflow] monitor** for clean, standardized tickets driven by the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. See [Ticketing Options](#ticketing-options).
- **Automatic Ticket Resolution (both options)** – When Memory falls below the low threshold, the open ticket is closed automatically — by the monitor's auto‑resolution rule (built‑in) or by a `Close` webhook (workflow). No manual closure is required.
- **No Duplicate Tickets (both options)** – A persistent high‑Memory condition never spawns repeated tickets. The built‑in monitor comments on the existing ticket; the [Workflow] monitor tracks state locally so exactly one ticket exists per incident (with no comment spam).
- **Informative Tickets** – The alert includes how long ago the spike began, the current Memory usage, the top five Memory‑consuming processes (as a percentage of total physical memory), and the PowerShell command line when PowerShell is among them. The [Workflow] variant presents this with a clean, controlled subject and body.
- **Hierarchical Policy Management** – Set Company‑wide defaults, override them at a Site, or set a unique value for a single Endpoint – all through custom fields.
- **OS‑Aware Targeting** – Servers and Workstations automatically use their respective threshold fields (`_Svr` / `_Wks`).
- **Configuration / Monitoring Decoupling** – Threshold changes take effect on the next daily (or manual) run of the configuration writer, without modifying the monitor itself.

### Important Caveats & Behavior

- **Daily Configuration Update** – The configuration writer task runs once per day. If you change a custom field, the new thresholds will only be picked up after the next scheduled run. You can manually run the task on an endpoint to apply changes immediately.
- **Monitor Interval** – The monitor checks Memory usage every 15 minutes against the stored configuration file.
- **Ticketing Behavior Depends on the Monitor** – Both monitors auto‑close the ticket on recovery, but the mechanism and the comment handling differ. See [Ticketing Options](#ticketing-options) for the exact behavior of each.
- **One Monitor Per Device** – The two monitors are mutually exclusive ticketing approaches. Import and deploy **only one** of them to a given device; deploying both would create conflicting or duplicate tickets.
- **Workflow Option Coverage** – The [Workflow] monitor depends on a valid webhook URL and on the workflow running under its creator's permissions. If the creating user lacks access to a device, ticketing will silently fail for that device. The built‑in monitor has no such dependency and works on all machines.

## Ticketing Options

This solution provides **two monitor sets** that perform identical sustained‑Memory detection but handle ticketing differently. **Choose one** and import only that monitor — they are mutually exclusive per device.

| | Built‑in Ticketing | Workflow Ticketing |
|---|---|---|
| **Monitor** | [Memory Threshold Violation Monitoring](/docs/919528ea-47be-4700-88e6-55accd98b435) | [Memory Threshold Violation Monitoring [Workflow]](/docs/029c88f9-1655-4919-8c25-873ad4b53ca0) |
| **How tickets are created** | CW RMM monitor's built‑in ticketing | Webhook → [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow |
| **Ticket subject** | Set by the monitor; not customizable | Clean and controlled (e.g., `Memory Threshold Violation - Memory - SERVER01 - 95 Percent`) |
| **Ticket body** | The monitor's alert message in its fixed format (spike time, current usage, top five processes) | A clean, controlled message: how long ago the spike began, the low threshold held above, current usage, and the top five processes (+ PowerShell command line if applicable) |
| **While the alert persists** | Adds a comment to the open ticket on each detection (bulky ticket) | One ticket per incident; no comment spam |
| **Resolution** | Auto‑resolves via the monitor set's automatic resolution rule | Auto‑closes via a `Close` webhook to the workflow |
| **Device coverage** | Works on all machines | Depends on the workflow + a valid webhook URL + the workflow creator's device permissions |
| **Extra components required** | None | [Trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7), [Workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57), [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field, and a webhook instance |
| **Best for** | Partners who want zero extra setup | Partners who want clean, standardized tickets with no comment spam |

**How to choose:**

- Pick **Built‑in** if you want the simplest deployment and don't mind monitor‑generated ticket formatting and per‑detection comments.
- Pick **Workflow** if you want clean, consistently formatted tickets without comment spam — and you can complete the one‑time workflow/webhook setup (and ensure the workflow is created by a user with access to all monitored devices). Both options auto‑close the ticket on recovery, so the decision comes down to ticket quality and setup versus universal coverage.

> Whichever you choose, the **group**, the **configuration writer task**, the **threshold / sustained‑minutes / enablement custom fields**, and the **local config file** are shared and identical. Only the monitor — and, for the Workflow option, the trigger / workflow / webhook field — differ.

## Associated Content

### Group

| Name | Purpose |
|---|---|
| [Memory Threshold Violation Monitoring](/docs/183946ab-f199-4b68-b92a-6dab5ae19d24) | Dynamic group that targets Windows endpoints based on the `MTVM_Enable` custom fields, automatically pulling in devices authorized for monitoring. Shared by both ticketing options. |

### Task

| Name | Purpose |
|---|---|
| [Memory Threshold Violation Monitoring Configuration Writer](/docs/27c2c3ce-52f1-4deb-9f4f-442f2cd27343) | Runs daily to resolve hierarchical thresholds from custom fields and writes the JSON configuration file for the monitor. Also writes the workflow webhook URL (`TicketWebhookUrl`) into the file when the `Ticket_Mgmt_Webhook_Url` field is populated. Shared by both ticketing options. |

### Monitor

> Choose **one** of the following monitors to import. They are mutually exclusive ticketing approaches for the same solution — do not deploy both to the same device. See [Ticketing Options](#ticketing-options) for help choosing.

| Name | Ticketing | Purpose |
|---|---|---|
| [Memory Threshold Violation Monitoring](/docs/919528ea-47be-4700-88e6-55accd98b435) | Built‑in | Runs every 15 minutes, reading the local JSON configuration file. Evaluates sustained Memory usage via the two‑threshold logic and generates / resolves tickets using the monitor's built‑in ticketing. |
| [Memory Threshold Violation Monitoring [Workflow]](/docs/029c88f9-1655-4919-8c25-873ad4b53ca0) | Workflow | Runs every 15 minutes, reading the same JSON configuration file. Performs the same Memory evaluation but creates and closes tickets by firing webhooks to the CWRMM Ticket Management workflow, producing clean tickets with no comment spam. |

### Trigger (Workflow option only)

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) | Webhook trigger that receives `Create` / `Close` / `Comment` payloads from the [Workflow] monitor and starts the ticketing workflow. Required only for the Workflow option. |

### Workflow (Workflow option only)

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) | Creates, closes, and comments on ConnectWise tickets based on the monitor's webhook payloads. Required only for the Workflow option. |

### Custom Fields: Enablement

These fields act as the "on/off switch" for the solution. They use a Dropdown (`Enable` or `Disable`) to dynamically target devices.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [MTVM_Enable_Svr](/docs/2fae464f-4fe6-4c42-9957-664365c25fe0) | Company | Dropdown | Enables or disables Memory monitoring for servers at the Company level. |
| [MTVM_Enable_Wks](/docs/f00277da-77b2-4f63-9f06-438b5f3800c8) | Company | Dropdown | Enables or disables Memory monitoring for workstations at the Company level. |
| [MTVM_Enable_Svr_Site](/docs/46461e0d-19a9-415f-998f-fc9b6d2a6112) | Site | Dropdown | Site‑level override for server enablement. |
| [MTVM_Enable_Wks_Site](/docs/61e68b73-3a6e-4e43-ac03-188a29a9b446) | Site | Dropdown | Site‑level override for workstation enablement. |
| [MTVM_Enable](/docs/cdbbb3d0-31a3-4ac7-816c-f381c8c94c7d) | Endpoint | Dropdown | Endpoint‑level override to explicitly enable/disable specific machines. |

### Custom Fields: High Threshold

Enter the Memory percentage that **starts** the sustained‑usage timer. Must be higher than the low threshold.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [MTVM_HighThreshold_Svr](/docs/68411d50-3434-4a8f-b61a-45280882d55c) | Company | Text Box | Company baseline for servers (Default: 95). |
| [MTVM_HighThreshold_Wks](/docs/59645171-f364-49d2-b77f-540a7e196548) | Company | Text Box | Company baseline for workstations (Default: 90). |
| [MTVM_HighThreshold_Svr_Site](/docs/fd75f77b-f6d4-4da5-b940-f4d453cdf629) | Site | Text Box | Site‑level override for servers. |
| [MTVM_HighThreshold_Wks_Site](/docs/4b3eacba-d5e1-4f80-8f4b-c4debb5634e4) | Site | Text Box | Site‑level override for workstations. |
| [MTVM_HighThreshold](/docs/7b979e7c-127e-45f7-8272-1673859fd52e) | Endpoint | Text Box | Endpoint‑level override (applies to both OS types). |

### Custom Fields: Low Threshold

Enter the Memory percentage that **resets** the timer and clears the alert. Must be lower than the high threshold.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [MTVM_LowThreshold_Svr](/docs/699f0cee-b9aa-4518-978c-411438d5f5a0) | Company | Text Box | Company baseline for servers (Default: 90). |
| [MTVM_LowThreshold_Wks](/docs/48c01a19-6250-4eb2-a9c4-c0431a2789dc) | Company | Text Box | Company baseline for workstations (Default: 85). |
| [MTVM_LowThreshold_Svr_Site](/docs/e44a2b52-44ef-4cfb-9d76-ed3036bbce07) | Site | Text Box | Site‑level override for servers. |
| [MTVM_LowThreshold_Wks_Site](/docs/54fd4b39-a8be-4683-92e2-270f44738cff) | Site | Text Box | Site‑level override for workstations. |
| [MTVM_LowThreshold](/docs/e52a3fd2-c154-499d-a775-2f4e7e10abe2) | Endpoint | Text Box | Endpoint‑level override (applies to both OS types). |

### Custom Fields: Sustained Minutes

Enter the number of minutes the Memory must remain above the low threshold (after spiking above the high threshold) before an alert is generated.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [MTVM_UsageMins_Svr](/docs/8eaa16d2-cbc5-4c46-84a4-ab17da0f8dd8) | Company | Text Box | Company baseline for servers (Default: 30). |
| [MTVM_UsageMins_Wks](/docs/56b23367-3c2c-49c0-8f53-501072a1e8b5) | Company | Text Box | Company baseline for workstations (Default: 30). |
| [MTVM_UsageMins_Svr_Site](/docs/6f5b0137-4bef-4c9a-bb2e-b2cee5d9a595) | Site | Text Box | Site‑level override for servers. |
| [MTVM_UsageMins_Wks_Site](/docs/bb20ad1a-a6f2-4d6d-9193-ef4051adeba4) | Site | Text Box | Site‑level override for workstations. |
| [MTVM_UsageMins](/docs/ac69275d-6200-4bc0-a449-0778149615f0) | Endpoint | Text Box | Endpoint‑level override (applies to both OS types). |

### Custom Fields: Ticketing (Workflow option only)

Required only when you deploy the [Workflow] monitor. The configuration writer reads this field and writes its value into the config file as `TicketWebhookUrl`, which the [Workflow] monitor uses to reach the ticketing workflow. If you deploy the built‑in monitor only, you may skip this field — the configuration writer tolerates its absence.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | Company | Text Box | Stores the workflow's webhook URL (copied from the trigger's webhook instance) as its Default Value. |

## Implementation

Follow these steps in order. Steps 1–3 and 6–8 are common to both ticketing options. **Steps 4–5** are where you choose and configure your ticketing approach — import **only** the monitor for the option you choose.

### Step 1: Create the Shared Custom Fields

Create all 20 shared custom fields listed below in ConnectWise RMM. These are required regardless of which ticketing option you choose.

- [Custom Field: MTVM_Enable](/docs/cdbbb3d0-31a3-4ac7-816c-f381c8c94c7d)
- [Custom Field: MTVM_Enable_Svr](/docs/2fae464f-4fe6-4c42-9957-664365c25fe0)
- [Custom Field: MTVM_Enable_Svr_Site](/docs/46461e0d-19a9-415f-998f-fc9b6d2a6112)
- [Custom Field: MTVM_Enable_Wks](/docs/f00277da-77b2-4f63-9f06-438b5f3800c8)
- [Custom Field: MTVM_Enable_Wks_Site](/docs/61e68b73-3a6e-4e43-ac03-188a29a9b446)
- [Custom Field: MTVM_HighThreshold](/docs/7b979e7c-127e-45f7-8272-1673859fd52e)
- [Custom Field: MTVM_HighThreshold_Svr](/docs/68411d50-3434-4a8f-b61a-45280882d55c)
- [Custom Field: MTVM_HighThreshold_Svr_Site](/docs/fd75f77b-f6d4-4da5-b940-f4d453cdf629)
- [Custom Field: MTVM_HighThreshold_Wks](/docs/59645171-f364-49d2-b77f-540a7e196548)
- [Custom Field: MTVM_HighThreshold_Wks_Site](/docs/4b3eacba-d5e1-4f80-8f4b-c4debb5634e4)
- [Custom Field: MTVM_LowThreshold](/docs/e52a3fd2-c154-499d-a775-2f4e7e10abe2)
- [Custom Field: MTVM_LowThreshold_Svr](/docs/699f0cee-b9aa-4518-978c-411438d5f5a0)
- [Custom Field: MTVM_LowThreshold_Svr_Site](/docs/e44a2b52-44ef-4cfb-9d76-ed3036bbce07)
- [Custom Field: MTVM_LowThreshold_Wks](/docs/48c01a19-6250-4eb2-a9c4-c0431a2789dc)
- [Custom Field: MTVM_LowThreshold_Wks_Site](/docs/54fd4b39-a8be-4683-92e2-270f44738cff)
- [Custom Field: MTVM_UsageMins](/docs/ac69275d-6200-4bc0-a449-0778149615f0)
- [Custom Field: MTVM_UsageMins_Svr](/docs/8eaa16d2-cbc5-4c46-84a4-ab17da0f8dd8)
- [Custom Field: MTVM_UsageMins_Svr_Site](/docs/6f5b0137-4bef-4c9a-bb2e-b2cee5d9a595)
- [Custom Field: MTVM_UsageMins_Wks](/docs/56b23367-3c2c-49c0-8f53-501072a1e8b5)
- [Custom Field: MTVM_UsageMins_Wks_Site](/docs/bb20ad1a-a6f2-4d6d-9193-ef4051adeba4)

### Step 2: Create the Group

Create the dynamic group that will automatically target the enabled machines.

- [Memory Threshold Violation Monitoring](/docs/183946ab-f199-4b68-b92a-6dab5ae19d24)

### Step 3: Create the Configuration Writer Task

Set up the configuration writer script that will run on the targeted endpoints.

- [Memory Threshold Violation Monitoring Configuration Writer](/docs/27c2c3ce-52f1-4deb-9f4f-442f2cd27343)

> This task also writes the workflow webhook URL into the config file when the `Ticket_Mgmt_Webhook_Url` field is populated. If you choose the built‑in option and skip that field, the task still runs successfully (the relevant row is set to Continue on Failure) and simply writes a placeholder the built‑in monitor ignores.

### Step 4: Choose Your Ticketing Approach

Decide whether the partner will use **Built‑in** or **Workflow** ticketing. See [Ticketing Options](#ticketing-options) for the comparison and guidance. Your choice determines which monitor you import in Step 5 and whether you need the workflow components.

### Step 5: Create the Monitor (and Workflow Components, if applicable)

#### Option A — Built‑in Ticketing

Import the original monitor. No additional components are required.

- [Memory Threshold Violation Monitoring](/docs/919528ea-47be-4700-88e6-55accd98b435)

#### Option B — Workflow Ticketing

Import the [Workflow] monitor **and** set up the workflow components. Complete the following in order:

1. Create the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field (Company, Text Box).
2. Install the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow from the `ProVal - Content` Community. This also installs the [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7).
3. In the workflow's **Trigger** node, create a new webhook instance named `CWRMM Ticket Management for Monitors` and **copy the generated URL**. (See the workflow document's *Create the Webhook Instance* section.)
4. Set that URL as the **Default Value** of the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field and save. Then run the Configuration Writer task once (or wait for the next daily run) so the config file is populated with the real URL before the [Workflow] monitor relies on it.
5. Configure the workflow's **Create Ticket** action (Service Board and assignment) to match your environment. (See the workflow document's *Configure the Create Ticket Action* section.)
6. Import the [Memory Threshold Violation Monitoring [Workflow]](/docs/029c88f9-1655-4919-8c25-873ad4b53ca0) monitor.

> **Important — user permissions:** The workflow runs under the context of the user account that creates it. Create the workflow with a user that has access to **all** devices you intend to monitor; otherwise ticket creation/closure will silently fail for any device that user cannot access. See the workflow document for details.

### Step 6: Schedule the Task

Schedule the [Memory Threshold Violation Monitoring Configuration Writer](/docs/27c2c3ce-52f1-4deb-9f4f-442f2cd27343) task to run once per day against the [Memory Threshold Violation Monitoring](/docs/183946ab-f199-4b68-b92a-6dab5ae19d24) group, as described in the Schedule Task section of the task's document.

Whichever monitor you imported is already configured to run every 15 minutes against the same group and requires no additional scheduling.

### Step 7: Review and Set Threshold Custom Fields

Review the default threshold values and set the threshold custom fields as required for your environments. You can set broad Company‑level baselines, and then configure specific Site‑level or Endpoint‑level overrides where tighter rules or exceptions are needed.

### Step 8: Review and Set Enablement Custom Fields

Set the enablement custom fields to `Enable` for the client, location, or specific endpoint to turn the solution and monitoring on for them. Machines will not be monitored until they are explicitly enabled via these dropdown fields.

## FAQ

### Q: How does the Memory Threshold Violation monitor work?

> A local configuration file (JSON) is written daily by the configuration writer task. The monitor reads this file every 15 minutes, samples the Memory usage over 10 seconds, and applies a two‑threshold logic:
>
> - When Memory first exceeds the **high threshold**, a marker is created and the timer starts.
> - As long as Memory stays above the **low threshold**, the timer continues.
> - If the timer reaches the **sustained minutes**, an alert is raised.
> - If at any point Memory drops below the low threshold, the marker is deleted and the timer resets.
>
> The two available monitors detect sustained high Memory identically — they differ only in how they create and close tickets (see [Ticketing Options](#ticketing-options)).

### Q: What's the difference between the two monitors, and which should I choose?

> Both monitors read the same config file and detect sustained high Memory the same way, and both close the ticket automatically on recovery. The **built‑in** monitor ([Memory Threshold Violation Monitoring](/docs/919528ea-47be-4700-88e6-55accd98b435)) uses the monitor's native ticketing — simplest to deploy, but tickets carry monitor‑generated formatting and a comment is added on each detection. The **[Workflow]** monitor ([Memory Threshold Violation Monitoring [Workflow]](/docs/029c88f9-1655-4919-8c25-873ad4b53ca0)) creates clean, consistently formatted tickets via the [CWRMM workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) with no comment spam — at the cost of a one‑time workflow/webhook setup. See the [Ticketing Options](#ticketing-options) comparison table.

### Q: Do I need to import both monitors?

> No. The two monitors are mutually exclusive ticketing approaches for the same solution. Import and deploy **only one** per device. Deploying both would create conflicting or duplicate tickets.

### Q: What are the default thresholds if I don't set any custom fields?

> For **servers**: High = 95%, Low = 90%, Sustained Minutes = 30.
> For **workstations**: High = 90%, Low = 85%, Sustained Minutes = 30.
> These defaults are used when no Company, Site, or Endpoint field is populated.

### Q: I changed a threshold custom field. When will the new values take effect?

> The configuration writer task runs once per day (by default). The new thresholds will be applied on the next scheduled run. You can manually execute the [Memory Threshold Violation Monitoring Configuration Writer](/docs/27c2c3ce-52f1-4deb-9f4f-442f2cd27343) task on an endpoint to update the configuration file immediately.

### Q: How quickly will I be notified of a sustained Memory issue?

> The monitor checks every 15 minutes. If the Memory has been above the low threshold (after spiking above the high threshold) for the configured number of minutes, a ticket will be created on the next monitor run. So the maximum delay from the moment the condition is met is 15 minutes.

### Q: Will the ticket close automatically when the Memory usage drops?

> Yes, with either monitor. The built‑in monitor re‑runs the same script for resolution; when the Memory falls below the low threshold the marker file is deleted and the script outputs nothing, so the monitor's automatic resolution rule closes the ticket. The [Workflow] monitor fires a `Close` webhook on recovery and the workflow closes the ticket. Neither requires manual closure.

### Q: Will the monitor create a new ticket every time it detects high Memory usage?

> No. With the built‑in monitor, the first sustained detection creates a ticket and subsequent detections add a comment to that same ticket. With the [Workflow] monitor, a local state machine ensures exactly one ticket exists per incident and adds no comments. In both cases a new ticket is only created if the issue was resolved (Memory dropped below the low threshold) and later re‑occurs.

### Q: Why does the Workflow option need a trigger, a workflow, and a custom field?

> The [Workflow] monitor doesn't create tickets itself — it sends an HTTP POST (a webhook) to the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, which performs the actual ticket creation/closure in ConnectWise. The [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) provides the webhook endpoint, and the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field stores that endpoint's URL so the configuration writer can pass it to the monitor via the config file.

### Q: The [Workflow] monitor isn't creating or closing tickets. What should I check?

> Work through this checklist:
>
> 1. The [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field's Default Value is set to the **real** webhook instance URL (not the placeholder).
> 2. A webhook instance was created in the workflow's trigger and the URL was copied from it.
> 3. The [workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) is installed and published, and its Create Ticket action is configured for a valid Service Board.
> 4. The Configuration Writer task was re‑run **after** the URL was set, so the config file contains the real URL.
> 5. The user who created the workflow has access to the affected device (see the next question).
> 6. The monitor's output for an action run — a failed webhook is logged there.

### Q: Why does the [Workflow] monitor work on some machines but not others?

> The workflow runs under the context of the user account that created it. If that user lacks permission to a specific device, the workflow cannot create or update tickets for it and ticketing silently fails for that endpoint. Create the workflow with a user that has access to all monitored devices. The built‑in monitor has no such dependency.

### Q: Can I switch from built‑in to workflow ticketing (or vice versa) later?

> Yes. Import the monitor for the new approach (and, for workflow, complete the trigger/workflow/webhook setup), then remove or disable the old monitor so both aren't active at once. Note that tickets already opened by the old approach won't be auto‑managed by the new one — close any stragglers manually.

### Q: Why isn't a specific device being monitored?

> The device must be explicitly enabled via the `MTVM_Enable` custom fields. Check that the Endpoint, its Site, or its Company has the appropriate `MTVM_Enable*` field set to `Enable`. Blank or `Disable` entries will exclude the device from the monitoring group.

### Q: I want to monitor only my servers, not workstations. How do I do that?

> At the Company level, set `MTVM_Enable_Svr` to `Enable` and leave `MTVM_Enable_Wks` blank or set to `Disable`. The dynamic group will then only pick up Windows Servers.

### Q: Can I set different thresholds for a specific critical server?

> Yes. Set the desired threshold values directly in the Endpoint‑level custom fields (e.g., `MTVM_HighThreshold`, `MTVM_LowThreshold`, `MTVM_UsageMins`) for that machine. Endpoint values override everything else.

### Q: What happens if I only set the high threshold but not the low threshold or minutes?

> The configuration writer will still apply defaults for the missing fields. For example, if you set `MTVM_HighThreshold` = 98 on a server but leave the others blank, the server will use Low = 90 (default) and Minutes = 30 (default).

### Q: What does the monitor ticket contain?

> The ticket body includes how long ago the Memory spiked above the high threshold, the current Memory usage, a list of the top five Memory‑consuming processes (each process's working set expressed as a percentage of total physical memory), and — if applicable — the command line of any PowerShell process that is consuming Memory. The [Workflow] monitor presents this with a clean, controlled subject (e.g., `Memory Threshold Violation - Memory - SERVER01 - 95 Percent`) and body; the built‑in monitor uses the monitor's default subject and formatting.

### Q: Can I disable monitoring for a single server temporarily without deleting custom fields?

> Yes. Set `MTVM_Enable` = `Disable` at the Endpoint level for that machine. The device will be removed from the monitoring group and no further monitoring will occur until you re‑enable it.

### Q: I see the configuration file under ProgramData. Can I modify it manually?

> Manual changes to the JSON file will be overwritten the next time the configuration writer task runs. Always adjust thresholds through the custom fields to ensure consistency.

### Q: The monitor output says "Memory monitoring configuration file not found." What should I do?

> This means the configuration writer task has not yet run on that endpoint. Run the [Memory Threshold Violation Monitoring Configuration Writer](/docs/27c2c3ce-52f1-4deb-9f4f-442f2cd27343) task manually or wait for the next daily schedule.

### Q: The monitor isn't generating tickets, or the ticket status isn't updating. How can I check if the configuration file is correct?

> Verify that the configuration file exists at `C:\ProgramData\_Automation\Script\Test-MemoryUsage\Test-MemoryUsage.json`. If the file is missing, run the [Memory Threshold Violation Monitoring Configuration Writer](/docs/27c2c3ce-52f1-4deb-9f4f-442f2cd27343) task manually on the endpoint. If the file exists but the thresholds seem wrong, check the custom fields at the Endpoint, Site, and Company levels; the task will use the first valid value it finds in that order. After updating fields, manually run the task again to refresh the file. (For the [Workflow] monitor, also confirm the `TicketWebhookUrl` value in the file is the real webhook URL — see the workflow troubleshooting question above.)

### Q: How can I tell if the monitor is actually running and evaluating Memory usage?

> Check the monitor's run history in the ConnectWise RMM console. You can also look for the marker file `C:\ProgramData\_Automation\Script\Test-MemoryUsage\Test-MemoryUsage.flag`. If it exists, a high‑Memory event is currently being tracked. If it does not exist, either no spike has occurred or the Memory has dropped below the low threshold and the timer has reset.

## Changelog

### 2026-07-23

- **New Optional Workflow Ticketing:** Added a second, optional monitor — [Memory Threshold Violation Monitoring [Workflow]](/docs/029c88f9-1655-4919-8c25-873ad4b53ca0) — that creates clean tickets and auto‑closes them on recovery by firing webhooks to the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, with no per‑detection comment spam.
- **New Components (Workflow option only):** Added the [CWRMM Ticket Management for Monitors trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) and [workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57), and the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field that stores the webhook URL.
- **Partner Choice:** The two monitors are mutually exclusive ticketing approaches. Added a [Ticketing Options](#ticketing-options) comparison and reworked Implementation so partners import **only** the monitor they choose; the group, task, and threshold/sustained‑minutes/enablement fields are shared. Both options auto‑close tickets on recovery; the [Workflow] option's advantages are clean tickets and no comment spam.
- The original built‑in monitor [Memory Threshold Violation Monitoring](/docs/919528ea-47be-4700-88e6-55accd98b435) remains available unchanged.

### 2026-07-15

- Initial version of the document
