---
id: 'de5d3a2a-085c-4150-8469-a9efdea0b3c2'
slug: /de5d3a2a-085c-4150-8469-a9efdea0b3c2
title: 'Entra Password Protection Proxy Health'
title_meta: 'Entra Password Protection Proxy Health'
keywords: ['entra', 'password-protection', 'proxy', 'health', 'monitor', 'tickets']
description: 'Checks every hour that the Entra Password Protection Proxy service is running and passes its health diagnostics, and alerts or opens a ticket when it does not.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **Entra Password Protection Proxy Health** monitor checks every hour that the Entra Password Protection Proxy service is running and passes Microsoft's health diagnostics, on the online servers in the [Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c) group. A failure raises an alert in CW RMM. When EPP_Ticket is `Enabled`, the monitor also creates one ticket for the server through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, and closes it once every check passes again.

The monitor can't read custom fields, so it reads its settings from the configuration file written by the [Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd) task.

### How it works

1. **Check.** Every hour, the script confirms the proxy service is running and runs `Test-AzureADPasswordProtectionProxyHealth -TestAll`. That test checks the server's TLS configuration, the proxy's registration with Entra ID, and its connection to Azure.
2. **Detect.** Any failed check returns output that starts with `Failure:`, and the monitor raises an alert. When tickets are on, the script creates one ticket for the server. Later failures of the same incident don't create more tickets.
3. **Resolve.** When every check passes again, the script closes the ticket through the workflow.

| Script Output | Meaning |
| --- | --- |
| `Failure: Entra Password Protection Proxy health check found <n> issue(s). <Issues>` | One or more checks failed. CW RMM raises an alert, and a ticket is created when EPP_Ticket is `Enabled`. |
| `Success: The Entra Password Protection Proxy service is running and every health diagnostic passed.` | Healthy. An open ticket is closed. |
| `Success: Entra Password Protection Proxy health monitoring is disabled for this device.` | Monitoring is `Disabled` in the configuration file. An open ticket is closed. |
| `Success: The AzureADPasswordProtectionProxy service is not installed, so this device is not an Entra Password Protection Proxy server. There is nothing to monitor.` | The device isn't a proxy server. An open ticket from when it was one is closed. |

**Requirements:** PowerShell 5.1, and the AzureADPasswordProtection PowerShell module that's installed with the proxy. The server needs internet access to Azure for the connectivity check, and to the webhook for tickets.

## Dependencies

- [Group: Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c)
- [Task: Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd)
- [Custom Field: EPP_Monitoring](/docs/bec78a0c-3524-45c2-8229-46daadacb5e6)
- [Custom Field: EPP_Monitoring_Site](/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870)
- [Custom Field: EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13)
- [Custom Field: EPP_Ticket](/docs/e39d54a4-ed93-4782-9ab1-81399a71ba15)
- [Custom Field: EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9)
- [Custom Field: EPP_Ticket_Endpoint](/docs/d80dd799-f481-4ae4-9a8f-85ef90dbe7c0)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)
- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)

## Target

This monitor targets the `Entra Password Protection Proxy Health` device group, which holds the servers with the proxy installed where monitoring is turned on.

![Image1](../../../static/img/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2/image1.webp)

## Monitor Setup Path

- **Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`
- **Action:** `Create Monitor`

## Monitor Creation

### Description

- **Name:** `Entra Password Protection Proxy Health`
- **Description:**

```PlainText
Checks every hour that the Entra Password Protection Proxy service is running and passes its health diagnostics. Alerts on a failure and, when tickets are turned on in the EPP_Ticket custom fields, opens and closes a ticket through the CWRMM Ticket Management for Monitors workflow.
```

- **Type:** `Script`
- **Severity:** `Others`
- **Family:** `Security`

![Image2](../../../static/img/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2/image2.webp)

## Conditions

- **Run script on:** `Schedule`
- **Repeat every:** `1` `Hour(s)`
- **Script Language:** `PowerShell`
- **Use Generative AI Assist for script creation:** `False`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/monitors/entra-password-protection-proxy-health/script.ps1)

- **Criteria:** `Contains`
- **Operator:** `AND`
- **Script Output:** `Failure:`
- **Escalate ticket on script failure:** `Disabled`
- **Add Automation:** `None`

![Image3](../../../static/img/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2/image3.webp)

## Monitor Output

- **Output:** `Do not Generate Ticket`

Leave the output as `Do not Generate Ticket`. Tickets come from the workflow, so generating them here as well would create duplicates.

![Image4](../../../static/img/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2/image4.webp)

## Completed Monitor

![Image5](../../../static/img/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2/image5.webp)

## Ticketing

Tickets are created and closed through the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, only for servers where EPP_Ticket is `Enabled` and the real webhook URL is set in [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab).

**Subject:**

```PlainText
Entra Password Protection Proxy Health - <ComputerName>
```

**Body:**

The body lists every failed check under **Issues**, and what to do about each one under **What to do**. For example, for a server that can't reach Azure:

```PlainText
The Entra Password Protection Proxy health check failed.

Computer: PROXY01

Issues:
- VerifyAzureConnectivity: Failed. <Details from the health test>

What to do:
- Check that the server can reach Azure, including firewalls and any outbound HTTP proxy.

The ticket closes automatically once the service is running and every health diagnostic passes.
```

**Closing note:**

```PlainText
The Entra Password Protection Proxy service is running and every health diagnostic passed. The ticket is being closed automatically.

Computer: <ComputerName>
```

The ticket is also closed automatically, with a note saying why, when the proxy is uninstalled from the server or monitoring is set to `Disabled` in the configuration file.

**Issues and what to do:**

| Issue in the ticket | What to do, as the ticket gives it |
| --- | --- |
| `The AzureADPasswordProtectionProxy service is Stopped.` | Start the AzureADPasswordProtectionProxy service, and check the server's event logs if it stops again. |
| `VerifyTLSConfiguration: Failed.` | Turn on TLS 1.2 on the server, then restart the server. |
| `VerifyProxyRegistration: Failed.` | Register the proxy with Entra ID again, using Register-AzureADPasswordProtectionProxy. |
| `VerifyAzureConnectivity: Failed.` | Check that the server can reach Azure, including firewalls and any outbound HTTP proxy. |
| `The proxy health test could not run.` | Repair or reinstall the Entra Password Protection Proxy software, which provides the AzureADPasswordProtection module. |

**Example Ticket:**

![Image6](../../../static/img/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2/image6.webp)

## Implementation

1. Create and schedule the [Entra Password Protection Proxy Monitoring Configuration Writer](/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd) task first, so the configuration file is in place.
2. For tickets, install the ticket management content and set the webhook URL, as described in the [Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80) solution.
3. Install the monitor from the `ProVal - Content` Community, selecting the **Monitors** repository.
4. Make sure the monitor is enabled, then save.

## Changelog

### 2026-11-27

- Initial version of the document
