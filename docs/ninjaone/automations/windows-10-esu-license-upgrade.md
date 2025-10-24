---
id: 'ba4df182-e419-4377-819f-ef55c34b0380'
slug: /ba4df182-e419-4377-819f-ef55c34b0380
title: 'Windows 10 ESU License Upgrade'
title_meta: 'Windows 10 ESU License Upgrade'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems through NinjaRMM. The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Overview

Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems through NinjaRMM. The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date.

**References:**

- [Enable Extended Security Updates](https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates)
- [Deploy Windows 10 Security Updates with Intune or SCCM](https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm/)

## Sample Run

![SampleRun](../../../static/img/docs/2731179e-384e-4fda-907a-365368ebf742/image4.webp)

## Dependencies

- [Custom Field - cpval ESU Key](/docs/6d3f6848-1c50-44e1-867a-1eb3ef94f419)  
- [Custom Field - cpval ESU Year](/docs/e54c319a-a8e9-4d58-9a67-6c310289320f)  
- [Solution - Ninja Win10 ESU Licensing and Auditing](/docs/f1ae37d6-7fa7-414c-8550-1ae9ea11b987)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| ESU Key | xxxxx-xxxxx-xxxxx-xxxxx-xxxxx | | False | | String/Text | Provide the ESU license key for activation of Windows 10 extended use. |
| ESU Year | 2 | 1, 2, or 3 | False | | Drop-Down | Select the license key year validation like 1, 2, or 3. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/windows-10-esu-license-upgrade.ps1)

## Output

- Activity Details
