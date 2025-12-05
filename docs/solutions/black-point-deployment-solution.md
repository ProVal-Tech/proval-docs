---
id: 'b9f13c4b-742d-4118-be8e-0c03e43ded17'
slug: /b9f13c4b-742d-4118-be8e-0c03e43ded17
title: 'BlackPoint Agent Deployment'
title_meta: 'BlackPoint Agent Deployment'
keywords: ['agent','windows','deployment','blackpoint']
description: 'This content is designed to install Blackpoint on Windows and macOS devices, and also supports uninstallation when required.'
tags: ['windows','security','installations','uninstalation','macos']
draft: true
unlisted: false
---

## Purpose

This content is designed to manage the deployment of Blackpoint across both Windows and macOS devices. It automates the installation process to ensure consistent security coverage across supported endpoints. While it includes support considerations for removal, the uninstallation process must be performed manually and is not automated within this task. By centralizing deployment, this content simplifies management and helps maintain a standardized security posture throughout the environment.

## Associated Content

**Compound Conditions**

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [Compound Condition - BlackPoint SNAP Installer - MacOS](docs/85a2de03-5004-4e90-9598-9de731bb5b6b)               | Policy                  | Used to target eligible macOS devices for automated Blackpoint installation.                |
| [Compound Condition - BlackPoint SNAP Installer - Windows Server](docs/d858853c-665a-4283-a653-6655c2477993)      | Policy                  | Used to target supported Windows Server devices for automated Blackpoint installation.      |
| [Compound Condition - BlackPoint SNAP Installer - Windows Workstations](docs/85a2de03-5004-4e90-9598-9de731bb5b6b) | Policy                  | Used to target supported Windows Workstation devices for automated Blackpoint installation. |

**Automation**

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [Automation - BlackPoint SNAP Installer - Windows](docs/06b6d11b-92b0-478d-9323-3f599d5caa46)                  | Script                  | Installs the Blackpoint SNAP agent on Windows devices.                                      |
| [Automation - BlackPoint SNAP Installer - MacOS](docs/22a99cac-7acf-4251-a790-41a3b651f183)                        | Script                  | Installs the Blackpoint SNAP agent on macOS devices.                                        |
| [Automation - Blackpoint - SNAP-Defense - Uninstall - (macOS)](docs/22f7e724-120f-4d80-b3fc-c6dad6944ace)          | Script                  | Used to manually uninstall Blackpoint SNAP-Defense from macOS devices when required.        |
| [Automation - Blackpoint - SNAP-Defense - Uninstall - (Windows)](docs/321970ff-b69d-4fb9-b9e7-6e1c3a581468)       | Script                  | Used to manually uninstall Blackpoint SNAP-Defense from Windows devices when required.      |

**Custom Field**

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [Custom Field - cPVAL Blackpoint Deployment](docs/d858853c-665a-4283-a653-6655c2477993)                         | Custom Field | Controls deployment logic during automation and compound condition evaluation.              |
| [Custom Field - cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)                                   |Custom Field | Stores the Blackpoint AccountUID used during authorization and deployment.                  |
| [Custom Field - cPVAL BP Mac Auth Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)                               | Custom Field | Stores the Blackpoint macOS authentication token used by the macOS installer.               |
| [Custom Field - cPVAL BP Win CompanyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)                                | Custom Field | Stores the Windows-specific Company EXE installer reference for Blackpoint deployment.      |

## Implementation

### Step 1: Create the following Custom Field

- Custom Field - [cPVAL Blackpoint Deployment](docs/d858853c-665a-4283-a653-6655c2477993)
- Custom Field - [cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- Custom Field - [cPVAL BP Mac Auth Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)
- Custom Field - [cPVAL BP Win CompanyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)

### Step 2: Import Automation Scripts

Import the following automation scripts:

- Automation - [BlackPoint SNAP Installer - Windows](docs/06b6d11b-92b0-478d-9323-3f599d5caa46)
- Automation - [BlackPoint SNAP Installer - MacOS](docs/22a99cac-7acf-4251-a790-41a3b651f183)
- Automation - [Blackpoint - SNAP-Defense - Uninstall - (macOS)](docs/22f7e724-120f-4d80-b3fc-c6dad6944ace)
- Automation - [Blackpoint - SNAP-Defense - Uninstall - (Windows)](docs/321970ff-b69d-4fb9-b9e7-6e1c3a581468)

### Step 3: Configure the following Compound Conditions

Create three compound conditions targeting the appropriate device policies:

- Compound Condition - [BlackPoint SNAP Installer - MacOS](docs/85a2de03-5004-4e90-9598-9de731bb5b6b)
- Compound Condition - [BlackPoint SNAP Installer - Windows Server](docs/d858853c-665a-4283-a653-6655c2477993)
- Compound Condition - [BlackPoint SNAP Installer - Windows Workstations](docs/85a2de03-5004-4e90-9598-9de731bb5b6b)

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

A: Yes. Both installation and uninstallation tasks can be run on-demand via Automation