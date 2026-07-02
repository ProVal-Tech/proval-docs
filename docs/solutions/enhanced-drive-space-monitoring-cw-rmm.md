---
id: 'e9cf4ff0-4413-447b-97dd-b8b2abd59597'
slug: /e9cf4ff0-4413-447b-97dd-b8b2abd59597
title: 'Enhanced Drive Space Monitoring'
title_meta: 'Enhanced Drive Space Monitoring'
keywords: ['monitoring', 'drive', 'space', 'thresholds', 'tickets']
description: 'Intelligently monitors local drive free space using capacity‑based hierarchical thresholds with automatic ticket resolution.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-02
---

## Purpose

The **Enhanced Drive Space Monitoring** solution provides an intelligent, highly customizable automated health check for local drive space across your managed Windows endpoints.

Instead of relying on a single, rigid “one‑size‑fits‑all” threshold, this solution dynamically calculates the total capacity of each logical drive and assigns it to a specific storage tier (e.g., 16–300 GB, 300–1024 GB). It then compares the available free space against flexible, hierarchical limits that you control, using percentages, megabytes, or gigabytes.

The monitoring itself is performed by a lightweight **monitor set** that runs every hour, reading a local JSON configuration file. A separate daily **configuration writer** task pulls your custom field settings and updates that file, so you can adjust thresholds without ever editing a script.

### Key Capabilities

- **Decoupled Configuration & Monitoring** – Thresholds are managed entirely through custom fields. The configuration writer runs once per day (or manually) to update the local config file; the monitor reads that file every hour to check drive health.  
- **Automatic Ticket Resolution** – When drive space returns above its threshold, the monitor automatically resolves the ticket – no manual closure required.  
- **Ticket Commenting, Not Duplication** – If a drive remains low on space, the monitor adds a comment to the existing open ticket instead of creating a new one, keeping all history in one place.  
- **Hierarchical Policy Management** – Set Company‑wide baselines and override them for specific Sites or individual Endpoints.  
- **OS‑Aware Targeting** – Servers and Workstations automatically use their respective threshold fields (`_Svr` / `_Wks`).  
- **Smart Drive Targeting** – Explicitly include or exclude specific drive letters (e.g., `CDEF`, `Z`).

### Important Caveats & Behavior

- **Daily Configuration Refresh** – The configuration writer task runs once per day. If you change a custom field, the new thresholds take effect after the next scheduled run. You can run the writer manually to apply changes immediately.  
- **Monitor Interval** – The monitor evaluates drive space every hour. At most, a newly low drive will be detected within one hour.  
- **Auto‑Resolution** – Tickets are automatically closed once all drives meet or exceed their thresholds.  
- **No Duplicate Tickets** – When a low‑space condition persists, the monitor comments on the existing ticket rather than creating a new one.

## Associated Content

### Group

| Name | Purpose |
|---|---|
| [Enhanced Drive Space Monitoring](/docs/475ce8e8-458e-4901-bdfc-18e79f62c549) | Dynamic group that targets Windows endpoints based on the `EDSM_Enable` custom fields, automatically pulling in devices authorized for monitoring. |

### Task

| Name | Purpose |
|---|---|
| [Enhanced Drive Space Monitoring Configuration Writer](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) | Runs daily to resolve hierarchical thresholds from custom fields and writes the JSON configuration file for the monitor. |

### Monitor

| Name | Purpose |
|---|---|
| [Enhanced Drive Space Monitoring](/docs/70d7b9fd-8311-4470-9e7a-674cf577d371) | Executes every hour, reading the local JSON configuration file. Checks drive free space against capacity‑based thresholds and generates or resolves tickets automatically. |

### Custom Fields: Enablement

These fields act as the “on/off switch” for the solution. They use a Dropdown (`Enable` or `Disable`) to dynamically target devices.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_Enable_Svr](/docs/0f5b9f59-98da-4cdd-bd21-8fa67ba81c76) | Company | Dropdown | Enables or disables server monitoring at the Company level. |
| [EDSM_Enable_Wks](/docs/079802b6-3820-4b72-a92f-f22052ce6360) | Company | Dropdown | Enables or disables workstation monitoring at the Company level. |
| [EDSM_Enable_Svr_Site](/docs/e003efff-e26c-4077-9f6c-b9d3287ace6e) | Site | Dropdown | Site‑level override for server enablement. |
| [EDSM_Enable_Wks_Site](/docs/8b27ab38-a281-4d4a-9108-e0fbfb076266) | Site | Dropdown | Site‑level override for workstation enablement. |
| [EDSM_Enable](/docs/82dfc50d-1a44-47dc-b719-4ac0e25e7010) | Endpoint | Dropdown | Endpoint‑level override to explicitly enable/disable specific machines. |

