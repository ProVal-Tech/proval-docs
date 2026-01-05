---
id: '2ebfabd5-05cf-4175-a513-2aa290eb26e8'
slug: /2ebfabd5-05cf-4175-a513-2aa290eb26e8
title: 'BitLocker Initialize - NinjaOne'
title_meta: 'BitLocker Initialize - NinjaOne'
keywords: ['bitlocker','initialization','encryption']
description: 'Automates BitLocker initialization on Windows devices using NinjaOne custom fields, including encryption method selection, key protector configuration, and secure execution with logging. '
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---
## Purpose

This solution provides a comprehensive, policy-driven framework for automating and enforcing BitLocker encryption on Windows endpoints within NinjaOne. It eliminates the need for manual script execution by utilizing NinjaRMM Custom Fields to define encryption standards (such as encryption method, key protector type, and mount point) and enforcing them via automated logic.

The solution operates on a "Gatekeeper" model: administrators opt-in specific devices or locations using a control flag. A detection script then continuously audits the device against the defined policy. If a device is found to be non-compliant—whether it is unencrypted, suspended, or using an incorrect algorithm—the system automatically triggers a remediation workflow to bring the device back into compliance without user intervention.

Key capabilities include:

* **Granular Configuration**: Define specific encryption parameters (e.g., XTS-AES 256 vs. AES 128) and key protectors (TPM, PIN, Recovery Password) via Custom Fields.
* **Smart Remediation**: Automatically handles complex scenarios, such as injecting a missing Recovery Password, resuming suspended protection, or fully re-encrypting a drive if the wrong algorithm is detected.
* **Safety & Compatibility**: built-in checks prevent execution on unsupported hardware (e.g., Windows Home edition) or missing prerequisites (e.g., TPM absence).
* **Wait-Loop Logic**: The remediation process includes intelligent monitoring to ensure drives are fully decrypted before attempting re-encryption, preventing errors during algorithm changes.
* **Separation of Duties**: Distinct policies for Workstations and Servers allow for tailored management strategies across different device types.

The solution uses a **[BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)** script to evaluate the system state against the Custom Field policy, which triggers the **[Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)** script via a Compound Condition to execute the necessary encryption logic.

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Required | Managed By |
| --- | --- | --- | --- | --- | --- |
| [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b) | - | `Windows` | Org, Loc, Dev | Yes | Manual |
| [cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926) | `$env:SystemDrive` | `C:` | Org, Loc, Dev | No | Manual |
| [cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0) | `XtsAes128` | `XtsAes256` | Org, Loc, Dev | No | Manual |
| [cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea) | `RecoveryPassword` | `TpmPin` | Org, Loc, Dev | No | Manual |
| [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057) | `0` | `3` | Org, Loc, Dev | No | Manual |
| [cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac) | `false` | `true` | Org, Loc, Dev | No | Manual |
| [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b) | - | `123456` | Org, Loc, Dev | No | Manual |
| [cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47) | - | `CONTOSO\Group` | Org, Loc, Dev | No | Manual |

### Automations

| Name | Function |
| --- | --- |
| [BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320) | Evaluates the endpoint's current encryption state against the policy defined in Custom Fields. Returns specific exit codes (0=Compliant, 1=Non-Compliant, 2=Error) to drive the automation logic. |
| [Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198) | The remediation engine that applies the desired configuration. It handles enabling encryption, adding key protectors, or re-encrypting the drive if the method is incorrect. |

## Compound Conditions

| Name | Function |
| --- | --- |
| [Enable BitLocker - Workstation](/docs/6193f950-2266-42fd-9535-59adfe445cb5) | Automatically runs the **Initialize BitLocker** automation on Workstations when the **Detection** script identifies a non-compliant state AND the device is opted-in via the "Windows Workstations" setting. |
| [Enable BitLocker - Server](/docs/6193f950-2266-42fd-9535-59adfe445cb5) | Automatically runs the **Initialize BitLocker** automation on Servers when the **Detection** script identifies a non-compliant state AND the device is opted-in via the "Windows Servers" setting. |

## Implementation

### Step 1

Create the following custom fields as described in the documentation:

