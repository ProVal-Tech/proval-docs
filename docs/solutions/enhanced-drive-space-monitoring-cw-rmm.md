---
id: 'e9cf4ff0-4413-447b-97dd-b8b2abd59597'
slug: /e9cf4ff0-4413-447b-97dd-b8b2abd59597
title: 'Enhanced Drive Space Monitoring'
title_meta: 'Enhanced Drive Space Monitoring'
keywords: ['monitoring', 'drive', 'space', 'thresholds', 'tickets']
description: 'Compares local drive free space against hierarchically defined custom thresholds based on disk capacity and outputs a formatted status string.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-24
---

## Purpose

The **Enhanced Drive Space Monitoring** solution provides an intelligent, highly customizable automated health check for local drive space across your managed Windows endpoints.

Instead of relying on a single, rigid "one-size-fits-all" threshold, this solution dynamically calculates the total capacity of each logical drive and assigns it to a specific storage tier (e.g., 16–300 GB, 300–1024 GB). It then compares the available free space against flexible, hierarchical limits that you control. This ensures a 250 GB OS drive and a 10 TB data volume are evaluated against proportionally appropriate limits, utilizing Percentages, Megabytes, or Gigabytes as you see fit.

### Key Capabilities

- **Hierarchical Policy Management:** Define broad baseline policies across your entire Company, and easily override them for specific Sites or individual, critical Endpoints.
- **OS-Aware Targeting:** Set different thresholds for Servers versus Workstations without managing separate scripts.
- **Smart Drive Targeting:** Explicitly monitor critical drives (like `CDEF`) or ignore specific secondary volumes (like a backup `Z` drive).

### Important Caveats & Ticketing Behavior

- **Daily Ticketing:** If the automation is scheduled to run daily and detects a drive below your defined threshold, it will generate a **new** service ticket each time it runs until the storage issue is resolved.
- **Manual Closure Required:** Due to native functionalities within ConnectWise RMM, the system cannot currently fetch or update an existing ticket. Technicians must manually close the generated tickets after freeing up space on the affected endpoint.

## Associated Content

### Group

| Name | Purpose |
|---|---|
| [Enhanced Drive Space Monitoring](/docs/475ce8e8-458e-4901-bdfc-18e79f62c549) | Dynamic group that targets Windows endpoints based on the `EDSM_Enable` custom fields, automatically pulling in devices authorized for monitoring. |

### Task

| Name | Purpose |
|---|---|
| [Enhanced Drive Space Monitoring](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) | The primary script execution wrapper. Evaluates hierarchical thresholds, checks disk capacity, and generates formatted alert tickets if space is critically low. |

### Custom Fields: Enablement

These fields act as the "on/off switch" for the solution. They utilize a Dropdown (`Enable` or `Disable`) to dynamically target devices.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_Enable_Svr](/docs/0f5b9f59-98da-4cdd-bd21-8fa67ba81c76) | Company | Dropdown | Enables or disables server monitoring at the Company level. |
| [EDSM_Enable_Wks](/docs/079802b6-3820-4b72-a92f-f22052ce6360) | Company | Dropdown | Enables or disables workstation monitoring at the Company level. |
| [EDSM_Enable_Svr_Site](/docs/e003efff-e26c-4077-9f6c-b9d3287ace6e) | Site | Dropdown | Site-level override for server enablement. |
| [EDSM_Enable_Wks_Site](/docs/8b27ab38-a281-4d4a-9108-e0fbfb076266) | Site | Dropdown | Site-level override for workstation enablement. |
| [EDSM_Enable](/docs/82dfc50d-1a44-47dc-b719-4ac0e25e7010) | Endpoint | Dropdown | Endpoint-level override to explicitly enable/disable specific machines. |

### Custom Fields: Drive Inclusion

Use these fields to specify exactly which drive letters should be evaluated (e.g., `CDEF`, `All`, or `None`).

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_DrivesToInclude_Svr](/docs/40d24606-0478-410c-a11a-a8a94fc20912) | Company | Text Box | Company baseline for server drives to include. |
| [EDSM_DrivesToInclude_Wks](/docs/45938d16-ef3a-4f64-891c-03b6a75a5dec) | Company | Text Box | Company baseline for workstation drives to include. |
| [EDSM_DrivesToInclude_Svr](/docs/e9905b04-6467-4e18-b7c9-ada16770b3f2) | Site | Text Box | Site-level override for server drives to include. |
| [EDSM_DrivesToInclude_Wks](/docs/8f6106d4-59b5-49da-a7cb-bf2de66bf8fb) | Site | Text Box | Site-level override for workstation drives to include. |
| [EDSM_DrivesToInclude](/docs/7c0130ee-56b6-4c04-8e66-1fafaad73c6d) | Endpoint | Text Box | Endpoint-level override for specific machine inclusions. |

