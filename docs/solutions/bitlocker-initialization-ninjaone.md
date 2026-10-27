---
id: '2ebfabd5-05cf-4175-a513-2aa290eb26e8'
slug: /2ebfabd5-05cf-4175-a513-2aa290eb26e8
title: 'BitLocker Initialize - NinjaOne'
title_meta: 'BitLocker Initialize - NinjaOne'
keywords: ['bitlocker','initialization','encryption','tpm','laptop','desktop']
description: 'Enforces BitLocker on Windows devices through NinjaOne custom fields and compound conditions, targets laptops, desktops and servers separately, and stores recovery passwords in NinjaOne.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-10-26
---

## Purpose

This solution enforces BitLocker on Windows devices in NinjaOne. Custom fields define the drive, the encryption method and the key protector, and compound conditions check each device once a day and fix the ones that do not match.

You choose the devices with [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b): every Windows device, workstations, servers, laptops only or desktops only. The [BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320) script compares each device with the custom fields. When it finds a difference, the compound condition runs [Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198). That automation applies the configuration through the [Initialize-BitLockerVolume](/docs/2ce835a2-3ac1-4291-baaf-8d3cac76869f) script, then records BitLocker, Secure Boot and TPM status, including recovery passwords, in NinjaOne custom fields.

Key capabilities:

- **Targeting by device type**: Enable laptops, desktops and servers separately or together. A workstation with a battery counts as a laptop.
- **Startup without the recovery key**: `RecoveryPassword`, `RecoveryKey` and `AdAccount` cannot unlock the system drive at startup by themselves, so the solution always adds a TPM protector alongside them on that drive. A drive that already has only one of them gets the TPM protector without being decrypted. When the TPM cannot be used, the drive is left unchanged instead of being protected in a way that asks for the recovery key at every startup.
- **Fixes in place**: Missing protectors, Windows device encryption waiting for activation, paused encryption and suspended protection are fixed without decrypting. Protection that a BIOS or firmware update suspended for a set number of restarts is left to resume on its own.
- **Re-encryption only when needed**: A drive is decrypted and encrypted again only for a different encryption method, a different TPM based protector or the Force option, and only when the TPM it needs is ready.
- **Recovery passwords in NinjaOne**: Every run writes the drive's recovery passwords to [cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9). When the drive changes, they are also backed up to Active Directory or Microsoft Entra ID.
- **Signed scripts only**: The automation verifies its own signature and the signature of the script it downloads before it changes anything.

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Required | Managed By |
| --- | --- | --- | --- | --- | --- |
| [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b) | - | `Windows Laptops` | Organization, Location, Device | Yes | Manual |
| [cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926) | System drive | `D:` | Organization, Location, Device | No | Manual |
| [cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0) | `XtsAes128` | `XtsAes256` | Organization, Location, Device | No | Manual |
| [cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea) | `RecoveryPassword` | `TpmPin` | Organization, Location, Device | No | Manual |
| [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057) | `0` | `3` | Organization, Location, Device | No | Manual |
| [cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac) | Unchecked | Checked | Organization, Location, Device | No | Manual |
| [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b) | - | `246810` | Organization, Location, Device | No | Manual |
| [cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47) | - | `CONTOSO\ContosoGroup` | Organization, Location, Device | No | Manual |
| [cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9) | - | *HTML Table* | Device | Yes | Automation |
| [cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5) | Unchecked | Checked | Device | Yes | Automation |
| [cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba) | - | *HTML Table* | Device | Yes | Automation |

Initialize and Audit BitLocker also fills the optional cPVAL Audit fields of the [BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc) solution when they exist.

### Automations

| Name | Function |
| --- | --- |
| [BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320) | Compares the device with the custom fields without changing anything. Exits with 0 when no action is needed, with 1 and a `Detected:` line when the device needs a fix, and with 2 when the device is unsupported or needs your attention. |
| [Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198) | Applies the configuration through Initialize-BitLockerVolume, then writes BitLocker, Secure Boot and TPM status, including recovery passwords, to the custom fields. |

## Compound Conditions

