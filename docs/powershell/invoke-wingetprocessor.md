---
id: '8496c2e9-0e52-4961-a1f1-4a95296e8cf7'
slug: /8496c2e9-0e52-4961-a1f1-4a95296e8cf7
title: 'Invoke-WingetProcessor'
title_meta: 'Invoke-WingetProcessor'
keywords: ['winget', 'package', 'install', 'update']
description: 'Documentation for the Invoke-WingetProcessor command to manage software packages using Winget in PowerShell.'
tags: ['installation', 'software', 'update']
draft: false
unlisted: false
---

## Description

**Invoke-WingetProcessor** is a powerful PowerShell automation tool designed to manage applications on Windows devices. It acts as a "portable" wrapper for the Windows Package Manager (WinGet), allowing users to install, update, and uninstall software without needing to manually install WinGet or its dependencies beforehand.

This script is built for reliability. It automatically fetches all necessary tools (WinGet, 7-Zip, Visual C++ runtimes) and runs them in a temporary environment. This makes it ideal for RMM (Remote Monitoring and Management) tools, system administrators, and automated deployment scenarios where the state of the target machine is unknown.

### Features

* **Zero-Dependency Execution:** Automatically downloads and sets up a portable version of WinGet, 7-Zip, and Microsoft VCLibs.
* **Flexible Installation:** Install applications by accurate **Package ID** (e.g., `Mozilla.Firefox`) or friendly **Name** (e.g., `Firefox`).
* **Bulk Updates:** One-click command to update all compatible software on the system.
* **Import/Export:** Create a "snapshot" of installed apps on one machine (Export) and replicate it on another (Import).
* **Smart Logic:** Checks if an app is already installed before trying to install it again (idempotency).
* **Logging:** Generates detailed logs (`Invoke-WingetProcessor-log.txt`) for auditing and troubleshooting.

---

## Requirements

* **OS:** Windows 10 Version 1709 or newer.
* **Permissions:** Must be run as **Administrator** (or SYSTEM context in RMM tools).
* **Network:** Internet access is required to download the WinGet tools and the applications themselves.

---

## Process

The script follows a rigorous 5-stage process to ensure success, even on clean or restricted systems.

### 1. Initialization & Security Setup

Before any changes are made, the script prepares the environment:

* **Security Protocols:** It forces the system to use **TLS 1.2** or **TLS 1.3** for secure network communication. This prevents download errors on older Windows versions.
* **Logging Module:** It installs or updates a helper module named `Strapper`. This module is responsible for writing clean, readable logs to the disk.
* **Directory Setup:** It creates a dedicated working folder in `C:\ProgramData\_automation\script\winget`. All temporary files are stored here to avoid cluttering the user's desktop or Temp folders.

### 2. Dependency Management (The "Portable" Engine)

The script assumes the computer has *nothing* installed. It builds its own toolkit:

* **WinGet Download:** It fetches the very latest version of the WinGet application directly from the official Microsoft GitHub repository.
* **Archiving Tools:** It downloads a portable version of **7-Zip**. It does *not* install 7-Zip on the system; it just uses the executable file to open the WinGet installer.
* **System Libraries:** It checks for **Microsoft VCLibs** and **Visual C++ Redistributables**. If these are missing, the script downloads and installs them silently. WinGet cannot run without these.

### 3. Extraction & Assembly

Once the files are downloaded, the script assembles them:

* It uses the portable 7-Zip tool to "unzip" the WinGet installer (which is technically an MSIX bundle).
* It intelligently detects if the computer is **64-bit** or **32-bit** and extracts the correct `AppInstaller` file.
* It verifies that `winget.exe` is present and functional by running a test command.

### 4. Execution Logic

Now that the engine is running, the script performs the task you requested:

* **If Installing:** It checks if the app is already there. If not, it installs it. If it is there, the script checks your settings to see if it should update it or leave it alone.
* **If Uninstalling:** It verifies the app exists before trying to remove it, preventing "File not found" errors.
* **If Updating All:** It scans the entire system for outdated software and triggers updates for everything found in the WinGet repository.
* **If Exporting:** It scans the system and saves a list of all apps to a JSON file (e.g., `C:\Apps.json`).
* **If Importing:** It reads a JSON file and sequentially installs every app listed inside it.