### Custom Fields: Drive Exclusion

Use these fields to explicitly ignore specific drive letters, such as a dedicated backup drive (e.g., `Z`, `None`, or `All`).

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_DrivesToExclude_Svr](/docs/f8a71954-7137-4b26-90de-5bb495d1e991) | Company | Text Box | Company baseline for server drives to ignore. |
| [EDSM_DrivesToExclude_Wks](/docs/268a9574-41c1-44ec-b87f-d3b7689364a1) | Company | Text Box | Company baseline for workstation drives to ignore. |
| [EDSM_DrivesToExclude_Svr](/docs/d8987226-2185-4097-a7aa-79cad95fddee) | Site | Text Box | Site-level override for server drives to ignore. |
| [EDSM_DrivesToExclude_Wks](/docs/5bdbc620-2b0f-4217-9009-78ebdfebbda1) | Site | Text Box | Site-level override for workstation drives to ignore. |
| [EDSM_DrivesToExclude](/docs/10713e2f-1457-4e60-8903-232032cc033e) | Endpoint | Text Box | Endpoint-level override for specific machine exclusions. |

### Custom Fields: 16–300 GB Thresholds

Accepts values in percentages (`10%`), Megabytes (`500MB`), or Gigabytes (`15GB`). Set to `0` to disable monitoring for this capacity bucket.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_16To300Threshold_Svr](/docs/b6af6e72-388a-49e8-8cd1-658d240b8813) | Company | Text Box | Company baseline for 16-300 GB server drives (Default: 10%). |
| [EDSM_16To300Threshold_Wks](/docs/8bc872f6-4810-4414-9532-ddec748df9ea) | Company | Text Box | Company baseline for 16-300 GB workstation drives (Default: 10%). |
| [EDSM_16To300Threshold_Svr](/docs/84777e7f-983e-4a36-a61b-248f7a83aacf) | Site | Text Box | Site-level override for 16-300 GB server drives. |
| [EDSM_16To300Threshold_Wks](/docs/56bf11f7-32ef-477f-872c-1d2751999054) | Site | Text Box | Site-level override for 16-300 GB workstation drives. |
| [EDSM_16To300Threshold](/docs/1a511334-ec72-4984-bd5c-fa6dd0e28ce4) | Endpoint | Text Box | Endpoint-level override for 16-300 GB drives. |

### Custom Fields: 300–1024 GB Thresholds

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_300To1024Threshold_Svr](/docs/659635de-dd8e-41dc-8137-cb3a6c691e11) | Company | Text Box | Company baseline for 300-1024 GB server drives (Default: 30GB). |
| [EDSM_300To1024Threshold_Wks](/docs/ac8bf87a-7ccf-4012-9831-02876c3bda70) | Company | Text Box | Company baseline for 300-1024 GB workstation drives (Default: 30GB). |
| [EDSM_300To1024Threshold_Svr](/docs/29954063-87cc-4ffe-b3eb-dc07bc07d577) | Site | Text Box | Site-level override for 300-1024 GB server drives. |
| [EDSM_300To1024Threshold_Wks](/docs/9a923aa8-2038-49f1-9328-0ef473737799) | Site | Text Box | Site-level override for 300-1024 GB workstation drives. |
| [EDSM_300To1024Threshold](/docs/bc76dac2-4367-4eb6-a080-09390667ae57) | Endpoint | Text Box | Endpoint-level override for 300-1024 GB drives. |

