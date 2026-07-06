---
id: '2c947f35-a856-4f70-a3f2-14c95d050943'
slug: /2c947f35-a856-4f70-a3f2-14c95d050943
title: 'Ensure Ninja Service is Running [Windows Server]'
title_meta: 'Ensure Ninja Service is Running [Windows Server]'
keywords: ['Ninja','Service','NinjaRMMAgent','condition','server']
description: 'Condition script for the NinjaRMM Agent Self-Heal solution on Windows Servers. Validates the background monitoring setup and triggers remediation if missing.'
tags: ['application','diagnostic','windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Summary

This condition serves as the evaluation logic for the NinjaRMM Agent Self-Heal solution on Windows Servers. It runs the [Check Ninja Service Monitoring [Windows]](/docs/3ead3d67-5310-4f2c-8774-501905b8db28) script to verify that the background watchdog (scheduled task and monitoring script) is fully intact. If the check fails, the condition triggers the [Ensure Ninja Service is Running [Windows]](/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d) automation to restore the monitoring setup and restart any stopped services.

## Details

**Name:** `Ensure Ninja Service is Running [Windows Server]`  
**Description:** `Validates the presence and integrity of the self-heal monitoring configuration on Windows Servers. If the monitoring script, its file hash, or the scheduled task is missing, the condition triggers remediation.`  
**Recommended Agent Policies:** `Windows Server Policy [Default]`  

## Dependencies

- [Solution: NinjaRMM Agent Self-Heal](/docs/e17b4631-7778-472f-8f5f-f8de33aa3529)
- [Automation: Check Ninja Service Monitoring [Windows]](/docs/3ead3d67-5310-4f2c-8774-501905b8db28)
- [Automation: Ensure Ninja Service is Running [Windows]](/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d)

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/ensure-ninja-service-is-running-windows-server.toml)

## Changelog

### 2026-07-07

- Initial version of the document.
