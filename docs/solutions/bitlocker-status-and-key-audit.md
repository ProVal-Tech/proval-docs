---
id: 'b2a974b2-c231-4197-a639-d0775d77d7c7'
slug: /b2a974b2-c231-4197-a639-d0775d77d7c7
title: 'BitLocker Status and Key Audit'
title_meta: 'BitLocker Status and Key Audit'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'The solution outlines the process of auditing BitLocker encryption status and recovery keys using CW RMM with daily scheduled tasks.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
---

## Purpose

This solution provides a comprehensive approach to auditing BitLocker encryption status and recovery keys across Windows devices using ConnectWise RMM. Instead of using monitors, it utilizes a daily scheduled task to collect and report BitLocker encryption details, ensuring centralized visibility of encryption status and recovery keys for all protected drives.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [Enable BitLocker Status Audit](/docs/c917557c-89d3-4487-a5f1-56ffd0fdac9c) | Windows Workstation and Server | Dropdown | COMPANY | Yes | Select OS to enable BitLocker status auditing. |
| [Disable BitLocker Status Audit (Site)](/docs/fb66191c-89d5-4712-a4a3-e1c90f943b7b) |  | Flag | SITE | No | Prevents BitLocker status auditing at specific sites. |
| [Disable BitLocker Status Audit (Endpoint)](/docs/bf4fbfbb-28ae-4357-a81c-f407fa847128) |  | Flag | ENDPOINT | No | Prevents BitLocker status auditing on specific endpoints. |
| [BitLocker Status and Key](/docs/a7785954-5a6d-4003-9d0e-c919e1a96b0c) |  | Text Box | ENDPOINT | Yes | Stores BitLocker encryption details and recovery keys. |

### Groups

| Name | Purpose |
|------|---------|
| [BitLocker Status Audit Enabled](/docs/8d034710-66c7-4f8e-8feb-740c9fa109f2) | Dynamic group targeting devices where BitLocker status auditing is enabled. |
| [BitLocker Disabled](/docs/848f6711-4aef-47a7-b221-1c44af841843) | Group of machines where BitLocker is not enabled. |
| [BitLocker Suspended](/docs/bafbe683-1e3f-42e1-a500-03910a9fab30) | Group of machines where BitLocker protection is suspended. |
| [BitLocker Enabled](/docs/20a70875-6ff8-45f0-a1c2-abdfe5fc0daa) | Group of machines where BitLocker protection is enabled. |

### Task

| Name | Purpose |
|------|---------|
| [BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) | PowerShell script that collects BitLocker encryption details and recovery keys. |

## Implementation

### Step 1: Create the Required Custom Fields

Create all the custom fields listed above under `SETTINGS → Custom Fields` in CW RMM. See individual documentation pages for configuration details.

- [Enable BitLocker Status Audit](/docs/c917557c-89d3-4487-a5f1-56ffd0fdac9c)
- [Disable BitLocker Status Audit (Site)](/docs/fb66191c-89d5-4712-a4a3-e1c90f943b7b)
- [Disable BitLocker Status Audit (Endpoint)](/docs/bf4fbfbb-28ae-4357-a81c-f407fa847128)
- [BitLocker Status and Key](/docs/a7785954-5a6d-4003-9d0e-c919e1a96b0c)

### Step 2: Create the Dynamic Groups

Create the groups listed above under `ENDPOINTS → Groups` as dynamic groups:

- [BitLocker Status Audit Enabled](/docs/8d034710-66c7-4f8e-8feb-740c9fa109f2)
- [BitLocker Disabled](/docs/848f6711-4aef-47a7-b221-1c44af841843)
- [BitLocker Suspended](/docs/bafbe683-1e3f-42e1-a500-03910a9fab30)
- [BitLocker Enabled](/docs/20a70875-6ff8-45f0-a1c2-abdfe5fc0daa)

### Step 3: Create the Audit Task

Create the audit script task [BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) under `AUTOMATION → Tasks`. Set up the script as detailed in the referenced documentation.

### Step 4: Schedule the Audit Task

Schedule the [BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) task to run daily against the [BitLocker Status Audit Enabled](/docs/8d034710-66c7-4f8e-8feb-740c9fa109f2) group.

## FAQ

**Q: What happens if a device is excluded at the site or endpoint level?**  
A: Devices or sites flagged for exclusion will not be included in the BitLocker status audit. However, the [BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) task can be executed manually.

**Q: How often does the solution audit BitLocker status?**  
A: The task is scheduled to run daily, but this can be adjusted in the scheduled task configuration based on your organizational needs.

**Q: Can I trigger the audit manually?**  
A: Yes, the [BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) task can be run on demand independent of the schedule.

**Q: What information is collected by the audit?**  
A: The script collects drive letters, key protector types, protection status, encryption percentage, and recovery passwords (when available).

**Q: What OSes are supported for auditing?**  
A: Supported OS selection is controlled by the [Enable BitLocker Status Audit](/docs/c917557c-89d3-4487-a5f1-56ffd0fdac9c) custom field (Windows Workstation, Windows Server, Both, or Disabled).

**Q: Is the BitLocker Drive Encryption feature required?**  
A: Yes, the `BitLocker Drive Encryption` feature must be enabled on servers for the audit to work properly. Auditing will not work without enabling this feature on Windows servers.

**Q: How are the results formatted and stored?**  
A: Results are formatted as a structured string and stored in the endpoint-level "BitLocker Status and Key" custom field, following this format: `| DriveLetter: KeyProtectorTypes; ProtectionStatus; EncryptionPercentage; RecoveryPassword |`
