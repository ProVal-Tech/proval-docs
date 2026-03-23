---
id: '65db6f18-c505-4ced-ad51-2964ea516f6b'
slug: /65db6f18-c505-4ced-ad51-2964ea516f6b
title: 'Connect Secure Deployment [Windows Workstation]'
title_meta: 'Connect Secure Deployment [Windows Workstation]'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'Initiates the Deploy ConnectSecure Agent [Windows] automation on Windows workstations where deployment is enabled but the agent is not yet installed.'
tags: ['vulnerability', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-03-16
---

## Summary

Initiates the [Deploy ConnectSecure Agent [Windows]](/docs/d22e3b29-76a2-4385-a013-d592f6c5ae6d) automation on Windows workstations where deployment is enabled but the agent is not yet installed.

## Details

- **Name:** `ConnectSecure Vulnerability Scan Agent Deployment`
- **Description:** `Initiates the Deploy ConnectSecure Agent [Windows] automation on Windows workstations where deployment is enabled but the agent is not yet installed.`
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Custom Field - cPVAL Connect Secure Agent Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)
- [Automation - Deploy ConnectSecure Agent [Windows]](/docs/d22e3b29-76a2-4385-a013-d592f6c5ae6d)
- [Solution - ConnectSecure Agent Deployment](/docs/0e33b1a2-5539-4451-b49d-2ba9b7f904dd)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/connect-secure-deployment-windows-workstation.toml)

## Changelog

### 2026-03-16

- Revised the detection logic to use a service-based validation method.
- Updated the condition to reference the new custom field and its associated automation.

### 2025-12-10

- Initial version of the document
