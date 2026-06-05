---
id: 'ea3196ae-8489-4029-8b1d-8be935518298'
slug: /ea3196ae-8489-4029-8b1d-8be935518298
title: 'Install-GenericMSIApplication'
title_meta: 'Install-GenericMSIApplication'
keywords: ['install', 'msi', 'msi-installer', 'generic-msi-installer', 'msi-template', 'msi-installation-template']
description: 'Installs a generic MSI application, validates the installation via registry, and cleans up.'
tags: ['installation', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-05
---

## Overview

Installs an MSI application on Windows, confirms it installed correctly, optionally checks version and service status, and then removes temporary files. Run this script once from your RMM or as an administrator.

---

## Requirements

- Windows with PowerShell 5.0 or later
- Must be run as **Administrator**
- Internet access only if:
  - You provide a web URL for `-InstallerPath`
  - The `Strapper` module needs to be installed or updated from PSGallery

---

## What It Does

| Step | What happens |
|---|---|
| **Prepare** | Creates a working folder under `C:\ProgramData\_Automation\App\<ApplicationName>` |
| **Acquire MSI** | Uses `-InstallerPath` as URL, local full path, or filename in the script folder |
| **Install** | Runs `msiexec` silently with `/qn /norestart` and writes an MSI log |
| **Validate** | Confirms install by checking uninstall registry entries for `-ApplicationName` |
| **Optional Checks** | If provided, validates `-ApplicationVersion` and confirms `-ServiceName` is running |
| **Cleanup** | Removes the temporary working directory |

The script handles logging automatically and supports standard MSI return codes.

---

## Basic Usage

### Install using a download URL

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'My Custom App' -InstallerPath 'https://example.com/app.msi'
```

Downloads the MSI, installs it silently, confirms the app appears in uninstall entries, and cleans up.

---

### Install using a local full path

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'RMM Agent' -InstallerPath 'C:\Temp\agent_installer.msi'
```

Copies the local MSI into the working folder and installs it silently.

---

### Install using a filename in the script folder

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'My App' -InstallerPath 'MyAppInstaller.msi'
```

Looks for the file in the script folder and installs it.

---

### Install with MSI properties

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'RMM Agent' -InstallerPath 'C:\Temp\agent_installer.msi' -AdditionalParameters 'SITETOKEN=12345'
```

Adds your custom MSI properties after the default silent install parameters.

---

### Validate minimum version

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'My Custom App' -InstallerPath 'https://example.com/app.msi' -ApplicationVersion '1.2.0'
```

Fails if the installed version is below `1.2.0`.

---

### Validate a service is running

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'My Service App' -InstallerPath 'https://example.com/svc.msi' -ServiceName 'MySvcApp'
```

Fails if the service is missing or not in the `Running` state.

---

## Parameters

| Parameter | Required | Default | Description |
|---|---|---|---|
| `-ApplicationName` | Yes | - | App display name to match in uninstall entries for validation |
| `-InstallerPath` | Yes | - | MSI source as a URL, full local path, or filename in the script folder |
| `-ApplicationVersion` | No | - | Minimum version expected after install |
| `-AdditionalParameters` | No | - | Extra MSI properties or arguments added to the install command |
| `-ServiceName` | No | - | Service to verify exists and is running after installation |
| `-WhatIf` | No | Off | Shows what would happen without running the installation |

---

## Preview Changes Without Making Them

Append `-WhatIf` to preview actions without installing:

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'My Custom App' -InstallerPath 'https://example.com/app.msi' -WhatIf
```

---

## Log Files

The script writes two log files in the same folder it runs from:

```PlainText
Install-GenericMSIApplication-log.txt    ← General activity and results
Install-GenericMSIApplication-error.txt  ← Errors only
```

An MSI verbose log is also written under ProgramData in the script working folder, for example:

```PlainText
C:\ProgramData\_Automation\App\My_Custom_App\My_Custom_App_install.log
```

---

## Common Scenarios

**Installer is in the same script folder** - pass only the filename:

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'Line of Business App' -InstallerPath 'LOBApp.msi'
```

**Need to pass tenant/site/license properties** - use `-AdditionalParameters`:

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'Agent App' -InstallerPath 'C:\Temp\agent.msi' -AdditionalParameters 'SITETOKEN=12345 TENANTID=abcd'
```

**Install succeeds but app not found in validation** - verify `-ApplicationName` matches the installed display name in Programs and Features.

**Need service-level validation** - provide `-ServiceName` to enforce post-install service health:

```powershell
.\Install-GenericMSIApplication.ps1 -ApplicationName 'My Service App' -InstallerPath 'https://example.com/svc.msi' -ServiceName 'MySvcApp'
```

## Changelog

### 2026-06-05

- Initial version of the document
