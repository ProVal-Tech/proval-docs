---
id: '9682b5a8-d821-43f6-9b77-59d43b6ef015'
slug: /9682b5a8-d821-43f6-9b77-59d43b6ef015
title: 'BitLocker Status and Recovery Key Audit'
title_meta: 'BitLocker Status and Recovery Key Audit'
keywords: ['bitlocker', 'encryption', 'audit', 'recovery', 'key', 'status', 'windows']
description: 'This document outlines the process to audit the BitLocker status of endpoints. It details how to gather recovery keys for encrypted drives and store the results in a custom field, along with instructions for manual and scheduled script execution.'
tags: ['encryption', 'recovery', 'windows']
draft: false
unlisted: false
---

## Summary

This document will attempt to audit the BitLocker status of the endpoint. If there is an encrypted drive, it will attempt to gather the recovery key and store it in a custom field. If the drive is not BitLocker encrypted, it will indicate that in the custom field.

## Manual Run

This script does not have any parameters and can be run against any online Windows device.

## Dependencies

- [BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f)
- [BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410) (BitLocker - Auditing, BitLocker - Regular Auditing)

## Create Script

To implement this script, please create a new "Script Editor" style script in the system.

![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_4.webp)
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_5.webp)

**Name:** BitLocker Status and Recovery Key Audit  
**Description:** This script will attempt to audit the BitLocker status of the endpoint. If there is an encrypted drive, it will attempt to gather the recovery key and store it in a custom field. If the drive is not BitLocker encrypted, it will indicate that in the custom field.  
**Category:** Custom  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_6.webp)

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_7.webp)

**Row 1 Function:** PowerShell Script  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_8.webp)

Paste in the following PowerShell script and set the expected time of script execution to 1800 seconds.

```PowerShell
if (!(Get-Command -Name 'Get-BitLockerVolume' -ErrorAction SilentlyContinue)) {
    return 'BitLocker module is unavailable on this device.'
}
$(
    foreach ($drive in @(Get-BitLockerVolume -ErrorAction SilentlyContinue)) {
        if ($drive.ProtectionStatus -ne 'On') {
            "$($drive.MountPoint) not enabled."
        } elseif ($drive.EncryptionPercentage -ne '100') {
            "Encryption on $($drive.MountPoint) in progress."
        } elseif ($recoveryPasswords = $drive.KeyProtector | Where-Object { $_.KeyProtectorType -eq 'RecoveryPassword' } | Select-Object -ExpandProperty RecoveryPassword -First 1) {
            "$($drive.MountPoint) enabled. Recovery Passwords:$($recoveryPasswords)"
        } else {
            "$($drive.MountPoint) enabled without a Recovery Password."
        }
    }
) -join ' | '
```

![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_9.webp)

Save and move to the next row.

**Row 2 Function:** Script Log  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_10.webp)

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_11.webp)

**Row 3 Function:** Set Custom Field  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_12.webp)

When you select "Set Custom Field," a new window will open. In this window, find the "BitLocker Status and Key" field.  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_13.webp)

In the Value area, simply type `%output%` to store the PowerShell output in the custom field.  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_14.webp)

Once all items are added, please save the task.  
The final task should look like the screenshot below.  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_15.webp)

## Script Deployment

The script is intended to run on a scheduled basis against two device groups.

First, is the [CW RMM - Device Groups - BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410) (BitLocker - Auditing) device group as a scheduled task. As machines run the script, they will exit the device group.

The task should be scheduled to run hourly against the device group. Please see the example in the screenshot below.  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_16.webp)

**Schedule:** Local Machine Time  
**Start:** Select today's date  
**Trigger:** Time  
**At:** 10:00 AM  
**Recurrence:** Every Hour  
**Resource:** [CW RMM - Device Groups - BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410) (BitLocker - Auditing)

---

Second, is the [CW RMM - Device Groups - BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410) (BitLocker - Regular Auditing) device group as a scheduled task. As machines complete their audit, they will join the BitLocker - Regular Auditing group, and the scheduled task will update the details every four (4) weeks.

The task should be scheduled to run every four (4) weeks against the BitLocker - Regular Auditing device group. Please see the example in the screenshot below.  
![Image](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_17.webp)

**Schedule:** Local Machine Time  
**Start:** Select today's date  
**Trigger:** Time  
**At:** 10:00 AM  
**Recurrence:** Every 4 weeks on Wednesday  
**Resource:** [CW RMM - Device Groups - BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410) (BitLocker - Regular Auditing)

This script can also run manually against any Windows-based device at any time to update the details.

## Output

- Script log
- Custom Field