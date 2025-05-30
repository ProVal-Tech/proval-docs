---
id: '73dab29b-9bca-4840-bab9-309d604f56df'
slug: /73dab29b-9bca-4840-bab9-309d604f56df
title: 'Bitlocker Recovery Password - AD Backup'
title_meta: 'Bitlocker Recovery Password - AD Backup'
keywords: ['bitlocker', 'active', 'directory', 'backup', 'security']
description: 'This document provides a detailed implementation guide for the BitLocker Recovery Password backup to Active Directory using a ConnectWise RMM script. It includes requirements, sample runs, task creation steps, and troubleshooting tips.'
tags: ['active-directory', 'backup', 'encryption', 'gpo', 'security']
draft: false
unlisted: false
---

## Summary

This is a CW RMM implementation of the agnostic script [Backup-BitlockerRecoveryPW](/docs/7eecbf0c-2b91-4454-ba5c-e1b9605f07fc). This script will back up BitLocker Recovery Passwords to the associated Active Directory instance.

## Requirements

- PowerShell v5
- Target must be domain-joined
- Group policy must be properly configured on the domain controller to allow backups of BitLocker keys into Active Directory

## Sample Run

![Sample Run 1](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_10.webp)  
![Sample Run 2](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_11.webp)  

## Dependencies

[Backup-BitlockerRecoveryPW](/docs/7eecbf0c-2b91-4454-ba5c-e1b9605f07fc)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_12.webp)  
![Task Creation Step 2](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_13.webp)  

**Name:** BitLocker Recovery Password - AD Backup  
**Description:** `This script will back up BitLocker Recovery Passwords to the associated Active Directory instance.`  
**Category:** Security  
![Task Creation Step 3](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_14.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Step 1](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_15.webp)  

A blank function will appear.  
![Task Step 2](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_16.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Step 3](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_17.webp)  
![Task Step 4](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_18.webp)  

The following function will pop up on the screen:  
![Task Step 5](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_19.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
#region Variables
$ProjectName = 'Backup-BitlockerRecoveryPW'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
#endregion
#region Setup - Folder Structure
New-Item -Path $WorkingDirectory -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    throw "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    throw 'An error occurred and the script was unable to be downloaded. Exiting.'
}
#endregion
#region Execution
if ($Parameters) {
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion

if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Task Step 6](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_20.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Step 7](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_21.webp)  

A blank function will appear.  
![Task Step 8](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_22.webp)  

Search and select the `Script Log` function.  
![Task Step 9](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_23.webp)  
![Task Step 10](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_24.webp)  

The following function will pop up on the screen:  
![Task Step 11](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_25.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Task Step 12](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_26.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Step 13](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_27.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_28.webp)  

## Output

- Script log

## FAQ

1. The script is failing with "Unable to find type [Microsoft.BitLocker.Structures.BitLockerVolume]."
   - Group policy must be properly configured to allow backups of BitLocker keys to Active Directory. Follow the process below:

## GPO Creation Process

1. Click the search icon in the taskbar and type “**Group Policy**“. You can then click **Group Policy Management** to launch it.  
   ![GPO Step 1](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_29.webp)  

2. In the left pane of Group Policy Management, right-click your AD domain and select “**Create a GPO in this domain, and Link it here…**” from the menu.  
   ![GPO Step 2](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_30.webp)  

3. In the New GPO dialog, give the GPO a name and click **OK**.  
   ![GPO Step 3](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_31.webp)  

4. Right-click the newly created GPO in the left pane, and select **Edit**.  
   ![GPO Step 4](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_32.webp)  

5. Browse to `Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> BitLocker Drive Encryption`, and then double-click the policy “**Store BitLocker recovery information in Active Directory Domain Services**“.  
   ![GPO Step 5](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_33.webp)  

6. Set the policy to **Enabled**. Make sure the “**Require BitLocker backup to AD DS**” option is checked, and select to store both recovery passwords and key packages.  
   ![GPO Step 6](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_34.webp)  

7. Next, expand **BitLocker Drive Encryption** in the left pane. You’ll see three nodes: Fixed Data Drives, Operating System Drives, and Removable Data Drives. Select **Fixed Data Drives** and double-click the policy “**Choose how BitLocker-protected fixed drives can be recovered**“.  
   ![GPO Step 7](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_35.webp)  

8. Set it to **Enabled**. Check the options “Save BitLocker recovery information to AD DS for fixed drives” and then click **OK**.  
   ![GPO Step 8](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_36.webp)  

9. Go to the “Operating System Drives” node and enable the similar policy “**Choose how BitLocker-protected operating system drives can be recovered**“. Afterwards, go to the “Removable Data Drives” node and enable the policy “**Choose how BitLocker-protected removable drives can be recovered**“.  

10. When any client PC retrieves the policy changes, BitLocker recovery information will be automatically and silently backed up to AD DS when BitLocker is turned on for fixed drives, OS drives, or removable drives.