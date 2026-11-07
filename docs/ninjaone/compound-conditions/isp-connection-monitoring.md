---
id: '9f23f871-6125-47ab-8a46-429893104702'
slug: /9f23f871-6125-47ab-8a46-429893104702
title: 'ISP Connection Monitoring'
title_meta: 'ISP Connection Monitoring'
keywords: ['isp', 'internet', 'connection', 'failover', 'compound condition', 'monitoring']
description: 'Runs the ISP Connection Monitor automation every 6 minutes and opens a ConnectWise Manage ticket when an ISP line is down or has failed over.'
tags: ['monitoring', 'networking', 'ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-06
---

## Summary

This compound condition runs the [ISP Connection Monitor](/docs/64936e58-3cd2-4430-b40f-d9a2419786e2) automation every 6 minutes on devices that have a check in [cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610). When an ISP line check fails, it opens a ConnectWise Manage ticket through the [ISP Connection Monitoring](/docs/03a8e269-aad5-486d-befd-0617c2b3a6c1) ticket template. The automation's output is included in the ticket, so the ticket shows which line failed and why. Once every line passes again, the condition resets and the ticket closes.

:::note  
The compound condition is set up on the **Windows Server Policy [Default]**, because a server usually stays online at the site. That doesn't limit the solution to servers. If a site has no server, a workstation that stays online can run the checks. Create the very same compound condition, with the same settings, in the **Windows Workstation Policy**, in the policy applied to that workstation, or as a policy override on that device only.  
:::

## Details

- **Name:** `ISP Connection Monitoring`
- **Description:** `Runs the ISP Connection Monitor automation on devices with checks in cPVAL ISP Connection Checks and opens a ticket when an ISP line is down or has failed over.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Custom Field: cPVAL ISP Connection Checks](/docs/48803081-ae39-4113-bb40-41c1c5dba610)
- [Automation: ISP Connection Monitor](/docs/64936e58-3cd2-4430-b40f-d9a2419786e2)
- [Ticket Template: ISP Connection Monitoring](/docs/03a8e269-aad5-486d-befd-0617c2b3a6c1)
- [Solution: ISP Connection Monitoring](/docs/fad08ef4-122c-4df2-8cb3-aad1b285a473)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/isp-connection-monitoring.toml)

## Changelog

### 2026-11-06

- Initial version of the document