### 5. Cleanup

After the job is done, the script is a "good guest":

* It deletes the downloaded installers, zip files, and temporary executables.
* It leaves the system clean, saving only the Log files for your review.

---

## Usage Examples

### 1. Install an Application (Best Practice)

Use the **Package ID** for the most accurate results.

```powershell
.\Invoke-WingetProcessor.ps1 -Install -PackageId 'Google.Chrome'

```

### 2. Install by Name

Use the display name if you don't know the ID.

```powershell
.\Invoke-WingetProcessor.ps1 -Install -Name 'Zoom'

```

### 3. Update All Applications

Scans the computer and updates every app it can manage.

```powershell
.\Invoke-WingetProcessor.ps1 -UpdateAll

```

### 4. Uninstall an Application

Removes the software silently.

```powershell
.\Invoke-WingetProcessor.ps1 -Uninstall -PackageId 'Spotify.Music'

```

### 5. Export Installed Apps to a List

Creates a backup list of your apps.

```powershell
.\Invoke-WingetProcessor.ps1 -Export 'C:\Temp\MyApps.json'

```

### 6. Install Apps from a List

Restores apps from a previously exported file.

```powershell
.\Invoke-WingetProcessor.ps1 -Import 'C:\Temp\MyApps.json'

```

### 7. Install with Force Update and Custom Arguments

Installs an application (e.g., VS Code) for all users (`--scope machine`). If the application is already installed, the `-AllowUpdate` switch forces it to upgrade to the latest version immediately.

```powershell
.\Invoke-WingetProcessor.ps1 -Install -PackageId 'Microsoft.VisualStudioCode' -AllowUpdate -OptionalParameter @('--scope', 'machine')

```

---

## Parameters

| Parameter | Example | ParameterSetName | Required | ValidSet | Type | Description |
| --- | --- | --- | --- | --- | --- | --- |
| `PackageId` | `'Mozilla.Firefox'` | `InstallByPackage`, `UninstallByPackage` | True |  | `String[]` | One or more WinGet package IDs to install or uninstall. Use this for precise identification. |
| `Name` | `@('Firefox', 'Zoom')` | `InstallByName`, `UninstallByName` | True |  | `String[]` | One or more package names to install or uninstall. Use this when you know the display name. |
| `AllowUpdate` | `-AllowUpdate` | `InstallByImport`, `InstallByPackage`, `InstallByName` | True (Import), False (Others) |  | `Switch` | Allows updating packages if they are already installed. Without this, existing packages are skipped. |
| `Install` | `-Install` | `InstallByPackage`, `InstallByName` | True |  | `Switch` | Specifies that the operation should install the specified packages. |
| `Source` | `'winget'` | `InstallByPackage`, `InstallByName`, `UpdateAll` | False | `msstore`, `winget` | `String` | Specifies the repository source (e.g., msstore or winget) for package operations. |
| `Uninstall` | `-Uninstall` | `UninstallByPackage`, `UninstallByName` | True |  | `Switch` | Specifies that the operation should uninstall the specified packages. |
| `UpdateAll` | `-UpdateAll` | `UpdateAll` | True |  | `Switch` | Updates all WinGet-compatible applications installed on the system. |
| `Import` | `'C:\Temp\Apps.json'` | `InstallByImport` | True |  | `String` | Path to a JSON file containing a list of packages to import and install. |
| `Export` | `'C:\List.json'` | `Export` | True |  | `String` | Path where the list of installed packages will be exported as a JSON file. |
| `OptionalParameter` | `@('--scope', 'machine')` | `InstallByPackage`, `InstallByName`, `UpdateAll`, `UninstallByName`, `UninstallByPackage` | False |  | `String[]` | Additional parameters to pass directly to WinGet commands. |

---

## Output

Troubleshooting logs are saved to the script's directory (or the current execution path):

* `.\Invoke-WingetProcessor-log.txt`: Standard success messages and steps.
* `.\Invoke-WingetProcessor-error.txt`: Details on any failures or crashes.
