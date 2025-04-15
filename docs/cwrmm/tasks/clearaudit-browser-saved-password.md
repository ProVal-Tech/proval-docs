---
id: 'a56e605b-a1d4-45ea-bebb-4411f3890f7e'
slug: /a56e605b-a1d4-45ea-bebb-4411f3890f7e
title: 'ClearAudit - Browser Saved Password'
title_meta: 'ClearAudit - Browser Saved Password'
keywords: ['browser', 'password', 'audit', 'clearance', 'windows']
description: 'This document outlines the steps to perform a Browser Saved Password Audit or Clearance using a custom PowerShell script. It includes sample runs, implementation details, and deployment instructions to ensure secure management of saved passwords across different web browsers.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This task is designed to perform the Browser Saved Password Audit or Clearance based on the custom fields selected.

## Sample Run

![Sample Run 1](../../../static/img/ClearAudit---Browser-Saved-Password/image_1.png)

![Sample Run 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_2.png)

![Sample Run 3](../../../static/img/ClearAudit---Browser-Saved-Password/image_3.png)

## Implementation

### Create Task

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_4.png)

- **Name:** Clear/Audit - Browser Saved Password  
- **Description:** This task performs the audit or clearance of the browser-saved password based on the option provided.  
- **OS Supported:** Windows  
- **Category:** Application

![Task Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_5.png)

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/ClearAudit---Browser-Saved-Password/image_6.png)

### Row 1: Function: Set User Variable

![Row 1 Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_7.png)

![Row 1 Image 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_8.png)

This sets the variable `EdgeWallet` with the value of a user parameter `@Wipe+DisableCloudSync-EdgeWallet@`.

### Row 2: Logic: If/Then/Else

![Row 2 Logic](../../../static/img/ClearAudit---Browser-Saved-Password/image_9.png)

![Row 2 Logic 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_10.png)

#### IF Condition

##### Row 2a: IF: Condition: Custom Field

In the IF part, enter the custom field as shown below:

![Custom Field](../../../static/img/ClearAudit---Browser-Saved-Password/image_11.png)

##### Row 2b: Function: PowerShell Script

![PowerShell Script 1](../../../static/img/ClearAudit---Browser-Saved-Password/image_12.png)

![PowerShell Script 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_13.png)

Paste in the following PowerShell script and set the expected time of script execution to **900 seconds**.

```powershell
$regPath = 'HKLM:\\Software\\Policies\\Microsoft\\Edge'
$name = 'SyncDisabled'
$SyncDisabled = (Get-ItemProperty -Path $regPath -Name $name -ErrorAction SilentlyContinue).SyncDisabled
if ($SyncDisabled) {
    Write-Output 'MSEdge Password Wallet Sync Disabled '
} else {
    Write-Output 'MSEdge Password Wallet Sync Enabled '
}
```

```powershell
# Function to count and log password files
function Log-PasswordFiles {
    param (
        [string]$browserName,
        [string]$userName,
        [string]$path,
        [string[]]$items
    )
    $count = 0
    foreach ($item in $items) {
        if (Test-Path -Path "$path\\$item") {
            $count++
        }
    }
    if ($count -gt 0) {
        Write-Information "-- $count Passwords saved in $browserName for $userName" -InformationAction Continue
    }
}
```

```powershell
# Chrome and Brave
if ((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Chrome|Brave' }).DisplayName) {
    Start-Sleep -Seconds 10
    foreach ($path in (Get-ChildItem -Path 'C:\\Users' | Where-Object { $_.Mode -match 'd' })) {
        foreach ($Browser in 'Google\\Chrome', 'BraveSoftware\\Brave-Browser') {
            if (Test-Path -Path "$($path.FullName)\\Appdata\\Local\\$Browser") {
                Log-PasswordFiles -browserName $(($Browser -split '\\\\') -replace '-Browser', '') -userName $path.Name -path "$($path.FullName)\\Appdata\\Local\\$Browser\\User Data\\Default" -items @('Login Data', 'Login Data-journal')
            }
        }
    }
}
```

```powershell
# Microsoft Edge
if ((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Edge' }).DisplayName) {
    Start-Sleep -Seconds 10
    foreach ($path in (Get-ChildItem -Path 'C:\\Users' | Where-Object { $_.Mode -match 'd' })) {
        foreach ($Browser in 'Microsoft\\Edge') {
            if (Test-Path -Path "$($path.FullName)\\Appdata\\Local\\$Browser") {
                Log-PasswordFiles -browserName $(($Browser -split '\\\\') -replace '-Browser', '') -userName $path.Name -path "$($path.FullName)\\Appdata\\Local\\$Browser\\User Data\\Default" -items @('Login Data', 'Login Data-journal')
            }
        }
    }
}
```

