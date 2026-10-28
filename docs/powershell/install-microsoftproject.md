---
id: '37da9163-8eda-45cf-bc0f-7103282b0d85'
slug: /37da9163-8eda-45cf-bc0f-7103282b0d85
title: 'Install-MicrosoftProject'
title_meta: 'Install-MicrosoftProject'
keywords: ['microsoft-project', 'project', 'microsoft-365', 'office', 'office-deployment-tool', 'install']
description: 'Installs Microsoft Project for Microsoft 365, adding it to an existing Microsoft 365 Apps installation or installing it on its own.'
tags: ['software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-28
---

## Overview

This script installs Microsoft Project for Microsoft 365, the Project desktop app included with Project Plan 3 and Project Plan 5. It uses Microsoft's Office Deployment Tool, so no installation files need to be prepared in advance.

**Key Features:**

- **Works with or without Office:** Adds Project to an existing Microsoft 365 Apps installation, matching its 32-bit or 64-bit version and update channel. On computers without Microsoft 365 Apps, Project is installed on its own.
- **Safe to run again:** Makes no changes when Project for Microsoft 365 is already installed.
- **Always current:** Downloads the latest Office Deployment Tool from Microsoft and checks its digital signature before running it.
- **Silent:** Installs without any windows or prompts for the user.
- **Language choice:** Installs Project in English (United States) by default, or in the language you choose.
- **Optional app shutdown:** `-ForceAppShutdown` closes open Office apps that would otherwise block the install.

## Requirements

- PowerShell version 5.1 or later.
- Windows 10, Windows 11, or a Windows Server version supported by Microsoft 365 Apps.
- Administrative privileges (SYSTEM context).
- Network access to **Microsoft's Office content delivery network** (`officecdn.microsoft.com`) to download the Office Deployment Tool and Project.
- Network access to **ProVal's File Server** to download the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to `www.powershellgallery.com` (queried by `Install-PSGalleryModule` to download the Strapper module).
- A Project Plan 3 or Project Plan 5 license for each user who opens Project.

## Dependencies

- [PowerShell: Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)

## Payload Usage

Below are usage examples:

### Example 1

Installs Project in English (United States). If Office apps are open, the install fails and nothing is changed.

```powershell
.\Install-MicrosoftProject.ps1
```

### Example 2

Installs Project in French and closes any open Office apps that block the install.

```powershell
.\Install-MicrosoftProject.ps1 -Language 'fr-fr' -ForceAppShutdown
```

### Example 3

Installs Project in the same language as Windows.

```powershell
.\Install-MicrosoftProject.ps1 -Language 'MatchOS'
```

### Example 4

Installs Project in the same languages as the Office apps already on the computer.

```powershell
.\Install-MicrosoftProject.ps1 -Language 'MatchInstalled'
```

## What Happens When You Run the Script

1. The script installs or updates the Strapper logging module.
2. It checks whether Project for Microsoft 365 is already installed. If it is, the script logs the installed version and stops without changing anything.
3. It downloads the latest Office Deployment Tool from Microsoft and confirms that the file is signed by Microsoft.
4. It installs Project silently:
   - **Microsoft 365 Apps installed:** Project is added with the same 32-bit or 64-bit version and update channel. The Office apps are also updated to the latest version of that channel.
   - **Microsoft 365 Apps not installed:** Project is installed on Current Channel. It's 64-bit, unless Windows is 32-bit or the computer has less than 4 GB of memory.
5. It confirms that Project is installed and logs the installed version.

You'll know it worked when **Project** appears in the Start menu. Users sign in with their work account the first time they open it.

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `Language` | `fr-fr` | A language code supported by Project, `MatchOS`, or `MatchInstalled` | False | `en-us` | String | Language to install Project in. `MatchOS` uses the Windows language, and `MatchInstalled` uses the languages of the installed Office apps. See [Good to Know](#good-to-know) for unsupported languages. |
| `ForceAppShutdown` | `-ForceAppShutdown` | Switch | False | False | Switch | Closes open Office apps that block the install. Unsaved work in those apps can be lost. |

## Good to Know

- Project supports fewer languages than the other Office apps. For example, English (United Kingdom) `en-gb`, French (Canada) `fr-ca` and Spanish (Mexico) `es-mx` aren't available, and the install fails if one of them is selected, including through `MatchOS` or `MatchInstalled`. Project supports the same languages as Visio, listed in [Display languages supported in the Visio desktop app](https://support.microsoft.com/office/a921983e-fd5d-45ef-8af1-cedf70c53d75).
- Open Office apps, such as Outlook or Word, block the install. Run the script outside working hours, or use `-ForceAppShutdown`.
- Adding Project to an existing installation also updates the Office apps to the latest version of their update channel.
- On computers without Microsoft 365 Apps, Project is installed on Current Channel. To use a different update channel, install Microsoft 365 Apps on that channel first.
- Project works only for users with a Project Plan 3 or Project Plan 5 license. Other users are asked to sign in with an account that has one.

## Troubleshooting

| Problem | Cause | Solution |
| ------- | ----- | -------- |
| `The Office Deployment Tool exited with code <code>. Open Office apps block the install unless -ForceAppShutdown is used.` | Office apps were open during the install. | Close the Office apps, or rerun the script with `-ForceAppShutdown`. |
| `The Office Deployment Tool exited with code <code>.` while no Office apps were open | The selected language isn't supported by Project, another version of Project is installed, or the computer lost its connection to Microsoft. | Check the setup log in the temp folder (`C:\Windows\Temp` when the script runs as SYSTEM). Choose a supported language or remove the other version of Project, then rerun the script. |
| `Failed to download the Office Deployment Tool from https://officecdn.microsoft.com/pr/wsus/setup.exe.` | A firewall or web filter blocks Microsoft's Office content delivery network. | Allow HTTPS access to `officecdn.microsoft.com` and rerun the script. |
| `The Office Deployment Tool at <path> does not have a valid Microsoft signature.` | The download was incomplete or was changed by a web filter or security product. | Rerun the script. If it fails again, exclude `officecdn.microsoft.com` from HTTPS inspection. |
| `The Office Deployment Tool finished, but Microsoft Project for Microsoft 365 is not in the uninstall registry keys.` | The install didn't complete. | Check the setup log in the temp folder (`C:\Windows\Temp` when the script runs as SYSTEM), then rerun the script. |
| Project asks the user to sign in and doesn't open | The user has no Project Plan 3 or Project Plan 5 license. | Assign the license to the user in the Microsoft 365 admin center. |

## Output

Project for Microsoft 365 is installed on the computer. The log ends with the installed Project name and version, or says that Project was already installed.

The Office Deployment Tool (`setup.exe`) and its configuration file (`configuration.xml`) are kept in `C:\ProgramData\_Automation\Script\Install-MicrosoftProject`. The Office Deployment Tool writes its setup logs to the temp folder of the account that runs the script.

Log files (next to the script):

- `.\Install-MicrosoftProject-log.txt`
- `.\Install-MicrosoftProject-error.txt`

## Changelog

### 2026-10-28

- Initial version of the document
