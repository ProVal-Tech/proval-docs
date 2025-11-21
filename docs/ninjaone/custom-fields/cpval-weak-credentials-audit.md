---
id: '35c7cb4a-f876-4186-8336-c95878622a04'
slug: /35c7cb4a-f876-4186-8336-c95878622a04
title: 'cPVAL Weak Credentials Audit'
title_meta: 'cPVAL Weak Credentials Audit'
keywords: ['weak-password', 'duplicate-password', 'weak-credential', 'domain']
description: 'Stores details of weak and duplicate password credentials identified by the "Test Weak Password [Domain]" automation. This field helps track accounts that require password updates to maintain security compliance.'
tags: ['auditing', 'alerting', 'domain', 'security']
draft: false
unlisted: false
---

## Summary

Stores details of weak and duplicate password credentials identified by the [Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016) automation. This field helps track accounts that require password updates to maintain security compliance.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Weak Credentials Audit | cpvalWeakCredentialsAudit | Device | WYSIWYG | False | | Editable | Read_Write | Read_Write | Stores details of weak and duplicate password credentials identified by the 'Test Weak Password [Domain]' automation. This field helps track accounts that require password updates to maintain security compliance. | Contains information about accounts flagged for weak or duplicate passwords during the 'Test Weak Password [Domain]' automation run." | This data is automatically populated by the 'Test Weak Password [Domain]' automation and should be reviewed regularly to ensure password policies are enforced. | Test Weak Password Device |

## Dependencies

- [Automation: Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016)
- [Solution: Weak Credentials Monitoring](/docs/7d087aad-e93d-45d6-bc30-b31f8e78d6e6)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-weak-credentials-audit.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/35c7cb4a-f876-4186-8336-c95878622a04/image1.webp)