### Custom Fields: 1024–4096 GB Thresholds

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_1024To4096Threshold_Svr](/docs/2a9bb294-b33e-4cfc-af75-52d5897d3f2d) | Company | Text Box | Company baseline for 1024-4096 GB server drives (Default: 50GB). |
| [EDSM_1024To4096Threshold_Wks](/docs/6567dd43-e788-40bc-a592-afb94a40fc71) | Company | Text Box | Company baseline for 1024-4096 GB workstation drives (Default: 50GB). |
| [EDSM_1024To4096Threshold_Svr](/docs/44e80c2c-dfdf-4e60-bbca-8599fad39d4e) | Site | Text Box | Site-level override for 1024-4096 GB server drives. |
| [EDSM_1024To4096Threshold_Wks](/docs/25e977e3-ba91-44bc-9f8d-e7054b04e14c) | Site | Text Box | Site-level override for 1024-4096 GB workstation drives. |
| [EDSM_1024To4096Threshold](/docs/b0a9f98d-c891-4903-bc9a-c526099a4076) | Endpoint | Text Box | Endpoint-level override for 1024-4096 GB drives. |

### Custom Fields: 4096+ GB Thresholds

| Name | Level | Type | Purpose |
|---|---|---|---|
| [EDSM_4096PlusThreshold_Svr](/docs/dcff8864-ef49-45aa-88c8-870911e1d618) | Company | Text Box | Company baseline for 4096+ GB server drives (Default: 100GB). |
| [EDSM_4096PlusThreshold_Wks](/docs/f7570818-8da7-4e29-b52b-ae9ba7085125) | Company | Text Box | Company baseline for 4096+ GB workstation drives (Default: 100GB). |
| [EDSM_4096PlusThreshold_Svr](/docs/c073dd2e-e7da-44b7-b74c-cad86b438946) | Site | Text Box | Site-level override for 4096+ GB server drives. |
| [EDSM_4096PlusThreshold_Wks](/docs/68c691d5-4c53-4bf0-862f-415f4a1ff73a) | Site | Text Box | Site-level override for 4096+ GB workstation drives. |
| [EDSM_4096PlusThreshold](/docs/3141a7bf-aea8-4703-92ea-7ad11e65ae6c) | Endpoint | Text Box | Endpoint-level override for 4096+ GB drives. |

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

Set up the monitoring script that will execute on the targeted endpoints.

- [Enhanced Drive Space Monitoring](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc)

### Step 4: Schedule the Task

