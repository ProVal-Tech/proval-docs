---
id: '2d104874-ec69-4d95-b912-7fcd240bf592'
slug: /2d104874-ec69-4d95-b912-7fcd240bf592
title: 'BitLocker and TPM Audit'
title_meta: 'BitLocker and TPM Audit'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Audits BitLocker encryption status and TPM hardware details, populating detailed HTML reports into NinjaRMM custom fields.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-01-08
---

## Description

This script performs a comprehensive audit of the machine's security posture regarding disk encryption and hardware security. It executes two main functions:

1. **BitLocker Audit (`Get-BitLockerDetail`)**:
    - **Prerequisite Check**: Verifies the presence of the 'BitLocker' module and necessary OS features.
    - **Data Collection**: Scans all volumes using `Get-BitLockerVolume`. It handles complex configurations by flattening volumes with multiple key protectors into individual rows.
    - **Formatting**: Generates a stylized HTML table containing granular details such as Mount Point, Encryption Method, Protection Status, Key Protector IDs, Recovery Passwords, and timestamps.
    - **Storage**: Populates the [cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9) custom field and sets the [cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5) flag if the OS drive is protected.

2. **TPM Audit (`Get-TPMDetail`)**:
    - **Prerequisite Check**: Verifies the 'TrustedPlatformModule' module.
    - **Data Collection**: Retrieves hardware security details using `Get-Tpm`.
    - **Formatting**: Generates a stylized HTML table covering Manufacturer ID, AutoProvisioning status, Lockout counters, and TpmReady/Enabled states, including a 'DataCollectionTime' timestamp.
    - **Storage**: Populates the [cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba) custom field.

**Note:**

- This is only compatible for Windows devices.  
- The BitLocker Drive Encryption feature must be enabled on servers to perform auditing. This script will not work without enabling this feature.
- TPM audit will still be performed even if BitLocker audit fails.

## Requirements

- PowerShell v5

## Sample Run

![Image1](../../../static/img/docs/2d104874-ec69-4d95-b912-7fcd240bf592/image1.webp)

## Dependencies

- [Custom Field: cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5)
- [Custom Field: cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9)
- [Custom Field: cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba)
- [Custom Field: cPVAL Audit Encryption Percentage](/docs/1c59227a-466d-4f42-a06f-0c2c0950d07e)
- [Custom Field: cPVAL Audit Encryption Method](/docs/66adc025-26ec-43f9-ae1e-330c422c799c)
- [Custom Field: cPVAl Audit Mount Point](/docs/ced74400-a022-4fa2-9b72-4c10e92e36ab)
- [Custom Field: cPVAL Audit Lock Status](/docs/52ff36d4-e554-4741-aae1-4bd1a50165ee)
- [Custom Field: cPVAL Audit Protection Status](/docs/dbf6abbd-fff0-4e1f-a6a7-b87994df64ca)
- [Custom Field: cPVAL Audit Volume Status](/docs/916d0353-8a35-4690-8d40-04b2a95112e1)
- [Custom Field: cPVAL Audit TPM Activated](/docs/d7079417-ab2f-460a-ab63-6ec1f7b986ca)
- [Custom Field: cPVAL Audit TPM Enabled](/docs/20f300a5-65f7-443b-aeeb-16ee9e7dc923)
- [Custom Field: cPVAL Audit TPM Present](/docs/5014cdab-65a5-45d9-9587-70d354cbe89b)
- [Custom Field: cPVAL Audit TPM Ready](/docs/878b60d8-f498-4479-85db-43252189026e)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Fields

| Field Label                       | Scope            | Type      | Description |
|-----------------------------------|------------------------------------|--------------------|-------------|
| [cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9)             | Device                 | WYSIWYG (HTML Table)             | Stores the HTML-formatted inventory of BitLocker volumes and protectors. |
| [cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5)  | Device | Checkbox             | Flag indicating if the Operating System drive is encrypted. |
| [cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba)                | Device                       | WYSIWYG (HTML Table)              | Stores the HTML-formatted detailed status of the Trusted Platform Module (TPM). |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/bitlocker-and-tpm-audit.ps1)

## Output

- Activity Logs
- Custom Fields
  - `cPVAL BitLocker SysDrive Enabled`  
    ![Image4](../../../static/img/docs/2d104874-ec69-4d95-b912-7fcd240bf592/image4.webp)
  - `cPVAL BitLocker Info`  
    ![Image2](../../../static/img/docs/2d104874-ec69-4d95-b912-7fcd240bf592/image3.webp)
  - `cPVAL TPM Info`  
    ![Image3](../../../static/img/docs/2d104874-ec69-4d95-b912-7fcd240bf592/image2.webp)

## Changelog


### 2026-04-14

- Updated the solution to individually update the below custom field.
- As the script previously update the custom field in HTML format.
- We need to create group on which the HTML format data is not shows there. 
- That is reason we have update the individual custom field.

  - cPVAL Audit Encryption Percentage
  - cPVAL Audit Encryption Method
  - cPVAl Audit Mount Point	
  - cPVAL Audit Lock Status
  - cPVAL Audit Protection Status
  - cPVAL Audit Volume Status
  - cPVAL Audit TPM Activated
  - cPVAL Audit TPM Enabled
  - cPVAL Audit TPM Present
  - cPVAL Audit TPM Ready

### 2026-01-08

- Initial version of the document