```powershell
# Firefox
if ((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Firefox' }).DisplayName) {
    Start-Sleep -Seconds 10
    foreach ($path in (Get-ChildItem -Path 'C:\\Users' | Where-Object { $_.Mode -match 'd' })) {
        if (Test-Path -Path "$($path.FullName)\\Appdata\\Roaming\\Mozilla\\Firefox\\Profiles") {
            foreach ($profile in ((Get-ChildItem -Path "$($path.FullName)\\Appdata\\Roaming\\Mozilla\\Firefox\\Profiles" | Where-Object { $_.Mode -match 'd' }).FullName)) {
                Log-PasswordFiles -browserName 'Firefox' -userName $path.Name -path $profile -items @('signons.txt', 'signons2.txt', 'signons3.txt', 'signons.sqllite', 'logins.json', 'logins-backup.json')
            }
        }
    }
}
```

##### Row 2c: Function: Script Log

![Script Log Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_14.png)

In the script log message, type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Image 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_15.png)

##### Row 2d: Function: Set Custom Field

![Set Custom Field Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_16.png)

Select Function 'Set Custom Field'. When you select `set custom field`, it will open a new window.

In this window, search for the `Browser Saved Pwd Audit Data` field.

- **Custom Field:** `Browser Saved Pwd Audit Data`  
- **Value:** `%output%`

![Custom Field Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_17.png)

##### Row 2e: Function: Script Exit

![Script Exit Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_18.png)

In the script Exit, leave it empty and save.

![Script Exit Save Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_19.png)

### Else Condition

#### Row 2f: Logic: If/Else/Then

![Else Logic 1](../../../static/img/ClearAudit---Browser-Saved-Password/image_9.png)

![Else Logic 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_10.png)

#### IF Condition

##### Row 2f(i): Condition: Value

In the IF part, enter Value 1 equals to `@EdgeWallet@`.

![Condition Value Image](../../../static/img/ClearAudit---Browser-Saved-Password/image_20.png)

##### Row 2f(ii): Logic: If/Then

![If Then Logic 1](../../../static/img/ClearAudit---Browser-Saved-Password/image_21.png)

![If Then Logic 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_22.png)

##### Row 2f(iii): Condition: Custom Field

In the IF part, enter the custom field as shown below:

![Custom Field Image 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_23.png)

##### Row 2f(iv): Function: PowerShell Script

![PowerShell Script 3](../../../static/img/ClearAudit---Browser-Saved-Password/image_12.png)

![PowerShell Script 4](../../../static/img/ClearAudit---Browser-Saved-Password/image_24.png)

Paste in the following PowerShell script and set the expected time of script execution to **900 seconds**.

```powershell
# Ensure that Microsoft Edge is not running
Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue > $null 2>&1

# Define the registry path for Edge sync settings
$regPath = "HKLM:\\Software\\Policies\\Microsoft\\Edge"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force > $null 2>&1
}

# Disable password sync by setting the policy
New-ItemProperty -Path $regPath -Name "SyncDisabled" -Value 1 -PropertyType DWORD -Force > $null 2>&1
Write-Output "Password sync from Microsoft Edge cloud has been disabled for Edge Wallet"

# Function to count and log password files
function Log-PasswordFiles {
    param (
        [string]$browserName,
        [string]$userName,
        [string]$path,
        [string[]]$items
    )
    $successCount = 0
    $failureCount = 0
    foreach ($item in $items) {
        if (Test-Path -Path "$path\\$item") {
            try {
                Remove-Item -Path "$path\\$item" -Force -Confirm:$False -ErrorAction Stop
                $successCount++
            }
            catch {
                $failureCount++
                $Reason = "$($_.Exception.Message)"
            }
        }
    }
    if ($successCount -gt 0) {
        Write-Information "-- $successCount passwords removed in $browserName for $userName " -InformationAction Continue
    }
    if ($failureCount -gt 0) {
        Write-Information "-- $failureCount passwords failed to remove in $browserName for $userName " -InformationAction Continue
    }
}
```