### Custom Fields: Drive Inclusion

Use these fields to specify exactly which drive letters should be evaluated (e.g., `CDEF`, `All`, or `None`).

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_DrivesToInclude_Svr](/docs/40d24606-0478-410c-a11a-a8a94fc20912) | Company | Text Box | Company baseline for server drives to include. |
| [EDSM_DrivesToInclude_Wks](/docs/45938d16-ef3a-4f64-891c-03b6a75a5dec) | Company | Text Box | Company baseline for workstation drives to include. |
| [EDSM_DrivesToInclude_Svr](/docs/e9905b04-6467-4e18-b7c9-ada16770b3f2) | Site | Text Box | Site‑level override for server drives to include. |
| [EDSM_DrivesToInclude_Wks](/docs/8f6106d4-59b5-49da-a7cb-bf2de66bf8fb) | Site | Text Box | Site‑level override for workstation drives to include. |
| [EDSM_DrivesToInclude](/docs/7c0130ee-56b6-4c04-8e66-1fafaad73c6d) | Endpoint | Text Box | Endpoint‑level override for specific machine inclusions. |

### Custom Fields: Drive Exclusion

Use these fields to explicitly ignore specific drive letters, such as a dedicated backup drive (e.g., `Z`, `None`, or `All`).

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_DrivesToExclude_Svr](/docs/f8a71954-7137-4b26-90de-5bb495d1e991) | Company | Text Box | Company baseline for server drives to ignore. |
| [EDSM_DrivesToExclude_Wks](/docs/268a9574-41c1-44ec-b87f-d3b7689364a1) | Company | Text Box | Company baseline for workstation drives to ignore. |
| [EDSM_DrivesToExclude_Svr](/docs/d8987226-2185-4097-a7aa-79cad95fddee) | Site | Text Box | Site‑level override for server drives to ignore. |
| [EDSM_DrivesToExclude_Wks](/docs/5bdbc620-2b0f-4217-9009-78ebdfebbda1) | Site | Text Box | Site‑level override for workstation drives to ignore. |
| [EDSM_DrivesToExclude](/docs/10713e2f-1457-4e60-8903-232032cc033e) | Endpoint | Text Box | Endpoint‑level override for specific machine exclusions. |

### Custom Fields: 16–300 GB Thresholds

Accepts values in percentages (`10%`), Megabytes (`500MB`), or Gigabytes (`15GB`). Set to `0` to disable monitoring for this capacity bucket.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_16To300Threshold_Svr](/docs/b6af6e72-388a-49e8-8cd1-658d240b8813) | Company | Text Box | Company baseline for 16‑300 GB server drives (Default: 10%). |
| [EDSM_16To300Threshold_Wks](/docs/8bc872f6-4810-4414-9532-ddec748df9ea) | Company | Text Box | Company baseline for 16‑300 GB workstation drives (Default: 10%). |
| [EDSM_16To300Threshold_Svr](/docs/84777e7f-983e-4a36-a61b-248f7a83aacf) | Site | Text Box | Site‑level override for 16‑300 GB server drives. |
| [EDSM_16To300Threshold_Wks](/docs/56bf11f7-32ef-477f-872c-1d2751999054) | Site | Text Box | Site‑level override for 16‑300 GB workstation drives. |
| [EDSM_16To300Threshold](/docs/1a511334-ec72-4984-bd5c-fa6dd0e28ce4) | Endpoint | Text Box | Endpoint‑level override for 16‑300 GB drives. |

### Custom Fields: 300–1024 GB Thresholds

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_300To1024Threshold_Svr](/docs/659635de-dd8e-41dc-8137-cb3a6c691e11) | Company | Text Box | Company baseline for 300‑1024 GB server drives (Default: 30GB). |
| [EDSM_300To1024Threshold_Wks](/docs/ac8bf87a-7ccf-4012-9831-02876c3bda70) | Company | Text Box | Company baseline for 300‑1024 GB workstation drives (Default: 30GB). |
| [EDSM_300To1024Threshold_Svr](/docs/29954063-87cc-4ffe-b3eb-dc07bc07d577) | Site | Text Box | Site‑level override for 300‑1024 GB server drives. |
| [EDSM_300To1024Threshold_Wks](/docs/9a923aa8-2038-49f1-9328-0ef473737799) | Site | Text Box | Site‑level override for 300‑1024 GB workstation drives. |
| [EDSM_300To1024Threshold](/docs/bc76dac2-4367-4eb6-a080-09390667ae57) | Endpoint | Text Box | Endpoint‑level override for 300‑1024 GB drives. |

