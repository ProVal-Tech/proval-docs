---
id: '1cd2e351-ffd3-4afe-966d-0f58c6dc4c49'
slug: /1cd2e351-ffd3-4afe-966d-0f58c6dc4c49
title: 'Boot Environment Audit'
title_meta: 'Boot Environment Audit'
keywords: ['boot', 'secure-boot', 'telemetry', 'secure-boot-certificates', 'kek', 'db', 'dbdefault', 'boot-environment-audit', 'secure-boot-audit']
description: 'This solution outlines the automated process for auditing the boot environment and security configuration of Windows endpoints using ConnectWise RMM.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-14
---

## Purpose

This solution outlines the automated process for auditing the boot environment and security configuration of Windows endpoints using ConnectWise RMM. It executes a comprehensive scan that gathers vital data on Secure Boot status, UEFI certificates (such as CA 2023 readiness), OEM driver updates, Windows telemetry, and firmware boot entries. The collected data is automatically populated into custom fields at the endpoint level, providing a centralized view to monitor your managed fleet's security posture and compliance with modern boot standards.

> **Note:** After importing this solution, it is recommended to disable the existing [Windows Secure Boot Audit](/docs/05b9e73a-64ae-43f6-8ed5-89c952a3aaec) solution to prevent duplicate executions.
>
> This solution serves as an enhancement of the earlier [Windows Secure Boot Audit](/docs/05b9e73a-64ae-43f6-8ed5-89c952a3aaec) solution. The previous version remains in production and is not yet deprecated, as it performs partial auditing. It can still be used independently for scenarios where only certificate status checks are required.

## Associated Content

### Custom Fields

