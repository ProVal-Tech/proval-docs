---
id: 'b3bbf754-fbdc-4034-8728-c52286746b1f'
slug: /b3bbf754-fbdc-4034-8728-c52286746b1f
title: 'Unknown ScreenConnect Monitoring'
title_meta: 'Unknown ScreenConnect Monitoring'
keywords: ['screenconnect', 'unwanted-screenconnect', 'unknown-screenconnect', 'unknown-screenconnect-client']
description: 'This solution detects and manages unauthorized or unknown ScreenConnect Client instances on Windows and macOS devices. It compares installed ScreenConnect instances against an approved list and takes action based on the enforcement level configured per organization, location, or device.'
tags: ['alerting', 'auditing', 'monitoring', 'security', 'screenconnect']
draft: false
unlisted: false
last_update:
  date: 2026-04-09
---

## Purpose

This solution detects and manages unauthorized or unknown ScreenConnect Client instances on Windows and macOS devices. It compares installed ScreenConnect instances against an approved list and takes action based on the enforcement level configured per organization, location, or device.

The solution supports three modes: audit only, audit and alert, and autofix with failure alerting. Results are written to device-level custom fields on every run and tickets are created when unknown instances are detected and remain present.

> ⚠️ **Warning - Read before enabling Autofix**
>
> Setting [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627) to `Autofix and Alert on Failure` **without** first populating [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) will cause the automation to attempt removal of **every** ScreenConnect Client instance on the device - including your own remote access tool. This can result in losing remote access to affected endpoints.
>
> Always populate the whitelist with your approved ScreenConnect instance identifiers before enabling Autofix at any scope. If you are unsure, start with `Audit Only` or `Audit and Alert` first to see what is installed before enabling any remediation.

## Associated Content

### Custom Fields

| Name | Type | Level | Purpose |
|------|------|-------|---------|
| [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627) | Dropdown | Organization, Location, Device | Controls the enforcement mode: `Audit Only`, `Audit and Alert`, or `Autofix and Alert on Failure`. |
| [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) | Text | Organization, Location, Device | Stores approved ScreenConnect instance identifiers. Instances not on this list are treated as unknown. |
| [cPVAL Installed ScreenConnect Instances](/docs/7379dfd8-d88c-4655-bab7-7b97e8798914) | WYSIWYG | Device | Automatically populated with a table of detected instances, their whitelist status, actions taken, and timestamps. |
| [cPVAL Unknown ScreenConnect Installed](/docs/72651ab4-28ea-4ee5-a7a3-63b03e437d96) | Checkbox | Device | Checked automatically when one or more unknown instances are detected in the latest run. |

### Automations

| Name | Platform | Purpose |
|------|----------|---------|
| [Manage Unknown ScreenConnect Client [Windows]](/docs/98a1813b-49c0-4b9e-8207-785884995e17) | Windows | Audits, optionally remediates, and updates custom fields for ScreenConnect instances on Windows devices. |
| [Manage Unknown ScreenConnect Client [Macintosh]](/docs/0b6b654a-f27e-4d5f-8dea-e5f9c2a30e72) | macOS | Audits, optionally remediates, and updates custom fields for ScreenConnect instances on macOS devices. |

### Compound Conditions

| Name | Platform | Purpose |
|------|----------|---------|
| [Unknown ScreenConnect Detection - Windows Workstation](/docs/741d52b4-f7db-42e3-a494-0071bd3edab4) | Windows Workstation | Runs the Windows automation daily on workstations with ScreenConnect installed. Triggers an alert and ticket when unknown instances are detected. |
| [Unknown ScreenConnect Detection - Windows Server](/docs/977d1dc8-2b16-4f63-a447-745c2ac21648) | Windows Server | Runs the Windows automation daily on servers with ScreenConnect installed. Triggers an alert and ticket when unknown instances are detected. |
| [Unknown ScreenConnect Detection - Macintosh](/docs/2a26cba8-08a0-48a2-9d50-772878135025) | macOS | Runs the macOS automation daily on Mac devices with ScreenConnect installed. Triggers an alert and ticket when unknown instances are detected. |

