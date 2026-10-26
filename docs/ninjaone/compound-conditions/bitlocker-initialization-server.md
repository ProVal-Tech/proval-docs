---
id: 'a4d9dc9c-3e10-4cf4-a296-709ad9f507dd'
slug: /a4d9dc9c-3e10-4cf4-a296-709ad9f507dd
title: 'Enable BitLocker - Server'
title_meta: 'Enable BitLocker - Server'
keywords: ['bitlocker','initialization','encryption','server']
description: 'Runs Initialize and Audit BitLocker on Windows servers that need a BitLocker fix, when cPVAL BitLocker Enable is set to Windows or Windows Servers.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-10-26
---

## Summary

Runs [Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198) on Windows servers when [BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320) finds that the server's BitLocker state does not match the cPVAL custom fields. It applies to servers where [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b) is `Windows` or `Windows Servers`, and checks them every 24 hours.

:::note  
The BitLocker Drive Encryption feature must be installed on the server. Without it, the detection script reports the server as unsupported and the automation does not run.  
:::

## Details

- **Name:** `Enable BitLocker - Server`
- **Description:** `Runs Initialize and Audit BitLocker on Windows servers where cPVAL BitLocker Enable is Windows or Windows Servers and the detection script finds a needed fix.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Custom Field - cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Automation - BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)
- [Automation - Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-initialization-servers.toml)

## Changelog

### 2026-10-26

- Rewrote the summary to describe the options that apply and the 24-hour check.
- The compound condition now runs Initialize and Audit BitLocker when the detection script output contains `Detected:`.
- Added the note about the BitLocker Drive Encryption feature.

### 2025-12-30

- Initial version of the document