| Name | Function |
| --- | --- |
| [Enable BitLocker - Laptop](/docs/32f08cdb-3ce6-4628-989b-704cd2e6394e) | Runs Initialize and Audit BitLocker on laptops set to `Windows`, `Windows Workstations` or `Windows Laptops` when the detection script finds a needed fix. |
| [Enable BitLocker - Desktop](/docs/47f52182-7c4c-4b4d-a0d7-7cb25c5256fa) | Runs Initialize and Audit BitLocker on desktops set to `Windows`, `Windows Workstations` or `Windows Desktops` when the detection script finds a needed fix. |
| [Enable BitLocker - Server](/docs/a4d9dc9c-3e10-4cf4-a296-709ad9f507dd) | Runs Initialize and Audit BitLocker on servers set to `Windows` or `Windows Servers` when the detection script finds a needed fix. The BitLocker Drive Encryption feature must be installed on the server. |

## Implementation

### Step 1

Create the following custom fields as described in the documentation:

- [Custom Field: cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Custom Field: cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)
- [Custom Field: cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)
- [Custom Field: cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)
- [Custom Field: cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057)
- [Custom Field: cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)
- [Custom Field: cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)
- [Custom Field: cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)
- [Custom Field: cPVAL BitLocker Info](/docs/fd545101-1cd5-4d9f-8df7-57c4df1616b9)
- [Custom Field: cPVAL BitLocker Enabled for System Drive](/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5)
- [Custom Field: cPVAL TPM Info](/docs/68c098e2-54f1-40f8-9574-f70f1948e4ba)

### Step 2

Create the following automations as described in the documentation:

- [Automation: BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)
- [Automation: Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)

### Step 3

Create the following compound conditions as described in the documentation:

- [Compound Condition: Enable BitLocker - Laptop](/docs/32f08cdb-3ce6-4628-989b-704cd2e6394e)
- [Compound Condition: Enable BitLocker - Desktop](/docs/47f52182-7c4c-4b4d-a0d7-7cb25c5256fa)
- [Compound Condition: Enable BitLocker - Server](/docs/a4d9dc9c-3e10-4cf4-a296-709ad9f507dd)

### Step 4

Set [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b) at the organization, location or device level, along with any other custom field whose default you want to change.

:::note
**Updating from an earlier version of this solution:**

- Delete the Enable BitLocker - Workstation compound condition and create Enable BitLocker - Laptop and Enable BitLocker - Desktop in its place.
- Update Enable BitLocker - Server from its documentation. The script result condition now checks for `Detected:` in the output instead of `Autofix is required`, and the automation is Initialize and Audit BitLocker.
- Add the `Windows Laptops` and `Windows Desktops` options to cPVAL BitLocker Enable, and create cPVAL TPM Info if it does not exist yet.
:::

## FAQs

### **Q.** What happens if I only set cPVAL BitLocker Enable and leave the other fields blank?

**A:** The solution uses these defaults:

- **Drive:** the system drive, usually `C:`.
- **Encryption method:** `XtsAes128`.
- **Key protector:** a TPM protector plus a recovery password on the system drive. The device needs a ready TPM; without one, the drive is left unchanged and the detection script reports why.
- **Hardware test:** BitLocker tests the device at the next restart before encryption starts.
- **Restarts:** none. Encryption starts after the next restart the user makes.

### **Q.** How do I turn on BitLocker for a specific computer?

**A:** Open the device in NinjaOne, go to the **BitLocker** custom field tab, and set **cPVAL BitLocker Enable** to an option that covers the device, for example `Windows`.

### **Q.** How does the solution tell laptops from desktops?