### Group

| Name | Purpose |
|------|---------|
| [cPVAL Unknown ScreenConnect Installed](/docs/be9fc1ac-d031-4d98-8f80-70bde34e76ce) | Dynamically groups all devices where [cPVAL Unknown ScreenConnect Installed](/docs/72651ab4-28ea-4ee5-a7a3-63b03e437d96) is checked. Useful for reporting and targeted follow-up. |

## Implementation

### Step 1: Create the Custom Fields

Create all four custom fields under `SETTINGS → Custom Fields`:

1. [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627) - Dropdown with options `Audit Only`, `Audit and Alert`, `Autofix and Alert on Failure`. Default value: `Audit Only`.
2. [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) - Text field. Enter approved ScreenConnect instance identifiers, comma-separated or one per line.
3. [cPVAL Installed ScreenConnect Instances](/docs/7379dfd8-d88c-4655-bab7-7b97e8798914) - WYSIWYG field. No manual configuration required; populated automatically by the automation.
4. [cPVAL Unknown ScreenConnect Installed](/docs/72651ab4-28ea-4ee5-a7a3-63b03e437d96) - Checkbox field. No manual configuration required; managed automatically by the automation.

### Step 2: Populate the Whitelist

Before enabling alerting or autofix, populate [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) at the organization level with your approved ScreenConnect instance identifiers.

> **Note:** *You can find your ScreenConnect instance identifier in the client name shown in your ScreenConnect console, or by running the automation in `Audit Only` mode first and reviewing the [cPVAL Installed ScreenConnect Instances](/docs/7379dfd8-d88c-4655-bab7-7b97e8798914) field output on a known-good device.*

### Step 3: Import the Automations

Import both automation scripts into NinjaOne:

1. [Manage Unknown ScreenConnect Client [Windows]](/docs/98a1813b-49c0-4b9e-8207-785884995e17)
2. [Manage Unknown ScreenConnect Client [Macintosh]](/docs/0b6b654a-f27e-4d5f-8dea-e5f9c2a30e72)

### Step 4: Create the Compound Conditions

Create the three compound conditions and attach them to the appropriate default agent policies:

1. [Unknown ScreenConnect Detection - Windows Workstation](/docs/741d52b4-f7db-42e3-a494-0071bd3edab4) - attach to `Windows Workstation [Default]` agent policy.
2. [Unknown ScreenConnect Detection - Windows Server](/docs/977d1dc8-2b16-4f63-a447-745c2ac21648) - attach to `Windows Server [Default]` agent policy.
3. [Unknown ScreenConnect Detection - Macintosh](/docs/2a26cba8-08a0-48a2-9d50-772878135025) - attach to `Mac [Default]` agent policy.

> **Note:** *In each compound condition, the `Allowed Instances` parameter on the evaluation script can be set to define approved identifiers at the policy level. When set, it overrides [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) for all devices in that policy. Leave it blank to use the custom field value instead.*

> **Note:** *For ticketing to work, the Notifications section in each compound condition must be configured with a valid ticket template for your PSA integration (ConnectWise Manage, Autotask, HaloPSA, etc.). Without a template, NinjaOne cannot generate or manage tickets from these conditions.*

### Step 5: Create the Group

Create the [cPVAL Unknown ScreenConnect Installed](/docs/be9fc1ac-d031-4d98-8f80-70bde34e76ce) device group to automatically collect any device where unknown ScreenConnect instances are detected.

### Step 6: Set the Enforcement Mode

Set [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627) at the organization level to the desired enforcement mode.

**Recommended rollout order:**