* [Custom Field: cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
* [Custom Field: cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)
* [Custom Field: cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)
* [Custom Field: cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)
* [Custom Field: cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057)
* [Custom Field: cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)
* [Custom Field: cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)
* [Custom Field: cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)

### Step 2

Create the following automations as described in the documentation:

* [Automation: BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)
* [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)

### Step 3

Create the following compound conditions as described in the documentation:

* [Compound Condition: Enable BitLocker - Workstation](/docs/6193f950-2266-42fd-9535-59adfe445cb5)
* [Compound Condition: Enable BitLocker - Server](/docs/6193f950-2266-42fd-9535-59adfe445cb5)

## FAQs

### **Q.** What happens if I just enable the solution for all Windows machines but do not set any other custom fields?

**A:** The solution is designed to have safe "Default" values. If you simply set the **cPVAL BitLocker Enable** field to `Windows` (or `Windows Workstations`/`Windows Servers`) and leave everything else blank, the solution will apply the following configuration:

* **Target:** System Drive (usually `C:`).
* **Encryption Method:** `XTS-AES 128`.
* **Protector:** `RecoveryPassword`. **Important:** If the machine supports TPM, selecting this default option will automatically enable **both** the `TPM` and `RecoveryPassword` key protectors. This ensures the device boots seamlessly via TPM while retaining a recovery option.
* **Hardware Test:** It will **run** the hardware test (requiring a reboot before encryption starts) unless you explicitly skip it.

### **Q.** How do I turn on BitLocker for a specific computer?

**A:** Navigate to the device in NinjaOne, go to the **Custom Fields** tab (specifically the **BitLocker** tab), and set the **cPVAL BitLocker Enable** dropdown to `Windows`, `Windows Workstations`, or `Windows Servers`.

### **Q.** Does this solution support Windows Home edition?

**A:** No. The **BitLocker Initialization - Detection** script explicitly checks for the OS edition. If it detects "Home" edition, it exits with an error code (Exit Code 2) and will **not** attempt to run the encryption script, as BitLocker is not natively supported on Windows Home.

### **Q.** Can I use this solution on Windows Servers?

**A:** Yes. You must enable the **BitLocker Drive Encryption** feature on the server first. Then, set the **cPVAL BitLocker Enable** field to `Windows Servers` to target the server-specific policies.

### **Q.** What if my drive is already encrypted?

**A:** The detection script will check the current configuration.

* If the settings (Method and Protector) match your Custom Fields, it marks the device as **Compliant** (Exit 0) and does nothing.
* If the settings **do not** match (e.g., you want `XTS-AES 256` but the drive is `AES 128`), it marks the device as **Non-Compliant**, triggering the automation to fix it.

### **Q.** What happens if the drive uses the wrong Encryption Method (e.g., AES 128 instead of XTS-AES 256)?

**A:** The **Initialize BitLocker** script will automatically **disable** (decrypt) BitLocker on the drive. It then waits for the decryption to fully complete (checking every 15 seconds) before re-encrypting the drive with the correct method defined in your Custom Fields.

### **Q.** What happens if the drive uses the wrong Key Protector (e.g., TPM instead of TPM+PIN)?

**A:** Similar to the encryption method mismatch, the script will disable BitLocker, wait for decryption, and then re-enable BitLocker using the correct protector type you specified in **cPVAL KeyProtectorType**.

### **Q.** Can I force the script to skip the Hardware Test?

**A:** Yes. By default, BitLocker runs a hardware test that requires a reboot before encryption begins. If you want to bypass this (start encrypting immediately), check the box for **cPVAL SkipHardwareTest** (set it to `true`).

### **Q.** How do I configure a Startup PIN for my users?

**A:**

1. Set **cPVAL KeyProtectorType** to `TpmPin` (or `Password` if no TPM).
2. Enter the desired PIN in the **cPVAL PIN Or Password** field.

* *Note:* Ensure the PIN meets Windows complexity requirements (usually 6+ digits).

### **Q.** Where do I specify the Active Directory account for backing up keys?

**A:** If you select `AdAccount` or `RecoveryKey` as your protector type, you must provide the domain account, group, or path in the **cPVAL Path Or ADAccount** field.

### **Q.** Will the script reboot the computer automatically?

**A:** It depends on your settings. The **cPVAL Allow TPM Or Reboot** field controls this behavior:

* `0`: No reboot allowed (Script might fail if TPM needs initialization).
* `1`: Allow TPM initialization only.
* `2`: Allow Restart.
* `3`: Allow both TPM initialization and Restart.

### **Q.** My BitLocker status says "Protection Off" (Suspended). Will this solution fix it?

**A:** Yes. The detection script explicitly checks for `ProtectionStatus: Off`. If found, it flags the device as non-compliant. The remediation script will then run `Resume-BitLocker` to re-enable protection without decrypting the drive.

### **Q.** What if the machine does not have a TPM chip?

**A:** You should not use the `Tpm`, `TpmPin`, or `TpmStartup` protector types. Instead, select `Password` or `RecoveryPassword` in the **cPVAL KeyProtectorType** field, which do not strictly require a TPM.

### **Q.** How often does the solution check for compliance?

**A:** The default schedule for the Compound Condition is every **24 hours**. You can adjust this interval in the Compound Condition settings if needed.

### **Q.** Can I encrypt a drive other than C:?

**A:** Yes. By default, it targets `$env:SystemDrive` (usually C:). You can specify a different drive letter (e.g., `D:`) in the **cPVAL MountPoint** custom field.

### **Q.** Does this solution backup the Recovery Key to NinjaOne?

**A:** Not directly into a custom field. The script executes standard BitLocker commands. If your environment is configured to back up keys to Active Directory (AD) or Entra ID (Azure AD), Windows will handle that key escrow during the encryption process triggered by this script.

### **Q.** What does Exit Code 1 mean in the Activity Log?

**A:** Exit Code 1 from the **Detection** script means the device is **Non-Compliant**. It has passed compatibility checks but requires changes (e.g., needs encryption, needs a resume, or needs a configuration change). This code triggers the Autofix script.

### **Q.** What does Exit Code 2 mean in the Activity Log?

**A:** Exit Code 2 means the device is **Unsupported** or in an **Error** state. This could be because it is running Windows Home, lacks the BitLocker module, or has invalid data in the Custom Fields. The solution will *not* attempt to run the Autofix script to prevent loops.

### **Q.** Why did the script fail with "Autofix is required"?

**A:** That message comes from the **Detection** script. It is *not* a failure; it is the success message indicating that the script successfully identified a machine that needs BitLocker enabled or fixed. This output is what tells NinjaOne to launch the remediation script.

### **Q.** Can I use this solution to decrypt a drive permanently?

**A:** No. This solution is for **Initialization** and **Enforcement**. If you set `cPVAL BitLocker Enable` to `Disable`, the automation will simply stop checking the device; it will not actively decrypt the drive. You would need to run a separate decryption command manually or via a different script.

### **Q.** I changed the Encryption Method custom field, but nothing happened immediately. Why?

**A:** The automation relies on the **Detection** script, which runs on a schedule (default: every 24 hours). The change will be picked up during the next scheduled scan. You can force the detection script to run manually if you need immediate results.

### **Q.** Does the script support "Used Space Only" encryption?

**A:** The wrapper script uses the agnostic `Initialize-BitLockerVolume` script. While the custom fields don't expose a "Used Space Only" toggle, standard BitLocker behavior via PowerShell on modern Windows versions usually defaults to Used Space Only for new encryptions unless specified otherwise.

### **Q.** What happens if the computer loses power during encryption?

**A:** BitLocker is designed to be robust. If power is lost during encryption (or decryption), Windows will typically pause the process and automatically resume it when the computer turns back on.

### **Q.** Where can I see the logs for the encryption process?

**A:** The scripts generate local logs on the machine at `$env:ProgramData\_Automation\Script\Initialize-BitLockerVolume`. These logs are also output to the NinjaOne Activity Log for the script run.

### **Q.** Why do we have separate "Windows" and "Windows Workstations" options in the dropdown?

**A:** This allows for granular policy targeting. You might have a broad policy for "Windows" generally, but specific, stricter policies applied only to "Windows Workstations" or "Windows Servers" via different Compound Conditions. Functionally, checking either will trigger the relevant automation if the Compound Condition is targeted correctly.

### **Q.** What does the "Force" parameter in the script variables do?

**A:** The **Force** parameter allows you to override the standard compliance checks. When enabled, if the script detects that the drive is already encrypted, it will ignore the current state and strictly enforce the policy by **decrypting** the drive first, then **re-encrypting** it using the settings defined in your Custom Fields.

### **Q.** When should I use the "Force" option?

**A:** You should generally leave this unchecked for normal operations. It is best used for troubleshooting or remediating devices with "stuck" or inconsistent encryption states. For example, if you suspect an encrypted drive has a corrupted configuration, enabling **Force** ensures a clean application of your policy from scratch. **Note:** Since this triggers a full decryption and re-encryption cycle, the process can take a significant amount of time to complete.