### Custom Fields: 1024–4096 GB Thresholds

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_1024To4096Threshold_Svr](/docs/2a9bb294-b33e-4cfc-af75-52d5897d3f2d) | Company | Text Box | Company baseline for 1024‑4096 GB server drives (Default: 50GB). |
| [EDSM_1024To4096Threshold_Wks](/docs/6567dd43-e788-40bc-a592-afb94a40fc71) | Company | Text Box | Company baseline for 1024‑4096 GB workstation drives (Default: 50GB). |
| [EDSM_1024To4096Threshold_Svr](/docs/44e80c2c-dfdf-4e60-bbca-8599fad39d4e) | Site | Text Box | Site‑level override for 1024‑4096 GB server drives. |
| [EDSM_1024To4096Threshold_Wks](/docs/25e977e3-ba91-44bc-9f8d-e7054b04e14c) | Site | Text Box | Site‑level override for 1024‑4096 GB workstation drives. |
| [EDSM_1024To4096Threshold](/docs/b0a9f98d-c891-4903-bc9a-c526099a4076) | Endpoint | Text Box | Endpoint‑level override for 1024‑4096 GB drives. |

### Custom Fields: 4096+ GB Thresholds

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_4096PlusThreshold_Svr](/docs/dcff8864-ef49-45aa-88c8-870911e1d618) | Company | Text Box | Company baseline for 4096+ GB server drives (Default: 100GB). |
| [EDSM_4096PlusThreshold_Wks](/docs/f7570818-8da7-4e29-b52b-ae9ba7085125) | Company | Text Box | Company baseline for 4096+ GB workstation drives (Default: 100GB). |
| [EDSM_4096PlusThreshold_Svr](/docs/c073dd2e-e7da-44b7-b74c-cad86b438946) | Site | Text Box | Site‑level override for 4096+ GB server drives. |
| [EDSM_4096PlusThreshold_Wks](/docs/68c691d5-4c53-4bf0-862f-415f4a1ff73a) | Site | Text Box | Site‑level override for 4096+ GB workstation drives. |
| [EDSM_4096PlusThreshold](/docs/3141a7bf-aea8-4703-92ea-7ad11e65ae6c) | Endpoint | Text Box | Endpoint‑level override for 4096+ GB drives. |

## Implementation

Follow these steps in order to successfully deploy the Enhanced Drive Space Monitoring solution in your environment.

### Step 1: Create the Following Custom Fields

Create all 35 custom fields listed below in ConnectWise RMM. These are required for the solution to function correctly.

