---
id: 'fb923e51-3cca-4b32-9066-51fbef06953f'
slug: /fb923e51-3cca-4b32-9066-51fbef06953f
title: 'Drive Fragmentation Monitoring'
title_meta: 'Drive Fragmentation Monitoring'
keywords: ['monitoring', 'drive', 'fragmentation', 'defragmentation', 'tickets', 'workflow', 'trigger']
description: 'Monitors drive fragmentation on Windows endpoints with hierarchical thresholds and modes. Uses ConnectWise workflow for ticket management and optional automatic defragmentation.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Purpose

The **Drive Fragmentation Monitoring** solution provides automated detection and optional remediation of disk fragmentation on Windows servers and workstations. It evaluates each eligible fixed rotational HDD against a configurable fragmentation threshold, creates tickets via the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, and optionally runs a defragmentation task when remediation is allowed.

The solution offers two operating modes per device:

- **AlertOnly** – The monitor creates and closes tickets, but no defragmentation is performed.
- **AutoFix** – The monitor triggers the [DRV Frag Autofix](/docs/bfa10078-375c-44ee-8741-2e11fa2a2031) task when fragmentation exceeds the threshold. The autofix script attempts defragmentation and manages ticket creation/comments/closure based on the outcome.

Servers are restricted to AlertOnly unless the endpoint-level `DRV_Frag_Mode` is explicitly `Enabled - Autofix`; workstations can use either mode at any hierarchy level.

All monitoring settings (mode, drives, threshold) are defined via hierarchical custom fields, resolved daily by the [DRV Frag Monitoring Configuration Writer](/docs/cb957f04-2261-465c-babf-4fc6106d7039) task, and stored in a local JSON file that the monitor and autofix scripts read. The monitor runs hourly; the autofix task is launched only when needed.

### Key Capabilities

- **Hierarchical Policy Management** – Set Company-wide defaults and override them per Site or Endpoint.
- **OS-Aware Targeting** – Servers and workstations automatically use the appropriate `_Svr` / `_Wks` custom fields.
- **Flexible Drive Selection** – Monitor all drives, none, or specific drive letters (e.g., `CDEF`).
- **Media Type Safety** – Only fixed HDDs are analyzed; SSDs, SCM, removable, and unknown media are excluded.
- **Automatic Ticket Lifecycle** – Creation, comments, and closure are handled via webhooks to the ConnectWise workflow, producing clean tickets without duplicate spam.
- **Automatic Remediation (AutoFix)** – Up to 4 defragmentation attempts per incident (initial + 3 retries, 24 hours apart). After the final failed attempt, manual intervention is requested.
- **Server Autofix Guard** – Servers never autofix unless explicitly enabled at the endpoint level, preventing unintended defragmentation on critical systems.
- **Fragmentation Caching** – Reduces analysis overhead by storing recent measurements; the autofix script also writes its post‑remediation measurement so the monitor observes changes immediately.
- **Concurrency Lock** – An `Autofix.lock` file prevents the monitor from evaluating while remediation is in progress, avoiding state file conflicts.

### Important Caveats & Behavior

- **Configuration Refresh** – The configuration writer task runs daily. Changes to custom fields take effect after the next scheduled run.
- **Monitor Interval** – Fragmentation is evaluated every hour. A new breach is detected within one hour.
- **Threshold Semantics** – A drive is considered breached when fragmentation percentage is **greater than or equal to** the configured threshold.
- **Fragmentation Metric** – Uses `Win32_Volume.DefragAnalysis` `TotalPercentFragmentation`, which differs slightly from the “total fragmented space” reported by `defrag.exe`. Review thresholds accordingly.
- **AlertOnly Reporting** – In AlertOnly mode, the monitor returns a failure string only on first detection to launch the autofix task once (which exits immediately). Subsequent cycles return success while the ticket remains open. This prevents repeated autofix launches.
- **AutoFix Retry Budget** – The maximum number of defragmentation attempts is 4. After that, no further automatic attempts occur; the ticket remains open for manual work.
- **Server AutoFix** – If a server would resolve to AutoFix but the endpoint override is not `Enabled - Autofix`, the mode is downgraded to AlertOnly. This is enforced in configuration and again in both scripts.
- **Unknown Media** – Drives with indeterminate media type are **not** monitored by default. To include them, set `$includeUnknownMediaType = $true` in both scripts.

