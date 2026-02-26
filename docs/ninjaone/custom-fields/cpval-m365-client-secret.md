---
id: '065a5f2f-9e2b-4717-b625-bd55bedf1986'
slug: /065a5f2f-9e2b-4717-b625-bd55bedf1986
title: 'cPVAL M365 Client Secret'
title_meta: 'cPVAL M365 Client Secret'
keywords: ['office365','license','count']
description: 'Enter the Office 365 Client Secret associated with the application. This credential is used together with the Client ID to authenticate securely when retrieving license data.'
tags:  ['office365','update','windows','software']
draft: false
unlisted: false
---

## Summary

Enter the Office 365 Client Secret associated with the application. This credential is used together with the Client ID to authenticate securely when retrieving license data.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL M365 Client Secret | cpvalM365ClientSecret | `Organization` | Secure | True | | Editable | Read_Write | Read_Write | Enter the Office 365 Client Secret associated with the application. This credential is used together with the Client ID to authenticate securely when retrieving license data. | Provide the Office 365 Client Secret used for secure authentication when accessing the tenant's license information. | The Client Secret enables secure authentication to Microsoft 365 services for license data collection and auditing. | Office 365 License Count Audit |

## Dependencies

- [Solution: Office 365 License Count Audit](/docs/4967b45b-e903-4176-ae5f-c4e095b5cdc5)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-m365-client-secret.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/065a5f2f-9e2b-4717-b625-bd55bedf1986/image1.webp)
