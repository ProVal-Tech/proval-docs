---
id: '91408668-745e-49f8-8ed3-020c68faf754'
title: 'Huntress Agent (Re-Register)'
title_meta: 'Huntress Agent (Re-Register)'
keywords: ['huntress', 'agent', 're-register', 'script', 'endpoint']
description: 'This document provides a detailed guide on how to re-register the Huntress Agent in the portal for the endpoint using a custom script. It includes step-by-step instructions for creating the script, setting up variables, and handling script execution and logging.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This task re-registers the Huntress Agent in the portal for the endpoint.

## Create Script

Please create a new "PowerShell" style script to implement this task.

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_1.png)
![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_2.png)

**Name:** Huntress Agent (Re-Register)  
**Description:** This task re-registers the Huntress Agent in the portal for the endpoint.  
**Category:** Custom

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_3.png)

# Script

## Row 1 Function: Script Log

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_4.png)

Input the following:

> The script will detect the required keys for the Huntress reinstallation:  
> `acct_key : @acct_key@`  
> `org_key: @ORG_Key@`  
> `tags: ['security', 'setup', 'software', 'windows']`  
> Attempting to download the ps1 from the below link:  
> [https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1](https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1), and once downloaded, the agent will be attempted to reinstall.

## Row 2 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_5.png)

- Select `Custom Field`
- Input `acct_key` as Variable name
- Select `Huntress Acct_Key` custom field from the dropdown
- Click Save

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_6.png)

## Row 3 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_5.png)

- Select `Custom Field`
- Input `ORG_Key` as Variable name
- Select `Huntress Org_Key` custom field from the dropdown
- Click Save

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_7.png)

## Row 4 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_5.png)

- Select `Custom Field`
- Input `Tags` as Variable name
- Select `Huntress Tag` custom field from the dropdown
- Click Save

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_8.png)

## Row 5 Function: PowerShell Script

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_9.png)

Paste in the following PowerShell script and set the expected script execution time to 1800 seconds.

```
#region Setup - Variables
$PS1URL = 'https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1'
$WorkingDirectory = 'C:/ProgramData/_Automation/Script/Invoke-HuntressAgentCommand'
$PS1Path = "$WorkingDirectory/Invoke-HuntressAgentCommand.ps1"
$AcctKey = '@acctkey@'
$OrgKey = '@orgkey@'
$Tags = '@tags@'
$Parameters = @{}

if ($AcctKey -ne '' -and $AcctKey -notmatch '@acct_key') {
    $Parameters['reregister'] = $true
    $Parameters['acctkey'] = $AcctKey
} else {
    return 'Account Key Missing'
}

if ($OrgKey -ne '' -and $OrgKey -notmatch '@Org_key') {
    $Parameters['orgkey'] = $OrgKey
} else {
    $Parameters['orgkey'] = ''
}

if ($Tags -ne '' -and $Tags -notmatch '@tags') {
    $Parameters['tags'] = $Tags
} else {
    $Parameters['tags'] = ''
}
#endregion

#region Setup - Folder Structure
if (!(Test-Path $WorkingDirectory)) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        return "ERROR: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
}
if (-not (((Get-Acl $WorkingDirectory).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' }).FileSystemRights -Match 'FullControl')) {
    $ACl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}

#region write script
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    return "ERROR: No pre-downloaded installer exists and installer $PS1URL failed to download. Exiting."
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    return 'ERROR: An error occurred and Huntress installer was unable to be downloaded. Exiting.'
}
#endregion

#region Execution
if ($Parameters) {
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion
```

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_10.png)

## Step 6 Function: Script Log

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Log` function.
- Input the following  

```
%Output%
```

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_11.png)
![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_12.png)

## Step 7 Logic: If/Then

- Add a new `If/Then/Else` logic from the Add Logic dropdown menu.

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_13.png)

## ROW 7a Condition: Output Contains

- Type `denied` in the Value box.
- Add another condition with the OR operator and type `ERROR:` in the Value box.
- Add another condition with the OR operator and type `Account Key Missing` in the Value box.

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_14.png)

## ROW 7b Function: Script Exit

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Exit` function.
- Input the following  

```
Failed to repair Huntress Agent. Command Result: %Output%
```

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_15.png)
![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_16.png)

## Step 8 Function: Script Log

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Log` function.
- Input the following  

```
Successfully repaired Huntress Agent.
```

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_11.png)
![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_17.png)

## Step 9 Function: Script Exit

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Exit` function.
- Leave it blank

```

```

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_15.png)
![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_18.png)

## Step 10: Complete Script

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_19.png)

## Script Deployment

For now, the task has been created to run manually on the machines.

Go to Automations > Tasks.  
Search for Huntress Agent (Re-Register).  
Then click on Schedule and provide the parameters details as necessary for the script completion.

![Image](../../../static/img/Huntress-Agent-(Re-Register)/image_20.png)

## Output

- Script log
