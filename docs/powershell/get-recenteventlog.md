---
id: '4cc33728-0327-42b5-86d3-e85c91635c71'
slug: /4cc33728-0327-42b5-86d3-e85c91635c71
title: 'Get-RecentEventLog'
title_meta: 'Get-RecentEventLog'
keywords: ['eventlog', 'recent', 'logs', 'windows']
description: 'Documentation for the Get-RecentEventLog command to retrieve events from the Windows event log that have triggered since the last run of the script.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description
Get events from the Windows event log that have triggered since the last run of the script.

## Requirements
- PowerShell V5

## Usage
1. Get the last run date of the script or the date offset to use based on the `-Seconds` parameter.
2. If `-Seconds` was not passed and the script has not been run before, then write the last run date to the registry and exit.
3. Gather and return the event logs based on the discovered date in Step 1 if the count is greater than or equal to the `-Threshold`.

*Returns all events from the Application log with an event ID of 15 that occurred since the last run time of the script.*
```powershell
.\Get-RecentEventLog.ps1 -LogName "Application" -EventID 15
```

*Returns all events from the Application log with an event ID of 15 and a provider name of 'Security Center' that occurred since the last run time of the script.*
```powershell
.\Get-RecentEventLog.ps1 -LogName "Application" -EventID 15 -ProviderName "Security Center"
```

*Returns all events from the Application log with an event ID of 15, a provider name of 'Security Center', and an event message containing the string "Updated Windows Defender status successfully" that occurred since the last run time of the script.*
```powershell
.\Get-RecentEventLog.ps1 -LogName "Application" -EventID 15 -ProviderName "Security Center" -Message "Updated Windows Defender status successfully"
```

*Returns all Informational events from the Application log with an event ID of 15, a provider name of 'Security Center', and an event message containing the string "Updated Windows Defender status successfully" that occurred since the last run time of the script.*
```powershell
.\Get-RecentEventLog.ps1 -LogName "Application" -EventID 15 -ProviderName "Security Center" -Message "Updated Windows Defender status successfully" -Level Informational
```

*Returns all Informational events from the Application log with an event ID of 15, a provider name of 'Security Center', and an event message containing the string "Updated Windows Defender status successfully" that occurred up to 3600 seconds before the current time.*
```powershell
.\Get-RecentEventLog.ps1 -LogName "Application" -EventID 15 -ProviderName "Security Center" -Message "Updated Windows Defender status successfully" -Level Informational -Seconds 3600
```

*Returns all Informational events from the Application log with an event ID of 15, a provider name of 'Security Center', and an event message containing the string "Updated Windows Defender status successfully" that occurred up to 3600 seconds before the current time, but only if there were 20 or more occurrences.*
```powershell
.\Get-RecentEventLog.ps1 -LogName "Application" -EventID 15 -ProviderName "Security Center" -Message "Updated Windows Defender status successfully" -Level Informational -Seconds 3600 -Threshold 20
```

## Parameters
| Parameter      | Alias | Required | Default       | Type   | Description                                                                                           |
| -------------- | ----- | -------- | ------------- | ------ | ----------------------------------------------------------------------------------------------------- |
| `Application`  |       | True     | `Application` | String | The name of the specific log you intend to query.                                                    |
| `EventID`      |       | True     |               | Int[]  | The event ID(s) of the events to search for.                                                         |
| `ProviderName` |       | False    |               | String | The provider name of the events to search for.                                                       |
| `Message`      |       | False    |               | String | A regex string to filter the returned event logs by message content.                                  |
| `Level`        |       | False    |               | String | The level of the events to search for.                                                                |
| `Threshold`    |       | False    | 0             | Int    | The number of target events that must have occurred for a result to be returned.                      |
| `Seconds`      |       | False    |               | Int    | Override the registry date check and instead return entries prior to the specified number of seconds. |

## Output
`System.Diagnostics.Eventing.Reader.EventLogRecord`


