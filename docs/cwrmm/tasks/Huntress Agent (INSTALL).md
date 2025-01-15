---
id: 'e1f40d15-13f1-465e-9870-653927ad0434'
title: 'Huntress Agent Install'
title_meta: 'Huntress Agent Install'
keywords: ['huntress', 'agent', 'install', 'windows', 'deployment']
description: 'This document provides a detailed guide on installing the Huntress agent on Windows machines, including prerequisites, dependencies, and step-by-step instructions for script creation and deployment within ConnectWise Automate.'
tags: ['windows', 'installation', 'setup', 'notification', 'security']
draft: false
unlisted: false
---
## Summary

Installs Huntress agent on the Windows machine if it's not already installed.

## Dependencies

- [CW RMM - Custom Fields - Huntress Acct_Key](https://proval.itglue.com/DOC-5078775-15293648)  
- [CW RMM - Custom Fields - Huntress Org_Key](https://proval.itglue.com/DOC-5078775-15293647)  
- [CW RMM - Custom Fields - Huntress Tag](https://proval.itglue.com/DOC-5078775-15293470)  
- [CW RMM - Custom Fields - Huntress Deploy_Result](https://proval.itglue.com/DOC-5078775-15294634)  
- [CW RMM - Device Group - Deploy Huntress](https://proval.itglue.com/DOC-5078775-15302736)  

## Create Script

Please create a new "PowerShell" style script to implement this script.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_1.png)  
![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_2.png)  

**Name:** Huntress Agent Install  
**Description:** This task will check first if Huntress is installed or not. If not, then it attempts to install the agent and log the result.  
**Category:** Custom  

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_3.png)  

## Script

### Row 1 Function: Script Log

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_4.png)  

Input the following:

>This script will detect the Huntress Agent and if the agent is not found then it will install the agent.
>
>acct_key : `@acct_key@`  
>org_key: `@ORG_Key@`  
>Tags: `@Tags@`  
>
>Attempting to download the file using acct_key from the huntress website as below:  
>
>[https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1](https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1), and once downloaded the agent will be attempted to install.

### Row 2 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_5.png)  

- Select `Custom Field`
- Input `acct_key` as Variable name
- Select `Huntress Acct_Key` custom field from drop-down
- Click Save

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_6.png)  

### Row 3 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_5.png)  

- Select `Custom Field`
- Input `ORG_Key` as Variable name
- Select `Huntress Org_Key` custom field from the drop-down
- Click Save

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_7.png)  

### Row 4 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_5.png)  

- Select `Custom Field`
- Input `Tags` as Variable name
- Select `Huntress Tag` custom field from the drop-down
- Click Save

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_8.png)  

### Row 5 Function: PowerShell Script

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_9.png)  

Paste in the following PowerShell script and set the expected script execution time to `1500` seconds.

```
$installed = Get-ChildItem -Path HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Uninstall, HKLM://SOFTWARE//Wow6432Node//Microsoft//Windows//CurrentVersion//Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Huntress' } | Select-Object -ExpandProperty DisplayName
if ($installed -match 'Huntress') {
    Write-Output 'Huntress agent is installed already.'
} else {
    #region Setup - Variables
    $PS1URL = 'https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1'
    $WorkingDirectory = 'C://ProgramData//_Automation//Script//Invoke-HuntressAgentCommand'
    $PS1Path = "$WorkingDirectory//Invoke-HuntressAgentCommand.ps1"
    $AcctKey = '@acct_key@'
    $OrgKey = '@Org_Key@'
    $Tags = '@tags@'
    $Parameters = @{}

    if ($AcctKey -ne '' -and $AcctKey -notmatch '@acct_key') {
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
    if ( !(Test-Path $WorkingDirectory) ) {
        try {
            New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
        } catch {
            return "ERROR: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
        }
    } if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
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
        return 'ERROR: An error occurred and huntress installer was unable to be downloaded. Exiting.'
    }
    #endregion

    #region Execution
    if ($Parameters) {
        & $PS1Path @Parameters
    } else {
        & $PS1Path
    }
    #endregion

    Start-Sleep -Seconds 300
    $installed = Get-ChildItem -Path HKLM://SOFTWARE//Microsoft//Windows//CurrentVersion//Uninstall, HKLM://SOFTWARE//Wow6432Node//Microsoft//Windows//CurrentVersion//Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Huntress' } | Select-Object -ExpandProperty DisplayName
    if ($installed -match 'Huntress') {
        Write-Output 'Huntress agent is installed successfully.'
    } else {
        Write-Output 'ERROR: Failed to install Huntress agent.'
    }
}
```

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_10.png)  

### Step 6 Function: Script Log

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Log` function.
- Input the following  

```
%Output%
```

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_11.png)  
![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_12.png)  

### Step 7 Logic: If Then Else

- Add a new `If/Then/Else` logic from the Add Logic dropdown menu.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_13.png)  

### ROW 7a Condition: Output Contains

- Type `Huntress agent is installed` in the Value box.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_14.png)  

### ROW 7b Function: Set Custom Field

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Set Custom Field` function.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_15.png)  

- Search and select the `Huntress Deploy_Result` Custom Field.
- Type `Successfully Installed` in the `Value` box and click the Save button.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_16.png)  

### ROW 7c Function: Script Log

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Exit` function.
- Leave it blank

```
Huntress Agent is installed successfully.
```

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_17.png)  
![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_18.png)  

### ROW 7d Function: Script Exit

- Add a new row in the If Section of If else then part by clicking the Add Row button
- Search and select the `Script Exit` function.
- Leave it blank

```

```

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_19.png)  
![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_20.png)  

### Step 7e Logic: If/Then

Add a new `If/Then` logic from the `Add Logic` dropdown menu inside the `Else` section.  

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_21.png)  

### Row 7e(i) Condition: Output Contains

- Select `Output` from Drop Down
- Type `ERROR:` in the Value box.
- Select another condition with `OR` Operator
- Type `Account Key Missing` in the Value box.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_22.png)  

### Row 7e(ii) Function: Set Custom Field

Add another row by selecting `ADD ROW` button in the `Else` section of the internal `If/Then` section.  

- Search and select the `Set Custom Field` function.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_23.png)  

- Search and select the `Huntress Deploy_Result` Custom Field.
- Type `%Output%` in the `Value` box and click the Save button.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_24.png)  

### Row 7e(iii) Function: Script Exit

Add another row by selecting `ADD ROW` button in the `Else` section of the internal `If/Then` section.  

- Search and select the `Script Exit` function.
- Input the following  

```
Failed to install Huntress. Refer to the below log:
%Output%
```

The final task should look like the below screenshot.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_25.png)  

## Script Deployment

This task has to be scheduled on `Deploy Huntress` group for auto deployment. Script can also be run manually if required.

Go to Automations > Tasks.  
Search for Huntress Agent Install.  
Then click on Schedule and provide the parameters detail as it is necessary for the script completion.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_26.png)  

## Output

- Script log

## FAQ

Note:  
For the huntress deployment, the Huntress_Acct_Key is mandatory to be filled at the company level.

![Image](../../../static/img/Huntress-Agent-(INSTALL)/image_27.png)  

Rest other custom fields can be left blank.

Note:  
Huntress_Acct_Key and Huntress_Org_Key are the company custom fields whereas the Huntress_Tags is the site-level custom field.







