---
id: '4f425877-0d14-4135-b2d7-0e640af52851'
slug: /4f425877-0d14-4135-b2d7-0e640af52851
title: 'Lockdown Browsers Autofill and Password Manager'
title_meta: 'Lockdown Browsers Autofill and Password Manager'
keywords: ['browsers', 'autofill', 'passwords', 'security', 'edge', 'chrome', 'firefox', 'brave']
description: 'This document describes a script that disables the password manager and autofill features for Edge, Chrome, Brave, and Firefox browsers. It also provides instructions on how to clear saved passwords and disable Edge Wallet, ensuring enhanced security and privacy for users.'
tags: ['browsers', 'security', 'setup', 'uninstallation']
draft: false
unlisted: false
---

## Summary

The script can disable the password manager and autofill address and credit card information for the Edge, Chrome, Brave, and Firefox browsers. Moreover, it can delete the saved passwords, but it will forcefully close the browsers. Microsoft Edge will also be closed if the script is used to disable the Edge Wallet.

## Lockdown Browsers Password Manager

It's important to know that for browsers based on Chromium (like Google Chrome, Microsoft Edge, and Brave), turning off the Password Manager won't stop the Autofill (or Sign in Automatically) feature. If Autofill (or Sign in Automatically) is enabled and there are saved passwords, it will still automatically fill in credentials for websites. However, if the Password Manager is disabled, new passwords won't be saved, and the browser won't ask to store passwords. The saved passwords will still work.

For Firefox, turning off the Password Manager will also disable Autofill.

**Affected Setting for Google Chrome:**  
![Google Chrome Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_1.webp)

**Affected Setting for Brave:**  
![Brave Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_2.webp)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_3.webp)

**Affected Settings for Mozilla Firefox:**  
![Mozilla Firefox Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_4.webp)

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open. In certain situations, especially for Microsoft Edge, the user might need to restart the entire computer for the changes to take effect.

## Lockdown Chromium Browsers Credit Card Autofill

**Affected Setting for Google Chrome:**  
![Google Chrome Credit Card Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_5.webp)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Credit Card Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_6.webp)

**Affected Setting for Brave:**  
![Brave Credit Card Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_7.webp)

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open.

## Lockdown Chromium Browsers Address Autofill

**Affected Setting for Google Chrome:**  
![Google Chrome Address Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_8.webp)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Address Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_9.webp)

**Affected Setting for Brave:**  
![Brave Address Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_10.webp)

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open.

## Clear Browsers Saved Passwords

The task is designed to remove saved passwords from the following browsers:

- Google Chrome
- Microsoft Edge
- Brave
- Mozilla Firefox

**Note:**  

- If any of these browsers are running, they will be forcefully closed.

## Disable Edge Wallet

The task can disable the sync between Edge Wallet and the cloud. It should be disabled to remove the saved passwords from Microsoft Edge.  
![Edge Wallet](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_11.webp)

**Note:**  

- If Microsoft Edge is running, it will be forcefully closed.

## Sample Run

![Sample Run 1](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_12.webp)  
![Sample Run 2](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_13.webp)  
![Sample Run 3](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_14.webp)  

## User Parameters

| Name                     | Example                     | Accepted Values                                   | Default | Type  | Required | Description                                                          |
|--------------------------|-----------------------------|---------------------------------------------------|---------|-------|----------|----------------------------------------------------------------------|
| Browser                  | Chrome, Edge, Firefox       | Chrome, Edge, Firefox, Brave, All                 | All     | Text  | False    | Name of the Browser(s) to apply the changes for.                   |
| DisablePasswordManager    | True                        | True or False                                     | True    | Text  | False    | Set this value to false to NOT disable the password manager for the browser(s). |
| DisableAutofillAddress   | True                        | True or False                                     | True    | Text  | False    | Set this value to false to NOT disable the autofilling of addresses for the browser(s). |
| DisableAutofillCreditCard | True                        | True or False                                     | True    | Text  | False    | Set this value to false to NOT disable the autofilling of credit card details for the browser(s). |
| RemoveSavedPassword       | False                       | True or False                                     | False   | Text  | False    | Setting this to true will remove the saved passwords from the browser(s). Browser(s) will be forcefully closed if they are running. |
| DisableEdgeWallet         | False                       | True or False                                     | False   | Text  | False    | Setting this to true will disable the Microsoft Edge Wallet's sync. Microsoft Edge will be forcefully closed if it is running. It is mandatory to set this parameter to True to remove the saved password from Microsoft Edge. |

![User Parameters](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_15.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Create Script](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_16.webp)  
![Create Script Step 2](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_17.webp)

