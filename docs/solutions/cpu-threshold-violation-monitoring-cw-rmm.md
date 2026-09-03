---
id: '49b06af7-af3b-4aaa-a90c-8efb28a65c9e'
slug: /49b06af7-af3b-4aaa-a90c-8efb28a65c9e
title: 'CPU Threshold Violation Monitoring'
title_meta: 'CPU Threshold Violation Monitoring'
keywords: ['cpu', 'monitoring', 'windows', 'alerts', 'thresholds', 'performance', 'workflow', 'trigger', 'bot', 'device-association']
description: 'Intelligently monitors sustained high CPU usage using hierarchical custom thresholds. Offers a choice of built‑in or workflow‑based ticketing, both with automatic ticket resolution.'
tags: ['performance', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-03
---

## Purpose

The **CPU Threshold Violation Monitoring** solution continuously tracks CPU usage on Windows endpoints and alerts you only when a sustained, high‑load condition persists for a configurable amount of time. It is designed to ignore brief, harmless spikes and only generate tickets when a true performance issue requires your attention.

Unlike traditional monitoring that looks at a single fixed percentage, this solution uses a **two‑threshold logic**:

1. **High Threshold** – the CPU percentage that starts the timer.
2. **Low Threshold** – the percentage that resets the timer if the CPU falls below it.
3. **Sustained Minutes** – the number of minutes the CPU must remain above the low threshold (after first exceeding the high threshold) before an alert is raised.

The actual monitoring is performed by a lightweight monitor that reads a local JSON configuration file every 15 minutes. A separate daily configuration writer task pulls the threshold values from ConnectWise RMM custom fields and writes that file, allowing you to manage policies entirely through custom fields without touching scripts.

The solution ships with **two monitor sets** that detect sustained high CPU identically but handle ticketing differently. You choose the one that fits the partner — see [Ticketing Options](#ticketing-options).

### Key Capabilities

- **Two‑Threshold Alerting with Automatic Reset** – Alert only on sustained high CPU. Brief spikes that drop back below the low threshold reset the timer automatically.
- **Choice of Ticketing Approach** – Use the monitor's **built‑in ticketing** for zero extra setup, or the optional **[Workflow] monitor** for clean, standardized tickets driven by the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow. See [Ticketing Options](#ticketing-options).
- **Automatic Ticket Resolution (both options)** – When CPU falls below the low threshold, the open ticket is closed automatically — by the monitor's auto‑resolution rule (built‑in) or by a `Close` webhook (workflow). No manual closure is required.
- **Device‑Linked Tickets (both options)** – The alerting endpoint is associated with the ticket. For the [Workflow] option this is performed by the [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) bot, because a native workflow action cannot attach a device to a ticket.
- **No Duplicate Tickets (both options)** – A persistent high‑CPU condition never spawns repeated tickets. The built‑in monitor comments on the existing ticket; the [Workflow] monitor tracks state locally so exactly one ticket exists per incident (with no comment spam).
- **Informative Tickets** – The alert includes how long ago the spike began, the current CPU usage, the top five CPU‑consuming processes, and the PowerShell command line when PowerShell is among them. The [Workflow] variant presents this with a clean, controlled subject and body.
- **Hierarchical Policy Management** – Set Company‑wide defaults, override them at a Site, or set a unique value for a single Endpoint – all through custom fields.
- **OS‑Aware Targeting** – Servers and Workstations automatically use their respective threshold fields (`_Svr` / `_Wks`).
- **Configuration / Monitoring Decoupling** – Threshold changes take effect on the next daily (or manual) run of the configuration writer, without modifying the monitor itself.

### Important Caveats & Behavior

- **Daily Configuration Update** – The configuration writer task runs once per day. If you change a custom field, the new thresholds will only be picked up after the next scheduled run. You can manually run the task on an endpoint to apply changes immediately.
- **Monitor Interval** – The monitor checks CPU usage every 15 minutes against the stored configuration file.
- **Ticketing Behavior Depends on the Monitor** – Both monitors auto‑close the ticket on recovery, but the mechanism and the comment handling differ. See [Ticketing Options](#ticketing-options) for the exact behavior of each.
- **One Monitor Per Device** – The two monitors are mutually exclusive ticketing approaches. Import and deploy **only one** of them to a given device; deploying both would create conflicting or duplicate tickets.
- **Workflow Option Coverage** – The [Workflow] monitor depends on a valid webhook URL and on the workflow running under its creator's permissions. If the creating user lacks access to a device, ticketing will silently fail for that device. The built‑in monitor has no such dependency and works on all machines.
- **Workflow Option Install Order** – The workflow calls a custom bot, so the [bot](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) and its [form](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) must be installed and published **before** the workflow is imported. A workflow that references a bot which does not exist in the environment cannot be saved.

## Ticketing Options

This solution provides **two monitor sets** that perform identical sustained‑CPU detection but handle ticketing differently. **Choose one** and import only that monitor — they are mutually exclusive per device.

| | Built‑in Ticketing | Workflow Ticketing |
|---|---|---|
| **Monitor** | [CPU Threshold Violation Monitoring](/docs/b03e0a64-8e91-4d2b-b08a-d320713e295b) | [CPU Threshold Violation Monitoring [Workflow]](/docs/92d7aa9c-c75b-4dba-94b4-f1d4f44e9ba9) |
| **How tickets are created** | CW RMM monitor's built‑in ticketing | Webhook → [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow |
| **Ticket subject** | Set by the monitor; not customizable | Clean and controlled (e.g., `CPU Threshold Violation - CPU - SERVER01 - 95 Percent`) |
| **Ticket body** | The monitor's alert message in its fixed format (spike time, current usage, top five processes) | A clean, controlled message: how long ago the spike began, the low threshold held above, current usage, and the top five processes (+ PowerShell command line if applicable) |
| **Device association** | Handled natively by the monitor's ticketing | Performed by the [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) bot, which the workflow calls after creating the ticket |
| **While the alert persists** | Adds a comment to the open ticket on each detection (bulky ticket) | One ticket per incident; no comment spam |
| **Resolution** | Auto‑resolves via the monitor set's automatic resolution rule | Auto‑closes via a `Close` webhook to the workflow |
| **Device coverage** | Works on all machines | Depends on the workflow + a valid webhook URL + the workflow creator's device permissions |
| **Extra components required** | None | [Trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7), [Workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57), [Bot](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219), [Form](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b), [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field, and a webhook instance |
| **Best for** | Partners who want zero extra setup | Partners who want clean, standardized tickets with no comment spam |

**How to choose:**

- Pick **Built‑in** if you want the simplest deployment and don't mind monitor‑generated ticket formatting and per‑detection comments.
- Pick **Workflow** if you want clean, consistently formatted tickets without comment spam — and you can complete the one‑time workflow/webhook setup (and ensure the workflow is created by a user with access to all monitored devices). Both options auto‑close the ticket on recovery and associate the alerting device with the ticket, so the decision comes down to ticket quality and setup versus universal coverage.

> Whichever you choose, the **group**, the **configuration writer task**, the **threshold / sustained‑minutes / enablement custom fields**, and the **local config file** are shared and identical. Only the monitor — and, for the Workflow option, the trigger / workflow / bot / form / webhook field — differ.

## Associated Content

### Group

| Name | Purpose |
|---|---|
| [CPU Threshold Violation Monitoring](/docs/006889e2-8977-4957-9c4d-7381bdbea9a0) | Dynamic group that targets Windows endpoints based on the `CTVM_Enable` custom fields, automatically pulling in devices authorized for monitoring. Shared by both ticketing options. |

### Task

| Name | Purpose |
|---|---|
| [CPU Threshold Violation Monitoring Configuration Writer](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a) | Runs daily to resolve hierarchical thresholds from custom fields and writes the JSON configuration file for the monitor. Also writes the workflow webhook URL (`TicketWebhookUrl`) into the file when the `Ticket_Mgmt_Webhook_Url` field is populated. Shared by both ticketing options. |

### Monitor

> Choose **one** of the following monitors to import. They are mutually exclusive ticketing approaches for the same solution — do not deploy both to the same device. See [Ticketing Options](#ticketing-options) for help choosing.

| Name | Ticketing | Purpose |
|---|---|---|
| [CPU Threshold Violation Monitoring](/docs/b03e0a64-8e91-4d2b-b08a-d320713e295b) | Built‑in | Runs every 15 minutes, reading the local JSON configuration file. Evaluates sustained CPU usage via the two‑threshold logic and generates / resolves tickets using the monitor's built‑in ticketing. |
| [CPU Threshold Violation Monitoring [Workflow]](/docs/92d7aa9c-c75b-4dba-94b4-f1d4f44e9ba9) | Workflow | Runs every 15 minutes, reading the same JSON configuration file. Performs the same CPU evaluation but creates and closes tickets by firing webhooks to the CWRMM Ticket Management workflow, producing clean tickets with no comment spam. |

### Trigger (Workflow option only)

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) | Webhook trigger that receives `Create` / `Close` / `Comment` payloads from the [Workflow] monitor and starts the ticketing workflow. Required only for the Workflow option. |

### Workflow (Workflow option only)

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) | Creates, closes, and comments on ConnectWise tickets based on the monitor's webhook payloads, and calls the association bot so the alerting device is attached to the ticket. Required only for the Workflow option. |

### Bot (Workflow option only)

| Name | Purpose |
|---|---|
| [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) | Custom RPA bot called by the workflow on the `Create` path. It attaches the alerting device to the ticket that was just created, covering the one operation a native workflow action cannot perform. Must be installed and published **before** the workflow is imported. |

### Form (Workflow option only)

| Name | Purpose |
|---|---|
| [Associate a device with an existing ticket](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) | The bot's input form, collecting the ticket and the device to attach. The bot cannot run without it. Required only for the Workflow option. |

### Custom Fields: Enablement

These fields act as the "on/off switch" for the solution. They use a Dropdown (`Enable` or `Disable`) to dynamically target devices.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [CTVM_Enable_Svr](/docs/5f3cb7ce-6d25-4199-9434-574fb2ed6542) | Company | Dropdown | Enables or disables CPU monitoring for servers at the Company level. |
| [CTVM_Enable_Wks](/docs/5b985126-3e3d-4b86-b306-5a93381df895) | Company | Dropdown | Enables or disables CPU monitoring for workstations at the Company level. |
| [CTVM_Enable_Svr_Site](/docs/f991ac6d-10ed-4957-8cb7-72b08d01f4d3) | Site | Dropdown | Site‑level override for server enablement. |
| [CTVM_Enable_Wks_Site](/docs/06dee656-c32f-4117-97fe-1641b0e29ab7) | Site | Dropdown | Site‑level override for workstation enablement. |
| [CTVM_Enable](/docs/aa6be36d-3653-4f68-b9fe-5bdb7c7f5c20) | Endpoint | Dropdown | Endpoint‑level override to explicitly enable/disable specific machines. |

### Custom Fields: High Threshold

Enter the CPU percentage that **starts** the sustained‑usage timer. Must be higher than the low threshold.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [CTVM_HighThreshold_Svr](/docs/8ff763ee-fb5c-4ca5-a693-543b2015fd2d) | Company | Text Box | Company baseline for servers (Default: 95). |
| [CTVM_HighThreshold_Wks](/docs/9828050e-4ca5-492e-a61f-97a9462a3de0) | Company | Text Box | Company baseline for workstations (Default: 90). |
| [CTVM_HighThreshold_Svr_Site](/docs/a0d5a32a-e7cd-4e3a-b870-d475ff1fb2d1) | Site | Text Box | Site‑level override for servers. |
| [CTVM_HighThreshold_Wks_Site](/docs/b6f96b1c-a6cb-4e98-b3e7-596ad90440ad) | Site | Text Box | Site‑level override for workstations. |
| [CTVM_HighThreshold](/docs/9c3a9dff-a7f0-4a97-91a5-8e41f035c1e9) | Endpoint | Text Box | Endpoint‑level override (applies to both OS types). |

### Custom Fields: Low Threshold

Enter the CPU percentage that **resets** the timer and clears the alert. Must be lower than the high threshold.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [CTVM_LowThreshold_Svr](/docs/59b3f03e-9f6c-4ef7-9e9f-f6b69df4cf7a) | Company | Text Box | Company baseline for servers (Default: 90). |
| [CTVM_LowThreshold_Wks](/docs/63c4478d-df7e-45b1-8690-8a3a0f0549ed) | Company | Text Box | Company baseline for workstations (Default: 85). |
| [CTVM_LowThreshold_Svr_Site](/docs/c81ccbcc-b7c0-4c61-b53b-4f096dfaf1e5) | Site | Text Box | Site‑level override for servers. |
| [CTVM_LowThreshold_Wks_Site](/docs/173abaea-0028-432e-a565-1c41e2f01345) | Site | Text Box | Site‑level override for workstations. |
| [CTVM_LowThreshold](/docs/f922a73f-a445-4cf9-b847-747dc309acc5) | Endpoint | Text Box | Endpoint‑level override (applies to both OS types). |

### Custom Fields: Sustained Minutes

Enter the number of minutes the CPU must remain above the low threshold (after spiking above the high threshold) before an alert is generated.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [CTVM_UsageMins_Svr](/docs/86db6615-4751-4c40-8018-53be3ed9db13) | Company | Text Box | Company baseline for servers (Default: 30). |
| [CTVM_UsageMins_Wks](/docs/df1733e0-701e-4d73-9826-404f1921a1db) | Company | Text Box | Company baseline for workstations (Default: 30). |
| [CTVM_UsageMins_Svr_Site](/docs/453bb759-8a08-42b1-9a9c-18e30d20d478) | Site | Text Box | Site‑level override for servers. |
| [CTVM_UsageMins_Wks_Site](/docs/3abfb2fc-2278-46d5-beb9-e26fa4c20a6f) | Site | Text Box | Site‑level override for workstations. |
| [CTVM_UsageMins](/docs/3f442fad-1a4a-4793-91f3-46ee9b16e956) | Endpoint | Text Box | Endpoint‑level override (applies to both OS types). |

### Custom Fields: Ticketing (Workflow option only)

Required only when you deploy the [Workflow] monitor. The configuration writer reads this field and writes its value into the config file as `TicketWebhookUrl`, which the [Workflow] monitor uses to reach the ticketing workflow. If you deploy the built‑in monitor only, you may skip this field — the configuration writer tolerates its absence.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | Company | Text Box | Stores the workflow's webhook URL (copied from the trigger's webhook instance) as its Default Value. |

## Implementation

Follow these steps in order. Steps 1–3 and 6–8 are common to both ticketing options. **Steps 4–5** are where you choose and configure your ticketing approach — import **only** the monitor for the option you choose.

### Step 1: Create the Shared Custom Fields

Create all 20 shared custom fields listed below in ConnectWise RMM. These are required regardless of which ticketing option you choose.

- [Custom Field: CTVM_Enable](/docs/aa6be36d-3653-4f68-b9fe-5bdb7c7f5c20)
- [Custom Field: CTVM_Enable_Svr](/docs/5f3cb7ce-6d25-4199-9434-574fb2ed6542)
- [Custom Field: CTVM_Enable_Svr_Site](/docs/f991ac6d-10ed-4957-8cb7-72b08d01f4d3)
- [Custom Field: CTVM_Enable_Wks](/docs/5b985126-3e3d-4b86-b306-5a93381df895)
- [Custom Field: CTVM_Enable_Wks_Site](/docs/06dee656-c32f-4117-97fe-1641b0e29ab7)
- [Custom Field: CTVM_HighThreshold](/docs/9c3a9dff-a7f0-4a97-91a5-8e41f035c1e9)
- [Custom Field: CTVM_HighThreshold_Svr](/docs/8ff763ee-fb5c-4ca5-a693-543b2015fd2d)
- [Custom Field: CTVM_HighThreshold_Svr_Site](/docs/a0d5a32a-e7cd-4e3a-b870-d475ff1fb2d1)
- [Custom Field: CTVM_HighThreshold_Wks](/docs/9828050e-4ca5-492e-a61f-97a9462a3de0)
- [Custom Field: CTVM_HighThreshold_Wks_Site](/docs/b6f96b1c-a6cb-4e98-b3e7-596ad90440ad)
- [Custom Field: CTVM_LowThreshold](/docs/f922a73f-a445-4cf9-b847-747dc309acc5)
- [Custom Field: CTVM_LowThreshold_Svr](/docs/59b3f03e-9f6c-4ef7-9e9f-f6b69df4cf7a)
- [Custom Field: CTVM_LowThreshold_Svr_Site](/docs/c81ccbcc-b7c0-4c61-b53b-4f096dfaf1e5)
- [Custom Field: CTVM_LowThreshold_Wks](/docs/63c4478d-df7e-45b1-8690-8a3a0f0549ed)
- [Custom Field: CTVM_LowThreshold_Wks_Site](/docs/173abaea-0028-432e-a565-1c41e2f01345)
- [Custom Field: CTVM_UsageMins](/docs/3f442fad-1a4a-4793-91f3-46ee9b16e956)
- [Custom Field: CTVM_UsageMins_Svr](/docs/86db6615-4751-4c40-8018-53be3ed9db13)
- [Custom Field: CTVM_UsageMins_Svr_Site](/docs/453bb759-8a08-42b1-9a9c-18e30d20d478)
- [Custom Field: CTVM_UsageMins_Wks](/docs/df1733e0-701e-4d73-9826-404f1921a1db)
- [Custom Field: CTVM_UsageMins_Wks_Site](/docs/3abfb2fc-2278-46d5-beb9-e26fa4c20a6f)

### Step 2: Create the Group

Create the dynamic group that will automatically target the enabled machines.

- [CPU Threshold Violation Monitoring](/docs/006889e2-8977-4957-9c4d-7381bdbea9a0)

### Step 3: Create the Configuration Writer Task

Set up the configuration writer script that will run on the targeted endpoints.

- [CPU Threshold Violation Monitoring Configuration Writer](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a)

> This task also writes the workflow webhook URL into the config file when the `Ticket_Mgmt_Webhook_Url` field is populated. If you choose the built‑in option and skip that field, the task still runs successfully (the relevant row is set to Continue on Failure) and simply writes a placeholder the built‑in monitor ignores.

### Step 4: Choose Your Ticketing Approach

Decide whether the partner will use **Built‑in** or **Workflow** ticketing. See [Ticketing Options](#ticketing-options) for the comparison and guidance. Your choice determines which monitor you import in Step 5 and whether you need the workflow components.

### Step 5: Create the Monitor (and Workflow Components, if applicable)

#### Option A — Built‑in Ticketing

Import the original monitor. No additional components are required.

- [CPU Threshold Violation Monitoring](/docs/b03e0a64-8e91-4d2b-b08a-d320713e295b)

#### Option B — Workflow Ticketing

Import the [Workflow] monitor **and** set up the workflow components. Complete the following in order — the bot and form must exist before the workflow is imported, because a workflow cannot be saved while it references a bot that is not present in the environment.

1. Create the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field (Company, Text Box).
2. Install the [Associate a device with an existing ticket](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) form from the `ProVal - Content` Community, selecting the **Forms** repository.
3. Install the [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) bot from the `ProVal - Content` Community, selecting the **Bots** repository. Attach the form from the previous step, configure the platform scopes, and **publish the bot**. (See the bot document's *Implementation* section.)
4. Install the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow from the `ProVal - Content` Community. This also installs the [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7).
5. In the workflow's **Trigger** node, create a new webhook instance named `CWRMM Ticket Management for Monitors` and **copy the generated URL**. (See the workflow document's *Create the Webhook Instance* section.)
6. Set that URL as the **Default Value** of the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field and save. Then run the Configuration Writer task once (or wait for the next daily run) so the config file is populated with the real URL before the [Workflow] monitor relies on it.
7. Configure the workflow's **Create Ticket** action (Service Board and assignment) to match your environment. (See the workflow document's *Configure the Create Ticket Action* section.)
8. Verify the device association steps on the workflow's `toCreate` branch — the **Get All Tickets By Criteria** filter and the bot node's **TicketId** / **DeviceId** input mappings. (See the workflow document's *Verify the Device Association Steps* section.)
9. Import the [CPU Threshold Violation Monitoring [Workflow]](/docs/92d7aa9c-c75b-4dba-94b4-f1d4f44e9ba9) monitor.

> **Important — user permissions:** The workflow runs under the context of the user account that creates it. Create the workflow with a user that has access to **all** devices you intend to monitor; otherwise ticket creation/closure will silently fail for any device that user cannot access. See the workflow document for details.

### Step 6: Schedule the Task

Schedule the [CPU Threshold Violation Monitoring Configuration Writer](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a) task to run once per day against the [CPU Threshold Violation Monitoring](/docs/006889e2-8977-4957-9c4d-7381bdbea9a0) group, as described in the [Schedule Task](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a#schedule-task) section of the task's document.

Whichever monitor you imported is already configured to run every 15 minutes against the same group and requires no additional scheduling.

### Step 7: Review and Set Threshold Custom Fields

Review the default threshold values and set the threshold custom fields as required for your environments. You can set broad Company‑level baselines, and then configure specific Site‑level or Endpoint‑level overrides where tighter rules or exceptions are needed.

### Step 8: Review and Set Enablement Custom Fields

Set the enablement custom fields to `Enable` for the client, location, or specific endpoint to turn the solution and monitoring on for them. Machines will not be monitored until they are explicitly enabled via these dropdown fields.

## FAQ

### Q: How does the CPU Threshold Violation monitor work?

> A local configuration file (JSON) is written daily by the configuration writer task. The monitor reads this file every 15 minutes, samples the CPU over 10 seconds, and applies a two‑threshold logic:
>
> - When CPU first exceeds the **high threshold**, a marker is created and the timer starts.
> - As long as CPU stays above the **low threshold**, the timer continues.
> - If the timer reaches the **sustained minutes**, an alert is raised.
> - If at any point CPU drops below the low threshold, the marker is deleted and the timer resets.
>
> The two available monitors detect sustained high CPU identically — they differ only in how they create and close tickets (see [Ticketing Options](#ticketing-options)).

### Q: What's the difference between the two monitors, and which should I choose?

> Both monitors read the same config file and detect sustained high CPU the same way, and both close the ticket automatically on recovery. The **built‑in** monitor ([CPU Threshold Violation Monitoring](/docs/b03e0a64-8e91-4d2b-b08a-d320713e295b)) uses the monitor's native ticketing — simplest to deploy, but tickets carry monitor‑generated formatting and a comment is added on each detection. The **[Workflow]** monitor ([CPU Threshold Violation Monitoring [Workflow]](/docs/92d7aa9c-c75b-4dba-94b4-f1d4f44e9ba9)) creates clean, consistently formatted tickets via the [CWRMM workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) with no comment spam — at the cost of a one‑time workflow/webhook setup. See the [Ticketing Options](#ticketing-options) comparison table.

### Q: Do I need to import both monitors?

> No. The two monitors are mutually exclusive ticketing approaches for the same solution. Import and deploy **only one** per device. Deploying both would create conflicting or duplicate tickets.

### Q: Is the alerting device attached to the ticket?

> Yes, with either option. The built‑in monitor's ticketing associates the device natively. The [Workflow] option cannot do this with a native workflow action, so the workflow calls the [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) bot immediately after creating the ticket, passing the ticket and the `DeviceId` from the webhook payload. If the bot or its [form](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) is missing or unpublished, the ticket is still created but the device is not attached.

### Q: What are the default thresholds if I don't set any custom fields?

> For **servers**: High = 95%, Low = 90%, Sustained Minutes = 30.
> For **workstations**: High = 90%, Low = 85%, Sustained Minutes = 30.
> These defaults are used when no Company, Site, or Endpoint field is populated.

### Q: I changed a threshold custom field. When will the new values take effect?

> The configuration writer task runs once per day (by default). The new thresholds will be applied on the next scheduled run. You can manually execute the [CPU Threshold Violation Monitoring Configuration Writer](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a) task on an endpoint to update the configuration file immediately.

### Q: How quickly will I be notified of a sustained CPU issue?

> The monitor checks every 15 minutes. If the CPU has been above the low threshold (after spiking above the high threshold) for the configured number of minutes, a ticket will be created on the next monitor run. So the maximum delay from the moment the condition is met is 15 minutes.

### Q: Will the ticket close automatically when the CPU usage drops?

> Yes, with either monitor. The built‑in monitor re‑runs the same script for resolution; when the CPU falls below the low threshold the marker file is deleted and the script outputs nothing, so the monitor's automatic resolution rule closes the ticket. The [Workflow] monitor fires a `Close` webhook on recovery and the workflow closes the ticket. Neither requires manual closure.

### Q: Will the monitor create a new ticket every time it detects high CPU usage?

> No. With the built‑in monitor, the first sustained detection creates a ticket and subsequent detections add a comment to that same ticket. With the [Workflow] monitor, a local state machine ensures exactly one ticket exists per incident and adds no comments. In both cases a new ticket is only created if the issue was resolved (CPU dropped below the low threshold) and later re‑occurs.

### Q: Why does the Workflow option need a trigger, a workflow, a bot, a form, and a custom field?

> The [Workflow] monitor doesn't create tickets itself — it sends an HTTP POST (a webhook) to the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, which performs the actual ticket creation/closure in ConnectWise. The [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) provides the webhook endpoint, and the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field stores that endpoint's URL so the configuration writer can pass it to the monitor via the config file. The [bot](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) and its [form](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) exist because a native workflow action cannot attach a device to a ticket; the workflow calls the bot to do it.

### Q: The [Workflow] monitor isn't creating or closing tickets. What should I check?

> Work through this checklist:
>
> 1. The [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field's Default Value is set to the **real** webhook instance URL (not the placeholder).
> 2. A webhook instance was created in the workflow's trigger and the URL was copied from it.
> 3. The [workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) is installed and published, and its Create Ticket action is configured for a valid Service Board.
> 4. The [bot](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) is installed and published with its [form](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) attached, and the bot node's inputs are mapped in the workflow.
> 5. The Configuration Writer task was re‑run **after** the URL was set, so the config file contains the real URL.
> 6. The user who created the workflow has access to the affected device (see the next question).
> 7. The monitor's output for an action run — a failed webhook is logged there.

### Q: Tickets are created but the device isn't attached. What should I check?

> The ticket creation and the device association are separate steps, so this points at the bot rather than the workflow. Confirm the bot is published, its form is attached, and its platform scopes include ticket read and update. Then check the bot's own log — the workflow can be configured to write bot logs to the ticket, and the bot reports the values it received, the ticket it resolved, and the asset count before and after the change. A missing `TicketId` or `DeviceId` there means the bot node's input mapping in the workflow needs correcting.

### Q: Why does the [Workflow] monitor work on some machines but not others?

> The workflow runs under the context of the user account that created it. If that user lacks permission to a specific device, the workflow cannot create or update tickets for it and ticketing silently fails for that endpoint. Create the workflow with a user that has access to all monitored devices. The built‑in monitor has no such dependency.

### Q: Can I switch from built‑in to workflow ticketing (or vice versa) later?

> Yes. Import the monitor for the new approach (and, for workflow, complete the trigger/workflow/bot/form/webhook setup), then remove or disable the old monitor so both aren't active at once. Note that tickets already opened by the old approach won't be auto‑managed by the new one — close any stragglers manually.

### Q: Why isn't a specific device being monitored?

> The device must be explicitly enabled via the `CTVM_Enable` custom fields. Check that the Endpoint, its Site, or its Company has the appropriate `CTVM_Enable*` field set to `Enable`. Blank or `Disable` entries will exclude the device from the monitoring group.

### Q: I want to monitor only my servers, not workstations. How do I do that?

> At the Company level, set `CTVM_Enable_Svr` to `Enable` and leave `CTVM_Enable_Wks` blank or set to `Disable`. The dynamic group will then only pick up Windows Servers.

### Q: Can I set different thresholds for a specific critical server?

> Yes. Set the desired threshold values directly in the Endpoint‑level custom fields (e.g., `CTVM_HighThreshold`, `CTVM_LowThreshold`, `CTVM_UsageMins`) for that machine. Endpoint values override everything else.

### Q: What happens if I only set the high threshold but not the low threshold or minutes?

> The configuration writer will still apply defaults for the missing fields. For example, if you set `CTVM_HighThreshold` = 98 on a server but leave the others blank, the server will use Low = 90 (default) and Minutes = 30 (default).

### Q: What does the monitor ticket contain?

> The ticket body includes how long ago the CPU spiked above the high threshold, the current CPU usage, a list of the top five CPU‑consuming processes, and — if applicable — the command line of any PowerShell process that is consuming CPU. The [Workflow] monitor presents this with a clean, controlled subject (e.g., `CPU Threshold Violation - CPU - SERVER01 - 95 Percent`) and body; the built‑in monitor uses the monitor's default subject and formatting.

### Q: Can I disable monitoring for a single server temporarily without deleting custom fields?

> Yes. Set `CTVM_Enable` = `Disable` at the Endpoint level for that machine. The device will be removed from the monitoring group and no further monitoring will occur until you re‑enable it.

### Q: I see the configuration file under ProgramData. Can I modify it manually?

> Manual changes to the JSON file will be overwritten the next time the configuration writer task runs. Always adjust thresholds through the custom fields to ensure consistency.

### Q: The monitor output says "CPU monitoring configuration file not found." What should I do?

> This means the configuration writer task has not yet run on that endpoint. Run the [CPU Threshold Violation Monitoring Configuration Writer](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a) task manually or wait for the next daily schedule.

### Q: The monitor isn't generating tickets, or the ticket status isn't updating. How can I check if the configuration file is correct?

> Verify that the configuration file exists at `C:\ProgramData\_Automation\Script\Test-CPUUsage\Test-CPUUsage.json`. If the file is missing, run the [CPU Threshold Violation Monitoring Configuration Writer](/docs/5e7c137d-1750-492c-9a66-0359a04c6d3a) task manually on the endpoint. If the file exists but the thresholds seem wrong, check the custom fields at the Endpoint, Site, and Company levels; the task will use the first valid value it finds in that order. After updating fields, manually run the task again to refresh the file. (For the [Workflow] monitor, also confirm the `TicketWebhookUrl` value in the file is the real webhook URL — see the workflow troubleshooting question above.)

### Q: How can I tell if the monitor is actually running and evaluating CPU usage?

> Check the monitor's run history in the ConnectWise RMM console. You can also look for the marker file `C:\ProgramData\_Automation\Script\Test-CPUUsage\Test-CPUUsage.flag`. If it exists, a high‑CPU event is currently being tracked. If it does not exist, either no spike has occurred or the CPU has dropped below the low threshold and the timer has reset.

## Changelog

### 2026-09-03

- **Device Association (Workflow option):** The [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow now attaches the alerting device to the ticket it creates, by calling the [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) bot.
- **New Components (Workflow option only):** Added the [Associate a device with an existing ticket](/docs/b98f159a-f34a-4c4c-8ff3-b89a0d003219) bot and its [form](/docs/45135ca2-b3f8-4d0e-9331-ef89768b487b) to Associated Content, the [Ticketing Options](#ticketing-options) comparison, and the Implementation steps.
- **Install Order:** Option B now installs the form and bot **before** the workflow, because a workflow referencing a bot that is not present in the environment cannot be saved.
- Added FAQ entries covering device association and the case where a ticket is created without the device attached.
- The built‑in monitor option is unaffected by this change.

### 2026-07-23

- **New Optional Workflow Ticketing:** Added a second, optional monitor — [CPU Threshold Violation Monitoring [Workflow]](/docs/92d7aa9c-c75b-4dba-94b4-f1d4f44e9ba9) — that creates clean tickets and auto‑closes them on recovery by firing webhooks to the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, with no per‑detection comment spam.
- **New Components (Workflow option only):** Added the [CWRMM Ticket Management for Monitors trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) and [workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57), and the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field that stores the webhook URL.
- **Partner Choice:** The two monitors are mutually exclusive ticketing approaches. Added a [Ticketing Options](#ticketing-options) comparison and reworked Implementation so partners import **only** the monitor they choose; the group, task, and threshold/sustained‑minutes/enablement fields are shared. Both options auto‑close tickets on recovery; the [Workflow] option's advantages are clean tickets and no comment spam.
- The original built‑in monitor [CPU Threshold Violation Monitoring](/docs/b03e0a64-8e91-4d2b-b08a-d320713e295b) remains available unchanged.

### 2026-07-03

- Initial version of the document
