---
id: '6247ac5b-7c02-4b01-ae73-32708eb3fded'
slug: /6247ac5b-7c02-4b01-ae73-32708eb3fded
title: 'cPVAL SMBv1 Status Audit'
title_meta: 'cPVAL SMBv1 Status Audit'
keywords: ['smbv1', 'remediation', 'detection', 'vulnerability']
description: 'This group identifies the SMB1 status of machines where a vulnerability action is selected using the `cPVAL SMB1 Vulnerability Action` custom field. The status is populated by the `SMBv1 Status Audit/Autofix` automation.'
tags: ['logging', 'report', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary
This group displays the SMB1 status of machines where a vulnerability action is selected using the [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1). The status is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0).

## Dependencies

- [Custom Field - cPVAL SMB1 Vulnerability Action](/docs/e2522a83-b703-4282-ae28-2a4643d6f1a1) 
- [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0) 
- [Solution - SMBv1 Status Audit/Autofix](/docs/d4508b91-c43e-41ca-bc94-28a4a22508d8) 

## Group Creation

[Group Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/groups/cpval-smbv1-status-audit.toml)

## Changelog

### 2026-10-07

- Initial version of the document