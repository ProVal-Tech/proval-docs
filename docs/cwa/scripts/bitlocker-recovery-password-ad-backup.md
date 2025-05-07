---
id: 'cd4cedee-cd92-4198-83d6-e7c596a6a01b'
slug: /cd4cedee-cd92-4198-83d6-e7c596a6a01b
title: 'Bitlocker Recovery Password - AD Backup'
title_meta: 'Bitlocker Recovery Password - AD Backup'
keywords: ['bitlocker', 'active', 'directory', 'backup', 'encryption']
description: 'This document provides a detailed guide on executing a script to back up BitLocker recovery keys to Active Directory. It covers requirements, dependencies, sample runs, and a step-by-step GPO creation process to ensure proper configuration for successful backups.'
tags: ['active-directory', 'backup', 'encryption', 'gpo']
draft: false
unlisted: false
---

## Summary

This Automate script executes the `Backup-BitlockerRecoveryPW.ps1` agnostic script.

## Requirements

- PowerShell v5
- The target must be domain-joined
- Group policy must be properly configured on the domain controller to allow backups of BitLocker keys into Active Directory 

### Dependencies

- [SEC - Encryption - Agnostic - Backup-BitlockerRecoveryPW](/docs/7eecbf0c-2b91-4454-ba5c-e1b9605f07fc)

## Sample Run

![Sample Run](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_1.png)

### Output

- Script log
- Dataview

## FAQ

1. The script is failing with "Unable to find type [Microsoft.BitLocker.Structures.BitLockerVolume]."
   - Group policy must be properly configured to allow backups of BitLocker keys to Active Directory. Follow the process below:

## GPO Creation Process

1. Click the Search icon in the taskbar and type “**Group Policy**“. You can then click **Group Policy Management** to launch it.
   ![Step 1](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_2.png)

2. In the left pane of Group Policy Management, right-click your AD domain and select “**Create a GPO in this domain, and Link it here…**” from the menu.
   ![Step 2](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_3.png)

3. In the New GPO dialog, give the GPO a name and click **OK**.
   ![Step 3](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_4.png)

### Configuration

4. Right-click the newly created GPO in the left pane and select **Edit**.
   ![Step 4](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_5.png)

5. Browse to `Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> BitLocker Drive Encryption`, and then double-click the policy “**Store BitLocker recovery information in Active Directory Domain Services**“.
   ![Step 5](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_6.png)

6. Set the policy to **Enabled**. Ensure the “**Require BitLocker backup to AD DS**” option is checked, and select to store both recovery passwords and key packages.
   ![Step 6](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_7.png)

7. Next, expand **BitLocker Drive Encryption** in the left pane. You’ll see three nodes: Fixed Data Drives, Operating System Drives, and Removable Data Drives. Select **Fixed Data Drives** and double-click the policy “**Choose how BitLocker-protected fixed drives can be recovered**“.
   ![Step 7](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_8.png)

8. Set it to **Enabled**. Check the options “Save BitLocker recovery information to AD DS for fixed drives” and then click **OK**.
   ![Step 8](../../../static/img/docs/cd4cedee-cd92-4198-83d6-e7c596a6a01b/image_9.png)

9. Go to the “Operating System Drives” node and enable the similar policy “**Choose how BitLocker-protected operating system drives can be recovered**“. Afterwards, go to the “Removable Data Drives” node and enable the policy “**Choose how BitLocker-protected removable drives can be recovered**“.

10. When any client PC retrieves the policy changes, BitLocker recovery information will be automatically and silently backed up to AD DS when BitLocker is turned on for fixed drives, OS drives, or removable drives.