Schedule the [Enhanced Drive Space Monitoring](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc) task to run once per day against the [Enhanced Drive Space Monitoring](/docs/475ce8e8-458e-4901-bdfc-18e79f62c549) as explained in the [Schedule Task](/docs/b2a4b9ec-08bd-4bce-8db7-b155c6bc03bc#schedule-task) section of the task's document.

### Step 5: Review and Set Threshold Custom Fields

Review the default threshold values and set the threshold custom fields as required for your environments. You can set broad Company-level baselines, and then configure specific Site-level or Endpoint-level overrides where tighter rules or exceptions are needed. Be sure to also configure any specific drive inclusion or exclusion fields if you only want to monitor certain drives (like `CDEF`).

### Step 6: Review and Set Enablement Custom Fields

Set the enablement custom fields to `Enable` for the client, location, or specific endpoint to turn the solution and monitoring on for them. Machines will not be monitored until they are explicitly enabled via these dropdown fields.

## FAQ

### Q: What does the Enhanced Drive Space Monitoring solution do?

> It acts as an automated health check that monitors the local drive space on your managed Windows endpoints. It calculates the total capacity of each drive, assigns it to a specific storage tier (e.g., 16-300 GB, 300-1024 GB), and compares the available free space against your custom thresholds.

### Q: How is this different from standard drive space monitoring?

> Standard monitoring usually relies on a single "one-size-fits-all" threshold (like 10% free space). This solution dynamically scales the threshold based on the drive's total capacity, ensuring a 250 GB OS drive and a 10 TB data volume are evaluated against proportionally appropriate limits.

### Q: Can I use this solution to monitor Mac or Linux endpoints?

> No, this solution is explicitly designed and targeted for Windows operating systems (Servers and Workstations) only.

### Q: Does the script monitor mapped network drives or USB flash drives?

> No. The script is specifically designed to discover and evaluate local logical drives (DriveType=3) attached directly to the system.

### Q: Why isn't a specific device being monitored, even though I see it in ConnectWise RMM?

> The solution requires an explicit "opt-in" via the EDSM_Enable custom fields. Ensure that the device is flagged as "Enable" either directly at the Endpoint level, or via its parent Site or Company level configurations.

### Q: I set the Company level to "Enable", but a specific site still isn't being monitored. Why?

> The monitoring uses a hierarchical override system. If the Site-level EDSM_Enable field is set to "Disable", it overrides the Company-level "Enable" setting for that specific location.

### Q: What happens if the EDSM_Enable field is blank at all levels?

> The solution requires an explicit "Enable" command to pull a device into the targeted dynamic group. If the field is completely blank everywhere, the device will not be monitored.

### Q: Can I monitor my servers differently than my workstations?

> Yes! The solution automatically detects the OS type and applies the corresponding Server (_Svr) or Workstation (_Wks) threshold custom fields.

### Q: I only want to monitor the OS drive (C:). How do I stop it from alerting on other drives?

> Use the EDSM_DrivesToInclude custom fields. Set the value to C at the Company, Site, or Endpoint level, and the script will only evaluate that specific letter.

### Q: How do I ignore a specific drive, like a dedicated backup volume on the Z: drive?

> Use the EDSM_DrivesToExclude custom fields. Enter Z into the appropriate field, and the script will automatically skip it during the evaluation.

### Q: What happens if I put C in the 'Include' field and C in the 'Exclude' field?

> The script evaluates inclusions first, but if a drive matches the exclusion list, it is ultimately skipped. In this contradictory scenario, the C: drive would be ignored.

### Q: The script log says "Drive space monitoring is disabled. No drives are included." What does this mean?

> This indicates that the EDSM_DrivesToInclude field (at the Company, Site, or Endpoint level) is currently set to "None", which explicitly tells the script not to monitor any drives on that machine.

### Q: Can I set a threshold using MegaBytes or GigaBytes instead of a Percentage?

> Yes, the threshold custom fields accept values formatted as a percentage (10%), Megabytes (500MB), or Gigabytes (15GB).

### Q: How do I disable monitoring for just one specific size category, like small 16-300 GB drives?

> Set the threshold value for that specific category to 0. The script will skip evaluating any drives that fall into that capacity bucket.

### Q: What happens if a device doesn't have any threshold custom fields filled out?

> If no custom thresholds are found at the Endpoint, Site, or Company level, the script assumes a value of 0 and will not monitor the drive. However, some Company-level fields have built-in default values (like 10% for 16-300 GB drives).

### Q: A specific endpoint has a 500GB drive. I set the Endpoint 16-300GB threshold to 5% and the 300-1024GB threshold to 20GB. Which one applies?

> The 300-1024GB threshold of 20GB will apply. The script calculates the total drive capacity first, assigns it to the 300-1024GB bucket, and pulls the corresponding limit.

### Q: What happens if a server has a massive 5 TB data drive?

> The drive's total capacity places it in the 4096+ GB bucket. The script will automatically evaluate it against the EDSM_4096PlusThreshold limits.

### Q: I set an Endpoint threshold, but it doesn't seem to be applying. What is wrong?

> Ensure the formatting is exactly correct (e.g., 10%, 500MB, or 15GB with no spaces). The script uses specific regex rules to parse these strings, and invalid entries may be ignored.

### Q: We have a client with very specific needs for their workstations. Can we override the Company default for just them?

> Yes, you would populate the _Wks custom fields at the Site Level for that specific client location. Site settings will override the broader Company defaults.

### Q: I scheduled the task to run daily at 1:00 PM. A server's drive filled up at 2:00 PM. When will I get a ticket?

> You will not receive a ticket until the next scheduled run, which would be 1:00 PM the following day. The script only evaluates the space at the exact moment it executes.

### Q: If a drive is low on space, will the system automatically create a ticket?

> Yes, if the scheduled task detects a drive falling below its assigned threshold, it will automatically generate a service ticket.

### Q: What information is included in the generated ticket?

> The ticket contains a detailed summary of the problematic drives, including the Drive Letter, Total Space, Used Space, Free Space, and the specific Threshold limit that was breached.

### Q: I cleared up space on a drive that generated an alert. Will the ticket auto-close?

> No. ConnectWise RMM does not currently support auto-closing these specific script-generated alerts. Technicians must manually close the generated tickets after resolving the underlying storage issue.

### Q: The drive is still low on space the next day. Will the script update the existing ticket?

> No. Due to native CW RMM functionality limitations, the system cannot fetch an existing ticket number to append data. It will generate a new ticket every time it runs and detects the issue is still present.

### Q: Can I manually run the monitoring task to check a machine right now?

> Yes. You can manually execute the Enhanced Drive Space Monitoring task at any time against an endpoint to generate an immediate status check, regardless of the daily schedule.

## Changelog

### 2026-06-24

- Initial version of the document