| Name | Example | Type | Level | Required | Purpose |
| --- | --- | --- | --- | --- | --- |
| [SB_OEM_Updates_Count](/docs/ba17eb18-3c95-4c40-b1d9-669cb94ef1c2) | 3 | Text Box | Endpoint | No | Number of available driver updates from OEM (Dell Command Update, HP Image Assistant, Lenovo Updates, or Windows Update). |
| [SB_SecureBoot_Status](/docs/bca82718-a8c8-4a9d-ac87-1920130978b6) | Enabled | Text Box | Endpoint | No | Current Secure Boot state: Enabled, Disabled, or Unknown. |
| [SB_Telemetry_Status](/docs/c67af38c-feaa-4c74-8f22-914fc8d17402) | Disabled | Text Box | Endpoint | No | Windows telemetry setting: Enabled or Disabled (based on registry and DiagTrack service). |
| [SB_DB_Certificate_Status](/docs/233d7b73-c65a-4eb9-bff1-90d91f3ab7e1) | Updated | Text Box | Endpoint | No | UEFI db certificate status: Updated (CA 2023), Out of date, or Not present. |
| [SB_KEK_Certificate_Status](/docs/f066b102-af22-4257-bc1d-8a4b9a66e7e2) | Updated | Text Box | Endpoint | No | UEFI KEK certificate status: Updated (Microsoft KEK 2K CA 2023), Out of date, or Not present. |
| [SB_DBDefault_Certificate_Status](/docs/cac79d06-1f5e-49f8-96c2-8660d5c1e162) | Out of date | Text Box | Endpoint | No | Default db certificate status: Updated (CA 2023), Out of date, or Not present. |
| [SB_Current_Cumulative_Update](/docs/d4de84fc-f158-466b-a7cf-57534445f0e9) | KB5012345 | Text Box | Endpoint | No | Latest installed Windows cumulative update identifier. |
| [SB_Nov_2025_CU_Installed](/docs/e6d3c7d9-9fa8-4e0c-a1d1-8c9d52428e41) | True | Text Box | Endpoint | No | True if November 2025 or newer cumulative update is installed; False otherwise. |
| [SB_BiosVersion](/docs/061ac707-7f78-40c9-984c-1327793ce6a3) | 2.15.0 | Text Box | Endpoint | No | BIOS/firmware version string collected from the system. |
| [SB_CA2023_Supported_BIOS_Version](/docs/641a1d5b-1ee1-4c24-a90e-809c308af495) | 2.16.0 | Text Box | Endpoint | No | Minimum BIOS version required for CA 2023 Secure Boot support per OEM; 'Not listed' if model not found in lookup. |
| [SB_PXE_Present](/docs/325c627e-961b-476b-b78f-80d2d94c4125) | False | Text Box | Endpoint | No | True if firmware boot entries include PXE/network boot options; False otherwise. |
| [SB_DualBoot_Or_NonWindowsEFI](/docs/592365ee-556a-4d9a-9785-7846833e4d87) | False | Text Box | Endpoint | No | True if non-Windows EFI boot entries detected (Ubuntu, Debian, GRUB, rEFInd, etc.); False otherwise. |
| [SB_WinRE_Enabled](/docs/24259337-1a3f-4c79-bbdd-67faef9347a9) | True | Text Box | Endpoint | No | True if Windows Recovery Environment is enabled; False otherwise. |
| [SB_Present_Conditions](/docs/2657a33b-4fbc-496e-aa89-143f033b0443) | WinREEnabled | Text Box | Endpoint | No | Comma-separated summary of detected boot conditions (e.g., 'PXE, DualBoot/NonWindowsEFI, WinREEnabled'). |
| [SB_PXE_Evidence](/docs/1cd8967a-820e-44da-b3b8-6edd38c578e7) | IPv4 Network | Text Box | Endpoint | No | Detailed boot firmware entries indicating PXE/network boot (from bcdedit output). |
| [SB_DualBoot_Evidence](/docs/4f28adde-7af1-4215-995e-83885b81149a) | EFI\ubuntu\grubx64.efi | Text Box | Endpoint | No | Detailed boot firmware entries indicating non-Windows EFI loaders (from bcdedit output). |
| [SB_Available_Updates](/docs/b6d34e3b-ad95-447c-ad3f-192e217bbffe) | Not exist | Text Box | Endpoint | No | Secure Boot registry value for available UEFI updates; 'Not exist' if key not present. |
| [SB_UEFICA2023_Status](/docs/ce98365e-b160-4bb7-89ad-b2025cbc9c68) | Not exist | Text Box | Endpoint | No | Secure Boot servicing registry value indicating CA 2023 enrollment status; 'Not exist' if key not present. |
| [SB_UEFICA2023_Error](/docs/1b2647ad-2479-47be-b424-d1846aef2325) | Not exist | Text Box | Endpoint | No | Secure Boot servicing registry value showing CA 2023 enrollment errors; 'Not exist' if key not present. |
| [SB_WindowsUEFICA2023_Capable](/docs/3f72d333-4c7c-4232-a127-e8f6b535d4f5) | Not exist | Text Box | Endpoint | No | Secure Boot servicing registry value indicating device hardware CA 2023 capability; 'Not exist' if key not present. |
| [SB_Confidence_Level](/docs/0c21d197-28c0-4dc1-81a9-a8981b0d75a5) | Not exist | Text Box | Endpoint | No | Secure Boot servicing registry confidence level for CA 2023 enrollment; 'Not exist' if key not present. |
| [SB_Confidence_Update_Type](/docs/319e3d2f-d26b-4833-8000-3d05724c47aa) | Not exist | Text Box | Endpoint | No | Secure Boot servicing registry update type for CA 2023; 'Not exist' if key not present. |
| [SB_BucketHash](/docs/d50206c9-70e5-4bcf-8e47-b5ad8343795d) | Not exist | Text Box | Endpoint | No | Secure Boot servicing registry bucket hash for troubleshooting; 'Not exist' if key not present. |
| [SB_Data_Collection_Time](/docs/7ec97bea-bba8-4ce7-88c9-1c3dd9b2c3df) | 2026-05-14 17:51:24 | Text Box | Endpoint | No | Timestamp (yyyy-MM-dd HH:mm:ss) when data was collected. |
| [Boot Environment Audit](/docs/1fd6dff7-dd6e-4d0f-921a-e9a62ebb6e47) | 1 | Text Box | Endpoint | No | Sets this custom field to 1 when the script runs successfully, indicating that the boot environment has been audited. |

### View

| Name | Purpose |
| --- | --- |
| [View: Boot Environment Audit](/docs/fdc93cdc-f5d2-41f1-9599-d6002cf2ac60) | Provides a centralized, single-pane-of-glass dashboard for monitoring the boot environment and security posture of all Windows endpoints based on the populated custom fields. |

### Task

| Name | Purpose |
| --- | --- |
| [Task: Boot Environment Audit](/docs/75123aea-cc54-4b38-bac1-8cefac78f66d) | Executes the system audit script to collect boot, security, and update data, then writes the results directly to the endpoint custom fields. |

### External Scripts

*These helper scripts are dynamically leveraged by the primary task to fetch extended data when required:*

- [Initialize-HPImageAssistant](/docs/92b749f0-2e30-4d4d-8916-fb5f30d85bff)
- [Initialize-DellCommandUpdate](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f)
- [Install-LenovoUpdates](/docs/3640e534-d089-4304-89ba-68d3bc113978)
- [Install-WindowsUpdates](/docs/3ccc8542-1961-4d3f-a54b-4a1bb9a78edd)
- [Get-LatestInstalledCU](/docs/81d82975-889b-49e4-b229-36d4f162a4ff)