**Name:** Lockdown Browsers Autofill and Password Manager  
**Description:** The script can disable the password manager and autofill address and credit card information for the Edge, Chrome, Brave, and Firefox browsers. Moreover, it can delete the saved passwords, but it will forcefully close the browsers. Microsoft Edge will also be closed if the script is used to disable the Edge Wallet.  
**Category:** Application  
![Category](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_18.webp)

## Parameters

### Browsers

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_19.webp)

This screen will appear.  
![Parameter Screen](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_20.webp)

- Set `Browser` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `All` in the `Default Value` field.
- Click the `Save` button.

![Save Parameter](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_21.webp)

Create the rest of the parameters described in the `User Parameters` section of the document in the same way.

### DisablePasswordManager:
![Disable Password Manager](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_22.webp)

### DisableAutofillAddress:
![Disable Autofill Address](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_23.webp)

### DisableAutofillCreditCard:
![Disable Autofill Credit Card](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_24.webp)

### RemoveSavedPassword:
![Remove Saved Password](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_25.webp)

### DisableEdgeWallet:
![Disable Edge Wallet](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_26.webp)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_27.webp)

A blank function will appear.  
![Blank Function](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_28.webp)

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_29.webp)  
![PowerShell Script Step 2](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_30.webp)

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_31.webp)

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.