- [Custom Field: EDSM_16To300Threshold_Svr](/docs/b6af6e72-388a-49e8-8cd1-658d240b8813)
- [Custom Field: EDSM_16To300Threshold_Wks](/docs/8bc872f6-4810-4414-9532-ddec748df9ea)
- [Custom Field: EDSM_16To300Threshold_Svr](/docs/84777e7f-983e-4a36-a61b-248f7a83aacf)
- [Custom Field: EDSM_16To300Threshold_Wks](/docs/56bf11f7-32ef-477f-872c-1d2751999054)
- [Custom Field: EDSM_16To300Threshold](/docs/1a511334-ec72-4984-bd5c-fa6dd0e28ce4)
- [Custom Field: EDSM_300To1024Threshold_Svr](/docs/659635de-dd8e-41dc-8137-cb3a6c691e11)
- [Custom Field: EDSM_300To1024Threshold_Wks](/docs/ac8bf87a-7ccf-4012-9831-02876c3bda70)
- [Custom Field: EDSM_300To1024Threshold_Svr](/docs/29954063-87cc-4ffe-b3eb-dc07bc07d577)
- [Custom Field: EDSM_300To1024Threshold_Wks](/docs/9a923aa8-2038-49f1-9328-0ef473737799)
- [Custom Field: EDSM_300To1024Threshold](/docs/bc76dac2-4367-4eb6-a080-09390667ae57)
- [Custom Field: EDSM_1024To4096Threshold_Svr](/docs/2a9bb294-b33e-4cfc-af75-52d5897d3f2d)
- [Custom Field: EDSM_1024To4096Threshold_Wks](/docs/6567dd43-e788-40bc-a592-afb94a40fc71)
- [Custom Field: EDSM_1024To4096Threshold_Svr](/docs/44e80c2c-dfdf-4e60-bbca-8599fad39d4e)
- [Custom Field: EDSM_1024To4096Threshold_Wks](/docs/25e977e3-ba91-44bc-9f8d-e7054b04e14c)
- [Custom Field: EDSM_1024To4096Threshold](/docs/b0a9f98d-c891-4903-bc9a-c526099a4076)
- [Custom Field: EDSM_4096PlusThreshold_Svr](/docs/dcff8864-ef49-45aa-88c8-870911e1d618)
- [Custom Field: EDSM_4096PlusThreshold_Wks](/docs/f7570818-8da7-4e29-b52b-ae9ba7085125)
- [Custom Field: EDSM_4096PlusThreshold_Svr](/docs/c073dd2e-e7da-44b7-b74c-cad86b438946)
- [Custom Field: EDSM_4096PlusThreshold_Wks](/docs/68c691d5-4c53-4bf0-862f-415f4a1ff73a)
- [Custom Field: EDSM_4096PlusThreshold](/docs/3141a7bf-aea8-4703-92ea-7ad11e65ae6c)
- [Custom Field: EDSM_DrivesToInclude_Svr](/docs/40d24606-0478-410c-a11a-a8a94fc20912)
- [Custom Field: EDSM_DrivesToInclude_Wks](/docs/45938d16-ef3a-4f64-891c-03b6a75a5dec)
- [Custom Field: EDSM_DrivesToInclude_Svr](/docs/e9905b04-6467-4e18-b7c9-ada16770b3f2)
- [Custom Field: EDSM_DrivesToInclude_Wks](/docs/8f6106d4-59b5-49da-a7cb-bf2de66bf8fb)
- [Custom Field: EDSM_DrivesToInclude](/docs/7c0130ee-56b6-4c04-8e66-1fafaad73c6d)
- [Custom Field: EDSM_DrivesToExclude_Svr](/docs/f8a71954-7137-4b26-90de-5bb495d1e991)
- [Custom Field: EDSM_DrivesToExclude_Wks](/docs/268a9574-41c1-44ec-b87f-d3b7689364a1)
- [Custom Field: EDSM_DrivesToExclude_Svr](/docs/d8987226-2185-4097-a7aa-79cad95fddee)
- [Custom Field: EDSM_DrivesToExclude_Wks](/docs/5bdbc620-2b0f-4217-9009-78ebdfebbda1)
- [Custom Field: EDSM_DrivesToExclude](/docs/10713e2f-1457-4e60-8903-232032cc033e)
- [Custom Field: EDSM_Enable_Svr](/docs/0f5b9f59-98da-4cdd-bd21-8fa67ba81c76)
- [Custom Field: EDSM_Enable_Wks](/docs/079802b6-3820-4b72-a92f-f22052ce6360)
- [Custom Field: EDSM_Enable_Svr_Site](/docs/e003efff-e26c-4077-9f6c-b9d3287ace6e)
- [Custom Field: EDSM_Enable_Wks_Site](/docs/8b27ab38-a281-4d4a-9108-e0fbfb076266)
- [Custom Field: EDSM_Enable](/docs/82dfc50d-1a44-47dc-b719-4ac0e25e7010)

### Step 2: Create the Group

Once all custom fields exist, create the dynamic group that will automatically target the enabled machines.

- [Enhanced Drive Space Monitoring](/docs/475ce8e8-458e-4901-bdfc-18e79f62c549)

### Step 3: Create the Task

Set up the configuration writer task that will write the JSON configuration file on the targeted endpoints.

- [Enhanced Drive Space Monitoring Configuration Writer](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc)

### Step 4: Create the Monitor

Create the monitor that will read the configuration file and perform the actual drive space checks every hour.

- [Enhanced Drive Space Monitoring](/docs/70d7b9fd-8311-4470-9e7a-674cf577d371)

### Step 5: Schedule the Task

