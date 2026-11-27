---
id: '1478e5e2-97a5-435e-aba4-970f33ef598b'
slug: /1478e5e2-97a5-435e-aba4-970f33ef598b
title: 'Deploy ConnectSecure Agent [Windows]'
title_meta: 'Deploy ConnectSecure Agent [Windows]'
keywords: ['connectsecure', 'cybercns', 'agent', 'monitor', 'autofix']
description: 'Checks every hour whether the ConnectSecure agent service is installed, and runs the Deploy ConnectSecure Agent [Windows] task when it is missing.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **Deploy ConnectSecure Agent [Windows]** monitor checks every hour whether the ConnectSecure agent service, `CyberCnsAgent`, is installed on the online devices in the [Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f) group. When it's missing, the monitor runs the [Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce) task to install it. The monitor doesn't create tickets.

### How it works

1. **Check.** Every hour, a short script checks whether the `CyberCnsAgent` service exists on the device.
2. **Detect.** `Not Installed` means the agent is missing. The monitor runs the [Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce) task, which downloads and installs the agent.
3. **Resolve.** After a successful install, the next check returns `Already Installed`. When an install fails, the next check finds the agent still missing and runs the task again, every hour until the problem is fixed.

| Script Output | Meaning |
| --- | --- |
| `Already Installed` | The agent's service is on the device. Nothing to do. |
| `Not Installed` | The agent's service is missing. The task runs to install it. |

**Requirements:** PowerShell 5.1. The task needs internet access to ConnectSecure, and the CS custom fields filled in for the device's company.

## Dependencies

- [Group: Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f)
- [Task: Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce)
- [Custom Field: CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b)
- [Custom Field: CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986)
- [Custom Field: CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b)
- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)

## Target

This monitor targets the `Deploy ConnectSecure Agent [Windows]` device group, which holds the Windows devices where deployment is turned on.

![Image1](../../../static/img/docs/1478e5e2-97a5-435e-aba4-970f33ef598b/image1.webp)

## Monitor Setup Path

- **Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`
- **Action:** `Create Monitor`

## Monitor Creation

### Description

- **Name:** `Deploy ConnectSecure Agent [Windows]`
- **Description:**

```PlainText
Checks every hour whether the ConnectSecure agent service (CyberCnsAgent) is installed. When it's missing, runs the Deploy ConnectSecure Agent [Windows] task to install it.
```

- **Type:** `Script`
- **Severity:** `Others`
- **Family:** `Windows Services`

![Image2](../../../static/img/docs/1478e5e2-97a5-435e-aba4-970f33ef598b/image2.webp)

## Conditions

- **Run script on:** `Schedule`
- **Repeat every:** `1` `Hour(s)`
- **Script Language:** `PowerShell`
- **Use Generative AI Assist for script creation:** `False`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/monitors/deploy-connectsecure-agent-windows/script.ps1)

- **Criteria:** `Contains`
- **Operator:** `AND`
- **Script Output:** `Not Installed`
- **Escalate ticket on script failure:** `Disabled`
- **Add Automation:** `Deploy ConnectSecure Agent [Windows]`

![Image3](../../../static/img/docs/1478e5e2-97a5-435e-aba4-970f33ef598b/image3.webp)

## Monitor Output

- **Output:** `Do not Generate Ticket`

![Image4](../../../static/img/docs/1478e5e2-97a5-435e-aba4-970f33ef598b/image4.webp)

## Completed Monitor

![Image5](../../../static/img/docs/1478e5e2-97a5-435e-aba4-970f33ef598b/image5.webp)

## Implementation

1. Create the [Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce) task first. The monitor runs it as its automation.
2. Install the monitor from the `ProVal - Content` Community, selecting the **Monitors** repository.
3. Open the monitor and check that **Add Automation** runs the `Deploy ConnectSecure Agent [Windows]` task. Select the task if it's missing.
4. Make sure the monitor is enabled, then save.

## Changelog

### 2026-11-27

- Initial version of the document