1. Start with `Audit Only` to see what ScreenConnect instances are installed across devices without any alerting or changes.
2. Review [cPVAL Installed ScreenConnect Instances](/docs/7379dfd8-d88c-4655-bab7-7b97e8798914) and the [cPVAL Unknown ScreenConnect Installed](/docs/72651ab4-28ea-4ee5-a7a3-63b03e437d96) checkbox on devices to confirm the whitelist is complete and accurate.
3. Move to `Audit and Alert` once the whitelist is confirmed, so tickets are created for genuinely unknown instances.
4. Only move to `Autofix and Alert on Failure` after thoroughly validating the whitelist and confirming no approved instances will be targeted for removal.

## FAQ

**1. What does this solution do?**  
> It finds ScreenConnect installations on devices, checks if they are approved, and then audits, alerts, or removes them based on your settings.

**2. Why would I use this solution?**  
> Use it to find unknown ScreenConnect installs quickly and reduce security risk from unapproved remote access tools.

**3. What does “unknown” mean here?**  
> “Unknown” means the ScreenConnect instance is not listed in [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b).

**4. What is the safest mode to start with?**  
> Start with `Audit Only`.

**5. What happens in Audit Only mode?**  
> The solution checks devices and updates custom fields. It does not create alerts and does not remove anything.

**6. What happens in Audit and Alert mode?**  
> The solution checks devices and creates alerts/tickets when unknown ScreenConnect instances are found.

**7. What happens in Autofix and Alert on Failure mode?**  
> The solution tries to remove unknown instances. If any remain, it creates an alert/ticket.

**8. What is the biggest risk in Autofix mode?**  
> If your whitelist is empty or incomplete, approved tools may be treated as unknown and removed.

**9. Can this remove our own ScreenConnect instance by mistake?**  
> Yes, if your approved instance identifier is not in the whitelist.

**10. How do I avoid accidental removal?**  
> Add approved identifiers to [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b), test with `Audit Only`, then move up to stricter modes.

**11. What if the whitelist is blank?**  
> All detected ScreenConnect instances are treated as unknown.

**12. Where do I set the monitoring mode?**  
> In [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627) at organization, location, or device level.

**13. Which setting wins if values are different at multiple levels?**  
> The most specific level (device over location over organization) is used by NinjaOne.

**14. What if I do not set the monitoring field at all?**  
> The automation defaults to `Audit Only`.

**15. What is Allowed Instances?**  
> It is an automation parameter that can define approved identifiers at runtime.

**16. Does Allowed Instances override the whitelist custom field?**  
> Yes. When set, it overrides [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) for that run/policy.

**17. What does the checkbox custom field mean?**  
> [cPVAL Unknown ScreenConnect Installed](/docs/72651ab4-28ea-4ee5-a7a3-63b03e437d96) is checked when at least one unknown instance is found in the latest run.

**18. What is the WYSIWYG custom field used for?**  
> [cPVAL Installed ScreenConnect Instances](/docs/7379dfd8-d88c-4655-bab7-7b97e8798914) shows details like name, version, status, action, and timestamp.

**19. Can I edit the WYSIWYG field manually?**  
> You can, but you should not. The automation overwrites it on the next run.

**20. How often does this run?**  
> By default, each compound condition is configured to run every 24 hours.

**21. Which devices are targeted by this solution?**  
> Windows Workstations, Windows Servers, and Macintosh devices where ScreenConnect is detected and the policy conditions are met.

**22. Do I need all three compound conditions?**  
> Yes, if you want full coverage across all three platform/policy types.

**23. Why are tickets not being created?**  
> Usually because the notification/ticket template is not configured in the compound condition.

**24. Can this work with ConnectWise, Autotask, or HaloPSA?**  
> Yes. Configure notifications and the correct ticket template for your PSA integration.

**25. What is the best rollout approach?**  
> Use `Audit Only` first, review results, fix whitelist gaps, move to `Audit and Alert`, and only then enable `Autofix and Alert on Failure`.

## Changelog

### 2026-04-09

- Initial version of the document
