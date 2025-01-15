---
id: ps-set-officeupdateschedule
title: 'Set-OfficeUpdateSchedule'
title_meta: 'Set-OfficeUpdateSchedule Command'
keywords: ['office365', 'update', 'schedule', 'configuration']
description: 'Documentation for the Set-OfficeUpdateSchedule command to set the update schedule for Office 365 Click2Run installations.'
tags: ['office365', 'update', 'configuration']
draft: false
unlisted: false
---

## Description
Sets the update schedule for Office 365 Click2Run installations

## Requirements
Office 365 (C2R) Version 16.x installed on the endpoint

## Usage
Sets registry key HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration\UpdateChannel to the [Microsoft-provided](https://learn.microsoft.com/en-us/mem/configmgr/sum/deploy-use/manage-office-365-proplus-updates#bkmk_channel) URI for the selected channel.




```powershell
    PS C:\> Set-OfficeUpdateSchedule.ps1
    Sets the update schedule to 'Current Channel'
```
```powershell
    PS C:\> Set-OfficeUpdateSchedule.ps1 -Channel 'Current Channel (Preview)'
    Sets the update schedule to 'Current Channel (Preview)'
```


## Parameters
| Parameter | Alias | Required | Default | Type   | Description                                                                                                                                                                                                                                    |
| --------- | ----- | -------- | ------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Channel` | `c`   | False    |  'Current Channel'       | String | Sets the update channel. For an extensive description of these channels and their effects on an endpoint, see [Microsoft's Documentation](https://learn.microsoft.com/en-us/deployoffice/overview-update-channels#comparison-of-the-update-channels-for-microsoft-365-apps) |

## Output
.\Set-OfficeUpdateSchedule-log.txt

.\Set-OfficeUpdateSchedule-error.txt




