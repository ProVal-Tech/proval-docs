---
id: '73dab29b-9bca-4840-bab9-309d604f56df'
title: 'Bitlocker Recovery Password - AD Backup'
title_meta: 'Bitlocker Recovery Password - AD Backup'
keywords: ['bitlocker', 'active', 'directory', 'backup', 'security']
description: 'This document provides a detailed implementation guide for the BitLocker Recovery Password backup to Active Directory using a ConnectWise RMM script. It includes requirements, sample runs, task creation steps, and troubleshooting tips.'
tags: ['active-directory', 'backup', 'encryption', 'gpo', 'security']
draft: false
unlisted: false
---

## Summary

This is a CW RMM implementation of the agnostic script [Backup-BitlockerRecoveryPW](<../../powershell/Backup-BitlockerRecoveryPW.md>). This script will back up BitLocker Recovery Passwords to the associated Active Directory instance.

## Requirements

- PowerShell v5
- Target must be domain-joined
- Group policy must be properly configured on the domain controller to allow backups of BitLocker keys into Active Directory

## Sample Run

![Sample Run 1](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_10.png)  
![Sample Run 2](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_11.png)  

## Dependencies

[SEC - Encryption - Agnostic - Backup-BitlockerRecoveryPW](<../../powershell/Backup-BitlockerRecoveryPW.md>)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_12.png)  
![Task Creation Step 2](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_13.png)  

**Name:** BitLocker Recovery Password - AD Backup  
**Description:** `This script will back up BitLocker Recovery Passwords to the associated Active Directory instance.`  
**Category:** Security  
![Task Creation Step 3](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_14.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Step 1](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_15.png)  

A blank function will appear.  
![Task Step 2](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_16.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Step 3](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_17.png)  
![Task Step 4](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_18.png)  

The following function will pop up on the screen:  
![Task Step 5](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_19.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$ProjectName = 'Backup-BitlockerRecoveryPW'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory/$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"
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
if (!(Test-Path $LogPath)) {
    throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell script.'
}
if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Task Step 6](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_20.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Step 7](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_21.png)  

A blank function will appear.  
![Task Step 8](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_22.png)  

Search and select the `Script Log` function.  
![Task Step 9](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_23.png)  
![Task Step 10](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_24.png)  

The following function will pop up on the screen:  
![Task Step 11](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_25.png)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Task Step 12](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_26.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Step 13](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_27.png)  

## Completed Task

![Completed Task](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_28.png)  

## Output

- Script log

## FAQ

1. The script is failing with "Unable to find type [Microsoft.BitLocker.Structures.BitLockerVolume]."
   - Group policy must be properly configured to allow backups of BitLocker keys to Active Directory. Follow the process below:

## GPO Creation Process

1. Click the search icon in the taskbar and type “**Group Policy**“. You can then click **Group Policy Management** to launch it.  
   ![GPO Step 1](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_29.png)  

2. In the left pane of Group Policy Management, right-click your AD domain and select “**Create a GPO in this domain, and Link it here…**” from the menu.  
   ![GPO Step 2](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_30.png)  

3. In the New GPO dialog, give the GPO a name and click **OK**.  
   ![GPO Step 3](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_31.png)  

4. Right-click the newly created GPO in the left pane, and select **Edit**.  
   ![GPO Step 4](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_32.png)  

5. Browse to `Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> BitLocker Drive Encryption`, and then double-click the policy “**Store BitLocker recovery information in Active Directory Domain Services**“.  
   ![GPO Step 5](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_33.png)  

6. Set the policy to **Enabled**. Make sure the “**Require BitLocker backup to AD DS**” option is checked, and select to store both recovery passwords and key packages.  
   ![GPO Step 6](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_34.png)  

7. Next, expand **BitLocker Drive Encryption** in the left pane. You’ll see three nodes: Fixed Data Drives, Operating System Drives, and Removable Data Drives. Select **Fixed Data Drives** and double-click the policy “**Choose how BitLocker-protected fixed drives can be recovered**“.  
   ![GPO Step 7](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_35.png)  

8. Set it to **Enabled**. Check the options “Save BitLocker recovery information to AD DS for fixed drives” and then click **OK**.  
   ![GPO Step 8](../../../static/img/Bitlocker-Recovery-Password---AD-Backup/image_36.png)  

9. Go to the “Operating System Drives” node and enable the similar policy “**Choose how BitLocker-protected operating system drives can be recovered**“. Afterwards, go to the “Removable Data Drives” node and enable the policy “**Choose how BitLocker-protected removable drives can be recovered**“.  

10. When any client PC retrieves the policy changes, BitLocker recovery information will be automatically and silently backed up to AD DS when BitLocker is turned on for fixed drives, OS drives, or removable drives.



