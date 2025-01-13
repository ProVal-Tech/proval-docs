---
id: 'ps-windows-server-bitlocker-roles'
title: 'Windows Server Bitlocker Roles'
title_meta: 'Windows Server Bitlocker Roles'
keywords: ['windows', 'server', 'bitlocker', 'roles', 'security']
description: 'This document outlines the roles responsible for determining the eligibility of Windows Server for Bitlocker. It includes detailed detection strings, comparators, and the applicable operating systems for each role, along with SQL commands to implement these roles.'
tags: ['windows', 'security', 'configuration', 'setup']
draft: false
unlisted: false
---
## Summary

These roles are responsible for determining whether a Windows Server is eligible for Bitlocker.

## Settings

| Role Name                                     | Detection String                                                                                                       | Comparator | Result  | Applicable OS |
|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|------------|---------|----------------|
| Windows Server Bitlocker                      | `%@powershell.exe -nologo -noprofile -command "(Get-WindowsOptionalFeature -Online -FeatureName BitLocker).state"@%` | Equals     | Enabled | Windows        |
| Windows Server Bitlocker-Utilities            | `%@powershell.exe -nologo -noprofile -command "(Get-WindowsOptionalFeature -Online -FeatureName Bitlocker-Utilities).state"@%` | Equals     | Enabled | Windows        |
| Windows Server BitLocker-RemoteAdminTool     | `%@powershell.exe -nologo -noprofile -command "(Get-WindowsOptionalFeature -Online -FeatureName BitLocker-RemoteAdminTool).state"@%` | Equals     | Enabled | Windows        |

## How to Implement

Run below SQL From RAWSQL to import these roles:

```
insert into `roledefinitions` (`RoleName`, `RoleType`, `RoleSubType`, `DetectionString`, `ComparisonOperator`, `ComparisonResult`, `SerialKeyString`, `ProductKeyString`, `RoleDetectionGuid`, `IsRemote`, `SearchId`, `IsSupport`, `ParentRoleDefinitionGuid`, `OsType`) values('Windows Server Bitlocker','PowerShell','Role','%@powershell.exe -nologo -noprofile -command \"(Get-WindowsOptionalFeature -Online -FeatureName BitLocker).state\"@%','eq','Enabled','','','91266161-a2ad-11ef-8f2a-8600008a66b7','1','0','0','','1');
insert into `roledefinitions` (`RoleName`, `RoleType`, `RoleSubType`, `DetectionString`, `ComparisonOperator`, `ComparisonResult`, `SerialKeyString`, `ProductKeyString`, `RoleDetectionGuid`, `IsRemote`, `SearchId`, `IsSupport`, `ParentRoleDefinitionGuid`, `OsType`) values('Windows Server Bitlocker-Utilities','PowerShell','Role','%@powershell.exe -nologo -noprofile -command \"(Get-WindowsOptionalFeature -Online -FeatureName Bitlocker-Utilities).state\"@%','eq','Enabled','','','618da03f-a2ba-11ef-8f2a-8600008a66b7','1','0','0','','1');
insert into `roledefinitions` (`RoleName`, `RoleType`, `RoleSubType`, `DetectionString`, `ComparisonOperator`, `ComparisonResult`, `SerialKeyString`, `ProductKeyString`, `RoleDetectionGuid`, `IsRemote`, `SearchId`, `IsSupport`, `ParentRoleDefinitionGuid`, `OsType`) values('Windows Server BitLocker-RemoteAdminTool','PowerShell','Role','%@powershell.exe -nologo -noprofile -command \"(Get-WindowsOptionalFeature -Online -FeatureName BitLocker-RemoteAdminTool).state\"@%','eq','Enabled','','','8be25675-a2ba-11ef-8f2a-8600008a66b7','1','0','0','','1');
```


