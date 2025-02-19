---
id: '814f236b-c673-4a8a-9740-e1acc7f8520d'
title: 'Disable Internet Explorer'
title_meta: 'Disable Internet Explorer'
keywords: ['disable', 'internet', 'explorer', 'windows', 'computers']
description: 'This document outlines a solution for detecting and disabling Internet Explorer on Windows computers. It includes associated content such as roles, internal monitors, scripts, and alert templates necessary for implementation.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to detect and disable Internet Explorer on Windows computers.

## Associated Content

| Content                                                                                                                                                            | Type            | Function                                                                                                                                                                                                                       |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Role - Internet Explorer Installed](<../cwa/roles/Internet Explorer Installed.md>)                                                            | Role            | The purpose of this Role is to detect the machines where the Internet Explorer feature is enabled.                                                                                                                           |
| [CWM - Automate - Internal Monitor - ProVal - Development - Internet Explorer Detected [Role]](<../cwa/monitors/Internet Explorer Detected Role.md>)                  | Internal Monitor | The purpose of this Internal Monitor is to detect the online machines where the [CWM - Automate - Role - Internet Explorer Installed](<../cwa/roles/Internet Explorer Installed.md>) role is detected.                      |
| [CWM - Automate - Script - Internet Explorer - Disable [Global, DV, Autofix]](<../cwa/scripts/Internet Explorer - Disable Global, DV, Autofix.md>)                                   | Script          | The purpose of this script is to disable Internet Explorer.                                                                                                                                                                  |
| ~Autofix - Disable Internet Explorer                                                                                                                              | Alert Template   | This alert template is responsible for executing the [CWM - Automate - Script - Internet Explorer - Disable [Global, DV, Autofix]](<../cwa/scripts/Internet Explorer - Disable Global, DV, Autofix.md>) script on all machines detected by the [CWM - Automate - Internal Monitor - ProVal - Development - Internet Explorer Detected [Role]](<../cwa/monitors/Internet Explorer Detected Role.md>) monitor set. |

## Implementation

**Step 1:** Import the Role. Here's the SQL query:

```
REPLACE INTO `roledefinitions` (`RoleDefinitionId`, `RoleName`, `RoleType`, `RoleSubType`, `DetectionString`, `ComparisonOperator`, `ComparisonResult`, `SerialKeyString`, `ProductKeyString`, `RoleDetectionGuid`, `IsRemote`, `SearchId`, `IsSupport`, `ParentRoleDefinitionGuid`, `OsType`) VALUES ('','Internet Explorer Installed', 'Encryption', 'Role', '{%@C:\\\\Windows\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\powershell.exe -Command \"Get-WindowsOptionalFeature -Online -FeatureName Internet-Explorer* | Select-Object -Expandproperty State\"@%}', 'ct', 'Enable', '', '', '57d918d5-8361-11ec-a044-000c295e5f17', 1, 0, 0, '', 1);
```

**Step 2:** Import the Internal Monitor.

**Step 3:** Import the Script.

**Step 4:** Import the Alert Template and assign that Alert Template to the Internal Monitor. Here's the SQL query to import the template:

```
INSERT INTO `alerttemplate` (`AlertActionID`, `Name`, `Comment`, `Last_User`, `Last_Date`, `Permission`, `EditPermission`, `GUID`) VALUES ('', '~Autofix - Disable Internet Explorer', '~Autofix - Disable Internet Explorer', 'PRONOC', (NOW()), '', '', 'ff457b08-849e-4501-8428-1ebe19305dfd');
INSERT INTO `alerttemplates` (`AlertID`, `AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Message`, `Trump`, `GUID`, `WarningAction`) VALUES ('', (SELECT alertactionid FROM alerttemplate WHERE guid = 'ff457b08-849e-4501-8428-1ebe19305dfd'), 127, '00:00:00', '23:59:00', 512, -1, 0, (SELECT scriptid FROM lt_scripts WHERE scriptguid = 'd8a1e5f2-7fbf-11ec-abe8-000c295e5f17'), '', 0, '53ec7509-f4d9-44fa-9d57-a3d89dfb6b2d', 512);
```


