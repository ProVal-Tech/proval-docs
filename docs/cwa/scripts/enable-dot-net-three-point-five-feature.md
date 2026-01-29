---
id: '31e2b232-f0b1-11f0-be0d-92000234cfc2'
slug: /31e2b232-f0b1-11f0-be0d-92000234cfc2
title: 'Enable .Net 3.5 Feature [Windows Workstations]'
title_meta: 'Enable .Net 3.5 Feature [Windows Workstations]'
keywords: ['feature', 'windows-workstations', '.net', '.net-3.5', '3.5']
description: 'Configures Windows Update settings to allow optional component downloads and successfully enables the .NET Framework 3.5 feature.'
tags: ['dotnet', 'windows']
draft: false
unlisted: false
---

## Summary

This script installs the .NET Framework 3.5 feature. It pre-configures the 'RepairContentServerSource' registry policy to bypass local WSUS and download source files directly from Windows Update, preventing common installation errors (0x800f081f).

## Sample Run

**First Run:** Run the script with the `Set_Environment` parameter set to `1` for the first run to create the EDFs used by the solution.

![First Run](../../../static/img/docs/31e2b232-f0b1-11f0-be0d-92000234cfc2/image1.webp)

**Regular Execution:**  
![Regular Execution](../../../static/img/docs/31e2b232-f0b1-11f0-be0d-92000234cfc2/image2.webp)

## Dependencies

- [Solution: Enable .Net 3.5](/docs/5d596cd8-3e9d-4a03-a610-ec85f8a9fb19)

## User Parameters

| Name                | Example | Required                        | Description |
| ------------------- | ------- | ------------------------------- | ----------- |
| Set_Environment     | 1       | True (for first execution)      | Run the script with the `Set_Environment` parameter set to `1` for the first run to create the EDFs used by the solution. |

## EDFs

| Name | Type | Scope | Section | Required | Description |
| ---- | ---- | ----- | ------- | -------- | ----------- |
| Enable .Net 3.5 Feature | Checkbox | Client | Automation | False | Set to enable automated installation of the .NET 3.5 feature for a client. |
| .Net 3.5 Feature - Exclusion | Checkbox | Location | Exclusions | False | Set to exclude an entire location from automated installation. |
| .Net 3.5 Feature - Exclusion | Checkbox | Computer | Exclusions | False | Set to exclude an individual computer from automated installation. |

## Output

- Script Logs
