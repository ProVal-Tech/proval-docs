---
id: '56fa7d90-7c83-4c4a-ac0e-c49a6d5701af'
slug: /56fa7d90-7c83-4c4a-ac0e-c49a6d5701af
title: 'New-DesktopUriShortcut'
title_meta: 'New-DesktopUriShortcut'
keywords: ['shortcut', 'desktop', 'uri', 'wscript', 'favicon', 'arguments', 'appx', 'aumid', 'packaged application']
description: 'Guide to creating a desktop URI shortcut with optional custom icon and launch arguments using PowerShell.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-20
---

## Overview

Creates a standard shell shortcut (.lnk) in the Public Desktop folder pointing to a local file, directory, or web URI, making the shortcut visible to every user on the machine.

The script uses the `WScript.Shell` COM object to build the shortcut. For web targets it automatically downloads the site favicon and applies it as the shortcut icon unless a custom icon is supplied. The `Arguments` parameter writes command-line arguments into the shortcut, which enables scenarios such as launching packaged (Appx/MSIX) applications through `explorer.exe` with a `shell:AppsFolder` application URI (AUMID).

Designed for RMM and automation platforms, it requires only a single execution per change and leaves correctly configured shortcuts untouched when managed by a compliance task.

## Requirements

| Requirement | Details |
| --- | --- |
| **Operating System** | Windows 10 or Windows 11 |
| **PowerShell** | Version 5.1 or later |
| **Execution Context** | Administrator / SYSTEM (writing to the Public Desktop requires elevated rights) |
| **Internet Access** | Only needed to download the favicon for web targets when no custom icon is supplied |

*Note: All dependencies, including the Strapper logging module, are automatically bootstrapped on the first run.*

## How It Works

1. **Shortcut creation:** Uses `WScript.Shell` to create a `.lnk` file in the `$env:PUBLIC\Desktop` folder.
2. **Favicon handling:** If `TargetUri` is a website and no `IconLocation` is provided, the script downloads `https://<host>/favicon.ico` into `$env:PUBLIC\Pictures` and applies it as the icon. A failed download does not block creation; the shortcut is saved with the default icon.
3. **Naming:** If `ShortcutName` is not provided, the file name (local targets) or the `DnsSafeHost` (web targets) is used as the shortcut name.
4. **Launch arguments:** If `Arguments` is provided, the value is written to the shortcut's Arguments property and is passed to the target every time the shortcut is launched.

## Before You Deploy

* **Elevated context required:** The script writes to the Public Desktop and Public Pictures folders. Run it as SYSTEM or Administrator from your RMM.
* **Custom icons must exist:** When `IconLocation` is provided, the path must point to an existing `.ico` file at creation time.
* **Packaged applications:** Modern Appx/MSIX applications cannot be launched reliably by pointing a shortcut directly at their executable. Use `-TargetUri 'C:\Windows\explorer.exe'` together with `-Arguments 'shell:AppsFolder\<AUMID>'`. The AUMID is stable across application updates, so the shortcut keeps working after the app updates.
* **Arguments are stored verbatim:** The `Arguments` value is written into the `.lnk` exactly as provided, so format embedded spaces and quotes the same way you would for any Windows shortcut.
* **Per-user launch behavior:** A shortcut that launches a packaged application through `explorer.exe` starts the app in the context of the signed-in user who clicks it, which makes it suitable for Public Desktop deployment.

## Usage Examples

**Local file shortcut with a custom name:**

```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'C:\Users\Test.docx' -ShortcutName 'Test Document'
```

**Web link with automatic favicon:**

```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'https://www.google.com' -ShortcutName 'Google'
```

**Directory shortcut using the folder name:**

```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'C:\Users'
```

**Web link with a custom icon:**

```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'https://mail.office365.com' -ShortcutName 'OWA' -IconLocation 'C:\ProgramData\ImmyBot\DesktopShortcuts\icons\owa.ico'
```

**Packaged application launched through explorer.exe:**

