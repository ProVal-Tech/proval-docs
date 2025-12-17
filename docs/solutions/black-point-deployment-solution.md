---
id: 'b9f13c4b-742d-4118-be8e-0c03e43ded17'
slug: /b9f13c4b-742d-4118-be8e-0c03e43ded17
title: 'BlackPoint SnapAgent Deployment'
title_meta: 'BlackPoint SnapAgent Deployment'
keywords: ['agent','windows','deployment','blackpoint']
description: 'This content is designed to install Blackpoint on Windows and macOS devices, and also supports uninstallation when required.'
tags: ['windows','security','installation','uninstallation','macos']
draft: false
unlisted: false
---

## Purpose

This content is designed to manage the deployment of Blackpoint across both Windows and MacOS devices. It automates the installation process to ensure consistent security coverage across supported endpoints. The uninstallation process must be performed manually by running script on target device and is not automated.

## Associated Content

### Compound Conditions

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [BlackPoint SnapAgent Installer - MacOS](/docs/c4c8973c-059f-4d8b-a091-8ad01760831b)               | Compound Condition                  | Used to target eligible macOS devices for automated Blackpoint installation.                |
| [BlackPoint SnapAgent Installer - Windows Server](/docs/729cb4c0-adc7-4c9b-9274-5dd4ff093ca3)      | Compound Condition                  | Used to target supported Windows Server devices for automated Blackpoint installation.      |
| [BlackPoint SnapAgent Installer - Windows Workstations](/docs/85a2de03-5004-4e90-9598-9de731bb5b6b) | Compound Condition                  | Used to target supported Windows Workstation devices for automated Blackpoint installation. |

### Automation

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [BlackPoint SnapAgent Installer - Windows](/docs/06b6d11b-92b0-478d-9323-3f599d5caa46)                  | Script                  | Installs the Blackpoint SNAP agent on Windows devices.                                      |
| [BlackPoint SnapAgent Installer - MacOS](/docs/22a99cac-7acf-4251-a790-41a3b651f183)                        | Script                  | Installs the Blackpoint SNAP agent on macOS devices.                                        |
| [Blackpoint SnapAgent - Uninstall - (MacOS)](/docs/22f7e724-120f-4d80-b3fc-c6dad6944ace)          | Script                  | Used to manually uninstall Blackpoint SNAP-Defense from macOS devices when required.        |
| [Blackpoint SnapAgent - Uninstall - (Windows)](/docs/321970ff-b69d-4fb9-b9e7-6e1c3a581468)       | Script                  | Used to manually uninstall Blackpoint SNAP-Defense from Windows devices when required.      |

### Custom Field

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [cPVAL Blackpoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)  | Custom Field | Controls deployment logic during automation and compound condition evaluation.              |
| [cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)   |Custom Field | Stores the Blackpoint AccountUID used during authorization and deployment.                  |
| [cPVAL BP Mac Auth Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)   | Custom Field | Stores the Blackpoint macOS authentication token used by the macOS installer.               |
| [cPVAL BP Win CompanyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)  | Custom Field | Stores the Windows-specific Company EXE installer reference for Blackpoint deployment.      |

## Implementation

### Step 1: Create the following Custom Field

- [cPVAL Blackpoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)
- [cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [cPVAL BP Mac Auth Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)
- [cPVAL BP Win CompanyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)

### Step 2: Import Automation Scripts

Import the following automation scripts:

- [BlackPoint SnapAgent Installer - Windows](/docs/06b6d11b-92b0-478d-9323-3f599d5caa46)
- [BlackPoint SnapAgent Installer - MacOS](/docs/22a99cac-7acf-4251-a790-41a3b651f183)
- [Blackpoint SnapAgent - Uninstall - (MacOS)](/docs/22f7e724-120f-4d80-b3fc-c6dad6944ace)
- [Blackpoint SnapAgent - Uninstall - (Windows)](/docs/321970ff-b69d-4fb9-b9e7-6e1c3a581468)

### Step 3: Configure the following Compound Conditions

Create three compound conditions targeting the appropriate device policies:

- [BlackPoint SnapAgent Installer - MacOS](/docs/c4c8973c-059f-4d8b-a091-8ad01760831b)
- [BlackPoint SnapAgent Installer - Windows Server](/docs/729cb4c0-adc7-4c9b-9274-5dd4ff093ca3)
- [BlackPoint SnapAgent Installer - Windows Workstations](/docs/85a2de03-5004-4e90-9598-9de731bb5b6b)

## FAQ

**Q: Does this automation include an automatic uninstall process?**

A: No. Uninstallation is not automated and will need to be executed manually using the provided removal script when appropriate.

**Q: What happens if Blackpoint is already installed on the device?**

A: The detection script validates the installation and prevents unnecessary redeployment.

**Q: Can I deploy only to selected operating systems?**

A: Yes. The custom field supports selective deployment using values Windows, macOS, or Both.

**Q: How often does the system check installation status?**

A: The compound condition continuously monitors agent presence and triggers remediation only when required.

**Q: Where do install parameters such as organization key or token come from?**

A: These values are typically stored in protected custom fields and injected into the installer by the remediation script.

**Q: Does the deployment process interrupt users or require reboot?**

A: Installation runs silently without interrupting the user and does not require a reboot under normal circumstances.

**Q: Can this be manually triggered for a single device?**

A: Yes. Both installation and uninstallation tasks can be run on-demand via Automation.
