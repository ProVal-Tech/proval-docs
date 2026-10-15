---
id: 'a63278c8-89e1-4cfc-80dc-7158bd88635f'
slug: /a63278c8-89e1-4cfc-80dc-7158bd88635f
title: 'Test VC Runtime'
title_meta: 'Test VC Runtime'
keywords: ['visual-c++', 'vcredist', 'runtime', 'health-check', 'remediation', 'dism', 'sfc', 'windows']
description: 'Checks the Microsoft Visual C++ 2015-2022 runtime for problems and can repair it by reinstalling the runtime. DISM and SFC can optionally be enabled to perform additional Windows system repairs.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-10-15
---

## Overview

This script checks whether the Microsoft Visual C++ 2015-2022 runtime is healthy and can repair it if it is corrupted. Many Windows applications need this runtime to start. The script is part of the [Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96) solution.

## Choose a Mode

The `Remediate` checkbox decides whether the script only checks the runtime or also repairs it.

| `Remediate` | `What Happens` | `Use It When` |
| :--- | :--- | :--- |
| Unchecked | Checks the runtime and reports the result. Nothing on the device changes. | You want to find affected devices without making changes. |
| Checked | Checks the runtime and repairs it if it is corrupted. Healthy devices are left unchanged. | You want to fix affected devices. |

## Optional Repair Components

The `RunDism` and `RunSfc` checkboxes control whether DISM and SFC are executed as part of the remediation process. These options are unchecked by default and will only run when explicitly enabled.

| `RunDism`   | `What Happens`                                    | `Use It When`                                                 |
| --------- | ----------------------------------------------- | ----------------------------------------------------------- |
| Unchecked | Skips the DISM RestoreHealth operation.         | You do not want to run DISM during remediation.             |
| Checked   | Runs DISM RestoreHealth as part of remediation. | You want to use DISM to repair the Windows component store. |

---

| `RunSfc`    | `What Happens`                              | `Use It When`                                                 |
| --------- | ----------------------------------------- | ----------------------------------------------------------- |
| Unchecked | Skips the SFC /scannow operation.         | You do not want to run SFC during remediation.              |
| Checked   | Runs SFC /scannow as part of remediation. | You want to scan and repair protected Windows system files. |

**Important:** These options apply to remediation runs. They do not enable DISM or SFC when `Remediate` is unchecked. Leave both options unchecked if you do not want these repair components to run during automated remediation.

## What the Repair Does

When the runtime is corrupted and `Remediate` is checked, the script:

1. Downloads and installs the latest Visual C++ runtime from Microsoft.
2. Optionally runs DISM RestoreHealth and SFC /scannow if their respective checkboxes (`RunDism` and `RunSfc`) are enabled.
3. Checks the runtime again to confirm the repair worked.
4. Deletes the files it downloaded.

The script never restarts the device. If a restart is needed to finish the repair, the activity output says so.

## Understand the Results

After each run, the result is saved to the [cPVAL VC Runtime Health Status](/docs/81660c29-6528-4cb0-9dbe-964ba1b4588e) custom field.

| Result | Exit Code | What It Means |
| :--- | :--- | :--- |
| `Healthy` | `0` | The runtime is working. No action is needed. |
| `Corrupted` | `1` | The runtime is damaged or missing files. Run the script with `Remediate` checked to repair it. |

## Before You Run the Script

- The device needs internet access. Repair runs also download installers from Microsoft.
- Repair runs can take 30 minutes or more. Set the automation timeout to allow for this.
- Keep the automation's architecture set to 64-bit. The script stops if it runs as 32-bit.

## Troubleshooting

| Problem | Cause | Solution |
| :--- | :--- | :--- |
| The activity shows as failed after a repair run. | The script records the original corruption as an error, even when the repair works. | Look for `Visual C++ runtime state: Healthy` in the activity output. This means the repair worked. |
| The result is still `Corrupted` after a repair run. | A repair step failed, or the device needs a restart to finish. | Check the activity output for the failed step. Restart the device if the output asks for it, then run the script again. |
| Repairs fail on devices that get updates from WSUS (Windows Server Update Services). | DISM cannot download repair files through WSUS when `RunDism` is enabled. | In Group Policy, enable **Specify settings for optional component installation and component repair**. Select the option to download repair content directly from Windows Update. |
| The script ends with an error before showing a result. | The device could not download the script, or security software blocked it. | Check the device's internet access and security software, then run the script again. |

## Sample Run

> **Note:** The [Windows Workstations](/docs/0f9b6490-325a-4863-8d1a-e4e38f21f0e6) and [Windows Servers](/docs/8be26d10-ce6c-49b1-99ac-bd5b3bdafc2d) compound conditions run this script automatically on devices in scope. Run it manually to check or repair a single device.

![Sample Screenshot](../../../static/img/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f/sample-run.webp)

## Dependencies

- [Test-VcRuntime](/docs/bb5b1652-515d-4981-95ca-a983d1e04b84)
- [Custom Field: cPVAL VC Runtime Health Status](/docs/81660c29-6528-4cb0-9dbe-964ba1b4588e)
- [Custom Field: cPVAL VC Runtime Remediation](/docs/c6895ff6-39ae-403c-9436-4830e1a84d4c)
- [Solution: Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96)

## Custom Fields

| Custom Field | Type | Example | Scope | Available Options | Editable | Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL VC Runtime Health Status](/docs/81660c29-6528-4cb0-9dbe-964ba1b4588e) | Text | `Healthy` | Device | N/A | No | Shows the result of the latest run: `Healthy` or `Corrupted`. |
| [cPVAL VC Runtime Remediation](/docs/c6895ff6-39ae-403c-9436-4830e1a84d4c) | Dropdown | `Windows` | System, Organization, Location, Device | `Windows`, `Windows Servers`, `Windows Workstations`, `Disable` | Yes | Selects which devices the solution runs on. Set to `Disable` to exclude a device or location. |

## Script Variables

| Name | Type | Example | Default | Available Options | Description |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Remediate` | Checkbox | `False` | `False` | `True`, `False` | Check to repair a corrupted runtime. Leave unchecked to only check it. |
| `RunDism` | Checkbox | `False` | `False` | `True`, `False` | Check to run DISM RestoreHealth as part of the remediation. (Opt-in) |
| `RunSfc` | Checkbox | `False` | `False` | `True`, `False` | Check to run SFC scannow as part of the remediation. (Opt-in) |

> **💡 Note:** Do not edit the script file. It is digitally signed, and any change stops it from running.

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/test-vc-runtime.ps1)

## Output

- **Activity Details:** The result and a log of each step.
- **Custom Field:** `cPVAL VC Runtime Health Status` shows `Healthy` or `Corrupted`.

## Changelog

### 2026-10-15

- Added optional `RunDism` and `RunSfc` checkboxes to control DISM and SFC execution during remediation.

### 2026-09-28

- Initial version of the document
