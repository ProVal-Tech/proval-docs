---
id: 'b037020a-1af5-4ecb-bb6b-62d59c123937'
slug: /b037020a-1af5-4ecb-bb6b-62d59c123937
title: 'Secure Boot Compliance - Audit'
title_meta: 'Secure Boot Compliance - Audit'
keywords: ['secure','secure-boot','audit']
description: 'This solution checks the Secure Boot status and validates the associated certificates. If the system is using older Secure Boot certificates, the custom fields are updated accordingly. If the system is using updated certificates. The custom fields are updated to reflect the compliant status.'
tags: ['security','custom-fields','Secureboot','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Purpose

This solution checks the Secure Boot status and validates the associated certificates. If the system is using older Secure Boot certificates, the custom fields are updated accordingly. If the system is using updated certificates, the custom fields are updated to reflect the compliant status.

## Associated Content

### `Custom Field`

| Content | Type | Function |
| ----------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| [Custom Field - cPVAL Secure Boot Status](/docs/1d87004f-2ab3-4dd3-9f62-472172678982) | `Custom Field` | This custom field shows whether Secure Boot is enabled on the device. |
| [Custom Field - cPVAL Windows Telemetry Status](/docs/e000a063-1286-41e1-a6f5-54afab3939a0) | `Custom Field` | This custom field indicates the current telemetry (diagnostic data) level on Windows. |
| [Custom Field - cPVAL Windows KEK Certificate](/docs/d131c730-502b-4f00-8461-ecef6766c161) | `Custom Field` | This custom field displays the status of the Windows Key Exchange Key (KEK) certificate. |
| [Custom Field - cPVAL Windows DB Certificate](/docs/1eaeb929-0df9-4482-be5c-f78c6f993487) | `Custom Field` | This custom field shows the status of the Windows Secure Boot Database (DB) certificate. |

### `Automation`

| Content | Type | Function |
| ----------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| [Automation - SecureBoot Compliance - Audit](/docs/33446436-a337-411d-99ae-299046ba30d9) | `Automation` | This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. |

### `Group`

| Content | Type | Function |
| ----------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| [Group- cPVAL SecureBoot Disabled](/docs/f60be794-9c67-48fe-9e2d-694c6ed58246) | `Group` | Devices with Secure Boot disabled for compliance and security monitoring. |

### `Task`

| Content | Type | Function |
| ----------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| [Task- cPVAL SecureBoot Status](/docs/aedc9657-d670-4057-b7dd-c75e214a7ad8) | `Task` | This task checks and records the SecureBoot status on devices, including SecureBoot certificates. |

## Implementation

### Step 1: Create the following Custom Field

[Custom Field - cPVAL Secure Boot Status](/docs/1d87004f-2ab3-4dd3-9f62-472172678982)
[Custom Field - cPVAL Windows Telemetry Status](/docs/e000a063-1286-41e1-a6f5-54afab3939a0)
[Custom Field - cPVAL Windows KEK Certificate](/docs/d131c730-502b-4f00-8461-ecef6766c161)
[Custom Field - cPVAL Windows DB Certificate](/docs/1eaeb929-0df9-4482-be5c-f78c6f993487)

### Step 2: Import Automation Scripts

Import the following automation script:

[Automation - SecureBoot Compliance - Audit](/docs/33446436-a337-411d-99ae-299046ba30d9)


### Step 3: Configure the following Compound Conditions

Create the following group

[Group- cPVAL SecureBoot Disabled](/docs/f60be794-9c67-48fe-9e2d-694c6ed58246)

Create the following Task:

[Task- cPVAL SecureBoot Status](/docs/aedc9657-d670-4057-b7dd-c75e214a7ad8)

## FAQ

#### 1. What is the purpose of the Secure Boot Compliance – Audit solution?

`Answer:` The solution audits the Secure Boot configuration on Windows devices and validates related Secure Boot certificates. It updates custom fields to reflect whether the device is compliant or using outdated certificates.

#### 2. What information does this solution collect from devices?

`Answer:` The solution collects and records the following information:

- Secure Boot status (enabled or disabled)
- Windows telemetry status
- Windows Secure Boot DB certificate status
- Windows KEK certificate status

This information is stored in custom fields for reporting and compliance monitoring.

#### 3. Why are custom fields used in this solution?

`Answer:` Custom fields allow Secure Boot audit results to be stored directly on each device record. This makes it easier to:

- Filter devices
- Create device groups
- Generate reports
- Monitor compliance across the environment.

#### 4. Which custom fields are created for this solution?

`Answer:` The solution uses the following custom fields:

- `cPVAL Secure Boot Status`
- `cPVAL Windows Telemetry Status`
- `cPVAL Windows KEK Certificate`
- `cPVAL Windows DB Certificate`

Each field records a specific part of the Secure Boot compliance audit.

#### 5. What is the role of the automation script in this solution?

`Answer:` The automation script evaluates the device's Secure Boot configuration and verifies whether the system is prepared for the Microsoft Secure Boot certificate transition scheduled for 2026.

It then updates the related custom fields with the results.

#### 6. What happens if Secure Boot is disabled on a device?

`Answer:` If Secure Boot is disabled, the device will be identified through the custom field cPVAL Secure Boot Status and may appear in the cPVAL SecureBoot Disabled device group for further review or remediation.

#### 7. What is the purpose of the device group "cPVAL SecureBoot Disabled"?

`Answer:` This device group is used to identify and monitor systems where Secure Boot is disabled. It helps administrators quickly locate devices that may not meet security or compliance requirements.

#### 8. What does the task "cPVAL SecureBoot Status" do?

`Answer:` This task runs the Secure Boot audit on devices. It checks the Secure Boot configuration and certificate status, then updates the associated custom fields with the results.

#### 9. Why is Secure Boot certificate validation important?

`Answer:` Secure Boot certificates ensure that only trusted software can run during the system boot process. Validating these certificates helps maintain system integrity and ensures compatibility with upcoming security updates from Microsoft.

#### 10. When should this solution be deployed?

`Answer:` This solution should be deployed across all Windows devices to ensure they are prepared for the 2026 Microsoft Secure Boot certificate transition and to maintain consistent security compliance across the environment.

#### 11. What is the benefit of separating audit results into multiple custom fields?

`Answer:` Using separate fields improves visibility and reporting. Administrators can easily filter devices based on specific conditions such as:

Secure Boot disabled
Outdated certificates
Telemetry configuration

This allows more accurate device grouping and compliance monitoring.

## Changelog

 Initial Document
