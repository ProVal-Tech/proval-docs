---
id: '800f96cd-5e64-48dd-bb9a-f17822db38e8'
slug: /800f96cd-5e64-48dd-bb9a-f17822db38e8
title: 'Manage Feature Update Deferral'
title_meta: 'Manage Feature Update Deferral'
keywords: ['windows-11', 'feature-update', 'feature-update-deferral', 'defer-feature-update', 'windows-update-policy']
description: 'This solution automates the enforcement and reporting of Windows feature update deferral policies using company-level settings and registry modifications on Windows 11 machines.'
tags: ['windows', 'patching', 'registry']
draft: false
unlisted: false
last_update:
  date: 2026-03-11
---

## Purpose

This solution automates the enforcement and reporting of Windows feature update deferral policies using company-level settings and registry modifications on Windows 11 machines.

## Associated Content

### Auditing

| Name | Type | Purpose |
| --- | --- | --- |
| [Feature Update Deferral Days](/docs/c3d64c06-6c83-4d50-b0aa-71ae018d4c22) | Custom Field | Stores the currently active number of days Windows feature updates are deferred on this specific endpoint. A value of 0 indicates the deferral policy is currently disabled or unconfigured. |
| [Windows 11 Machines](/docs/1e54cc97-a5af-4dc9-9d79-00fd052c8454) | Dynamic Group | Contains all Windows 11 machines. |
| [Get Feature Update Deferral Days](/docs/ffdbfea6-21fd-44b6-9eca-c42529652a47) | Task | Fetches the current feature update deferral setting from the local machine. The output is automatically mapped to the "Feature Update Deferral Days" custom field. |

### Automation

| Name | Type | Purpose |
| --- | --- | --- |
| [Days to Defer Feature Updates](/docs/f09876a6-5d87-446a-8b07-dc3f30f3a285) | Custom Field | A company-level, editable field used to set the desired number of days to postpone Windows feature updates for all endpoints under the client. |
| [Manage Feature Update Deferral Days](/docs/8b8782e5-6747-4cd4-b7c5-00e0040ee4fb) | Dynamic Group | A group of Windows 11 machines configured to inherit their feature update deferral settings directly from the company-level custom field "Days to Defer Feature Updates". |
| [Set Feature Update Deferral Days](/docs/4a9a6325-a499-4260-85e2-ba83e472403e) | Task | Enforces the Windows feature update delay based on the mandatory company-level custom field "Days to Defer Feature Updates". Once the registry changes are applied, the script automatically writes the new value back to the device-level custom field "Feature Update Deferral Days" for accurate reporting. |

## Implementation

### Step 1: Create the Custom Fields

Navigate to `SETTINGS → Custom Fields`. Create the endpoint-level [Feature Update Deferral Days](/docs/c3d64c06-6c83-4d50-b0aa-71ae018d4c22) custom field and the company-level [Days to Defer Feature Updates](/docs/f09876a6-5d87-446a-8b07-dc3f30f3a285) custom field.

### Step 2: Create the Dynamic Groups

Navigate to `ENDPOINTS → Groups`. Create the [Windows 11 Machines](/docs/1e54cc97-a5af-4dc9-9d79-00fd052c8454) dynamic group to target all Windows 11 machines. Then, create the [Manage Feature Update Deferral Days](/docs/8b8782e5-6747-4cd4-b7c5-00e0040ee4fb) dynamic group to target Windows 11 machines where the "Days to Defer Feature Updates" field is not blank.

### Step 3: Create the Tasks

Navigate to `AUTOMATION → Tasks`. Add both the [Get Feature Update Deferral Days](/docs/ffdbfea6-21fd-44b6-9eca-c42529652a47) task and the [Set Feature Update Deferral Days](/docs/4a9a6325-a499-4260-85e2-ba83e472403e) task.

### Step 4: Schedule the Tasks

Configure the tasks to run on an `Every day` recurrence schedule.

* Target the [Set Feature Update Deferral Days](/docs/4a9a6325-a499-4260-85e2-ba83e472403e) task against the `Manage Feature Update Deferral Days` device group.
* Target the [Get Feature Update Deferral Days](/docs/ffdbfea6-21fd-44b6-9eca-c42529652a47) task against the `Windows 11 Machines` device group.

>**Note:** If you are enforcing the automation for all machines in your environment, you do not need to schedule this auditing task. The automation script automatically writes the active value back to the endpoint-level custom field for accurate reporting.

