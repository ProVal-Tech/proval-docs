---
id: 'af137ce1-f349-4067-ae66-aebfaf5e08bd'
slug: /af137ce1-f349-4067-ae66-aebfaf5e08bd
title: 'Entra Password Protection Proxy Monitoring Configuration Writer'
title_meta: 'Entra Password Protection Proxy Monitoring Configuration Writer'
keywords: ['entra', 'password-protection', 'proxy', 'configuration-writer', 'monitoring']
description: 'Writes the Entra Password Protection Proxy monitoring settings from the EPP custom fields to a local configuration file that the monitor reads.'
tags: ['active-directory', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **Entra Password Protection Proxy Monitoring Configuration Writer** task prepares the settings for the [Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2) monitor. A CW RMM monitor can't read custom fields, so this task reads the EPP custom fields and the ticket webhook URL, and writes them to a configuration file on the server. The monitor reads that file at every check.

The task doesn't check the proxy or create tickets itself. It's scheduled to run once a day against the [Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c) group.

### How it works

1. **Check for the proxy.** When the `AzureADPasswordProtectionProxy` service isn't installed, the device isn't a proxy server, and the task stops without writing anything.
2. **Read the settings.** EPP_Monitoring and EPP_Ticket are each taken from the device, then the site, then the company. Each one comes out as `Enabled` or `Disabled`, and is `Disabled` when no level is set.
3. **Check the webhook URL.** The task reads [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) at the company level. An empty value or the shipped placeholder is written as empty, which keeps tickets off.
4. **Write the file.** The task overwrites `C:\ProgramData\_Automation\Script\EntraPasswordProtectionProxyMonitoring\EntraPasswordProtectionProxyMonitoring.json` on every run.

A configuration file looks like this:

```json
{
    "SchemaVersion": 1,
    "GeneratedAt": "2026-11-27T11:00:00.0000000-05:00",
    "ComputerName": "PROXY01",
    "Monitoring": "Enabled",
    "Ticket": "Enabled",
    "TicketWebhookUrl": "https://webhook.myconnectwise.net/..."
}
```

### Sample Scenario: Tickets for Every Proxy Server but One

A partner wants tickets for every proxy server of a company, except PROXY02, which is being replaced. They set:

- `EPP_Monitoring` = `Enabled` (Company level)
- `EPP_Ticket` = `Enabled` (Company level)
- `EPP_Ticket_Endpoint` = `Disabled` (Endpoint level, on PROXY02)

Every proxy server of the company gets `"Ticket": "Enabled"`. PROXY02 gets `"Ticket": "Disabled"`, because the endpoint level overrides the company level. PROXY02 is still monitored, and its failures still raise an alert in CW RMM.

**Requirements:** Windows PowerShell 5.1, on a server with the Entra Password Protection Proxy installed.

## Sample Run

![Image1](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image1.webp)

## Dependencies

- [Solution: Entra Password Protection Proxy Health](/docs/d588fdb2-344a-451e-8941-1d011fc21e80)
- [Group: Entra Password Protection Proxy Health](/docs/c114a048-e3f7-4fdf-8cb5-047311bdb66c)
- [Monitor: Entra Password Protection Proxy Health](/docs/de5d3a2a-085c-4150-8469-a9efdea0b3c2)
- [Custom Field: EPP_Monitoring](/docs/bec78a0c-3524-45c2-8229-46daadacb5e6)
- [Custom Field: EPP_Monitoring_Site](/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870)
- [Custom Field: EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13)
- [Custom Field: EPP_Ticket](/docs/e39d54a4-ed93-4782-9ab1-81399a71ba15)
- [Custom Field: EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9)
- [Custom Field: EPP_Ticket_Endpoint](/docs/d80dd799-f481-4ae4-9a8f-85ef90dbe7c0)
- [Custom Field: Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab)
- [Workflows: CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57)

## User Parameters

This task has no parameters.

## Custom Fields

The task reads these fields through its Set Pre-defined Variable rows. A blank site or endpoint field uses the level above.

| Name | Example | Level | Type | Default Value | Description |
| --- | --- | --- | --- | --- | --- |
| [EPP_Monitoring](/docs/bec78a0c-3524-45c2-8229-46daadacb5e6) | `Enabled` | `Company` | `Dropdown` | `Disabled` | Company-level Entra Password Protection Proxy health monitoring. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default. |
| [EPP_Monitoring_Site](/docs/f0aac000-1eb0-4f95-bf9a-d3d4b453e870) | `Enabled` | `Site` | `Dropdown` |  | Site-level override for Entra Password Protection Proxy health monitoring. Overrides Company settings, but overridden by Endpoint. |
| [EPP_Monitoring_Endpoint](/docs/4e7effaa-04ba-4d39-b386-db53b8a22d13) | `Enabled` | `Endpoint` | `Dropdown` |  | Endpoint-level override for Entra Password Protection Proxy health monitoring. Overrides Site and Company settings. |
| [EPP_Ticket](/docs/e39d54a4-ed93-4782-9ab1-81399a71ba15) | `Enabled` | `Company` | `Dropdown` | `Disabled` | Company-level ticketing for failed Entra Password Protection Proxy health checks. Enabled creates one ticket per device when a check fails and closes it when the proxy is healthy again. Overridden by Site or Endpoint settings. |
| [EPP_Ticket_Site](/docs/96899194-d7e8-4302-aa6a-110ecc1b8cb9) | `Enabled` | `Site` | `Dropdown` |  | Site-level override for ticketing on failed Entra Password Protection Proxy health checks. Overrides Company settings, but overridden by Endpoint. |
| [EPP_Ticket_Endpoint](/docs/d80dd799-f481-4ae4-9a8f-85ef90dbe7c0) | `Enabled` | `Endpoint` | `Dropdown` |  | Endpoint-level override for ticketing on failed Entra Password Protection Proxy health checks. Overrides Site and Company settings. |
| [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) | `https://webhook.<rmm-domain>/<instance-id>` | `Company` | `Text Box` | `https://webhook.myconnectwise.net/...` | Webhook URL of the [CWRMM Ticket Management for Monitors](/docs/57daa951-2acc-4be7-a025-0d0ca729ef57) workflow, entered as the field's default value. Needed only for tickets. |

:::note

The webhook URL is read at the company level only, as the field's default value. Leave the shipped placeholder in place and tickets stay off, even when EPP_Ticket is `Enabled`.

:::

## Results

| Script Log shows | What it means |
|---|---|
| `Success: Configuration writer completed. Monitoring is <Enabled or Disabled>, Ticket is <Enabled or Disabled>, webhook configured: <True or False>.` | The configuration file was written with these values. |
| `Skipped: The AzureADPasswordProtectionProxy service is not installed` | The device isn't a proxy server. Nothing was written. |
| `[WARNING] EPP_Ticket is Enabled, but Ticket_Mgmt_Webhook_Url does not hold a usable webhook URL.` | Tickets stay off until the real webhook URL is the field's default value. |
| `Failed to write the configuration file` | The file couldn't be written. The rest of the text says why. The task fails. |

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`
- **Task Type:** `Script Editor`

## Task Creation

### Description

- **Name:** `Entra Password Protection Proxy Monitoring Configuration Writer`
- **Description:**

```PlainText
Writes the Entra Password Protection Proxy monitoring settings from the EPP custom fields to the configuration file read by the Entra Password Protection Proxy Health monitor.

https://content.provaltech.com/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd
```

- **Category:** `Security`
- **Script Isolation Mode:** `Inactive`

![Image2](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image2.webp)

### Script Editor

Add the rows in this order. Rows 1 to 7 load the custom fields into the variables that the script reads.

#### Row 1 Function: Set Pre-defined Variable ( @endpointLevelMonitoring@ = EPP_Monitoring_Endpoint )

- **Notes:** `endpointLevelMonitoring`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelMonitoring`
- **Custom Field:** `EPP_Monitoring_Endpoint (ENUM - ENDPOINT)`

![Image3](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image3.webp)

#### Row 2 Function: Set Pre-defined Variable ( @endpointLevelTicket@ = EPP_Ticket_Endpoint )

- **Notes:** `endpointLevelTicket`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelTicket`
- **Custom Field:** `EPP_Ticket_Endpoint (ENUM - ENDPOINT)`

![Image4](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image4.webp)

#### Row 3 Function: Set Pre-defined Variable ( @locationLevelMonitoring@ = EPP_Monitoring_Site )

- **Notes:** `locationLevelMonitoring`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelMonitoring`
- **Custom Field:** `EPP_Monitoring_Site (ENUM - SITE)`

![Image5](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image5.webp)

#### Row 4 Function: Set Pre-defined Variable ( @locationLevelTicket@ = EPP_Ticket_Site )

- **Notes:** `locationLevelTicket`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelTicket`
- **Custom Field:** `EPP_Ticket_Site (ENUM - SITE)`

![Image6](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image6.webp)

#### Row 5 Function: Set Pre-defined Variable ( @clientLevelMonitoring@ = EPP_Monitoring )

- **Notes:** `clientLevelMonitoring`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelMonitoring`
- **Custom Field:** `EPP_Monitoring (ENUM - COMPANY)`

![Image7](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image7.webp)

#### Row 6 Function: Set Pre-defined Variable ( @clientLevelTicket@ = EPP_Ticket )

- **Notes:** `clientLevelTicket`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelTicket`
- **Custom Field:** `EPP_Ticket (ENUM - COMPANY)`

![Image8](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image8.webp)

#### Row 7 Function: Set Pre-defined Variable ( @clientLevelTicketMgmtWebhookUrl@ = Ticket_Mgmt_Webhook_Url )

- **Notes:** `clientLevelTicketMgmtWebhookUrl`
- **Continue on Failure:** `True`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelTicketMgmtWebhookUrl`
- **Custom Field:** `Ticket_Mgmt_Webhook_Url (STRING - COMPANY)`

![Image9](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image9.webp)

#### Row 8 Function: PowerShell script

- **Notes:** `<Leave it Blank>`
- **Use Generative AI Assist for script creation:** `False`
- **Expected time of script execution in seconds:** `1800`
- **Continue on Failure:** `False`
- **Run As:** `System`
- **Operating System:** `Windows`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/entra-password-protection-proxy-monitoring-configuration-writer/script.ps1)