## Implementation

### Step 1: Create the Required Custom Fields

Ensure all 25 custom fields listed in the Associated Content section are created in your ConnectWise RMM environment. These act as the destination for the data gathered during the audit. Navigate to `SETTINGS ➞ Custom Fields` to set them up as Endpoint-level text boxes. See the individual custom field documentation links for setup details.

### Step 2: Create the Execution Task

Create the automation task that will run the auditing script. Navigate to `AUTOMATION ➞ Tasks` and implement the [Task: Boot Environment Audit](/docs/75123aea-cc54-4b38-bac1-8cefac78f66d). This task serves as the wrapper that runs the security checks and handles outputting the results into the defined custom fields.

### Step 3: Execute or Schedule the Task

You can now run the **[Boot Environment Audit](/docs/75123aea-cc54-4b38-bac1-8cefac78f66d)** task against your endpoints. You can run it on-demand to fetch immediate boot environment data, or schedule it on a recurring basis.

**Pro Tip for Scheduling:** If you do not want to execute the script repeatedly against machines that have already been successfully audited, schedule the task against a dynamic group of devices where the [Boot Environment Audit](/docs/1fd6dff7-dd6e-4d0f-921a-e9a62ebb6e47) custom field is **not equal to 1**.

Because the [Boot Environment Audit](/docs/1fd6dff7-dd6e-4d0f-921a-e9a62ebb6e47) field is editable, managing your schedule is easy: if you ever need to force a re-audit on a specific machine, simply manually edit that custom field on the endpoint and change the `1` to a `0` (or clear it out). The machine will automatically be picked up during the next scheduled run.

### Step 4: Create the Centralized View

To easily monitor the collected data across your managed devices, configure the custom view. Navigate to `ENDPOINTS ➞ Devices (Preview)`, create a new custom view named **[Boot Environment Audit](/docs/fdc93cdc-f5d2-41f1-9599-d6002cf2ac60)**, and add your newly created custom fields as columns. You can refer to the [View: Boot Environment Audit](/docs/fdc93cdc-f5d2-41f1-9599-d6002cf2ac60) documentation for specific column ordering and filtering instructions.

> **Note:** Views in ConnectWise RMM are strictly user-specific and cannot be shared, imported, or exported. Each technician or user who wants to utilize this single-pane-of-glass dashboard will need to quickly create their own view following the provided documentation.

## FAQs

### General Understanding

**1. What exactly does the Boot Environment Audit solution do?**
> It acts as a comprehensive, automated health check for your Windows devices. It looks under the hood at the lowest levels of the operating system (the boot environment) to ensure critical security measures—like Secure Boot, updated certificates, and OEM firmware—are active, up-to-date, and configured properly.

**2. Does this script install updates or make changes to the endpoint?**
> No. This is strictly a "read-only" auditing tool. It gathers information and reports it back to ConnectWise RMM. It will not install updates, change BIOS settings, or reboot the computer.

**3. Why is auditing the boot environment important?**
> Modern malware often targets the boot process before antivirus software even loads. Ensuring Secure Boot is active and using the latest Microsoft certificates (like the CA 2023 update) prevents unauthorized operating systems or malicious software from hijacking the device at startup.

**4. What operating systems are supported?**
> This solution is designed exclusively for UEFI-based Windows environments (Workstations and Servers).

**5. What does the "Boot Environment Audit" custom field mean when it says "1"?**
> This is a success flag. When this field is marked as "1", it means the auditing script successfully ran on that machine, and the rest of the `SB_` custom fields have been populated with fresh data.

### Finding and Understanding the Data

**6. Where can I view the audit results for a specific machine?**
> You can find all the data by navigating to the specific device in ConnectWise RMM and checking its **Custom Fields** tab. Look for all the fields starting with the `SB_` prefix.

**7. How can I tell if a machine is fully protected by the latest Secure Boot certificates?**
> Look at the `SB_DB_Certificate_Status` and `SB_KEK_Certificate_Status` fields. If they say "Updated", the machine has the newest CA 2023 certificates. If they say "Out of date" or "Not present", the machine is running older, potentially vulnerable security baselines.

**8. Which field tells me if someone can boot the computer from a network?**
> Check the `SB_PXE_Present` field. If it says "True", the machine's firmware allows network booting (PXE). While useful for IT deployments, it can be a security risk if left enabled unnecessarily. The `SB_PXE_Evidence` field will provide the technical details of what the script found.

