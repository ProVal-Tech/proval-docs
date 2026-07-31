---
id: 426118d9-ff83-444e-9744-30a0e26cb490
slug: /426118d9-ff83-444e-9744-30a0e26cb490
title: Invoke-ToastNotification
title_meta: Invoke-ToastNotification
keywords: ['toast', 'reminder', 'reboot', 'toast-notification', 'notification']
description: A PowerShell script to create and manage toast notifications with customizable options, including images, buttons, and scenarios for different use cases.
tags: ['notifications', 'reboot', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-31
---

## Overview

A PowerShell script to create and manage Windows toast notifications with customizable options, including images, buttons, and scenarios for different use cases. This script acts as a wrapper and deployment engine for the `New-ToastNotification.ps1` notification engine, which is downloaded directly from **ProVal's File Server**.

**Key Features:**

- **Zero Window Flashing:** Utilizes a custom, compiled Go executable (`SilentLauncher.exe`) to guarantee that no console windows flash on the user's screen during task execution or button clicks.
- **Intelligent Image Resolution:** Accepts image sources as URLs, local file paths, or bare file names. URLs are downloaded with automatic format detection. Local paths are validated and copied. Bare names are resolved from the built-in images shipped in the package.
- Script monitors for button clicks for 600 seconds (10 minutes) after displaying the notification.
- Automatically re-displays the notification exactly once if the "Learn More" button is clicked within the timeout period.
- Deploys **signed, static helper scripts** to ensure integrity and security. Because these helpers are parameterized and encoded, their on-disk content remains byte-identical across deployments, allowing them to be Authenticode signed.
- Provisions the Strapper logging module via **`Install-PSGalleryModule`**, bypassing the PackageManagement engine and avoiding dynamic .NET DLL compilation or NuGet provider bootstrapping.
- Recommended minimum interval between two consecutive prompts is 30 minutes.

**Acknowledgement:** Original engine concept sourced from [imabdk's Toast-Notification-Script](https://github.com/imabdk/Toast-Notification-Script).

## Requirements

- PowerShell version 5.0 or later.
- Windows 10 or later.
- Network access to **ProVal's File Server** to download the notification engine package ([New-ToastNotification.zip](https://github.com/ProVal-Tech/Toast-Notification-Script/blob/master/ToastNotificationScript.zip)), the silent launcher ([SilentLauncher.exe](/docs/b0b9f423-eee3-4148-b8a0-e99400c45698)), and the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to **www.powershellgallery.com** (queried by `Install-PSGalleryModule` to resolve and download the Strapper module).
- Administrative privileges (the script requires `-RunAsAdministrator` to create scheduled tasks and write to `$env:ProgramData`).

## Image Handling

The `LogoImage` and `HeroImage` parameters accept three types of input. The script detects the type automatically and resolves the image accordingly.

### URL

When you supply a URL (for example `https://example.com/logo.gif`), the image is downloaded to the working directory. The actual file format is detected automatically from the server response, the URL path, or the file content itself. The downloaded file is saved with the correct extension matching its real format.

This means you can supply URLs pointing to any supported format, including URLs that do not contain a file extension (for example `https://www.provaltech.com/favicon`). The script will still determine the correct format.

### Local Path

When you supply a full local path or a UNC path (for example `C:\Images\logo.png` or `\\server\share\hero.jpg`), the file is validated for existence and supported extension, then copied into the working directory. This makes the deployment self-contained and independent of the original file location.

### Bare File Name

When you supply only a file name without any path (for example `lazyCat.jpg` or `ToastLogoImageDefault.jpg`), the script searches the extracted package directory recursively for a matching file. This supports the built-in images shipped inside the `ToastNotificationScript.zip` package under the `Images` folder.

### Supported Formats

`png`, `gif`, `jpg`, `jpeg`, `ico`, `bmp`, `webp`, `svg`

### Failure Behaviour

If a download fails, a local file is missing, an extension is unsupported, or a bare name cannot be found, the error is logged and the notification falls back to the packaged default image. The script does not exit.

## Payload Usage

This script allows users to configure toast notifications using parameters. Below are usage examples:

### Example 1

Creates a generic notification with a reboot button, a "Learn More" button linking to a specified URL, and custom dismiss button text. Includes a deadline and a repeat setting of "Once."

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -LearnMoreButton -LearnMoreUrl 'https://www.provaltech.com' -DismissButtonText 'Ignore' -TitleText 'A Generic Notification' -AttributionText 'www.provaltech.com' -BodyText1 'First Line of generic notification' -BodyText2 'Second Line of generic notification' -Deadline $((Get-Date).AddDays(30)) -Repeat 'Once'
```

**Screenshot:**

![Example 1](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example1.webp)

### Example 2

Creates a generic notification with a reboot button, a "Learn More" button, custom images for the logo and hero image sections. Images are supplied as URLs and downloaded locally before the notification is rendered.

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -LearnMoreButton -LearnMoreUrl 'https://www.provaltech.com' -DismissButtonText 'Ignore' -TitleText 'A Generic Notification' -AttributionText 'www.provaltech.com' -BodyText1 'First Line of generic notification' -LogoImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -HeroImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg'
```

**Screenshot:**

![Example 2](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example2.webp)

### Example 3

Displays a notification for systems exceeding a maximum uptime of 14 days, with a "Reboot Now" button, a snooze option, and custom images.

```powershell
.\Invoke-ToastNotification.ps1 -PendingRebootUptime -RebootButton -MaxUptimeDays 14 -TitleText 'Reboot Required' -AttributionText 'www.provaltech.com' -BodyText1 'Your computer uptime exceeds XX days.' -BodyText2 'Please reboot now or snooze for a reminder.' -Deadline $((Get-Date).AddDays(1)) -LogoImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -HeroImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -SnoozeButton
```

**Screenshot:**

![Example 3](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example3.webp)

### Example 4

Displays a notification reminding users to reboot their system after exceeding 14 days of uptime. Notification repeats every 30 minutes.

```powershell
.\Invoke-ToastNotification.ps1 -PendingRebootUptime -MaxUptimeDays 14 -TitleText 'Reboot Required' -AttributionText 'www.provaltech.com' -BodyText1 'This is to notify you of your computer exceeding uptime of XX days.' -BodyText2 'Please click the ''Reboot Now'' to restart your computer.' -Deadline $((Get-Date).AddDays(1)) -HeroImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -LogoImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -RebootButton -Repeat '30Minutes'
```

**Screenshot:**

![Example 4](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example4.webp)  
![Example 4 ScheduledTask](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example4ScheduledTask.webp)

### Example 5

Sends a notification about an upcoming password expiration 60 days in advance. Notification includes a "Learn More" button and repeats every 7 days.

```powershell
.\Invoke-ToastNotification.ps1 -ADPasswordExpiration -LearnMoreButton -LearnMoreUrl 'https://www.provaltech.com' -TitleText 'Password Expiration Notification' -AttributionText 'www.provaltech.com' -BodyText1 'Your password is about to expire. Save yourself the trouble and change your password today.' -BodyText2 'To change your password, press CTRL+ALT+DEL and choose ''Change a Password''.' -ADPasswordExpirationDays 60 -Repeat '7Days'
```

**Screenshot:**

![Example 5](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example5.webp)  
![Example 5 ScheduledTask](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example5ScheduledTask.webp)

### Example 6

Creates a generic notification with a custom application name. The logo and hero images are supplied as bare file names and resolved from the built-in images in the package.

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -TitleText 'Your Feline Overlord' -AttributionText 'TheLazyCat' -BodyText1 'I''ve been lounging around and noticed that you haven''t given me enough attention today.' -BodyText2 'Please rectify this immediately by providing ample belly rubs and treats. Also, don''t forget to fluff my favorite pillow.' -NotificationAppName 'Purrfect Alerts' -LogoImage 'lazyCat.jpg' -HeroImage 'lazyCat.jpg'
```

**Screenshot:**

![Example6](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example6.webp)

### Example 7

Creates a generic notification that repeats every 15 minutes and automatically stops after being displayed 5 times.

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -TitleText 'Your Feline Overlord' -AttributionText 'TheLazyCat' -BodyText1 'I''ve been lounging around and noticed that you haven''t given me enough attention today.' -BodyText2 'Please rectify this immediately by providing ample belly rubs and treats. Also, don''t forget to fluff my favorite pillow.' -NotificationAppName 'Purrfect Alerts' -LogoImage 'lazyCat.jpg' -HeroImage 'lazyCat.jpg' -Repeat '15Minutes' -MaxOccurrences 5
```

### Example 8

Creates a cat-themed notification with two options:

- "Restart Now" (reboot button) to feed the cat immediately by restarting the computer.
- "Feed at 8" (custom button) to run a script that schedules a forced restart at 8:00 PM.

The dismiss button is hidden, so the user must choose one of the two actions.

```PowerShell
$scriptContent = @"
`$now = Get-Date
`$eightPMToday = Get-Date -Hour 20 -Minute 0 -Second 0

if (`$now -lt `$eightPMToday) {
    `$targetTime = `$eightPMToday
} else {
    `$targetTime = `$eightPMToday.AddDays(1)
}

`$secondsUntil8PM = [int](`$targetTime - `$now).TotalSeconds
Shutdown -f -r -t `$secondsUntil8PM
"@
$scriptPath = 'C:\Temp\TimeToFeedCat.ps1'

(mkdir 'C:\Temp') 2>&1 1>$Null

$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($scriptPath, $scriptContent, $Utf8NoBomEncoding)

.\Invoke-ToastNotification.ps1 -Generic -TitleText 'Your Cat Is Hungry!' -AttributionText 'TheLazyCat' -BodyText1 'It''s time to feed your feline overlord.' -BodyText2 'Restart now to feed me immediately, or schedule a restart at 8:00 PM by clicking ''Feed at 8''.' -NotificationAppName 'Hunger Alerts' -LogoImage 'lazyCat.jpg' -HeroImage 'lazyCat.jpg' -RebootButton -RunScriptButton -RunScriptButtonText 'Feed at 8' -ScriptPath 'C:\Temp\TimeToFeedCat.ps1' -ScriptContext 'System' -ScriptStyle 'Hidden' -HideDismissButton
```

**Screenshot:**

![Example 8](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example8.webp)

Windows notification when you click `Feed at 8`:  
![Feed on 8](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example8_1.webp)

## What Happens When You Run the Script

When you execute `Invoke-ToastNotification.ps1`, the following steps occur in order:

1. The script downloads the notification engine package and `SilentLauncher.exe` from ProVal's File Server.
2. Your supplied images are resolved (downloaded, copied, or located in the package) and placed in the working directory.
3. An XML configuration file is generated from your parameters.
4. A scheduled task is created to display the notification to the logged-on user.
5. If `MaxOccurrences` is set (or `Repeat` is `Once`), a second scheduled task is created to automatically remove the notification after the specified number of displays.
6. If `RunScriptButton` is used, a third scheduled task is created to watch for the button click and execute your script.

### Scheduled Task Timing

| Task | Delay After Creation | Purpose |
|---|---|---|
| Notification task | 15 seconds | Displays the toast to the user |
| Removal task | 15 minutes | Counts occurrences and cleans up when the limit is reached |
| Run Script task | 60 seconds | Watches for the button click signal and runs your script |

For recurring schedules, all tasks repeat on the same interval and the relative delays remain constant per cycle.

### Automatic Removal Behaviour

When the notification count reaches `MaxOccurrences`, the removal script:

1. Verifies the notification task has actually executed (prevents removing a task that never fired, for example if the machine was asleep).
2. Waits for the notification task to finish if it is still running.
3. Removes the Run Script task (if present).
4. Removes the Notification task.
5. Resets the occurrence counter.
6. Removes itself last.

:::note
Because `SilentLauncher.exe` waits for the PowerShell script to finish before exiting, the scheduled task remains in a **Running** state for the entire duration of the script. This is expected behaviour. Removing a task definition does not kill the running process; the script continues to completion regardless.
:::

## Generated Files and Scenario Breakdown

When the script runs, it orchestrates several files and scheduled tasks within the working directory (`C:\ProgramData\_Automation\Script\New-ToastNotification\`). Below is an end-to-end breakdown of what is created and why:

1. **Engine Package**
   - `New-ToastNotification.zip`: The downloaded package from ProVal's File Server.
   - `New-ToastNotification\New-ToastNotification.ps1`: The core engine that renders the toast.
   - `New-ToastNotification\Images\`: Default logo and hero images (used when resolving bare file names).

2. **Silent Launcher**
   - `SilentLauncher.exe`: A compiled Go executable that runs scripts with the Windows API `CREATE_NO_WINDOW` flag. All scheduled tasks launch their targets through it to guarantee zero window flashing.

3. **Resolved Images** *(when `LogoImage` or `HeroImage` is supplied)*
   - `ToastLogoImage.<ext>`: The logo image resolved from a URL, local path, or built-in package image. The extension matches the actual format (`.gif`, `.png`, `.jpg`, `.ico`, etc.).
   - `ToastHeroImage.<ext>`: The hero image resolved the same way.
   - If resolution fails, the engine falls back to the default image packaged in `New-ToastNotification\Images\`.

4. **Toast Configuration**
   - `config-toast-<scenario>.xml`: The generated XML configuration consumed by the notification engine. All image references in this file are local paths.

5. **Notification Task**
   - *Scheduled Task*: `Toast Notification - config-toast-<scenario>` (runs as the logged-on user).
   - Action: Executes `SilentLauncher.exe`, passing `New-ToastNotification.ps1` and the XML config as arguments.

6. **Run Script Plumbing** *(Only if `RunScriptButton` is used)*
   - `<config>-<ButtonName>.ps1`: A signed, static signal writer. When the button is clicked, it stamps the signal file below.
   - `<config>-<ButtonName>.txt`: The signal file, written at the exact moment the button is clicked.
   - `Toast_Notification_<config>_<ButtonName>.ps1`: A signed, static waiter script. It watches the signal file and, once stamped, launches the target `ScriptPath` via `SilentLauncher.exe` (if Hidden) or directly (if Interactive), then exits immediately.
   - *Scheduled Task*: `Toast Notification - <config> - <ButtonName>`.
   - Action: Executes `SilentLauncher.exe`, passing the waiter `.ps1` script and parameters.

7. **Automatic Removal** *(Only if `MaxOccurrences` is set or `Repeat` is 'Once')*
   - `Stop-ToastNotification.ps1`: A signed, static helper that removes the tasks once the notification has been shown the maximum number of times.
   - *Scheduled Task*: `Remove - Toast Notification - <config>` (runs as `NT AUTHORITY\SYSTEM`).
   - Action: Executes `SilentLauncher.exe`, passing `Stop-ToastNotification.ps1` and parameters.

8. **Engine-Generated Files** *(Created dynamically when the notification task fires)*
   - `ToastNotification.log`: Engine execution log.
   - `ToastReboot.cmd`: Reboot protocol handler.
   - `ToastRunPSScript.cmd`: Run Script protocol handler (invokes the signal writer).
   - `ToastLearnMore.cmd`: Learn More protocol handler (opens the URL and stamps `learn-more.txt`).
   - `learn-more.txt`: A stamp file. The engine polls this for up to 600 seconds. If updated, it re-displays the toast exactly once, then stops watching.

9. **Strapper Module Logs**
   - `Stop-ToastNotification-log.txt` / `Stop-ToastNotification-error.txt`: Written when the cleanup script runs.
   - `Invoke-ToastNotification-log.txt` / `Invoke-ToastNotification-error.txt`: Written by the Strapper module in the directory from which the main script was launched.

:::note
The helper PowerShell scripts deployed by this tool (the Run Script signal writer, `Stop-ToastNotification.ps1`, and the Run Script waiter) are written from a fixed, parameterized source. Their on-disk content never changes between runs, allowing them to be securely Authenticode signed. All varying data (like file paths) is passed to these helpers as parameters at call time, ensuring the signed content remains byte-identical. Every deployed `.ps1` file is written as UTF-8 without a byte order mark (BOM).  
:::

## Parameters

| Parameter | ParameterSetName | Required | Default | Type | Description |
|---|---|---|---|---|---|
| `Generic` | Generic | True | | Switch | Enables a static, generic toast notification. |
| `PendingRebootUptime` | PendingRebootUptime | True | | Switch | Displays a toast notification reminding users to restart after exceeding max uptime. |
| `PendingRebootCheck` | PendingRebootCheck | True | | Switch | Displays a toast notification when a pending reboot is detected via Registry/WMI. |
| `ADPasswordExpiration` | ADPasswordExpiration | True | | Switch | Sends a toast notification when the user's Active Directory password is nearing expiration. |
| `RebootButton` | Generic, PendingRebootUptime, PendingRebootCheck | False | None | Switch | Adds a "Reboot Now" button. |
| `RunScriptButton` | All | False | | Switch | Adds a custom button to run a specified PowerShell script when clicked. |
| `RunScriptButtonText` | All | False | RunScript | String | Sets the label for the custom script execution button. |
| `ScriptPath` | All | False | | String | Full path to a PowerShell script (.ps1) to execute when the custom button is clicked. Must end in `.ps1`. |
| `ScriptContext` | All | False | User | String | Context in which the custom script runs: `User` or `System`. |
| `ScriptStyle` | All | False | Hidden | String | Script execution style: `Interactive` or `Hidden`. |
| `LearnMoreButton` | All | False | | Switch | Adds a "Learn More" button. Requires `LearnMoreUrl`. |
| `LearnMoreUrl` | All | False | | String | URL to open when the "Learn More" button is clicked. |
| `SnoozeButton` | All | False | | Switch | Adds a "Snooze" button. Cannot be used together with `LearnMoreButton`. |
| `DismissButtonText` | All | False | Dismiss | String | Customizes the text of the dismiss button. |
| `HideDismissButton` | All | False | | Switch | Hides the dismiss/close button on the toast notification. |
| `TitleText` | All | True | | String | Sets the title of the notification. |
| `AttributionText` | All | True | | String | Displays attribution text, such as a company name or website. |
| `BodyText1` | All | True | | String | The main text content of the notification body. |
| `BodyText2` | All | False | | String | Secondary text content displayed below `BodyText1`. |
| `LogoImage` | All | False | | String | URL, local path, or bare file name for the logo image. See [Image Handling](#image-handling) for details. |
| `HeroImage` | All | False | | String | URL, local path, or bare file name for the hero image. See [Image Handling](#image-handling) for details. |
| `Deadline` | All | False | Current +14d | DateTime | Deadline for the notification. Format: `yyyy-MM-dd HH:mm:ss`. |
| `NotificationAppName` | All | False | Windows PowerShell | String | Name of the application that displays the notification. |
| `MaxUptimeDays` | PendingRebootUptime | False | 30 | Int | Maximum uptime (in days) for the `PendingRebootUptime` scenario. |
| `ADPasswordExpirationDays` | ADPasswordExpiration | False | 7 | Int | Days before password expiration when reminders should start. |
| `Repeat` | All | False | Once | String | Frequency of repetition. Options: `Once`, `Hourly`, `<n>Minutes`, `<n>Hours`, `Daily`, `<n>Days`, `Weekly`, `Monthly`, `AtLogon`. |
| `MaxOccurrences` | All | False | | Int32 | Max notifications to send before the scheduled task is automatically removed. Forced to `1` when `Repeat` is `Once`. |

## Output

The script generates log files for troubleshooting and auditing purposes:

- `.\Invoke-ToastNotification-log.txt`
- `.\Invoke-ToastNotification-error.txt`
- `$env:ProgramData\_Automation\Script\New-ToastNotification\Stop-ToastNotification-log.txt`
- `$env:ProgramData\_Automation\Script\New-ToastNotification\Stop-ToastNotification-error.txt`
- `$env:ProgramData\_Automation\Script\New-ToastNotification\ToastNotification.log`

## Changelog

### 2026-07-31

- Consolidated image resolution into a single code path that auto-detects the source type (URL, local path, or bare file name) and resolves the image accordingly, eliminating the need for callers to know the input format in advance.
- Added automatic image format detection for URL downloads using Content-Type headers, URL path extensions, and file magic bytes, so downloaded images are saved with the correct extension instead of always being hardcoded as `.jpg`.
- Added support for extensionless URLs (e.g. `https://www.provaltech.com/favicon`) by falling back to Content-Type inspection and magic byte analysis when no file extension is present in the URL.
- Added local path validation and copy-to-working-directory behaviour so that user-supplied local or UNC image paths are verified for existence and supported extension before use, making the deployment self-contained.
- Added bare file name resolution by searching the extracted package directory recursively, so built-in images shipped inside `ToastNotificationScript.zip` (e.g. `lazyCat.jpg`) can be referenced by name alone without a full path.
- Fixed `Stop-ToastNotification.ps1` to account for `SilentLauncher.exe` keeping tasks in a Running state by replacing the broken 7-minute `LastRunTime` window with a state-based polling loop, adding an execution guard that prevents removing a task that never fired, and reordering cleanup so the removal task unregisters itself last.
- Updated the `LogoImage` and `HeroImage` parameter descriptions and the script help block to reflect that both now accept URLs, local paths, or bare file names.

### 2026-07-30

- Updated image handling: when `LogoImage` or `HeroImage` is a URL, the image is now downloaded to the working directory (`ToastLogoImage.jpg` / `ToastHeroImage.jpg`) and the local path is written to the XML configuration. The notification engine always receives a local file path, never a URL. A failed download logs an error and falls back to the packaged default image without terminating the script.
- Replaced the `Install-Module` / `Update-Module` / `Find-Module` Strapper provisioning logic with the [Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547) script, retrieved at runtime from the content repository. This bypasses the PackageManagement engine entirely, eliminating dynamic .NET DLL compilation, NuGet provider bootstrapping, and the associated failure modes in constrained environments.
- Added `www.powershellgallery.com` as an explicit network requirement (queried by [Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547) to resolve and download the Strapper module).

### 2026-07-22

- Replaced legacy `Hidden.vbs` and `.cmd` scheduled task wrappers with a custom, compiled Go executable (`SilentLauncher.exe`).
- Guaranteed zero console window flashing for all scheduled tasks and protocol handler executions using the Windows API `CREATE_NO_WINDOW` flag.
- Updated the Run Script waiter logic to launch target scripts silently (when configured as Hidden) and exit immediately, preventing lingering PowerShell windows.
- Removed the generation of intermediate `.cmd` launcher files for primary, secondary, and run-script scheduled tasks.

### 2026-07-16

- Removed obsolete and unused code.
- Eliminated the dependency on `css.exe`.
- Applied code signing to the `New-ToastNotification.ps1` script.
- Updated the script to generate code-signed `.ps1` files.
- Modified the download process to retrieve the `.zip` package from our file server instead of GitHub.

### 2025-04-10

- Initial version of the document.