For detailed instructions on creating the task, see [Workflow for Implementing Engineers](https://github.com/ProVal-Tech/cw-rmm#-workflow-for-implementing-engineers).

![Image10](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image10.webp)

#### Row 9 Function: Script Log

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Script Log Message:** `%Output%`

![Image11](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image11.webp)

:::note

Row 7 is set to **Continue on Failure** `True`, so the task still runs in an environment without the [Ticket_Mgmt_Webhook_Url](/docs/8e55deb6-bef8-4501-9e64-7b25e7fcd1ab) field. Tickets are off there.

:::

## Completed Task

![Image12](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image12.webp)

## Schedule Task

### Task Details

- **Name:** `Entra Password Protection Proxy Monitoring Configuration Writer`
- **Description:**

```PlainText
Writes the Entra Password Protection Proxy monitoring settings from the EPP custom fields to the configuration file read by the Entra Password Protection Proxy Health monitor.

https://content.provaltech.com/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd
```

- **Category:** `Security`

![Image13](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image13.webp)

### Schedule

- **Schedule Type:** `Schedule`
- **Timezone:** `Local Machine Time`
- **Start:** `<Current Date>`
- **Trigger:** `Time` `At` `<Current Time>`
- **Recurrence:** `Every day`
- **Execute at next agent check-in:** `True`
- **Stop After:** `15`
- **Unit:** `Day(s)`

![Image14](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image14.webp)

### Targeted Resource

- **Device Group:** `Entra Password Protection Proxy Health`

![Image15](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image15.webp)

### Completed Scheduled Task

![Image16](../../../static/img/docs/af137ce1-f349-4067-ae66-aebfaf5e08bd/image16.webp)

## Output

- Script Log
- `C:\ProgramData\_Automation\Script\EntraPasswordProtectionProxyMonitoring\EntraPasswordProtectionProxyMonitoring.json`

## Changelog

### 2026-11-27

- Initial version of the document
