---
id: 426118d9-ff83-444e-9744-30a0e26cb490
slug: /426118d9-ff83-444e-9744-30a0e26cb490
title: Invoke-ToastNotification
title_meta: Invoke-ToastNotification
keywords: ['toast', 'reminder', 'reboot']
description: A PowerShell script to create and manage toast notifications with customizable options, including images, buttons, and scenarios for different use cases.
tags: ['reboot', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-16
---

## Overview

A PowerShell script to create and manage Windows toast notifications with customizable options, including images, buttons, and scenarios for different use cases. This script acts as a wrapper and deployment engine for the `New-ToastNotification.ps1` notification engine, which is downloaded directly from **ProVal's File Server**.

**Key Features:**

- Script monitors for button clicks for 600 seconds (10 minutes) after displaying the notification.
- Automatically re-displays the notification exactly once if the "Learn More" button is clicked within the timeout period.
- Deploys **signed, static helper scripts** to ensure integrity and security. Because these helpers are parameterized and encoded, their on-disk content remains byte-identical across deployments, allowing them to be Authenticode signed.
- Recommended minimum interval between two consecutive prompts is 30 minutes.

**Acknowledgement:** Original engine concept sourced from [imabdk's Toast-Notification-Script](https://github.com/imabdk/Toast-Notification-Script).

## Requirements

- PowerShell version 5.0 or later.
- Windows 10 or later.
- Network access to **ProVal's File Server** to download the notification engine package ([New-ToastNotification.zip](https://contentrepo.net/repo/share/ToastNotificationScript.zip)).
- Administrative privileges (the script requires `-RunAsAdministrator` to create scheduled tasks and write to `$env:ProgramData`).

## Process

1. **Parameter Handling**  
   Accepts and validates user-supplied parameters to determine the notification scenario, appearance, actions, and scheduling logic.

2. **Environment Preparation**  
   Bootstraps the environment using the `Strapper` module for consistent error handling, logging, and persistent storage. Ensures secure TLS settings (TLS 1.2/1.3) and configures the PowerShell Gallery as a trusted repository if module updates are needed.

3. **Working Directory Setup**  
   Creates a dedicated working directory under `$env:ProgramData\_Automation\Script\New-ToastNotification`. Sets appropriate ACL permissions to allow all users full control of this directory, ensuring the notification engine can run in the user's context.

4. **Component Download and Extraction**  
   Downloads the latest notification script package (ZIP) from ProVal's File Server and extracts the engine (`New-ToastNotification.ps1`) and default images to the working directory.

5. **Deployment of Signed Helper Scripts**  
   Writes static, parameterized PowerShell helper scripts (e.g., signal writers, waiters, and cleanup scripts) to disk. These are stored as Base64 (UTF-16LE) encoded strings and decoded to UTF-8 without a Byte Order Mark (BOM). This ensures the files remain byte-identical across runs and can be securely Authenticode signed.

6. **XML Configuration Preparation**  
   Translates PowerShell parameters into XML-compatible values. Selects and customizes the appropriate XML template based on the chosen notification scenario, handling localization, image paths, deadlines, and button/action logic.

7. **Notification Scheduling**  
   Creates a scheduled task to display the toast notification according to the specified recurrence (`Repeat` parameter). If `MaxOccurrences` is set (or `Repeat` is 'Once'), it creates an additional scheduled task running as `SYSTEM` to automatically remove the notification task after the specified number of runs.

8. **Custom Script Execution (Optional)**  
   If the `RunScriptButton` is enabled, creates a dedicated scheduled task that waits for a user interaction signal file and then executes the specified PowerShell script (`ScriptPath`) in either the `User` or `System` context.

9. **Notification Delivery**  
   When triggered by the scheduled task, the notification is displayed to the logged-on user with all configured options, images, and actionable buttons.

10. **Cleanup and Logging**  
    Logs all actions and errors for troubleshooting. Automatically cleans up scheduled tasks and temporary files as needed, especially when `MaxOccurrences` is reached or custom script execution completes.

## Payload Usage

This script allows users to configure toast notifications using parameters. Below are usage examples:

### Example 1

Creates a generic notification with a reboot button, a "Learn More" button linking to a specified URL, and custom dismiss button text. Includes a deadline and a repeat setting of "Once."

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -LearnMoreButton -LearnMoreUrl 'https://www.provaltech.com' -DismissButtonText 'Ignore' -TitleText 'A Generic Notification' -AttributionText 'www.provaltech.com' -BodyText1 "First Line of generic notification" -BodyText2 "Second Line of generic notification" -Deadline $((Get-Date).AddDays(30)) -Repeat 'Once'
```

**Screenshot:**

![Example 1](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example1.webp)

### Example 2

Creates a generic notification with a reboot button, a "Learn More" button, custom images for the logo and hero image sections.

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -LearnMoreButton -LearnMoreUrl 'https://www.provaltech.com' -DismissButtonText 'Ignore' -TitleText 'A Generic Notification' -AttributionText 'www.provaltech.com' -BodyText1 "First Line of generic notification" -LogoImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -HeroImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg'
```

**Screenshot:**

![Example 2](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example2.webp)

### Example 3

Displays a notification for systems exceeding a maximum uptime of 14 days, with a "Reboot Now" button, a snooze option, and custom images.

```powershell

.\Invoke-ToastNotification.ps1 -PendingRebootUptime -RebootButton -MaxUptimeDays 14 -TitleText 'Reboot Required' -AttributionText 'www.provaltech.com' -BodyText1 "Your computer uptime exceeds XX days." -BodyText2 "Please reboot now or snooze for a reminder." -Deadline $((Get-Date).AddDays(1)) -LogoImage "https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg" -HeroImage 'https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg' -SnoozeButton
```

**Screenshot:**

![Example 3](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example3.webp)

### Example 4

Displays a notification reminding users to reboot their system after exceeding 14 days of uptime. Notification repeats every 30 minutes.

```powershell
.\Invoke-ToastNotification.ps1 -PendingRebootUptime -MaxUptimeDays 14 -TitleText 'Reboot Required' -AttributionText 'www.provaltech.com' -BodyText1 "This is to notify you of your computer exceeding uptime of XX days." -BodyText2 "Please click the 'Reboot Now' to restart your computer." -Deadline $((Get-Date).AddDays(1)) -HeroImage "https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg" -LogoImage "https://labtech.provaltech.com/labtech/transfer/images/alogo.jpg" -RebootButton -Repeat '30Minutes'
```

**Screenshot:**

![Example 4](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example4.webp)  
![Example 4 ScheduledTask](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example4ScheduledTask.webp)

### Example 5

Sends a notification about an upcoming password expiration 60 days in advance. Notification includes a "Learn More" button and repeats every 7 days.

```powershell
.\Invoke-ToastNotification.ps1 -ADPasswordExpiration -LearnMoreButton -LearnMoreUrl 'https://www.provaltech.com' -TitleText 'Password Expiration Notification' -AttributionText 'www.provaltech.com' -BodyText1 "Your password is about to expire. Save yourself the trouble and change your password today." -BodyText2 "To change your password, press CTRL+ALT+DEL and choose 'Change a Password'." -ADPasswordExpirationDays 60 -Repeat '7Days'
```

**Screenshot:**

![Example 5](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example5.webp)  
![Example 5 ScheduledTask](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example5ScheduledTask.webp)

### Example 6

Creates a generic notification with a custom application name and other parameters for a cat-themed notification.

```powershell
.\Invoke-ToastNotification.ps1 -Generic -RebootButton -TitleText 'Your Feline Overlord' -AttributionText 'TheLazyCat' -BodyText1 'I''ve been lounging around and noticed that you haven''t given me enough attention today.' -BodyText2 'Please rectify this immediately by providing ample belly rubs and treats. Also, don''t forget to fluff my favorite pillow.' -NotificationAppName 'Purrfect Alerts' -LogoImage 'lazyCat.jpg' -HeroImage 'lazyCat.jpg'
```

**Screenshot:**

![Example6](../../static/img/docs/426118d9-ff83-444e-9744-30a0e26cb490/Example6.webp)

### Example 7

Creates a generic notification that repeats hourly and automatically stops after being displayed 5 times.

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

## Generated Files and Scenario Breakdown

When the script runs, it orchestrates several files and scheduled tasks within the working directory (`C:\ProgramData\_Automation\Script\New-ToastNotification\`). Below is an end-to-end breakdown of what is created and why:

1. **Engine Package**  
   - `New-ToastNotification.zip`: The downloaded package from ProVal's File Server.  
   - `New-ToastNotification\New-ToastNotification.ps1`: The core engine that renders the toast.  
   - `New-ToastNotification\Images\`: Default logo and hero images.
2. **Silent Launcher**  
   - `Hidden.vbs`: A VBScript that runs `.cmd` files with no visible window. All scheduled tasks below launch their `.cmd` files through this to remain invisible to the user.
3. **Toast Configuration**  
   - `config-toast-<scenario>.xml`: The generated XML configuration consumed by the notification engine.
4. **Notification Task & Launcher**  
   - `config-toast-<scenario>.cmd`: Runs `New-ToastNotification.ps1` with the `-Config` parameter pointing to the XML file.  
   - *Scheduled Task*: `Toast Notification - config-toast-<scenario>` (runs as the logged-on user).
5. **Run Script Plumbing** *(Only if `RunScriptButton` is used)*  
   - `<config>-Run-Now.ps1`: A signed, static signal writer. When "Run Now" is clicked, it stamps the signal file below.  
   - `<config>-Run-Now.txt`: The signal file, written at the exact moment the button is clicked.  
   - `Toast_Notification_<config>_Run_Now.ps1`: A signed, static waiter script. It watches the signal file and, once stamped, executes the target `ScriptPath`.  
   - `Toast_Notification_<config>_Run_Now.cmd`: Launcher for the waiter script.  
   - *Scheduled Task*: `Toast Notification - <config> - Run-Now`.
6. **Automatic Removal** *(Only if `MaxOccurrences` is set or `Repeat` is 'Once')*  
   - `Stop-ToastNotification.ps1`: A signed, static helper that removes the tasks once the notification has been shown the maximum number of times.  
   - `Remove_Toast_Notification_<config>.cmd`: Launcher for the removal script.  
   - *Scheduled Task*: `Remove - Toast Notification - <config>` (runs as `NT AUTHORITY\SYSTEM`).
7. **Engine-Generated Files** *(Created dynamically when the notification task fires)*  
   - `ToastNotification.log`: Engine execution log.  
   - `ToastReboot.cmd`: Reboot protocol handler.  
   - `ToastRunPSScript.cmd`: Run Script protocol handler (invokes the signal writer).  
   - `ToastLearnMore.cmd`: Learn More protocol handler (opens the URL and stamps `learn-more.txt`).  
   - `learn-more.txt`: A stamp file. The engine polls this for up to 600 seconds. If updated, it re-displays the toast exactly once, then stops watching.
8. **Strapper Module Logs**  
   - `Stop-ToastNotification-log.txt` / `Stop-ToastNotification-error.txt`: Written when the cleanup script runs.  
   - `Invoke-ToastNotification-log.txt` / `Invoke-ToastNotification-error.txt`: Written by the Strapper module in the directory from which the main script was launched.

> **Note on Signed Static Helpers:**  
> The helper PowerShell scripts deployed by this tool (the Run Script signal writer, `Stop-ToastNotification.ps1`, and the Run Script waiter) are written from a fixed, parameterized source. Their on-disk content never changes between runs, allowing them to be securely Authenticode signed. All varying data (like file paths) is passed to these helpers as parameters at call time, ensuring the signed content remains byte-identical. Every deployed `.ps1` file is written as UTF-8 without a byte order mark (BOM).

## Parameters

| Parameter                | ParameterSetName      | Required | Default         | Type     | Description                                                                 |
|--------------------------|----------------------|----------|-----------------|----------|-----------------------------------------------------------------------------|
| `Generic`                | Generic              | True     |                 | Switch   | Enables a static, generic toast notification.                               |
| `PendingRebootUptime`    | PendingRebootUptime  | True     |                 | Switch   | Displays a toast notification reminding users to restart after exceeding max uptime. |
| `PendingRebootCheck`     | PendingRebootCheck   | True     |                 | Switch   | Displays a toast notification when a pending reboot is detected via Registry/WMI. |
| `ADPasswordExpiration`   | ADPasswordExpiration | True     |                 | Switch   | Sends a toast notification when the user's Active Directory password is nearing expiration. |
| `RebootButton`           | Generic, PendingRebootUptime, PendingRebootCheck | False | None | Switch | Adds a "Reboot Now" button.                                                 |
| `RunScriptButton`        | All                  | False    |                 | Switch   | Adds a custom button to run a specified PowerShell script when clicked.     |
| `RunScriptButtonText`    | All                  | False    | RunScript       | String   | Sets the label for the custom script execution button.                      |
| `ScriptPath`             | All                  | False    |                 | String   | Full path to a PowerShell script (.ps1) to execute when the custom button is clicked. |
| `ScriptContext`          | All                  | False    | User            | String   | Context in which the custom script runs: `User` or `System`.                |
| `ScriptStyle`            | All                  | False    | Hidden          | String   | Script execution style: `Interactive` or `Hidden`.                          |
| `LearnMoreButton`        | All                  | False    |                 | Switch   | Adds a "Learn More" button. Requires `LearnMoreUrl`.                        |
| `LearnMoreUrl`           | All                  | False    |                 | String   | URL to open when the "Learn More" button is clicked.                        |
| `SnoozeButton`           | All                  | False    |                 | Switch   | Adds a "Snooze" button. Cannot be used together with `LearnMoreButton`.     |
| `DismissButtonText`      | All                  | False    | Dismiss         | String   | Customizes the text of the dismiss button.                                  |
| `HideDismissButton`      | All                  | False    |                 | Switch   | Hides the dismiss/close button on the toast notification.                   |
| `TitleText`              | All                  | True     |                 | String   | Sets the title of the notification.                                         |
| `AttributionText`        | All                  | True     |                 | String   | Displays attribution text, such as a company name or website.               |
| `BodyText1`              | All                  | True     |                 | String   | The main text content of the notification body.                             |
| `BodyText2`              | All                  | False    |                 | String   | Secondary text content displayed below `BodyText1`.                         |
| `LogoImage`              | All                  | False    |                 | String   | URL or path for the logo image in the notification.                         |
| `HeroImage`              | All                  | False    |                 | String   | URL or path for the hero image displayed at the top of the notification.    |
| `Deadline`               | All                  | False    | Current +14d    | DateTime | Deadline for the notification. Format: `yyyy-MM-dd HH:mm:ss`.               |
| `NotificationAppName`    | All                  | False    | Windows PowerShell | String | Name of the application that displays the notification.                     |
| `MaxUptimeDays`          | PendingRebootUptime  | False    | 30              | Int      | Maximum uptime (in days) for the `PendingRebootUptime` scenario.            |
| `ADPasswordExpirationDays`| ADPasswordExpiration| False    | 7               | Int      | Days before password expiration when reminders should start.                |
| `Repeat`                 | All                  | False    | Once            | String   | Frequency of repetition. Options: `Once`, `Hourly`, `<n>Minutes`, `<n>Hours`, `Daily`, `<n>Days`, `Weekly`, `Monthly`, `AtLogon`. |
| `MaxOccurrences`         | All                  | False    |                 | Int32    | Max notifications to send before the scheduled task is automatically removed. Works with `Repeat` (except when `Repeat` is `Once`). |

## Output

The script generates log files for troubleshooting and auditing purposes:

- `.\Invoke-ToastNotification-log.txt`
- `.\Invoke-ToastNotification-error.txt`
- `$env:ProgramData\_Automation\Script\New-ToastNotification\Stop-ToastNotification-log.txt`
- `$env:ProgramData\_Automation\Script\New-ToastNotification\Stop-ToastNotification-error.txt`
- `$env:ProgramData\_Automation\Script\New-ToastNotification\ToastNotification.log`

## Changelog

### 2026-07-16

- Removed obsolete and unused code.
- Eliminated the dependency on css.exe.
- Applied code signing to the New-ToastNotification.ps1 script.
- Updated the script to generate code-signed .ps1 files.
- Modified the download process to retrieve the .zip package from our file server instead of GitHub.

### 2025-04-10

- Initial version of the document
