---
id: '1e22ec15-e4e3-4696-a115-eeb1839adeb1'
slug: /1e22ec15-e4e3-4696-a115-eeb1839adeb1
title: 'Ensure Ninja Service is Running [Macintosh]'
title_meta: 'Ensure Ninja Service is Running [Macintosh]'
keywords: ['Ninja','Service','NinjaRMMAgent','condition','mac','macintosh']
description: 'Condition script for the NinjaRMM Agent Self-Heal solution on macOS. Validates the background monitoring setup and triggers remediation if missing.'
tags: ['application','diagnostic','macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Summary

This condition serves as the evaluation logic for the NinjaRMM Agent Self-Heal solution on macOS. It runs the [Check Ninja Service Monitoring [Macintosh]](/docs/57f4f1cc-c334-4434-a6d5-d2c2cae693c7) script to verify that the background watchdog (LaunchDaemon and monitoring script) is fully intact. If the check fails, the condition triggers the [Ensure Ninja Service is Running [Macintosh]](/docs/e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b) automation to restore the monitoring setup and restart any stopped services.

## Details

**Name:** `Ensure Ninja Service is Running [Macintosh]`  
**Description:** `Validates the presence and integrity of the self-heal monitoring configuration on macOS. If the monitoring script, its file hash, the LaunchDaemon plist, or the daemon load status is missing, the condition triggers remediation.`  
**Recommended Agent Policies:** `Mac Policy [Default]`  

## Dependencies

- [Solution: NinjaRMM Agent Self-Heal](/docs/e17b4631-7778-472f-8f5f-f8de33aa3529)
- [Automation: Check Ninja Service Monitoring [Macintosh]](/docs/57f4f1cc-c334-4434-a6d5-d2c2cae693c7)
- [Automation: Ensure Ninja Service is Running [Macintosh]](/docs/e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b)

## Condition Creation

[Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/conditions/ensure-ninja-service-is-running-macintosh.toml)

## Changelog

### 2026-07-07

- Initial version of the document.
