---
id: '3a441306-efbc-48a5-8732-06bfd56c9a5f'
title: 'Predictive Volume Exhaustion Monitor Creation'
title_meta: 'Predictive Volume Exhaustion Monitor Creation'
keywords: ['monitor', 'disk', 'volume', 'exhaustion', 'estimation']
description: 'This document details the Predictive Volume Exhaustion Monitor Creation script, which generates a monitor set to assess the remaining days before drive space is fully occupied. It utilizes the Get-VolumeExhaustionEstimate script to gather trend data and provide accurate estimations based on system properties.'
tags: ['alerting', 'disk', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The [Predictive Volume Exhaustion Monitor Creation](<../scripts/Predictive Volume Exhaustion Monitor Creation.md>) script generates the monitor set. It utilizes the [Get-VolumeExhaustionEstimate](<../../powershell/Get-VolumeExhaustionEstimate.md>) agnostic script to assess and return an estimation of the number of days remaining before the drive space is entirely occupied, utilizing the trend data/samples gathered. The parameters for the script are configured according to the system properties detailed in the [script's documentation](<../scripts/Predictive Volume Exhaustion Monitor Creation.md>).

The data returned by the monitor set is displayed by the [Volume Exhaustion Estimations [Remote Monitor]](<../dataviews/Volume Exhaustion Estimations Remote Monitor.md>) dataview.

## Dependencies

- [EPM - Disk - Script - Predictive Volume Exhaustion Monitor Creation](<../scripts/Predictive Volume Exhaustion Monitor Creation.md>)
- [EPM - Disk - Dataview - Volume Exhaustion Estimations [Remote Monitor]](<../dataviews/Volume Exhaustion Estimations Remote Monitor.md>)

## Monitor

#### Status

![Status](../../../static/img/EPM---Disk---Remote-Monitor---Volume-Space-Sampling/image_1.png)

#### Location

![Location](../../../static/img/EPM---Disk---Remote-Monitor---Volume-Space-Sampling/image_2.png)

#### Alerting

![Alerting](../../../static/img/EPM---Disk---Remote-Monitor---Volume-Space-Sampling/image_3.png)

#### Configuration

![Configuration](../../../static/img/EPM---Disk---Remote-Monitor---Volume-Space-Sampling/image_4.png)

**Executable/Arguments:** 
```plaintext
C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$WarningPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072); $ProjectName = 'Get-VolumeExhaustionEstimate'; $WorkingDirectory = 'C://ProgramData//_Automation//Script//$ProjectName//'; $scriptpath = '$($WorkingDirectory)//$($ProjectName).ps1'; $scripturl = 'https://file.provaltech.com/repo/script/Get-VolumeExhaustionEstimate.ps1'; if (!(Test-Path $WorkingDirectory)) {mkdir $WorkingDirectory | Out-Null}; (New-Object System.Net.WebClient).DownloadFile($scripturl,$scriptpath); $op = & $scriptpath -MinimumSamples 30 -Path $WorkingDirectory -DaysToReport 14 -DaysToLead 7 -Quiet -Force; $exDate = ($op | Where-Object { $_.DriveLetter -eq 'C' }).ExhaustionEstimationDate; if ($exDate) { ($exdate).ToString('yyyy-MM-dd HH:mm:ss') }"
```

The parameter values highlighted in the provided example are regulated by the system properties and the Extra Data Fields (EDFs).