```powershell
$projectName = 'Set-BrowserSecPolicy'
$workingDirectory = "C:\ProgramData\_Automation\App\$projectName"
$scriptPath = "$workingDirectory\$projectName.ps1"
# Create WorkingDirectory
if (!(Test-Path $workingDirectory)) {
    try {
        New-Item -Path $workingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        throw "!ERROR!: Failed to Create $workingDirectory. Reason: $($Error[0].Exception.Message)"
    }
}
# Assign permissions to everyone for the $workingDirectory
if (-not ((Get-Acl $workingDirectory).Access | Where-Object { $_.IdentityReference -Match 'Everyone' }).FileSystemRights -Match 'FullControl') {
    $Acl = Get-Acl $workingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $workingDirectory $Acl -ErrorAction SilentlyContinue
}
# Script Text
$scriptText = @"
#requires -RunAsAdministrator
#requires -Version 5.1
#Parameters
[CmdletBinding()]
param (
    [Parameter(Mandatory = `$true)]
    [ValidateSet('Chrome', 'Edge', 'Brave', 'Firefox', 'All')]
    [String[]]`$Browser = 'All',
    [Parameter(Mandatory = `$false)]
    [bool]`$DisablePasswordManager = `$true,
    [Parameter(Mandatory = `$false)]
    [bool]`$DisableAutofillAddress = `$true,
    [Parameter(Mandatory = `$false)]
    [bool]`$DisableAutofillCreditCard = `$true,
    [Parameter(Mandatory = `$false)]
    [bool]`$RemoveSavedPassword = `$false,
    [Parameter(Mandatory = `$false)]
    [bool]`$DisableEdgeWallet = `$false
)
#Function to check if the application is installed
function Find-Application {
    Param(
        [Parameter()]
        [String]
        `$Name
    )
    if (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { `$_.DisplayName -match "`$Name" }) {
        Write-Information "`$Name is installed." -InformationAction Continue
        return `$Name
    } else {
        Write-Information "`$Name is not installed." -InformationAction Continue
        return `$false
    }
}
#Function to check the current value of the registry key
function Get-RegValue {
    Param(
        [Parameter()]
        [String]
        `$path,
        `$Reg
    )
    try {
        return (Get-ItemProperty -Path `$path -ErrorAction Stop)."`$Reg"
    } catch {
        return `$null
    }
}
#Function to set the value to the registry key
function Set-RegValue {
    Param(
        [Parameter()]
        [String]
        `$path,
        `$Reg,
        `$Value
    )
    if ((Get-RegValue -path `$path -Reg `$Reg) -ne `$Value) {
        if (!(Test-Path -Path `$path)) {
            New-Item -Path `$path -Force | Out-Null
        }
        Set-ItemProperty -Path `$path -Name `$Reg -Value `$Value -Force
    }
}
`$failed = @()
if (`$Browser -eq 'All') {
    `$Browser = @('Chrome', 'Edge', 'Brave', 'Firefox')
}
#Disable Password Manager and Autofill
foreach (`$app in `$Browser) {
    # Set the registry settings for the current Browser
    switch (`$app) {
        'Chrome' {
            `$regPath = 'HKLM:\Software\Policies\Google\Chrome'
            `$appName = 'Google Chrome'
            `$process = 'chrome'
            `$profilePath = 'AppData\Local\Google\Chrome'
        }
        'Edge' {
            `$regPath = 'HKLM:\Software\Policies\Microsoft\Edge'
            `$appName = 'Microsoft Edge'
            `$process = 'msedge'
            `$profilePath = 'AppData\Local\Microsoft\Edge'
        }
        'Brave' {
            `$regPath = 'HKLM:\SOFTWARE\Policies\BraveSoftware\Brave'
            `$appName = 'Brave'
            `$process = 'brave'
            `$profilePath = 'AppData\Local\BraveSoftware\Brave-Browser'
        }
        'Firefox' {
            `$regPath = 'HKLM:\Software\Policies\Mozilla\Firefox'
            `$appName = 'Mozilla Firefox'
            `$process = 'firefox'
            `$profilePath = 'AppData\Roaming\Mozilla\Firefox\Profiles'
        }
    }
    # Check Application
    if (Find-Application -Name `$appName) {
        # Disable Password Manager
        if (`$DisablePasswordManager -eq `$true) {
            `$reg = 'PasswordManagerEnabled'
            `$Value = 0
            Write-Information "Disabling Password Manager for `$appName." -InformationAction Continue
            Set-RegValue -Path `$regPath -Reg `$reg -Value `$Value
            if ((Get-RegValue -path `$regPath -Reg `$reg) -ne `$Value) {
                `$failed += `$app
            }
        }
        # Disable Autofill Address for Chromium
        if (`$DisableAutofillAddress -eq `$true -and `$app -ne 'Firefox') {
            `$Value = 0
            Write-Information "Disabling Address Autofilling for `$appName." -InformationAction Continue
            `$reg = 'AutofillAddressEnabled'
            Set-RegValue -Path `$regPath -Reg `$reg -Value `$Value
            if ((Get-RegValue -path `$regPath -Reg `$reg) -ne `$Value) {
                `$failed += `$app
            }
        }
        # Disable Autofill Credit Card for Chromium
        if (`$DisableAutofillCreditCard -eq `$true -and `$app -ne 'Firefox') {
            `$Value = 0
            Write-Information "Disabling Credit Card Information Autofilling for `$appName." -InformationAction Continue
            foreach (`$reg in 'AutofillCreditCardEnabled', 'PaymentMethodQueryEnabled') {
                Set-RegValue -Path `$regPath -Reg `$reg -Value `$Value
                if ((Get-RegValue -path `$regPath -Reg `$reg) -ne `$Value) {
                    `$failed += `$app
                }
            }
        }
        # Disable Edge Wallet
        if (`$DisableEdgeWallet -eq `$true -and `$app -eq 'Edge') {
            Write-Information 'Disabling Edge Wallet.' -InformationAction Continue
            Write-Information "Stopping the process for `$appName if it's running." -InformationAction Continue
            Get-Process -Name `$process -ErrorAction SilentlyContinue | Stop-Process -Force -Confirm:`$False -WarningAction SilentlyContinue
            Start-Sleep -Seconds 2
            `$reg = 'SyncDisabled'
            `$Value = 1
            Set-RegValue -Path `$regPath -Reg `$reg -Value `$Value
            if ((Get-RegValue -path `$regPath -Reg `$reg) -ne `$Value) {
                `$failed += `$app
            }
            foreach (`$path in Get-ChildItem -Path 'C:\Users' | Where-Object { `$_.Mode -match 'd' }) {
                if (Test-Path -Path "`$(`$path.FullName)\`$profilePath") {
                    if (Test-Path -Path "`$(`$path.FullName)\`$profilePath\User Data\Edge Wallet") {
                        try {
                            Remove-Item -Path "`$(`$path.FullName)\`$profilePath\User Data\Edge Wallet" -Force -Confirm:`$False -ErrorAction Stop
                        } catch {
                            `$failed += `$app
                        }
                    }
                }
            }
        }
        # Delete Saved Passwords for chromium
        if (`$RemoveSavedPassword -eq `$true -and `$app -ne 'Firefox') {
            Write-Information "Stopping the process for `$appName if it's running." -InformationAction Continue
            Get-Process -Name `$process -ErrorAction SilentlyContinue | Stop-Process -Force -Confirm:`$False -WarningAction SilentlyContinue
            Start-Sleep -Seconds 2
            foreach (`$path in Get-ChildItem -Path 'C:\Users' | Where-Object { `$_.Mode -match 'd' }) {
                if (Test-Path -Path "`$(`$path.FullName)\`$profilePath") {
                    foreach (`$item in ('Login Data', 'Login Data-journal')) {
                        if (Test-Path -Path "`$(`$path.FullName)\`$profilePath\User Data\Default\`$item") {
                            try {
                                Write-Information "Removing the passwords saved in `$appName for `$(`$path.Name)" -InformationAction Continue
                                Remove-Item -Path "`$(`$path.FullName)\`$profilePath\User Data\Default\`$item" -Force -Confirm:`$False -ErrorAction Stop
                            } catch {
                                `$failed += `$app
                            }
                        }
                    }
                }
            }
        }
        # Delete Saved Passwords for Firefox
        if (`$RemoveSavedPassword -eq `$true -and `$app -eq 'Firefox') {
            Write-Information "Stopping the process for `$appName if it's running." -InformationAction Continue
            Get-Process -Name `$process -ErrorAction SilentlyContinue | Stop-Process -Force -Confirm:`$False -WarningAction SilentlyContinue
            Start-Sleep -Seconds 2
            foreach (`$path in Get-ChildItem -Path 'C:\Users' | Where-Object { `$_.Mode -match 'd' }) {
                if (Test-Path -Path "`$(`$path.FullName)\`$profilePath") {
                    foreach (`$profile in Get-ChildItem -Path "`$(`$path.FullName)\`$profilePath" | Where-Object { `$_.Mode -match 'd' }) {
                        foreach (`$item in ('signons.txt', 'signons2.txt', 'signons3.txt', 'signons.sqlite', 'logins.json', 'logins-backup.json')) {
                            if (Test-Path -Path "`$(`$profile.FullName)\`$item") {
                                try {
                                    Write-Information "Removing the passwords saved in `$appName for `$(`$path.Name)" -InformationAction Continue
                                    Remove-Item -Path "`$(`$profile.FullName)\`$item" -Force -Confirm:`$False -ErrorAction Stop
                                } catch {
                                    `$failed += `$app
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
# return failures if any
if (`$failed.Count -gt 0) {
    throw "The following applications encountered issues: `$(`$failed -join ', ')"
} else {
    Write-Information 'All operations completed successfully.' -InformationAction Continue
}
"@
# Write Script
Write-Information 'Writing the PowerShell Script.' -InformationAction Continue
Remove-Item $scriptPath -Force -Confirm:$false -ErrorAction SilentlyContinue
try {
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllLines($scriptPath, $scriptText, $Utf8NoBomEncoding)
} catch {
    throw "Failed to write the PowerShell script. Reason: $($Error[0].Exception.Message)"
}
# Set Parameters
if ( !('@Browser@' -match 'Chrome|Edge|Brave|Firefox|All') -or '@Browser@' -match 'All' ) {
    $Browser = 'All'
} else {
    $Browser = @()
    if ('@Browser@' -match 'Chrome') {
        $Browser += 'Chrome'
    }
    if ('@Browser@' -match 'Edge') {
        $Browser += 'Edge'
    }
    if ('@Browser@' -match 'Brave') {
        $Browser += 'Brave'
    }
    if ('@Browser@' -match 'Firefox') {
        $Browser += 'Firefox'
    }
}
if ('@DisablePasswordManager@' -match 'False|No|0') {
    $DisablePasswordManager = $false
} else {
    $DisablePasswordManager = $true
}
if ('@DisableAutofillAddress@' -match 'False|No|0') {
    $DisableAutofillAddress = $false
} else {
    $DisableAutofillAddress = $true
}
if ('@DisableAutofillCreditCard@' -match 'False|No|0') {
    $DisableAutofillCreditCard = $false
} else {
    $DisableAutofillCreditCard = $true
}
if ('@RemoveSavedPassword@' -match 'True|1|Yes') {
    $RemoveSavedPassword = $true
} else {
    $RemoveSavedPassword = $false
}
if ('@DisableEdgeWallet@' -match 'True|1|Yes') {
    $DisableEdgeWallet = $true
} else {
    $DisableEdgeWallet = $false
}
$parameters = @{
    Browser = $Browser
    DisablePasswordManager = $DisablePasswordManager
    DisableAutofillAddress = $DisableAutofillAddress
    DisableAutofillCreditCard = $DisableAutofillCreditCard
    RemoveSavedPassword = $RemoveSavedPassword
    DisableEdgeWallet = $DisableEdgeWallet
}
# Run Script
& $scriptPath @parameters
```

![Script Execution](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_32.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row for Log](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_33.webp)

A blank function will appear.  
![Blank Function for Log](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_34.webp)

Search and select the `Script Log` function.  
![Script Log Function](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_35.webp)

The following function will pop up on the screen:  
![Script Log Pop Up](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_36.webp)

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_37.webp)

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_38.webp)

## Completed Task

![Completed Task](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_39.webp)

## Output

- Script Log


