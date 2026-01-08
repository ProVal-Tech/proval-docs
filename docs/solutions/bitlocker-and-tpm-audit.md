---
id: '57c787ad-8d22-4ae4-b5e5-dac34fc600fc'
slug: /57c787ad-8d22-4ae4-b5e5-dac34fc600fc
title: 'BitLocker and TPM Audit'
title_meta: 'BitLocker and TPM Audit'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'This solution provides a comprehensive auditing framework for BitLocker encryption and Trusted Platform Module (TPM) security status on Windows endpoints within NinjaOne. It eliminates the need for manual checks by automatically collecting granular encryption data and hardware security details, formatting them into easy-to-read HTML reports stored directly in NinjaRMM Custom Fields.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Purpose

This solution provides a comprehensive auditing framework for BitLocker encryption and Trusted Platform Module (TPM) security status on Windows endpoints within NinjaOne. It eliminates the need for manual checks by automatically collecting granular encryption data and hardware security details, formatting them into easy-to-read HTML reports stored directly in NinjaRMM Custom Fields.

The solution operates on a "Gatekeeper" model: administrators opt-in specific devices or locations using a control flag. Once enabled, the system continuously audits the device to maintain an up-to-date inventory of its security posture.

Key capabilities include:

* **Detailed Reporting**: Generates stylized HTML tables containing granular details such as Mount Point, Encryption Method, Protection Status, Key Protector IDs, Recovery Passwords, and timestamps.
* **Hardware Security Audit**: Retrieves and reports critical TPM details, including Manufacturer ID, AutoProvisioning status, Lockout counters, and TpmReady/Enabled states.
* **Compliance Tracking**: Automatically flags whether the Operating System drive is actively encrypted via a dedicated boolean Custom Field, simplifying compliance reporting.
* **Separation of Duties**: Distinct policies for Workstations and Servers allow for tailored management strategies across different device types.
* **Complex Configuration Handling**: Capable of flattening volumes with multiple key protectors into individual rows for clear visibility.

The solution uses the **[BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)** automation to collect system data, which is triggered by Compound Conditions based on the policy defined in the **[cPVAL Enable BitLocker Audit](/docs/61e7d229-4f47-431d-b948-23523a04cb7d)** Custom Field.

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Required | Managed By |
| --- | --- | --- | --- | --- | --- |
| [cPVAL Enable BitLocker Audit](/docs/61e7d229-4f47-431d-b948-23523a04cb7d) | - | `Windows Workstations` | Organization, Location, Device | Yes | Manual |
| [cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5) | `False` | `Checked` | Device | No | Automation |
| [cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9) | - | *HTML Table* | Device | No | Automation |
| [cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba) | - | *HTML Table* | Device | No | Automation |

### Automations

| Name | Function |
| --- | --- |
| [BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592) | Performs a comprehensive audit of the machine's security posture. It executes `Get-BitLockerDetail` to scan volumes and `Get-TPMDetail` to retrieve hardware security stats, populating the results into the respective Custom Fields. |

### Compound Conditions

| Name | Function |
| --- | --- |
| [BitLocker Audit - Workstations](/docs/368a9d6b-0f50-498b-94ba-32e95e402b66) | Performs BitLocker and TPM audit once per day on Windows workstations where auditing is enabled via the Custom Field. |
| [BitLocker Audit - Servers](/docs/ee96061c-3700-44af-a10c-9f1dde32e611) | Performs BitLocker and TPM audit once per day on Windows servers where auditing is enabled via the Custom Field. **The BitLocker Drive Encryption feature must be enabled on servers to perform auditing. This script will not work without enabling this feature.** |

## Implementation

### Step 1

Create the following custom fields as described in the documentation:

* [Custom Field: cPVAL Enable BitLocker Audit](/docs/61e7d229-4f47-431d-b948-23523a04cb7d)
* [Custom Field: cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5)
* [Custom Field: cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9)
* [Custom Field: cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba)

### Step 2

Create the following automation as described in the documentation:

* [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)

### Step 3

Create the following compound conditions as described in the documentation:

* [Compound Condition: BitLocker Audit - Workstations](/docs/368a9d6b-0f50-498b-94ba-32e95e402b66)
* [Compound Condition: BitLocker Audit - Servers](/docs/ee96061c-3700-44af-a10c-9f1dde32e611)

## FAQs

### **Q.** What is the primary purpose of this solution?

**A:** The solution performs a comprehensive security audit of Windows devices. It scans for BitLocker encryption status on all volumes and retrieves hardware security details from the Trusted Platform Module (TPM), populating this data into NinjaOne custom fields.

### **Q.** Does this solution support Mac or Linux devices?

**A:** No. This solution is only compatible with Windows devices.