```powershell
.\New-DesktopUriShortcut.ps1 -TargetUri 'C:\Windows\explorer.exe' -Arguments 'shell:AppsFolder\MicrosoftCorporationII.Windows365_8wekyb3d8bbwe!App' -ShortcutName 'Windows App' -IconLocation 'C:\ProgramData\ImmyBot\DesktopShortcuts\icons\windowsApp.ico'
```

Creates a shortcut named 'Windows App' that launches the packaged Windows 365 application by passing its Applications Folder URI (AUMID) as an argument to `explorer.exe`.

### Resolving the AUMID for a packaged application

The value after `shell:AppsFolder\` is the application AUMID in the format `<PackageFamilyName>!<ApplicationId>`. Resolve it dynamically from the installed package:

```powershell
$appxPackage = Get-AppxPackage -Name 'MicrosoftCorporationII.Windows365' |
    Sort-Object -Property 'Version' -Descending |
    Select-Object -First 1

$applicationId = (Get-AppxPackageManifest -Package $appxPackage).Package.Applications.Application.Id |
    Select-Object -First 1

$aumid = 'shell:AppsFolder\{0}!{1}' -f $appxPackage.PackageFamilyName, $applicationId
```

For machines where the package is only provisioned and no user has signed in yet, read the manifest from the provisioned package and build the family name as `<DisplayName>_<PublisherId>`:

```powershell
$appxProvisioned = Get-AppxProvisionedPackage -Online |
    Where-Object -FilterScript { $_.DisplayName -eq 'MicrosoftCorporationII.Windows365' } |
    Select-Object -First 1

$manifestPath = Join-Path -Path $appxProvisioned.InstallLocation -ChildPath 'AppxManifest.xml'
$manifest = [xml](Get-Content -Path $manifestPath)
$applicationId = $manifest.Package.Applications.Application.Id | Select-Object -First 1

$aumid = 'shell:AppsFolder\{0}_{1}!{2}' -f $appxProvisioned.DisplayName, $appxProvisioned.PublisherId, $applicationId
```

## Parameters

| Parameter | Required | Type | Default | Description |
| --- | --- | --- | --- | --- |
| `TargetUri` | True | String | | The target path of the shortcut. This can be a local or web URI. Must begin with a drive letter and colon (for example `C:\`), `https://`, or `http://`. |
| `ShortcutName` | False | String | | The optional name of the shortcut. If not provided, the file name or `DnsSafeHost` property will be used as the shortcut name. |
| `IconLocation` | False | String | | Optionally set an `.ico` file as the shortcut icon. Overrides the automatic favicon download for web targets. |
| `Arguments` | False | String | | Optional command-line arguments passed to the shortcut target when it is launched. Combined with an executable `TargetUri` such as `explorer.exe`, this allows launching packaged applications with a `shell:AppsFolder` AUMID. |

## Logs and Artifacts

| Artifact | Location |
| --- | --- |
| **Shortcut** | `$env:PUBLIC\Desktop\<ShortcutName>.lnk` |
| **Favicon** (web targets) | `$env:PUBLIC\Pictures\<DnsSafeHost>.ico` |
| **Log** | `C:\ProgramData\_Automation\Script\New-DesktopUriShortcut\New-DesktopUriShortcut-log.txt` |
| **Error log** | `C:\ProgramData\_Automation\Script\New-DesktopUriShortcut\New-DesktopUriShortcut-error.txt` |

## Changelog

### 2026-08-20

- Added the `Arguments` parameter to pass command-line arguments to the shortcut target when it is launched.
- Added support for launching packaged (Appx/MSIX) applications by combining an `explorer.exe` target with a `shell:AppsFolder` AUMID argument.
- Added guidance and examples for resolving the AUMID from installed and provisioned packages.
- Expanded the document with an overview, requirements, deployment notes, and artifact locations.

### 2026-08-20

- Fixed the logic for local file shortcut creation
- Formatted script

### 2025-04-10

- Initial version of the document