## Associated Content

### Groups

| Name | Purpose |
|---|---|
| [DRV Frag Monitoring - Active](/docs/f7b6eeec-bde1-4eb1-ba2f-0a0d42e7dcc7) | Dynamic group that targets Windows endpoints with monitoring enabled (AlertOnly or AutoFix) based on custom fields. This group receives the configuration writer task, monitor, and autofix automation. **Note:** Includes servers explicitly set to `Enabled - Autofix` at the endpoint level, as permitted by the server autofix policy. |
| [DRV Frag Monitoring - Alert Only [Workstations]](/docs/1eb19953-1b8c-4191-92df-c3e57f272063) | View‑only group for workstations configured with AlertOnly mode. Used for reporting and visibility; no automation is applied to this group. |

### Tasks

| Name | Purpose |
|---|---|
| [DRV Frag Monitoring Configuration Writer](/docs/cb957f04-2261-465c-babf-4fc6106d7039) | Runs daily to resolve hierarchical settings from custom fields and writes the local JSON configuration file. Also validates and stores the ticket webhook URL. |
| [DRV Frag Autofix](/docs/bfa10078-375c-44ee-8741-2e11fa2a2031) | Automation task triggered by the monitor when AutoFix is required. Performs defragmentation, manages ticket creation/comments/closure, and respects attempt limits. |

### Monitor

| Name | Purpose |
|---|---|
| [DRV - Frag Monitoring](/docs/95c3fc7f-750f-4941-a088-d73eafdc60dc) | Runs hourly, reads the local JSON configuration file, evaluates drive fragmentation, manages state files, fires ticket webhooks, and triggers the autofix task when necessary. |

### Trigger

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) | Webhook trigger that receives `Create` / `Close` / `Comment` payloads from the monitor and autofix scripts and starts the ticketing workflow. |

### Workflow

| Name | Purpose |
|---|---|
| [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) | Creates, comments on, and closes ConnectWise tickets based on webhook payloads. Required for all ticketing in this solution. |

### Custom Fields: Monitoring Mode

These fields determine whether a device is monitored, and if so, in which mode (`AlertOnly` or `AutoFix`). Blank values inherit from the next hierarchy level.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [DRV_Frag_Mode_Wks](/docs/07b326ab-b7b1-4a31-b91b-22119dd41ec8) | Company | Dropdown | Company baseline for workstation mode. |
| [DRV_Frag_Mode_Svr](/docs/edc708ab-b61a-44d0-a563-d5f2571faf55) | Company | Dropdown | Company baseline for server mode. |
| [DRV_Frag_Mode_Wks_Site](/docs/1f925f10-61f7-4db7-824f-f955d252342b) | Site | Dropdown | Site‑level override for workstation mode. |
| [DRV_Frag_Mode_Svr_Site](/docs/4e70913e-811f-4238-b804-04726145b2d0) | Site | Dropdown | Site‑level override for server mode. |
| [DRV_Frag_Mode](/docs/563f1ad1-79df-47c7-ac99-b56566cd8634) | Endpoint | Dropdown | Endpoint‑level override for mode. |

### Custom Fields: Drive Selection

Specify which drive letters to monitor (e.g., `All`, `None`, `CDEF`). Blank inherits.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [DRV_Frag_Drives_Wks](/docs/e60834f5-f158-48e6-b2aa-0e83132c7613) | Company | Text Box | Company baseline for workstation drive selection. |
| [DRV_Frag_Drives_Svr](/docs/dc296d51-d58b-4164-8bb7-1c60786449cb) | Company | Text Box | Company baseline for server drive selection. |
| [DRV_Frag_Drives_Wks_Site](/docs/5b3093b3-6a9e-4502-aac1-93cdb3714870) | Site | Text Box | Site‑level override for workstation drive selection. |
| [DRV_Frag_Drives_Svr_Site](/docs/e9a25222-7108-454a-ad76-a224a1b69b47) | Site | Text Box | Site‑level override for server drive selection. |
| [DRV_Frag_Drives](/docs/a06d0792-44dd-4946-addc-4b27ca275686) | Endpoint | Text Box | Endpoint‑level override for drive selection. |