### **Q.** I enabled the audit on my Windows Servers, but it isn't working. Why?

**A:** The **BitLocker Drive Encryption** feature must be enabled on servers to perform auditing. The script will not work without enabling this feature first.

### **Q.** If BitLocker is not enabled or fails to audit, will the TPM audit still run?

**A:** Yes. The TPM audit is performed independently and will still execute even if the BitLocker audit fails.

### **Q.** How often does the audit run?

**A:** By default, the Compound Conditions for both Workstations and Servers are configured to run the audit once per day.

### **Q.** Can I disable the audit for a specific device?

**A:** Yes. You can set the **cPVAL Enable BitLocker Audit** custom field to `Disable` at the device level. This will exclude that specific device from the auditing policy.

### **Q.** What PowerShell version is required for this solution?

**A:** The solution requires PowerShell v5.

### **Q.** How does the solution handle drives that have multiple Key Protectors (e.g., TPM and PIN)?

**A:** The script handles complex configurations by flattening volumes with multiple key protectors. This means it creates individual rows in the report for each protector associated with a volume.

### **Q.** Where can I view the actual Recovery Password for a drive?

**A:** The Recovery Password (48-digit) is listed in the **cPVAL BitLocker Info** custom field, specifically in the `RecoveryPassword` column of the HTML table.

### **Q.** What is the difference between the "Windows" and "Windows Workstations" options in the enable field?

**A:** Selecting `Windows` enables auditing for both `Windows Workstations` and `Windows Servers`. The specific options (`Windows Workstations` or `Windows Servers`) allow you to target policies more granularly if you only want to audit one type of device.

### **Q.** Does this solution automatically encrypt my drives?

**A:** No. This is strictly an **Audit** solution. It collects and reports status but does not perform encryption. For encryption, you would need the "Initialize BitLocker" automation.

### **Q.** How can I quickly tell if the C: drive is encrypted without opening the full HTML report?

**A:** You can check the **cPVAL BitLocker Enabled for System Drive** custom field. This is a checkbox (Boolean) that is checked if the OS drive is protected.

### **Q.** What happens if I manually edit the data in the "cPVAL BitLocker Info" field?

**A:** The field has "Read_Write" permissions for technicians, so you can edit it. However, the data is refreshed and overwritten automatically by the BitLocker solution during the next audit.

### **Q.** What does the "LockoutCount" in the TPM report indicate?

**A:** The `LockoutCount` indicates the current number of failed authorization attempts against the TPM.

### **Q.** Does the audit tell me if a reboot is pending for the TPM?

**A:** Yes. The **cPVAL TPM Info** table includes a `RestartPending` column that indicates if a system restart is required for TPM operations.

### **Q.** Can I use this solution to find out if a machine has no TPM at all?

**A:** Yes. The **cPVAL TPM Info** table has a `TpmPresent` column. A "False" value (or empty data depending on script output behavior for missing hardware) would indicate the physical absence of a TPM.

### **Q.** Is the "DataCollectionTime" the current time?

**A:** No, `DataCollectionTime` is the timestamp when the audit script last ran. It indicates how fresh the data is.

### **Q.** What does "ProtectionStatus: On" mean in the BitLocker report?

**A:** "On" means the volume is encrypted and the key is protected. "Off" typically implies the drive might be decrypted or protection is suspended.

### **Q.** Does the script run on Removable drives?

**A:** The script scans "all volumes" using `Get-BitLockerVolume`. The `VolumeType` column in the report will indicate if a drive is `Fixed`, `OperatingSystem`, or `Removable`.

### **Q.** How do I exclude a specific Location from auditing?

**A:** Navigate to the Location in NinjaOne, go to Custom Fields, and set **cPVAL Enable BitLocker Audit** to `Disable`. This setting will apply to all devices in that location unless overridden at the device level.

### **Q.** What if the "cPVAL BitLocker Info" field is empty?

**A:** This indicates the automation has not run yet, the device is offline, or the script failed (potentially due to missing prerequisites like the Server feature).

### **Q.** Does the solution track if "Auto-Unlock" is enabled for data drives?

**A:** Yes. The BitLocker Info table includes an `AutoUnlockEnabled` column.

### **Q.** Can I see the encryption percentage if a drive is currently encrypting?

**A:** Yes. The `EncryptionPercentage` column in the report shows the progress of encryption.

### **Q.** What permissions are required for the automation to write to the custom fields?

**A:** The automation requires `Read_Write` permission for the custom fields. This is configured by default in the field definitions.

### **Q.** Why is the "cPVAL BitLocker Enabled for System Drive" field useful if I already have the full table?

**A:** It is a simple boolean (Checkbox) field. This makes it much easier to use in Condition logic (e.g., "If Checkbox is Unchecked, trigger alert") compared to parsing a full HTML table.
