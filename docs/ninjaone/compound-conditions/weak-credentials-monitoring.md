---
id: '4e7c3666-86ba-458c-80e8-3c7ecb390518'
slug: /4e7c3666-86ba-458c-80e8-3c7ecb390518
title: 'Weak Credentials Monitoring'
title_meta: 'Weak Credentials Monitoring'
keywords: ['weak-password', 'duplicate-password', 'weak-credential', 'domain']
description: 'Runs the "Test Weak Password [Domain]" automation daily on Primary Domain Controllers and creates a CW Manage ticket when a new weak or duplicate password is detected.'
tags: ['auditing', 'alerting', 'domain', 'security']
draft: false
unlisted: false
---

## Summary

Runs the [Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016) automation daily on Primary Domain Controllers and creates a CW Manage ticket when a new weak or duplicate password is detected.

## Details

**Name:** `Weak Credentials Monitoring`  
**Description:** `Runs the "Test Weak Password [Domain]" automation daily on Primary Domain Controllers and creates a CW Manage ticket when a new weak or duplicate password is detected.`  
**Recommended Agent Policies:** `Windows Server Policy [Default]`  

## Dependencies

- [Custom Field: cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
- [Custom Field: cPVAL Weak Credentials Audit](/docs/35c7cb4a-f876-4186-8336-c95878622a04)
- [Custom Field: cPVAL Enable Weak Credentials Monitoring](/docs/60a8bed6-fe7e-49b9-b0b9-d4d4e79cf769)
- [Automation: Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016)
- [CW Manage Template: Weak AD Password](/docs/f53572a8-8bfe-4962-b28f-b3b6052e9ed2)
- [Solution: Weak Credentials Monitoring](/docs/7d087aad-e93d-45d6-bc30-b31f8e78d6e6)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/weak-credentials-monitoring.toml)