```powershell
# Chromium
if ((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Chrome|Brave|Edge' }).DisplayName) {
    Get-Process -Name chrome, msedge, brave -ErrorAction SilentlyContinue | Stop-Process -Force -Confirm:$False -WarningAction SilentlyContinue > $null 2>&1
    Start-Sleep -Seconds 10
    foreach ($path in (Get-ChildItem -Path 'C:\\Users' | Where-Object { $_.Mode -match 'd' })) {
        foreach ($Browser in 'Google\\Chrome', 'Microsoft\\Edge', 'BraveSoftware\\Brave-Browser') {
            if (Test-Path -Path "$($path.FullName)\\Appdata\\Local\\$Browser") {
                Log-PasswordFiles -browserName $(($Browser -split '\\\\') -replace '-Browser','') -userName $($path.Name) -path "$($path.FullName)\\Appdata\\Local\\$Browser\\User Data\\Default" -items @('Login Data', 'Login Data-journal')
            }
        }
    }
}
```

```powershell
# Firefox
if ((Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Firefox' }).DisplayName) {
    Get-Process -Name firefox -ErrorAction SilentlyContinue | Stop-Process -Force -Confirm:$False -WarningAction SilentlyContinue > $null 2>&1
    Start-Sleep -Seconds 10
    foreach ($path in (Get-ChildItem -Path 'C:\\Users' | Where-Object { $_.Mode -match 'd' })) {
        if (Test-Path -Path "$($path.FullName)\\Appdata\\Roaming\\Mozilla\\Firefox\\Profiles") {
            foreach ($profile in ((Get-ChildItem -Path "$($path.FullName)\\Appdata\\Roaming\\Mozilla\\Firefox\\Profiles" | Where-Object { $_.Mode -match 'd' }).FullName)) {
                Log-PasswordFiles -browserName 'Firefox' -userName $($path.Name) -path $profile -items @('signons.txt', 'signons2.txt', 'signons3.txt', 'signons.sqllite', 'logins.json', 'logins-backup.json')
            }
        }
    }
}
```

##### Row 2f(v): Function: Script Log

![Script Log Image 3](../../../static/img/ClearAudit---Browser-Saved-Password/image_14.png)

In the script log message, type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Image 4](../../../static/img/ClearAudit---Browser-Saved-Password/image_15.png)

##### Row 2f(vi): Function: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open a new window.

In this window, search for the `Browser Saved Pwd Audit Data` field.

- **Custom Field:** `Browser Saved Pwd Audit Data`  
- **Value:** `%output%`

![Custom Field Image 3](../../../static/img/ClearAudit---Browser-Saved-Password/image_25.png)

##### Row 2f(vii): Function: Script Exit

![Script Exit Image 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_18.png)

In the script Exit, leave it empty and save.

![Script Exit Save Image 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_19.png)

### Row 3: Complete

![Complete Image 1](../../../static/img/ClearAudit---Browser-Saved-Password/image_26.png)

![Complete Image 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_27.png)

![Complete Image 3](../../../static/img/ClearAudit---Browser-Saved-Password/image_28.png)

## Deployment

It is suggested to run the Task daily or weekly on the groups "Clear Browser Saved Password endpoints" and "Browser Saved Password Audit Group."  
Refer to the Group documentation: [Dynamic Groups - Browser Saved Password](/docs/a9b4c5f1-c1bb-4e0d-8a2f-fad1bca51d47) on how to create it.

- Go to `Automation` > `Tasks.`
- Search for `Clear/Audit - Browser Saved Password` Task.
- Select the concerned task.
- Click on `Schedule` to schedule the task/script.

This screen will appear.

![Schedule Screen](../../../static/img/ClearAudit---Browser-Saved-Password/image_29.png)

- Select the time to run the script and click the "Does not repeat" button.

![Does Not Repeat](../../../static/img/ClearAudit---Browser-Saved-Password/image_30.png)

- A pop-up box will appear.
- Change the number of hours to `2` and click `OK`.

![Change Hours](../../../static/img/ClearAudit---Browser-Saved-Password/image_31.png)

![Change Hours 2](../../../static/img/ClearAudit---Browser-Saved-Password/image_32.png)

- Search for `Cyrisma Sensor Deployment` in the `Resources*` and select it. You can search and select any relevant group you would like to schedule the task against. If the site doesn't have a device group that includes all Windows agents, then create one and schedule the task on it.

![Search Group](../../../static/img/ClearAudit---Browser-Saved-Password/image_33.png)

- Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/ClearAudit---Browser-Saved-Password/image_34.png)

- The task will start appearing in the Scheduled Tasks.

## Output

- Script log
- Custom field

