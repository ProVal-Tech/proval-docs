---
id: 'd533538b-8b00-425e-849f-434518296b2d'
slug: /d533538b-8b00-425e-849f-434518296b2d
title: 'Bitlocker - AD Key Protector - Audit'
title_meta: 'Bitlocker - AD Key Protector - Audit'
keywords: ['audit', 'bitlocker', 'key', 'protectors', 'active', 'directory']
description: 'This document provides a detailed guide on auditing existing backup BitLocker key protectors from an Active Directory server. It includes sample runs, dependencies, process explanations, and a step-by-step guide to configuring Group Policy for automatic backup of BitLocker recovery keys to Active Directory.'
tags: ['active-directory', 'backup', 'encryption', 'gpo', 'windows']
draft: false
unlisted: false
---

## Summary

This document audits the existing backup BitLocker key protectors from an Active Directory server.

**Note:** The **Store BitLocker recovery information in Active Directory Domain Services** policy must be enabled on the domain controller to save the recovery keys.

## File Hash

**File Path**: `C:\ProgramData\_Automation\script\Get-ADBitlockerStores\Get-ADBitlockerStores-loop.ps1`  
**SHA256**: `500A60B0D5223AAF9201EE0F29EBC8CE45A5BB6D5675DE20AB9FC7F5682AEFC7`  
**MD5**: `C48D3B2E7097F87459D9999F6F74CD19`

## Sample Run

![Sample Run](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_1.webp)

## Dependencies

This must be run against an Active Directory server.

[Get-ADBitlockerStore](/docs/c3f8637a-bc38-4709-a626-d59d9111d621)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name        | Description                                                                                                                                                                       |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maxstores   | The number of key protector entries to process in one loop. This is used as a workaround for the Automate variable size limitation of 65,000 characters.                         |
| InsertValues| The values to be inserted into the database. This variable will change with each iteration of the loop.                                                                           |

## Process

The script implements a looping mechanism to compensate for the character limit of Automate's variables. As such, the `@maxstores@` variable should never be set above 70 to prevent overflow of the variable `@InsertValues@`.

**Example:**  
The script runs and finds 250 key protectors backed up by Active Directory. The `@maxstores@` variable is set to 70. The following occurs:

```
Loop Iteration 1:
The first 70 records are processed. [0..69]

Loop Iteration 2:
The second 70 records are processed. [70..139]

Loop Iteration 3:
The third 70 records are processed. [140..209]

Loop Iteration 4:
The final 40 records are processed. [210..249]
No additional records are found, so another loop iteration is not processed.
```

This causes the underlying PowerShell to be run as many loop iterations as necessary to process all records. The overhead of running this is minimal, as the underlying script's average execution time is less than 5 seconds.

For additional information about the underlying logic, please see [SEC - Encryption - Agnostic - Get-ADBitlockerStores](/docs/c3f8637a-bc38-4709-a626-d59d9111d621).

## Output

- [SEC - Encryption - Custom Table - plugin_proval_ad_bitlocker_keyprotectors](/docs/23777e5f-2cdd-414c-9938-2293223df3ac)
- Dataview

## GPO to Automatically Save BitLocker Recovery Key to AD

1. Click the Search icon in the taskbar and type “**group policy**.” You can then click **Group Policy Management** to launch it.  
   ![Step 1](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_2.webp)

2. In the left pane of Group Policy Management, right-click your AD domain and select “**Create a GPO in this domain, and Link it here…**” from the menu.  
   ![Step 2](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_3.webp)

3. In the New GPO dialog, give the GPO a name and click **OK**.  
   ![Step 3](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_4.webp)

4. Right-click the newly created GPO in the left pane, and select **Edit**.  
   ![Step 4](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_5.webp)

5. Browse to `Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> BitLocker Drive Encryption`, and then double-click the policy “**Store BitLocker recovery information in Active Directory Domain Services**.”  
   ![Step 5](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_6.webp)

6. Set the policy to **Enabled**. Make sure the “**Require BitLocker backup to AD DS**” option is checked, and select to store both recovery passwords and key packages.  
   ![Step 6](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_7.webp)

7. Next, expand **BitLocker Drive Encryption** in the left pane. You’ll see three nodes: Fixed Data Drives, Operating System Drives, and Removable Data Drives. Select **Fixed Data Drives** and double-click the policy “**Choose how BitLocker-protected fixed drives can be recovered**.”  
   ![Step 7](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_8.webp)

8. Set it to **Enabled**. Check the options “Save BitLocker recovery information to AD DS for fixed drives” and then click **OK**.  
   ![Step 8](../../../static/img/docs/d533538b-8b00-425e-849f-434518296b2d/image_9.webp)

9. Go to the “Operating System Drives” node and enable the similar policy “**Choose how BitLocker-protected operating system drives can be recovered**.” Then, go to the “Removable Data Drives” node and enable the policy “**Choose how BitLocker-protected removable drives can be recovered**.” 

10. When any client PC retrieves the policy changes, BitLocker recovery information will be automatically and silently backed up to AD DS when BitLocker is turned on for fixed drives, OS drives, or removable drives.