## FAQ

**Q1: What is the main purpose of this solution?**
>This solution is designed to enforce and report on Windows feature update deferral policies using company-level settings and registry modifications on Windows 11 endpoints.

**Q2: Which operating systems are targeted by this automation?**
>The dynamic groups in this solution are specifically configured to target machines where the OS contains "Microsoft Windows 11".

**Q3: How do I specify how long feature updates should be delayed for a client?**
>You define the desired delay by entering a number in the company-level custom field named "Days to Defer Feature Updates".

**Q4: What is the maximum number of days I can defer feature updates using this script?**
>The script accepts a maximum value of 365 days.

**Q5: What is the minimum number of days I can defer feature updates?**
>The minimum value is 0 days.

**Q6: How do I turn off the deferral policy entirely?**
>Setting the "Days to Defer Feature Updates" company-level custom field to 0 turns off the deferral policy entirely.

**Q7: How does the system automatically know which machines to apply the policy to?**
>The "Manage Feature Update Deferral Days" dynamic group automatically includes Windows 11 machines as long as the company-level "Days to Defer Feature Updates" field is not blank.

**Q8: Can I manually edit an endpoint's deferral days custom field?**
>No, the endpoint-level "Feature Update Deferral Days" custom field is marked as non-editable. It is strictly used to store the current setting fetched by the scripts.

**Q9: Where can I see if a specific machine has the deferral policy active?**
>You can check the "Feature Update Deferral Days" endpoint-level custom field.

**Q10: What does it mean if an endpoint has a "0" in the "Feature Update Deferral Days" field?**
>A value of 0 indicates that the deferral policy is currently disabled or unconfigured on that specific endpoint.

**Q11: What exact registry path does the automation script modify?**
>The script modifies the `HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate` registry path.

**Q12: Which specific registry values are changed by the script?**
>The script enables the `DeferFeatureUpdates` policy and sets the `DeferFeatureUpdatesPeriodInDays` value to the duration specified in your custom field.

**Q13: What happens if the required registry path does not exist on the endpoint?**
>If the registry path is missing, the script will attempt to create it. However, if the deferral days are set to 0, it will simply output '0' and exit without creating the path.

**Q14: What is the purpose of the "Get Feature Update Deferral Days" task?**
>It is an auditing task that fetches the current feature update deferral setting from the local machine's registry and maps it to the endpoint-level custom field.

**Q15: Do I need to schedule both the auditing task and the automation task?**
>Not necessarily. If you use the "Set Feature Update Deferral Days" automation task, it automatically writes the new value back to the endpoint-level custom field for reporting. The "Get" task is primarily for auditing machines where the automation is not actively enforced.

**Q16: How often should I schedule these tasks to run?**
>The suggested recurrence schedule for both tasks is "Every day".

**Q17: Under what user context do the scripts execute?**
>Both the auditing and automation scripts run under the "System" context.

**Q18: What language are the tasks written in?**
>The task scripts are written in PowerShell.

**Q19: What is the expected timeout or execution time for the scripts?**
>The expected time of script execution is configured to 300 seconds.

**Q20: What happens if someone types text instead of a number into the "Days to Defer Feature Updates" custom field?**
>The automation script checks if the value is a valid integer between 0 and 365; if it contains non-numeric characters or falls outside this range, the script will throw an error.

**Q21: What happens if the company-level custom field is completely empty?**
>If the custom field is blank, the endpoint will not be added to the "Manage Feature Update Deferral Days" dynamic group. If the script were to run anyway, it would throw an error stating the field is not set or empty.

**Q22: Which dynamic group should I target the enforcement script against?**
>The "Set Feature Update Deferral Days" task should be scheduled against the "Manage Feature Update Deferral Days" device group.

**Q23: Which dynamic group should I target the auditing script against?**
>The "Get Feature Update Deferral Days" task should be scheduled against the broader "Windows 11 Machines" device group.

**Q24: Does the automation script generate a script log?**
>Yes, both scripts output the final deferral days value (e.g., "0" or "30") as a Script Log Message.

**Q25: Can this script handle Windows 10 machines?**
>While the custom field description mentions postponing updates for "all Windows 10 and 11 endpoints", the dynamic groups provided in this specific solution are strictly configured with the criteria "OS Contains any of Microsoft Windows 11".

## Changelog

### 2026-03-11

* Initial version of the document