### Custom Fields: Fragmentation Threshold

Numeric percentage (1–100). Blank inherits.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [DRV_Frag_Threshold_Wks](/docs/dafbbfd1-ae21-4c4f-9e97-6be2bee4cc77) | Company | Text Box | Company baseline for workstation threshold. |
| [DRV_Frag_Threshold_Svr](/docs/5fe9b606-2dad-40a9-93d3-b53db9fc8824) | Company | Text Box | Company baseline for server threshold. |
| [DRV_Frag_Threshold_Wks_Site](/docs/f3597302-8bb5-440c-8dc6-600a34506bb5) | Site | Text Box | Site‑level override for workstation threshold. |
| [DRV_Frag_Threshold_Svr_Site](/docs/70f41848-2ea5-4deb-b3cf-53edf0c9bf22) | Site | Text Box | Site‑level override for server threshold. |
| [DRV_Frag_Threshold](/docs/ea02dd10-c313-4636-a4e9-40edc4ae7357) | Endpoint | Text Box | Endpoint‑level override for threshold. |

### Custom Field: Ticketing Webhook URL

| Name | Level | Type | Purpose |
|---|---|---|---|
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | Company | Text Box | Stores the workflow webhook URL. The configuration writer validates it and writes it to the local config file. |

## Implementation

Follow these steps in order.

### Step 1: Create the Custom Fields

Create all 16 custom fields listed above. Ensure the names match exactly (including case and suffix) so that the configuration writer can resolve them correctly.

### Step 2: Create the Device Groups

Create the dynamic groups:

- [DRV Frag Monitoring - Active](/docs/f7b6eeec-bde1-4eb1-ba2f-0a0d42e7dcc7) – main group receiving all automation.
- [DRV Frag Monitoring - Alert Only [Workstations]](/docs/1eb19953-1b8c-4191-92df-c3e57f272063) – view‑only group for reporting.

### Step 3: Create the Configuration Writer Task

Set up the [DRV Frag Monitoring Configuration Writer](/docs/cb957f04-2261-465c-babf-4fc6106d7039) task. This task will be scheduled to run daily against the **Active** group. It reads custom fields and writes the local JSON configuration file.

### Step 4: Create the Autofix Task

Create the [DRV Frag Autofix](/docs/bfa10078-375c-44ee-8741-2e11fa2a2031) automation task. It will be linked to the [DRV - Frag Monitoring](/docs/95c3fc7f-750f-4941-a088-d73eafdc60dc) monitor and triggered by failure strings.

### Step 5: Create the Monitor

Import the [DRV - Frag Monitoring](/docs/95c3fc7f-750f-4941-a088-d73eafdc60dc) monitor. Configure it to run hourly against the **Active** group, with criteria `Contains` → `Failure:`. In the monitor's **Add Automation** section, link the [DRV Frag Autofix](/docs/bfa10078-375c-44ee-8741-2e11fa2a2031) task.

### Step 6: Set Up the Ticketing Workflow and Trigger

The solution requires the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow and its [trigger](/docs/05c811e6-c6d0-4652-b4b6-2aa83f9605c7) to handle ticket actions. Complete the following:

1. Install the workflow and trigger from the Community (if not already present).
2. In the workflow's **Trigger** node, create a webhook instance named `CWRMM Ticket Management for Monitors` and copy the generated URL.
3. Set that URL as the **Default Value** of the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field.
4. Configure the workflow's **Create Ticket** action (Service Board and assignment).
5. Verify the workflow is published.

### Step 7: Schedule the Configuration Writer

