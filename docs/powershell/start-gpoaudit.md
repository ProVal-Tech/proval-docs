---
id: ps-start-gpoaudit
title: 'Start-GPOAudit'
title_meta: 'Start-GPOAudit'
keywords: ['prompt', 'user', 'input', 'dialog']
description: 'Documentation for the Show-Prompt command to display a user prompt for input.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
Performs an audit of the GPOs and their settings on the target domain controller.

# Requirements
- Active Directory Domain Controller
- PowerShell v5+

## Usage
The `Start-GPOAudit.ps1` script performs an audit of Group Policy Objects (GPOs) on the target domain controller. The process involves the following steps:

1. **Initialize Environment**:
   - Set the `ProgressPreference` to 'SilentlyContinue'.
   - Configure the security protocol to use TLS 1.2.
   - Ensure the NuGet package provider is bootstrapped.
   - Set the PowerShell Gallery repository installation policy to 'Trusted'.
   - Update or install the 'Strapper' module and set the Strapper environment.

2. **Define Functions**:
   - `Get-XMLPropertyString`: Converts XML properties to a string.
   - `Get-GPOGeneralSetting`: Retrieves general settings of a GPO.
   - `Get-GPSettingsReport`: Retrieves detailed settings of a GPO.
   - `Get-GPOLink`: Retrieves links of a GPO.
   - `Get-GPOSecurityFilter`: Retrieves security filters of a GPO.

3. **Audit GPOs**:
   - Retrieve all GPOs on the target domain controller using `Get-GPO -All`.
   - Log the number of GPOs found.
   - Gather general settings for each GPO using `Get-GPOGeneralSetting`.
   - Gather detailed settings for each GPO using `Get-GPSettingsReport`.
   - Gather links for each GPO using `Get-GPOLink`.
   - Gather security filters for each GPO using `Get-GPOSecurityFilter`.

4. **Compile Results**:
   - Compile the gathered data into a custom object containing general settings, detailed settings, links, and security filters.
   - Return the compiled audit result object.

5. **Output**:
   - The script logs its actions and any errors to `Start-GPOAudit-Log.txt` and `Start-GPOAudit-Error.txt` respectively.


```powershell
.\Start-GPOAudit.ps1
```
Returns an object containing GPO general settings, detailed settings, links, and security filters.

## Output
Location of output for log, result, and error files.
    .\Start-GPOAudit-Log.txt
    .\Start-GPOAudit-Error.txt