**9. How do I know if an employee installed a second operating system, like Linux?**
> Look at the `SB_DualBoot_Or_NonWindowsEFI` field. If it is "True", the script detected non-Windows boot loaders (like GRUB, Ubuntu, or Debian). The `SB_DualBoot_Evidence` field will show you exactly which unauthorized bootloader was found.

**10. What does the `SB_Telemetry_Status` field tell me?**
> It indicates whether Windows is actively configured to send diagnostic and usage data back to Microsoft ("Enabled" or "Disabled").

**11. Why do we care if the Windows Recovery Environment (WinRE) is enabled?**
> The `SB_WinRE_Enabled` field checks if WinRE is active. WinRE is critical for remote IT troubleshooting; if a machine fails to boot, a disabled WinRE makes remote recovery nearly impossible.

**12. How do I know how old this audit data is?**
> Check the `SB_Data_Collection_Time` field. It logs the exact date and time (e.g., 2026-05-14 17:51:24) the script last ran and collected the information.

### External Scripts and Updates

**13. How does the script know how many hardware updates are missing?**
> Instead of just guessing, the audit script dynamically downloads and runs vendor-specific external scripts based on the computer's manufacturer to get an accurate count of missing driver and firmware updates.

**14. Which specific vendor tools does the audit leverage?**
> If it detects a Dell, it uses a Dell Command Update helper script. For HP, it uses the HP Image Assistant script. For Lenovo, it uses a Lenovo Updates script.

**15. What happens if the computer isn't a Dell, HP, or Lenovo?**
> The script is smart enough to fall back to a generic `Install-WindowsUpdates` helper script. It will query the standard Microsoft Windows Update service specifically for the "Drivers" category to count available updates.

**16. Why is the script checking for a "November 2025" Cumulative Update?**
> The `SB_Nov_2025_CU_Installed` field is a specific compliance check. Microsoft is enforcing the new CA 2023 Secure Boot certificates, and the November 2025 updates represent a critical baseline for that enforcement.

**17. What is the `Get-LatestInstalledCU` external script doing?**
> This helper script is downloaded to accurately identify the KB number of the most recent Windows update installed on the machine, which then populates the `SB_Current_Cumulative_Update` field.

**18. Why does the script check my BIOS version against a "Supported" version?**
> The CA 2023 Secure Boot update requires specific hardware support. The script compares your current `SB_BiosVersion` against a hosted lookup table of manufacturer minimums (the `SB_CA2023_Supported_BIOS_Version`). If your BIOS is older than the supported version, a firmware update is required before the machine can be fully secured.

### Advanced Technical Fields

**19. What do `SB_Available_Updates` and `SB_UEFICA2023_Status` mean?**
> These fields read directly from hidden Windows registry keys that track the operating system's internal readiness to apply Secure Boot updates. If they say "Not exist", the system hasn't staged the update yet.

**20. What is a `BucketHash` or `Confidence_Level`?**
> These are advanced Microsoft diagnostic values. If a Secure Boot update fails, Windows logs a `BucketHash` and `Confidence_Level` to help Microsoft engineers diagnose why the hardware rejected the security certificate.

**21. Where can I see a quick overview without reading every field?**
> The `SB_Present_Conditions` field gives you a quick, comma-separated summary. For example, it might just say "PXE, WinREEnabled", giving you an instant snapshot of the machine's state.

### Setting Up Your View (Dashboard)

**22. How do I create a dashboard to view all this data across my entire fleet?**
> You need to create a Custom View. In ConnectWise RMM, navigate to **ENDPOINTS ➞ Devices (Preview)**. Refer to the [View: Boot Environment Audit](/docs/fdc93cdc-f5d2-41f1-9599-d6002cf2ac60) documentation to create a new custom view, name it **Boot Environment Audit**, and add all the `SB_` custom fields as columns.

**23. Can I just build the view once and share it with my whole team?**
> No. In ConnectWise RMM, Views are strictly user-specific. They cannot be shared, imported, or exported. Every technician who wants this single-pane-of-glass dashboard will need to quickly build their own view using the documentation.

**24. What filters should I apply to the View?**
> To keep your dashboard clean, add a filter for **Operating System matches Windows**. This audit script only runs on Windows machines, so filtering out Macs and network devices keeps your data relevant.

**25. How can I make the View easier to read on smaller screens?**
> When creating your view, set the **Row Density** to `Compact`. You should also set the primary Sort rule to sort the **Name** column by ASC (ascending) so your devices are grouped logically by name.

## Changelog

### 2026-05-14

- Initial version of the document
