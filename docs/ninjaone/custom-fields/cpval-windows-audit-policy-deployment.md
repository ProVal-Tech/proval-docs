---
id: '7160184e-bf13-4862-861a-3fa86b9ef847'
slug: /7160184e-bf13-4862-861a-3fa86b9ef847
title: 'cPVAL Windows Audit Policy Deployment'
title_meta: 'cPVAL Windows Audit Policy Deployment'
kkeywords: ['window', 'audit', 'policy', 'firewall']
description: 'Used within the compound condition to determine where the deployment should be performed.'
tags: ['audit', 'security', 'windows', 'firewall', 'eventlogs', 'active-directory', 'registry']
draft: false
unlisted: false
last_update:
  date: 2026-10-02
---

## Summary

Used within the compound condition to determine where the deployment should be performed.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Windows Audit Policy Deployment | cpvalWindowsAuditPolicyDeployment | -- | `Device`, `Organization`, `Location` | `Dropdown` | False |-- | `Disabled`, `Windows`, `Windows Servers`, `Windows Workstations` | True | Windows Audit Policy |

## Dependencies

- [Solution - Windows Audit Policy](/docs/b1682285-652d-4f50-b34b-c23e2c7382f6)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-audit-policy-deployment.toml)


## Sample Screenshot

![cPVAL Windows Audit Policy Deployment](../../../static/img/docs/7160184e-bf13-4862-861a-3fa86b9ef847/Custom%20Field.webp)

## Changelog

### 2025-12-16

- Initial version of the document
