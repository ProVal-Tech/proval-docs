---
id: 'a947cc93-68a2-4ddc-a6dc-ae2cf4422c66'
slug: /a947cc93-68a2-4ddc-a6dc-ae2cf4422c66
title: 'SentinelOne Management Console Validation'
title_meta: 'SentinelOne Management Console Validation'
keywords: ['sentinelone', 's1', 'management-console', 'management-server-url']
description: 'This ticket template configures how a ConnectWise Manage ticket will be generated in response to the SentinelOne Management Console Validation condition.'
tags: ['antivirus', 'auditing', 'ticketing']
draft: false
unlisted: false
---

## Summary

The condition runs the [SentinelOne Management Console Validation](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e) automation once per day and generates a ticket with the script’s results if the SentinelOne Management Server detected on the computer is different from what is set for the Client in NinjaRMM.

## Details

- **Name:**  `SentinelOne Management Console Validation`  
- **Description:**  `The condition runs the SentinelOne Management Console Validation automation once per day and generates a ticket with the script’s results if the SentinelOne Management Server detected on the computer is different from what is set for the Client in NinjaRMM.`  
- **Recommended Agent Policies:**  `Windows Workstation`, `Windows Server`

## Dependencies
- [Solution - SentinelOne Management Server Url Validation](/docs/5c97a683-f12f-4fb0-bc18-1720a561da93)
- [Automation - SentinelOne Management Console Validation](/docs/4d9087cb-0cf3-4ade-863f-3a14c9b73d5e) 

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/sentinelone-management-console-validation.toml)
