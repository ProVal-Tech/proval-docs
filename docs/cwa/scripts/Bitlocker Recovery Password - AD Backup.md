---
id: 'cwa-backup-bitlocker-recovery'
title: 'Backup BitLocker Recovery Keys to Active Directory'
title_meta: 'Backup BitLocker Recovery Keys to Active Directory'
keywords: ['bitlocker', 'active', 'directory', 'backup', 'encryption']
description: 'This document provides a detailed guide on executing a script to backup BitLocker recovery keys to Active Directory. It covers requirements, dependencies, sample runs, and a step-by-step GPO creation process to ensure proper configuration for successful backups.'
tags: ['backup', 'encryption', 'gpo', 'configuration', 'active-directory']
draft: false
unlisted: false
---
## Summary

This Automate script executes the Backup-BitlockerRecoveryPW.ps1 agnostic script.

## Requirements

- PowerShell v5
- Target must be domain-joined
- Group policy must be properly configured on the domain controller to allow backups of BitLocker keys into Active Directory 

### Dependencies

- [SEC - Encryption - Agnostic - Backup-BitlockerRecoveryPW](https://proval.itglue.com/DOC-5078775-10673018)

## Sample Run

![Sample Run](5078775/docs/10672949/images/14820666)

### Output

- Script log
- Dataview

## FAQ

1. The script is failing with  Unable to find type [Microsoft.BitLocker.Structures.BitLockerVolume].
   - Group policy must be properly configured to allow backups of Bitlocker keys to active directory. Follow the process below:

## GPO Creation Process

1. Click the Search icon in the taskbar and type “**group policy**“. You can then click **Group Policy Management** to launch it.
   ![Step 1](5078775/docs/9045331/images/16626828)

2. Now in the left pane of Group Policy Management, right-click your AD domain and select “**Create a GPO in this domain, and Link it here…**” from the menu.
   ![Step 2](5078775/docs/9045331/images/16626838)

3. In the New GPO dialog, give the GPO a name and click **OK**.
   ![Step 3](5078775/docs/9045331/images/16626843)

### Configuration

4. Right-click the newly-created GPO in the left pane, and select **Edit**.
   ![Step 4](5078775/docs/9045331/images/16626854)

5. Browse to `Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> BitLocker Drive Encryption`, and then double-click the policy “**Store BitLocker recovery information in Active Directory Domain Services**“.
   ![Step 5](5078775/docs/9045331/images/16626860)

6. Set the policy to **Enabled**. Make sure the “**Require BitLocker backup to AD DS**” option is checked, and select to store both recovery passwords and key packages.
   ![Step 6](5078775/docs/9045331/images/16626869)

7. Next, expand **BitLocker Drive Encryption** in the left pane. You’ll see three nodes: Fixed Data Drives, Operating System Drives, Removable Data Drives. Just select Fixed Data Drives and double-click the policy “**Choose how BitLocker-protected fixed drives can be recovered**“.
   ![Step 7](5078775/docs/9045331/images/16626888)

8. Set it to **Enabled**. Check the options “Save BitLocker recovery information to AD DS for fixed drives” and then click OK.
   ![Step 8](5078775/docs/9045331/images/16626894)

9. Go to the “Operating System Drives” node and turn on the similar policy “**Choose how BitLocker-protected operating system drives can be recovered**“. Afterwards, go to the “Removable Data Drives” node and enable the policy “**Choose how BitLocker-protected removable drives can be recovered**“.

10. When any client PC retrieves the policy changes, BitLocker recovery information will be automatically and silently backed up to AD DS when BitLocker is turned on for fixed drives, OS drives or removable drives.

