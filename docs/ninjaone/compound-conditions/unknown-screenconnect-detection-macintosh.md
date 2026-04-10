---
id: '2a26cba8-08a0-48a2-9d50-772878135025'
slug: /2a26cba8-08a0-48a2-9d50-772878135025
title: 'Unknown ScreenConnect Detection - Macintosh'
title_meta: 'Unknown ScreenConnect Detection - Macintosh'
keywords: ['screenconnect', 'unwanted-screenconnect', 'unknown-screenconnect', 'unknown-screenconnect-client']
description: 'Runs the Unknown ScreenConnect Client audit and remediation script daily on MacOS with a ScreenConnect Client installed. Triggers an alert when non-approved instances are detected.'
tags: ['alerting', 'auditing', 'monitoring', 'security', 'screenconnect']
draft: false
unlisted: false
last_update:
  date: 2026-04-09
---

## Summary

Runs the [Manage Unknown ScreenConnect Client [Macintosh]](/docs/0b6b654a-f27e-4d5f-8dea-e5f9c2a30e72) automation daily on MacOS where any ScreenConnect Client is installed and [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627) is configured. Creates a ticket when non-approved ScreenConnect instances are detected and remain after any configured remediation.

The behavior of the evaluation script depends on the value set in [cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627):

- When set to `Audit Only`, the script audits installed ScreenConnect instances and updates the device custom fields. No alert is raised and no removal is attempted. The compound condition will not trigger in this mode.
- When set to `Audit and Alert`, the script audits and updates custom fields, then exits with code `1` and outputs `Alert:` if unknown instances are found. The compound condition triggers and a ticket is created.
- When set to `Autofix and Alert on Failure`, the script attempts to remove unknown instances, re-audits the device, and updates custom fields. The compound condition triggers and a ticket is created only if unknown instances still remain after the removal attempt.

## Details

**Name:** `Unknown ScreenConnect Detection - Macintosh`  
**Description:** `Runs the Unknown ScreenConnect Client audit and remediation script daily on MacOS with a ScreenConnect Client installed. Triggers an alert when non-approved instances are detected.`  
**Recommended Agent Policies:** `Mac Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Unknown ScreenConnect Monitoring](/docs/ce85f694-4518-4e46-93e2-b008210e9627)
- [Custom Field: cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b)
- [Custom Field: cPVAL Installed ScreenConnect Instances](/docs/7379dfd8-d88c-4655-bab7-7b97e8798914)
- [Custom Field: cPVAL Unknown ScreenConnect Installed](/docs/72651ab4-28ea-4ee5-a7a3-63b03e437d96)
- [Automation: Manage Unknown ScreenConnect Client [Macintosh]](/docs/0b6b654a-f27e-4d5f-8dea-e5f9c2a30e72)
- [Solution: Unknown ScreenConnect Monitoring](/docs/b3bbf754-fbdc-4034-8728-c52286746b1f)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/unknown-screenconnect-detection-macintosh.toml)

> **Note:** *The `Allowed Instances` parameter on the evaluation script can be set here to define approved identifiers at the policy level, overriding [cPVAL Whitelisted ScreenConnect Instances](/docs/b190f460-afd9-4761-ad30-93094d15be2b) for all devices in the policy. Leave it blank to use the custom field instead.*

> **Note:** *The Notifications section requires a configured ticket template for the PSA integration in use (ConnectWise Manage, Autotask, HaloPSA, etc.). Without a valid template assigned, NinjaOne will not generate or manage tickets from this compound condition.*

## Changelog

### 2026-04-09

- Initial version of the document
