---
id: 'cwa-intune-enrollment-check'
title: 'Intune Enrollment Check for Windows Machines'
title_meta: 'Intune Enrollment Check for Windows Machines'
keywords: ['intune', 'enrollment', 'windows', 'machine', 'detection', 'role']
description: 'This document outlines the process for determining whether a Windows machine is enrolled in Intune, including the necessary detection string and implementation steps for importing the role into the system.'
tags: ['configuration', 'windows', 'security', 'software']
draft: false
unlisted: false
---
## Summary

This role is responsible for determining whether a Windows machine is enrolled in Intune.

## Settings

| Detection String                                                                                     | Comparator | Result    | Applicable OS |
|------------------------------------------------------------------------------------------------------|------------|-----------|---------------|
| {%@powershell -c "(Get-ItemProperty HKLM:/Software/Microsoft/Enrollments/* -ea 0).AADTenantID"@%} | Regex      | [A-Z0-9]  | Windows       |

## How to Implement

Run below SQL From RAWSQL to import this role:

```
INSERT INTO `roledefinitions` (`RoleDefinitionId`, `RoleName`, `RoleType`, `RoleSubType`, `DetectionString`, `ComparisonOperator`, `ComparisonResult`, `SerialKeyString`, `ProductKeyString`, `RoleDetectionGuid`, `IsRemote`, `SearchId`, `IsSupport`, `ParentRoleDefinitionGuid`, `OsType`) VALUES (1998, 'IntuneEnrolled', 'Intune', 'Role', '{%@powershell -c "(Get-ItemProperty HKLM://Software//Microsoft//Enrollments//* -ea 0).AADTenantID"@%}', 'rl', '[A-Z0-9]', '', '', '22c74c68-c9cf-11ee-83de-124f9e021845', 1, 0, 0, '', 0);
```




