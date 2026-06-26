---
id: 'c921a900-73da-40e2-9507-ed64ba38fb46'
slug: /c921a900-73da-40e2-9507-ed64ba38fb46
title: 'Bitlocker - Missing Key Protectors'
title_meta: 'Bitlocker - Missing Key Protectors'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'This monitor set detects computers where Bitlocker is enabled and the drive is fully encrypted but does not have any key protectors.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
last_update:
  date: 2025-06-25
---

## Summary
This monitor set detects computers where Bitlocker is enabled and the drive is fully encrypted but does not have any key protectors.

## Dependencies

- [Solution - BitLocker Status and Recovery Key Audit](/docs/b2a974b2-c231-4197-a639-d0775d77d7c7)

## Monitor Setup Location

**Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  

## Monitor Summary

Fill in the mandatory columns on the left side  
Name: `Bitlocker - Missing Key Protectors`  
Description: `The monitor set detects computers where Bitlocker is enabled and the drive is fully encrypted but does not have any key protectors.`  
Type: `Script`  
Severity: `Critical Impact Results`  
Family: `Security`  

![Image](../../../static/img/docs/c921a900-73da-40e2-9507-ed64ba38fb46/image1.webp)

## Targeted Resources

- **Target Type:**  `Device Groups`  
- **Group Name:** `BitLocker Enabled`

![Image2](../../../static/img/docs/c921a900-73da-40e2-9507-ed64ba38fb46/image2.webp)

## Conditions

- **Run Script on:** `Schedule`  
- **Repeat every:** `1` `Hours`  
- **Script Language:** `PowerShell`  
- **Use Generative AI Assist for script creation:** `False`  
- **PowerShell Script Editor:**  

```PowerShell
$WarningPreference = 'SilentlyContinue'
Import-Module BitLocker -ErrorAction Stop
$WarningPreference = 'Continue'

$detectedVolumes = Get-BitLockerVolume -ErrorAction Stop | Where-Object {
    $_.MountPoint -match '^[A-Za-z]:$' -and
    $_.VolumeStatus -eq 'FullyEncrypted' -and
    $_.ProtectionStatus -eq 'OFF' -and
    (
        -not $_.KeyProtector -or
        $_.KeyProtector.KeyProtectorId.ToString().Length -lt 2
    )
}

if ($detectedVolumes) {
    $drives = $detectedVolumes | ForEach-Object {
        "$($_.MountPoint) ($($_.VolumeType))"
    }

    return "Detected fully decrypted drive(s) with BitLocker protection OFF and an invalid/missing KeyProtectorId: $($drives -join ', ')"
}
return "No affected BitLocker volumes found."
```

- **Criteria:**  `Contains`  
- **Operator:** `AND`  
- **Script Output:**  `Detected fully encrypted drive(s) with BitLocker protection OFF`  
- **Escalate ticket on script failure:** `False`  
- **Add Automation:**  ``

![Image3](../../../static/img/docs/c921a900-73da-40e2-9507-ed64ba38fb46/image3.webp)

## Ticket Resolution

**Automatically resolve:** `True`
**Script to Run** `Same Script as Above`
**Criteria:**  `Contains`  
**Operator:** `AND`  
**Script Output:**  `Detected fully encrypted drive(s) with BitLocker protection OFF`  

![Image4](../../../static/img/docs/c921a900-73da-40e2-9507-ed64ba38fb46/image4.webp)

## Monitor Output

**Output:** `Generate Ticket`

![Image5](../../../static/img/docs/c921a900-73da-40e2-9507-ed64ba38fb46/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/c921a900-73da-40e2-9507-ed64ba38fb46/image6.webp)

## Changelog

### 2025-06-25

- Initial version of the document