Schedule the [DRV Frag Monitoring Configuration Writer](/docs/cb957f04-2261-465c-babf-4fc6106d7039) task to run daily against the **Active** group. The monitor and autofix task require no explicit schedule; they run based on monitor criteria and trigger linkage.

### Step 8: Configure Custom Field Values

Set the appropriate monitoring mode, drive selection, and threshold for your companies, sites, and endpoints:

- **Company level:** Set `DRV_Frag_Mode_Wks` / `DRV_Frag_Mode_Svr` to `Disabled` (or the desired baseline), `DRV_Frag_Drives_*` to `All` / `C`, and `DRV_Frag_Threshold_*` to `30` (or your preference).
- **Site/Endpoint overrides:** Use the Site and Endpoint fields to override settings where needed.
- To enable monitoring for a device, set the mode field (Company, Site, or Endpoint) to `Enabled - Alert Only` or `Enabled - Autofix` (for workstations) / `Enabled - Alert Only` (for servers, unless endpoint explicit `Enabled - Autofix`).

### Step 9: Verify Operation

Run the configuration writer manually on a test device, then wait for the next monitor cycle. Confirm the configuration file appears in `C:\ProgramData\_Automation\Script\DRVFragmentationMonitoring\`. Check the monitor output and the ConnectWise ticket queue.

## FAQ

### Q: How does the fragmentation monitoring work?

> A local JSON configuration file is written daily by the configuration writer task. The monitor reads this file hourly, enumerates eligible fixed HDDs, applies drive selection filters, and compares fragmentation against the threshold. If a drive breaches the threshold and the mode is AlertOnly, a ticket is created via webhook. If the mode is AutoFix, the monitor returns a failure string, which triggers the autofix task to defragment the drive.

### Q: What is the difference between AlertOnly and AutoFix modes?

> - **AlertOnly** – The monitor creates a ticket when fragmentation exceeds the threshold and closes it when the drive recovers. No defragmentation is performed.
> - **AutoFix** – The monitor triggers the autofix task, which attempts defragmentation. If the first attempt fails, a ticket is created; subsequent failures add comments; after the 4th failed attempt, a final comment is added and automatic remediation stops. If the drive recovers, the ticket is closed.

### Q: Why are servers restricted to AlertOnly by default?

> Servers are effectively restricted to **AlertOnly** in this solution. The dynamic group that receives the automation tasks (the [DRV Frag Monitoring - Active](/docs/f7b6eeec-bde1-4eb1-ba2f-0a0d42e7dcc7) group) only includes servers whose effective mode is AlertOnly—whether that value comes from the Company, Site, or Endpoint level. Servers with endpoint‑level `DRV_Frag_Mode` set to `Enabled - Autofix` are **excluded** from the group, so they never receive the configuration writer, monitor, or autofix task. The configuration writer still contains a server autofix policy as a safeguard, but because such servers are not in the group, it is never applied. Therefore, the automated solution never performs defragmentation on servers.

### Q: How many defragmentation attempts are made?

> Up to 4 attempts per incident: the initial attempt plus 3 retries, spaced 24 hours apart. After the 4th failed attempt, no further automatic attempts occur; the ticket remains open for manual intervention.

### Q: Will the ticket close automatically when fragmentation drops below the threshold?

> Yes. If the drive recovers, the monitor (or autofix script, depending on the scenario) sends a `Close` webhook to the workflow. The ticket is closed automatically.

### Q: I changed a custom field. When will it take effect?

> The configuration writer task runs daily. Changes take effect after the next scheduled run. You can manually run the task to apply changes immediately.

### Q: Why are SSDs not monitored?

> Defragmenting SSDs is unnecessary and can reduce their lifespan. The solution uses `MSFT_PhysicalDisk.MediaType` to identify HDDs (value 3) and excludes SSDs (value 4) and SCM (value 5). Unknown media is also excluded by default.

### Q: Can I monitor only the C: drive?

> Yes. Set the appropriate `DRV_Frag_Drives` field (Company, Site, or Endpoint) to `C`.

### Q: How do I enable monitoring for a device?

> - **Workstations** – Set the mode field at the desired hierarchy level to `Enabled - Alert Only` or `Enabled - Autofix`. The device will then be included in the Active group and receive all automation.
> - **Servers** – Set the mode field to `Enabled - Alert Only` at any level (Company, Site, or Endpoint). Setting a server to `Enabled - Autofix` (even at the endpoint) will **exclude it** from the Active group, so no monitoring will occur for that server. Use AlertOnly for all server monitoring.

### Q: The monitor output says "Configuration file not found." What should I do?

> The configuration writer task hasn’t run yet. Run [DRV Frag Monitoring Configuration Writer](/docs/cb957f04-2261-465c-babf-4fc6106d7039) manually or wait for the next daily schedule.

### Q: The autofix task ran but didn’t defragment. Why?

> Check the mode in the configuration file. If it’s `AlertOnly` or `Disabled`, the autofix script exits immediately. Also verify that the drive is eligible (fixed HDD, included in drive selection, media type known) and that fragmentation is actually above the threshold.

### Q: What happens if the webhook URL is missing or invalid?

> The configuration writer leaves `TicketWebhookUrl` empty. The monitor and autofix scripts will skip ticket webhooks and log warnings. State files still track the incident, and webhooks will be retried once a valid URL is configured.

### Q: Can I edit the configuration file manually?

> Manual changes will be overwritten by the next configuration writer run. Always adjust custom fields to ensure consistency.

### Q: The workflow is not creating or closing tickets. What should I check?

> Work through this checklist:
>
> 1. The [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) custom field contains the **real** webhook instance URL (not the placeholder).
> 2. A webhook instance was created in the workflow's trigger and the URL was copied from it.
> 3. The [workflow](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) is installed, published, and its **Create Ticket** action is configured with a valid Service Board.
> 4. The configuration writer task was run **after** the URL was set, so the config file contains the real URL.
> 5. The user who created the workflow has access to the affected device (see the workflow document for permission requirements).
> 6. Check the monitor or autofix script output for webhook failure messages.

### Q: Why does the workflow work on some machines but not others?

> The workflow executes under the context of the user account that created it. If that user lacks permission to a specific device, ticket creation or closure will silently fail for that endpoint. Create the workflow with a user that has access to **all** devices you intend to monitor.

### Q: What does the workflow do with the `Comment` action?

> For `Comment`, the workflow retrieves all open tickets matching the subject and device, and adds a note containing the body from the payload. It does **not** close the ticket. This is used by the autofix script to add retry comments after failed remediation attempts.

### Q: Will the workflow ever create duplicate tickets?

> The workflow itself does not check for existing tickets; it creates a new ticket whenever it receives a `Create` action. Duplicate prevention is entirely the responsibility of the monitor and autofix scripts, which use state files to ensure `Create` is sent only once per incident.

### Q: I have both the Active group and the Alert Only [Workstations] group. Why isn't a workstation with AlertOnly appearing in the Active group?

> The Active group includes workstations with either `Enabled - Alert Only` or `Enabled - Autofix`. The Alert Only [Workstations] group is a view‑only subset; a workstation in AlertOnly mode should appear in **both** groups. If it is missing from Active, check the group criteria and custom field inheritance (Endpoint → Site → Company). Common mistakes: a Site or Endpoint field has `Disabled`, overriding a higher-level enablement.

### Q: Can I run the configuration writer more than once a day?

> Yes. The scheduled task runs daily, but you can manually execute it at any time to apply immediate changes to the configuration file.

### Q: What happens if the fragmentation cache file grows too large?

> The cache file stores one entry per drive letter (maximum 26 entries) and is overwritten on each monitor cycle with the current cache list. It does not grow indefinitely.

### Q: Does the solution monitor network drives or removable drives?

> No. Only local fixed disks (`DriveType = 3`) that are rotational HDDs are considered. Network, removable, optical, and unknown media are excluded.

---

## Changelog

### 2026-08-26

- Initial version of the document.
