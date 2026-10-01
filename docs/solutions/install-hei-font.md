---
id: 'f81e8a64-f17b-4f0f-ba46-be61933e0582'
slug: /f81e8a64-f17b-4f0f-ba46-be61933e0582
title: 'Install HEI Font'
title_meta: 'Install HEI Font'
keywords: ['install', 'font', 'hei']
description: 'This content is designed to install font on Windows.'
tags: ['installation', 'windows', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-25-09
---

## Purpose

This content is designed to install font on Windows.

## Associated Content

### Compound Conditions

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [Install HEI Font - Windows Workstations](/docs/8dad6f14-ff98-4427-a048-aa36af3d77a7) | Compound Condition | This compound condition is built to run th automation to install HEI font. |

### Automation

| Content                                                             | Type                | Function                                                                               |
| ------------------------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| [Install HEI Font](/docs/8979e262-82e5-48a4-9692-099a63fafc07)  | Script  | This script used to Install-HEI Font on a Windows system. |

### Custom Field

| Content  | Type  | Function    |
| ----------------- | ----------------------- | ------------------- |
| [cPVAL HEI Font Deployment](/docs/a3224e85-d9a6-44fd-83b5-bd9963c0f5a9)  | Custom Field | Controls deployment logic during automation and compound condition evaluation.              |

## Implementation

### Step 1: Create the following Custom Field

- [cPVAL HEI Font Deployment](/docs/a3224e85-d9a6-44fd-83b5-bd9963c0f5a9) 

### Step 2: Import Automation Scripts

Import the following automation scripts:

- [Install HEI Font](/docs/8979e262-82e5-48a4-9692-099a63fafc07)

### Step 3: Configure the following Compound Conditions

Create three compound conditions targeting the appropriate device policies:

- [Install HEI Font - Windows Workstations](/docs/8dad6f14-ff98-4427-a048-aa36af3d77a7)

## FAQ

## FAQ

**Q: What does this automation do?**

A: This automation installs the HEI font on Windows systems based on the configured deployment settings.

**Q: How is the HEI font deployed to the target machine?**

A: The font ZIP file is first transferred to a specified folder on the target machine using the File Transfer option. The folder path is then provided to the installation script as a parameter.

**Q: Where does the installation script come from?**

A: The automation runs `Install-Font.ps1` from the content repository to install the HEI font.

**Q: How does the script know where the font files are located?**

A: The `Fontdirectory` parameter specifies the folder path where the font ZIP file has been transferred. The script uses this path to locate the font files for installation.

**Q: Can I control which machines receive the HEI font?**

A: Yes. The `cPVAL HEI Font Deployment` custom field is used to control whether the HEI font should be installed on a machine. Machines set to Disabled will not have the HEI font installed.

**Q: What happens if the HEI Font Deployment custom field is set to Disabled?**

A: The automation will not install the HEI font on that machine.

**Q: Can the HEI font installation be triggered manually for a single machine?**

A: Yes. The Install HEI Font automation can be run manually on an individual Windows machine when required.

**Q: Does the HEI font installation require a reboot?**

A: No. The font installation is designed to run without requiring a system reboot under normal circumstances.

**Q: Where is the font ZIP file stored before installation?**

A: The font ZIP file is transferred to the folder specified by the `Fontdirectory` parameter on the target machine before the installation script is executed.

**Q: What operating systems are supported?**

A: This automation is designed to install the HEI font on Windows systems.


## Changelog

### 2026-25-09

- Initial version of the document