**A:** A workstation counts as a laptop when Windows has detected a battery on it. The compound conditions check this with the registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\ACPI\PNP0C0A`, which Windows creates for a laptop battery. All-in-ones, mini PCs and virtual machines count as desktops.

### **Q.** Why are there Windows, Windows Workstations, Windows Laptops and Windows Desktops options?

**A:** They set how wide the rollout is. `Windows` covers every Windows device, `Windows Workstations` covers laptops and desktops, and `Windows Laptops` or `Windows Desktops` cover only that type, for example to start with laptops before moving on to desktops.

### **Q.** Why does the solution add a TPM protector when the key protector is RecoveryPassword?

**A:** A recovery password, a recovery key or an Active Directory account cannot unlock the system drive at startup by itself. A system drive protected only by one of them asks for the recovery key at every startup. The TPM protector lets the device start normally, and the recovery password stays available for recovery.

### **Q.** A system drive already has only a recovery password. What does the solution do?

**A:** It adds a TPM protector without decrypting the drive, then turns protection on if it was off. When the TPM is missing or not ready, the drive is left unchanged and the detection script exits with 2. If protection on that drive is already on, the device keeps asking for the recovery key at startup until the TPM is fixed.

### **Q.** What if the device has no TPM?

**A:** The `Tpm` key protectors, and `RecoveryPassword`, `RecoveryKey` or `AdAccount` on the system drive, need a TPM. Without one, the detection script exits with 2 and the drive is left unchanged. Use `Password` or `Startup` for these devices instead, which also need the group policy that allows BitLocker without a compatible TPM.

### **Q.** What if the TPM is not ready?

**A:** Set **cPVAL Allow TPM Or Reboot** to `1` or `3` so the automation can initialize it. Initialization can need a restart, and it can clear the TPM, which removes keys other software keeps in it, such as Windows Hello PINs.

### **Q.** Does this solution support Windows Home edition?

**A:** No. The detection script exits with 2 on Home editions, so the automation does not run.

### **Q.** Can I use this solution on Windows Servers?

**A:** Yes. Install the **BitLocker Drive Encryption** feature on the server first, then set **cPVAL BitLocker Enable** to `Windows` or `Windows Servers`.

### **Q.** How often does the solution check for compliance?

**A:** Every **24 hours**. You can change the interval in the compound condition settings.

### **Q.** What if my drive is already encrypted?

**A:** When the encryption method and key protector match the custom fields, nothing changes. A different encryption method, or a different TPM based protector, makes the automation decrypt the drive and encrypt it again. Any other difference, such as a missing protector or suspended protection, is fixed without decrypting.

### **Q.** What happens when the encryption method or TPM based protector is different?

**A:** The automation turns BitLocker off and waits up to 15 minutes for decryption. When decryption finishes in time, it encrypts the drive again in the same run; otherwise, the next detection run encrypts it once decryption completes. The drive is unprotected until then. Windows allows only one TPM based protector per drive, which is why switching, for example from `Tpm` to `TpmPin`, needs re-encryption. When the TPM needed to encrypt again is not ready, the drive is not decrypted.

### **Q.** My BitLocker status says Protection Off (Suspended). Will this solution fix it?

**A:** Yes, when protection was suspended until it is resumed manually and the drive can unlock at startup. Protection that a BIOS or firmware update suspended for a set number of restarts is left to resume on its own.

### **Q.** What about devices where Windows device encryption is waiting for activation?

**A:** Those drives are encrypted but have no key protectors. The automation adds the configured protectors, plus a TPM protector when needed, and turns protection on. The drive keeps its encryption method; when that differs from **cPVAL EncryptionMethod**, a later run encrypts it again.

### **Q.** Which custom fields does Initialize and Audit BitLocker update?

**A:** At the end of every run it writes **cPVAL BitLocker Info**, **cPVAL BitLocker Enabled for System Drive**, **cPVAL TPM Info** and, when they exist, the cPVAL Audit fields, in the same format as the [BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc) solution. A run stopped by a failed signature check does not update them.

### **Q.** Are recovery passwords stored in NinjaOne?

**A:** Yes. **cPVAL BitLocker Info** holds the recovery password of every drive, so the key is available even when a device restarts before it reaches Active Directory or Microsoft Entra ID. Limit who can view that field. When the drive changes, the automation also backs up the recovery password to Active Directory, or to Microsoft Entra ID when that fails.

### **Q.** Does this replace the daily BitLocker and TPM Audit?

**A:** No. Initialize and Audit BitLocker audits only when it runs. Keep the [BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc) solution for daily reporting.

### **Q.** Where do I specify the Active Directory account or the key folder?

**A:** In **cPVAL Path Or ADAccount**: a domain account or group for `AdAccount`, and a folder for `RecoveryKey`, `Startup`, `TpmStartup` and `TpmPinStartup`.

### **Q.** Can I encrypt a drive other than C:?

**A:** Yes. Enter its drive letter in **cPVAL MountPoint**, for example `D:`. A data drive protected by `RecoveryPassword`, `RecoveryKey` or `AdAccount` also gets auto-unlock, which needs an encrypted system drive.

### **Q.** Does the solution use Used Space Only encryption?

**A:** The solution does not request it. Drives encrypted earlier, such as by Windows device encryption, keep the encryption they have.

### **Q.** How do I configure a startup PIN for my users?

**A:** Set **cPVAL KeyProtectorType** to `TpmPin` and enter the PIN in **cPVAL PIN Or Password**. The PIN must meet the minimum PIN length set for the device.

### **Q.** Will the solution restart the computer?

**A:** Only when **cPVAL Allow TPM Or Reboot** allows it:

- `0`: No initialization or restart. Encryption starts after the next restart the user makes.
- `1`: Initialize the TPM when it is not ready.
- `2`: Restart when the BitLocker hardware test needs it.
- `3`: Initialize the TPM and restart when needed.

### **Q.** Can I skip the hardware test?

**A:** Yes. Check **cPVAL SkipHardwareTest** to start encryption right away. When the hardware test has failed on a device, the solution stops for that device until you fix the cause or check this field.

### **Q.** What happens if the computer loses power during encryption?

**A:** BitLocker pauses and resumes the encryption or decryption when the computer starts again.

### **Q.** I changed a custom field, but nothing happened. Why?

**A:** The compound conditions run every 24 hours, so the change is picked up on the next run. To apply it sooner, run **Initialize and Audit BitLocker** on the device.

### **Q.** Can I use this solution to decrypt a drive?

**A:** No. Setting **cPVAL BitLocker Enable** to `Disable` stops the checks, and drives that are already encrypted stay encrypted.

### **Q.** What do the detection script's exit codes mean?

**A:**

- **0:** No action needed.
- **1:** The device needs a fix. The output has a line that begins with `Detected:` and gives the reason, and the compound condition runs Initialize and Audit BitLocker.
- **2:** The device is unsupported or needs your attention, for example a Home edition, a missing value in a custom field, or a TPM that is missing or not ready. The output has a line that begins with `[FAIL]` and gives the reason. The automation does not run.

### **Q.** Where can I see the logs?

**A:** In the NinjaOne activity log of each run, which includes the log of the Initialize-BitLockerVolume script. The log is also saved on the device at `C:\ProgramData\_Automation\Script\Initialize-BitLockerVolume`. It contains recovery passwords.

### **Q.** What does Invalid Signature in the activity log mean?

**A:** The automation, or the Initialize-BitLockerVolume script it downloaded, is not signed by ProVal, so nothing ran. Import the latest version of the automation from its documentation.

### **Q.** What does the Force option do, and when should I use it?

**A:** **Force** makes the automation decrypt an encrypted drive and encrypt it again with the settings from the custom fields, even when the drive already matches. Use it only to recover a drive with an inconsistent configuration. The drive is unprotected while it decrypts, which can take hours.

## Changelog

### 2026-10-26

- Replaced the Enable BitLocker - Workstation compound condition with Enable BitLocker - Laptop and Enable BitLocker - Desktop, and added the `Windows Laptops` and `Windows Desktops` options to cPVAL BitLocker Enable.
- Renamed the Initialize BitLocker automation to Initialize and Audit BitLocker.
- `RecoveryPassword`, `RecoveryKey` and `AdAccount` now get a TPM protector on the system drive, and a drive that cannot get one is left unchanged.
- Added cPVAL TPM Info to the custom fields.
- Corrected the Enable BitLocker - Server link, added the update steps, and rewrote the FAQs.

### 2025-12-16

- Initial version of the document
