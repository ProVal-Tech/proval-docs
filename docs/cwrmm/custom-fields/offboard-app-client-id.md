---
id: '7857a579-d691-4a79-a959-211c45a09d8f'
slug: /7857a579-d691-4a79-a959-211c45a09d8f
title: 'Offboard_App_Client_ID'
title_meta: 'Offboard_App_Client_ID'
keywords: ['offboarding', 'intune', 'entra', 'client-id', 'app-registration', 'bot']
description: 'Application (client) ID of the app registration in the client tenant used by the Device Offboarding bot. Not needed for RMM Only.'
tags: ['azure', 'mdm', 'offboarding']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Summary

Holds the Application (client) ID of the app registration the [Device Offboarding [RMM, Intune and Entra]](/docs/39a88b59-e48a-4c72-bba3-fbe5ff1839ab) bot signs in with. The app registration is created in the client's own tenant, so each client has its own value.

Copy the value from the **Application (client) ID** on the app registration's **Overview** page. See the [app registration steps](/docs/39a88b59-e48a-4c72-bba3-fbe5ff1839ab#3-create-the-microsoft-entra-app-registration).

## Dependencies

- [Solution: Device Offboarding [RMM, Intune and Entra]](/docs/02e3ba26-1e13-4485-8194-69cb7434c412)
- [Bots: Device Offboarding [RMM, Intune and Entra]](/docs/39a88b59-e48a-4c72-bba3-fbe5ff1839ab)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| Offboard_App_Client_ID | Application (client) ID of the app registration in the client tenant used by the Device Offboarding bot. Not needed for RMM Only. | `Company` | `Text Box` | Enter the Application (client) ID from the Overview page of the app registration. |  | `Yes` |

:::note

This field is only needed for clients that use the `RMM and Intune` or `RMM Intune and Entra` options of [Offboard_Action](/docs/e18f1709-6273-4086-b9f0-43bbb62c8644). Leave it empty for clients that only use `RMM Only`.

:::

## Completed Custom Field

![Image1](../../../static/img/docs/7857a579-d691-4a79-a959-211c45a09d8f/image1.webp)

## Changelog

### 2026-10-27

- Initial version of the document
