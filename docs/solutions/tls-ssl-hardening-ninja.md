---
id: '5e391e0f-088e-41be-8b6c-306e02a2cadb'
slug: /5e391e0f-088e-41be-8b6c-306e02a2cadb
title: 'TLS/SSL Security Hardening'
title_meta: 'TLS/SSL Security Hardening'
keywords: ['tls','ssl','disable']
description: 'This solution validates and hardens the system`s SSL/TLS configuration by disabling insecure protocols and weak cipher suites while enabling secure protocols and supporting optional reboot management.'
tags: ['tls','windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-15
---

## Purpose

This solution validates and hardens the system's SSL/TLS configuration by disabling insecure protocols (SSL 3.0, TLS 1.0, and TLS 1.1) and ensuring that specified weak cipher suites are disabled for both server and client communications. It also verifies that TLS 1.2 and TLS 1.3 are enabled where supported. Additionally, the solution configures .NET Framework strong cryptography settings to help maintain application compatibility after legacy protocols are disabled. With an Optional settings to either enforce an immediate reboot upon completion of the hardening process or present users with reboot prompts to complete the changes. Solution verifies below Cipher suites :

- TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
- TLS_RSA_WITH_AES_256_CBC_SHA256
- TLS_RSA_WITH_AES_256_GCM_SHA384
- TLS_RSA_WITH_AES_128_CBC_SHA256
- TLS_RSA_WITH_AES_128_GCM_SHA256
- TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256

**Note** : [Solution - Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) should be imported to use prompt feature for reboot.

## Associated Content

| Content               | Type            | Function                                               |
|---------------------|--------------------------------|-------------------------------------|
| [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d)    | Custom Field | Custom Fields to enable TLS hardening for workstations and servers. `Validate` identifies devices that require TLS hardening without making changes. `Enforce` applies hardening to devices flagged by Validate. `Validate` must be enabled for Enforce to work properly.|
| [cPVAL TLS SSL Hardening Required](/docs/89a6d344-ae79-42fb-ae76-b855a3081201)    | Custom Field | This custom field is populated by [Script - Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d) and flags devices that require TLS/SSL hardening to meet security best practices. |
| [cPVAL Enable Reboot Prompts](/docs/6f8d4110-f4ee-4965-8853-8b4a7b03bda5)   | Custom Field | Enables reboot prompts following TLS Hardening. Requires the [Solution - Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)  to be enabled in the environment. |
| [Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d)   | Script | Validates that insecure protocols (SSL 3.0, TLS 1.0, TLS 1.1) and specified weak cipher suites are disabled at both the server and client levels on the system, while ensuring TLS 1.2 and TLS 1.3 are enabled when supported, providing a clear PASS/FAIL status without making any changes. |
| [Enforce TLS SSL Hardening](/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576)   | Script | Enforces Windows TLS/SSL security hardening by disabling legacy protocols (SSL 3.0, TLS 1.0, and TLS 1.1), enabling supported modern TLS versions (TLS 1.2 and TLS 1.3), configuring .NET Framework strong cryptography settings to help maintain application compatibility when legacy protocols are disabled, removing weak TLS cipher suites, and optionally initiating a reboot or enabling the [Solution - Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) to notify users that a restart is required for the changes to take effect. **Note** [Custom Field - cPVAL Enable Reboot Prompts](/docs/6f8d4110-f4ee-4965-8853-8b4a7b03bda5) needs to be selected and [Solution - Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) should be imported to use prompt feature for reboot. |
| [Execute - Validate TLS SSL Hardening - Workstations](/docs/28f17281-2502-43a0-8d4d-5da2b06580f8)   | Compound Condition | Triggers [Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d) script on windows workstations where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Validation (Both)`, `Validation (Workstations)`, `Enforce and Validation (Workstations)`,`Enforce and Validation (Both)`. |
| [Execute - Validate TLS SSL Hardening - Servers](/docs/79c1901b-3e55-42e3-8152-360605a4dbce)   | Compound Condition | Triggers [Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d)  on windows Servers where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Validation (Both)`, `Validation (Servers)`, `Enforce and Validation (Servers)`,`Enforce and Validation (Both)`. |
| [Execute - Enforce TLS SSL Hardening - Workstations](/docs/52a43eef-d4d7-4f91-b8c1-cb6e786ddcce)   | Compound Condition | Triggers [Enforce TLS SSL Hardening](/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576) script on windows workstations where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Enforce and Validation (Workstations)`,`Enforce and Validation (Both)`. |
| [Execute - Enforce TLS SSL Hardening - Servers](/docs/93609405-1ef4-4aaa-b421-4f86a7e51145)   | Compound Condition |Triggers [Enforce TLS SSL Hardening](/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576) script on windows servers where [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d) is either set to  `Enforce and Validation (servers)`,`Enforce and Validation (Both)`. |


## Implementation

- Create the following Custom Fields as per instructions provided in the documents
  - [cPVAL TLS Hardening](/docs/6959568a-a814-4c96-8b5a-d83e315c637d)
  - [cPVAL TLS SSL Hardening Required](/docs/89a6d344-ae79-42fb-ae76-b855a3081201)
  - [cPVAL Enable Reboot Prompts](/docs/6f8d4110-f4ee-4965-8853-8b4a7b03bda5)
- Create the following Scripts as per instructions provided in the documents
  - [Validate TLS SSL Hardening](/docs/f4505cf9-915f-464f-ab45-95f9eaea7a8d)
  - [Enforce TLS SSL Hardening](/docs/5a33db63-8a92-4ab3-9984-e0af4db8f576)
- Create the following Compound Conditions as per instructions provided in the documents
  - [Execute - Validate TLS SSL Hardening - Workstations](/docs/28f17281-2502-43a0-8d4d-5da2b06580f8)
  - [Execute - Validate TLS SSL Hardening - Servers](/docs/79c1901b-3e55-42e3-8152-360605a4dbce)
  - [Execute - Enforce TLS SSL Hardening - Workstations](/docs/52a43eef-d4d7-4f91-b8c1-cb6e786ddcce)
  - [Execute - Enforce TLS SSL Hardening - Servers](/docs/93609405-1ef4-4aaa-b421-4f86a7e51145)

## FAQ

**Q. Can the scripts be used independently?**
- Yes. Both scripts can be used independently, however, the associated custom fields must be imported into the environment for the scripts to function correctly.

**Q. Can `Enforce TLS SSL Hardening` run automatically to enforce Hardening**
- No, `Validate TLS SSL Hardening` scripts should be executed as it marks the machines that requires SSL Hardening.


## Changelog

###  2026-06-15

- Initial version of the document