---
id: '64936e58-3cd2-4430-b40f-d9a2419786e2'
slug: /64936e58-3cd2-4430-b40f-d9a2419786e2
title: 'ISP Connection Monitor'
title_meta: 'ISP Connection Monitor'
keywords: ['isp', 'internet', 'connection', 'failover', 'wan', 'public ip', 'monitoring']
description: 'Checks that each ISP line at a site is up by confirming that public IP lookup sites return the expected IP, and saves the result to a custom field.'
tags: ['monitoring', 'networking', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-06
---

## Overview

This automation checks that each internet (ISP) line at a site is up. The site's firewall routes each public IP lookup site out a specific ISP line. The automation requests each lookup site from the device and confirms that the response contains that line's public IP. If a line doesn't answer, or answers with another line's IP, the line is down or has failed over. The automation reads its checks from [cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610) and saves the check time and the result of each check to [cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e).

:::note  
The automation shows as failed when an ISP line check fails, which is what lets the [ISP Connection Monitoring](/docs/9f23f871-6125-47ab-8a46-429893104702) compound condition open a ticket. It also shows as failed when the device has no checks.  
:::

## Requirements

- A Windows computer at the site that stays online, preferably a server
- Run As: `System`
- PowerShell 5.1
- Internet access to the public IP lookup sites in the device's checks
- A site firewall that routes each lookup site out a specific ISP line

## Sample Run

:::note  
We don't recommend running this automation manually. For the best results, let the [ISP Connection Monitoring](/docs/9f23f871-6125-47ab-8a46-429893104702) compound condition run it. The exception is testing a new check with the **Checks** script variable before you add it to cPVAL ISP Connection Checks.  
:::

## Script Variables

| Name | Example | Required | Type | Description |
| ---- | ------- | -------- | ---- | ----------- |
| Checks | `Test ISP Connection Monitor\|https://icanhazip.com/\|203.0.113.10` | False | String/Text | Checks to run instead of cPVAL ISP Connection Checks, separated by semicolons. Use it to test a new check. Leave it blank in the compound condition. |

## Scenarios

- **Every line is up:** each lookup site returns its line's public IP. The automation saves a `PASS` line for each check to cPVAL ISP Connection Status and shows as successful.
- **A line is down:** the lookup site routed out that line doesn't answer within 10 seconds. The automation saves a `FAIL` line with the error, for example a timeout, and shows as failed.
- **A line has failed over:** the firewall sends the lookup site's traffic out another line, so the site returns the other line's IP. The automation saves a `FAIL` line with the IP that came back and shows as failed.
- **A check is not in the right format:** the entry is saved as a `FAIL` line that names it, so the mistake raises a ticket instead of being skipped. The other checks still run.
- **Testing a new check:** with the **Checks** script variable set, the automation runs only those checks and ignores cPVAL ISP Connection Checks. The result still replaces cPVAL ISP Connection Status.
- **No checks:** with both the **Checks** script variable and cPVAL ISP Connection Checks blank, the automation makes no changes and shows as failed.

## Custom Fields

| Custom Field | Scope | Type | Description |
| ------------ | ----- | ---- | ----------- |
| [cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610) | Device | Multi-line | The ISP line checks to run, one per line. Required. |
| [cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e) | Device | Multi-line | Receives the check time and a `PASS` or `FAIL` line for each check. |

## Dependencies

* [Custom Field: cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610)
* [Custom Field: cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e)
* [Compound Condition: ISP Connection Monitoring](/docs/9f23f871-6125-47ab-8a46-429893104702)
* [Solution: ISP Connection Monitoring](/docs/fad08ef4-122c-4df2-8cb3-aad1b285a473)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/isp-connection-monitor.ps1)

## Output

- Activity Details
- Custom Field: [cPVAL ISP Connection Status](/docs/2da0d0c6-7dd0-4fbc-a846-bfec4b22219e)

## Changelog

### 2026-11-06

- Initial version of the document