Schedule the [Enhanced Drive Space Monitoring Configuration Writer](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) task to run once per day against the [Enhanced Drive Space Monitoring](/docs/475ce8e8-458e-4901-bdfc-18e79f62c549) group, as described in the [Schedule Task](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc#schedule-task) section of the task's document.

The monitor is already configured to run every hour against the same group and requires no additional scheduling.

### Step 6: Review and Set Threshold Custom Fields

Review the default threshold values and set the threshold custom fields as required for your environments. You can set broad Company‑level baselines, and then configure specific Site‑level or Endpoint‑level overrides where tighter rules or exceptions are needed. Be sure to also configure any specific drive inclusion or exclusion fields if you only want to monitor certain drives (like `CDEF`).

### Step 7: Review and Set Enablement Custom Fields

Set the enablement custom fields to `Enable` for the client, location, or specific endpoint to turn the solution and monitoring on for them. Machines will not be monitored until they are explicitly enabled via these dropdown fields.

## FAQ

### Q: How does the Enhanced Drive Space Monitoring monitor work?

> A local configuration file (JSON) is written daily by the configuration writer task. The monitor reads this file every hour, evaluates all local fixed drives, filters them according to your include/exclude lists, and compares free space against the appropriate capacity‑bucket threshold. If any drive falls below its limit, an alert is generated; otherwise, a success message is returned and any open ticket is automatically resolved.

### Q: What are the default thresholds if I don’t set any custom fields?

> - 16–300 GB drives: 10% free space  
> - 300–1024 GB drives: 30 GB free  
> - 1024–4096 GB drives: 50 GB free  
> - 4096+ GB drives: 100 GB free  
> These defaults are used when no Company, Site, or Endpoint field is populated.

### Q: I changed a threshold custom field. When will the new values take effect?

> The configuration writer task runs once per day. The new thresholds will be applied on the next scheduled run. You can manually execute the [Enhanced Drive Space Monitoring Configuration Writer](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) task on an endpoint to update the configuration file immediately.

### Q: How quickly will I be notified if a drive runs low on space?

> The monitor checks every hour. In the worst case, you will be notified within one hour of the drive falling below its threshold.

### Q: Will the ticket close automatically when free space goes back above the threshold?

> Yes. As soon as all monitored drives are above their limits, the monitor returns a healthy state and the ticket is automatically closed.

### Q: If a drive stays low for several days, will I get a new ticket every day?

> No. After the first alert, if the condition persists, the monitor adds a comment to the existing ticket with the current drive status. A new ticket is only created if the issue was resolved and later re‑occurs.

### Q: Why isn't a specific device being monitored?

> The device must be explicitly enabled via the `EDSM_Enable` custom fields. Verify that the Endpoint, its Site, or its Company has the appropriate `EDSM_Enable*` field set to `Enable`. Blank or `Disable` entries will exclude the device from the monitoring group.

### Q: Can I monitor my servers differently than my workstations?

> Yes. The solution automatically detects the OS type and applies the corresponding Server (`_Svr`) or Workstation (`_Wks`) threshold fields.

### Q: I only want to monitor the C: drive. How do I stop alerts on other drives?

> Set the `EDSM_DrivesToInclude` field (at the desired level) to `C`. Only that drive letter will be evaluated.

### Q: How do I ignore a dedicated backup drive, like Z:?

> Use the `EDSM_DrivesToExclude` custom field and enter `Z`. The monitor will skip that drive.

### Q: Can I set a threshold in Megabytes or Gigabytes instead of a Percentage?

> Yes. Threshold fields accept `10%`, `500MB`, or `15GB`.

### Q: How do I disable monitoring for just one capacity bucket, like small 16–300 GB drives?

> Set the threshold value for that bucket to `0`. Drives in that range will be ignored.

### Q: The monitor output says “Drive space configuration file not found.” What should I do?

> This means the configuration writer task has not yet run on that endpoint. Run the [Enhanced Drive Space Monitoring Configuration Writer](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) task manually or wait for the next daily schedule.

### Q: I see the configuration file under ProgramData. Can I edit it manually?

> Manual changes will be overwritten the next time the configuration writer task runs. Always adjust thresholds through the custom fields to ensure consistency.

## Changelog

### 2026-07-02

- **Architecture Change:** The original monitoring task that directly generated tickets has been split into a **configuration writer** and a **dedicated monitor set**. The writer runs daily to produce a JSON config file; the new monitor runs every hour, reads that file, and handles all alerting and ticket management.  
- **Improved Ticketing:** Duplicate tickets are no longer created for persistent low‑space conditions. The monitor now comments on the existing open ticket.  
- **Automatic Ticket Resolution:** Tickets are automatically closed when drive space returns above the threshold.  
- Added the new monitor: [Enhanced Drive Space Monitoring](/docs/70d7b9fd-8311-4470-9e7a-674cf577d371).

### 2026-06-24

- Initial version of the document
