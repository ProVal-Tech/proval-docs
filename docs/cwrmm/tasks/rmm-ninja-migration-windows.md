---
id: '905f38b9-492e-43d8-b687-7b4df48c3b97'
slug: /905f38b9-492e-43d8-b687-7b4df48c3b97
title: 'NinjaRMM Deployment - [Windows]'
title_meta: 'NinjaRMM Deployment - [Windows]'
keywords: ['RMM', 'Ninja', 'Migration', 'Windows', 'Agent', 'Install']
description: 'This script deploys the NinjaRMMAgent to Windows-supported OS. It depends on the Authorization token, which will be kept in the company or site custom fields.'
tags: ['windows', 'installation', 'deployment', 'application', 'connectwise']
draft: false
unlisted: false
---

## Summary
This script deploys the NinjaRMMAgent to Windows-supported OS, based on the article provided below:
[Agent Installation Tokenization](https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization).
It depends on the Authorization token, which will be kept in the company or site custom fields.

## Sample Run
![Sample Run 1](../../../static/img/docs/rmm-ninja-migration-windows/image-1.png)

![Sample Run 2](../../../static/img/docs/rmm-ninja-migration-windows/image-2.png)

## Dependencies
[CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae)

[Group - Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0)

[Solution - CW RMM to Ninja Migration](/docs/b388aa6a-3e60-482c-9a13-ce6425c55dd3)

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/cw-rmm-tasks-common-screenshots/step1.png)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/cw-rmm-tasks-common-screenshots/step2.png)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/cw-rmm-tasks-common-screenshots/step3.png)

#### Step 3 

**Name:** `NinjaRMM Deployment - [Windows]`  
**Description:** `This script deploys the NinjaRMMAgent to Windows-supported OS, based on the article provided below:
https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization.
It depends on the Authorization token, which will be kept in the company or site custom fields.`  
**Category:** `Application`

![Script Detail](../../../static/img/docs/rmm-ninja-migration-windows/image-21.png)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/cw-rmm-tasks-common-screenshots/addrow.png)

A blank function will appear:  
![BlankFunction](../../../static/img/cw-rmm-tasks-common-screenshots/blankfunction.png)

`Note: Limit all the function to Windows machines.`

![Windows Limit](../../../static/img/docs/rmm-ninja-migration-windows/image-10.png)

#### Row 1 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `Deployment`

Custom Field: `Ninja Deployment Enable`

![Set Pre-defined 1](../../../static/img/docs/rmm-ninja-migration-windows/image-22.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Enable](../../../static/img/docs/rmm-ninja-migration-windows/image-23.png)

#### Row 2 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.
Make sure to select the `Ninja Deployment Exclude` site level custom field.

Variable: `DeploymentExL`

Custom Field: `Ninja Deployment Exclude`

![Pre-defined 2](../../../static/img/docs/rmm-ninja-migration-windows/image-24.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Exclude](../../../static/img/docs/rmm-ninja-migration-windows/image-25.png)

#### Row 3 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.
Make sure to select the `Ninja Deployment Exclude` endpoint level custom field.

Variable: `DeploymentExC`

Custom Field: `Ninja Deployment Exclude`

![Pre-defined 3](../../../static/img/docs/rmm-ninja-migration-windows/image-26.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Exclude](../../../static/img/docs/rmm-ninja-migration-windows/image-27.png)

#### Row 4 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `OrgID`

Custom Field: `Ninja_Org_ID`

![Pre-defined 4](../../../static/img/docs/rmm-ninja-migration-windows/image-28.png)

After clicking on Save the Pre-defined will show data as:

![Org ID](../../../static/img/docs/rmm-ninja-migration-windows/image-29.png)

#### Row 5 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `LocID`

Custom Field: `Ninja_Site_ID`

![pre-defined 5](../../../static/img/docs/rmm-ninja-migration-windows/image-30.png)

After clicking on Save the Pre-defined will show data as:

![Loc ID](../../../static/img/docs/rmm-ninja-migration-windows/image-31.png)


#### Row 6 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Select PowerShell](../../../static/img/docs/rmm-ninja-migration-windows/image-3.png)

![PowerShell Selected](../../../static/img/docs/rmm-ninja-migration-windows/image-4.png)

The following function will pop up on the screen:

![Empty PowerShell Editor](../../../static/img/docs/rmm-ninja-migration-windows/image-5.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$PreValidation = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'NinjaRMMAgent' } | Select-Object -ExpandProperty DisplayName
if ($PreValidation -match 'NinjaRMMAgent') {
    return 'The Ninja RMM agent already installed'
}
else {
    #region Setup - Variables
    $URL = 'https://app.ninjarmm.com/ws/api/v2/generic-installer/NinjaOneAgent-x86.msi'
    $WorkingDirectory = 'C:\ProgramData\_automation\script\NinjaRMM'
    $Path = "$WorkingDirectory\NinjaOneAgent-x86.msi"
    $NinjaDeploy = '@Deployment@'
    $NinjaDeployExL = '@DeploymentExL@'
    $NinjaDeployExC = '@DeploymentExc@'
    $LocID = '@LocID@'
    $OrgID = '@OrgID@'
    if ($NinjaDeploy -notmatch '@Deployment' -and $NinjaDeploy -eq 'True') {
        if ($NinjaDeployExL -notmatch '@DeploymentExL' -and $NinjaDeployExL -eq 'True') {
            return 'An error occurred: The Site level exclusion is applied for the computer'
        } 
        if ($NinjaDeployExC -notmatch '@DeploymentExC' -and $NinjaDeployExC -eq 'True') {
            return 'An error occurred: The computer level exclusion is applied for the endpoint'
        }
        if ($LocID -notmatch '@LocID' -and $LocID -match '[A-z0-9]') {
            $AuthToken = $LocID
        }
        elseif ($OrgID -notmatch '@OrgID' -and $OrgID -match '[A-z0-9]') {
            $AuthToken = $OrgID
        }
        else {
            return 'An error occurred: The authentication token is missing at the company and site level. Please provide token at least to one custom field'
        }
    }
    else {
        return 'An error occurred: The deployment is not enabled at the company level'
    }
    #endregion
    #region Setup - Folder Structure
    if (!(Test-Path $WorkingDirectory)) {
        try {
            New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
        }
        catch {
            return "An error occurred: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
        }
    }
    if (-not ((Get-Acl $WorkingDirectory).Access | Where-Object { $_.IdentityReference -Match 'Everyone' }).FileSystemRights -Match 'FullControl') {
        $Acl = Get-Acl $WorkingDirectory
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
        $Acl.AddAccessRule($AccessRule)
        Set-Acl $WorkingDirectory $Acl
    }
    #endregion

    #region Download Installer
    $response = Invoke-WebRequest -Uri $URL -OutFile $Path -UseBasicParsing
    if (!(Test-Path -Path $Path)) {
        return 'An error occurred: The installer was unable to be downloaded. Exiting.'
    }
    #endregion

    #region Install Ninja RMM Agent
    $Arguments = "-i `"$Path`" /qn REBOOT=ReallySuppress TOKENID=`"$AuthToken`""
    Start-Process -FilePath "msiexec.exe" -ArgumentList $Arguments -Wait -NoNewWindow
    Start-Sleep -Seconds 120
    $Validation = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'NinjaRMMAgent' } | Select-Object -ExpandProperty DisplayName
    if ($Validation -match 'NinjaRMMAgent') {
        return 'The installation succeeded for the Ninja RMM agent'
    }
    else {
        return 'An error occurred: The Ninja RMM agent deployment failed.'
    }
}
#endregion
```

![PowerShell Script](../../../static/img/docs/rmm-ninja-migration-windows/image-32.png)

#### Row 7 Logic: If/Then

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-windows/image-6.png) 
![Logic Selected](../../../static/img/docs/rmm-ninja-migration-windows/image-7.png) 

#### Row 7a Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/rmm-ninja-migration-windows/{8B1FC9D0-1421-4796-ACBE-388C6889F8F7}.png)

#### Row 7b Function: Set Custom Field

Add a new row in the IF part by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/rmm-ninja-migration-windows/image-8.png)

Search and select the `Set Custom Field` function.

![Select Custom field 1](../../../static/img/docs/rmm-ninja-migration-windows/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Custom field 2](../../../static/img/docs/rmm-ninja-migration-windows/image-33.png)

![Custom field 3](../../../static/img/docs/rmm-ninja-migration-windows/image-34.png)

#### Row 7c Function: Script Exit

In the IF part, add a new row by clicking on the Add row button.  

![Add Row 3](../../../static/img/docs/rmm-ninja-migration-windows/image-11.png)

In the script exit message, simply type `The Ninja deployment failed. Refer to the logs: %Output%`  

![Script Exit](../../../static/img/docs/rmm-ninja-migration-windows/image-35.png)

#### Row 8 Function: Script Log

Add a new row by clicking the `Add Row` button after `END IF`

![Add Row 5](../../../static/img/docs/rmm-ninja-migration-windows/image-12.png)

Search and select the `Script Log` function.

![Script Log Empty](../../../static/img/docs/rmm-ninja-migration-windows/image-13.png)

The following function will pop up on the screen:

![Script Log Empty 1](../../../static/img/docs/rmm-ninja-migration-windows/image-14.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Message](../../../static/img/docs/rmm-ninja-migration-windows/image-15.png)

#### Row 9 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 7](../../../static/img/docs/rmm-ninja-migration-windows/image-8.png)

Search and select the `Set Custom Field` function.

![Select Custom field 5](../../../static/img/docs/rmm-ninja-migration-windows/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Success` in the `Value` field, and click the `Save` button.

![Custom field 6](../../../static/img/docs/rmm-ninja-migration-windows/image-36.png)

![Custom field 7](../../../static/img/docs/rmm-ninja-migration-windows/image-37.png)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/cw-rmm-tasks-common-screenshots/savebutton.png)

## Completed Task

![Complete Task](../../../static/img/docs/rmm-ninja-migration-windows/image-38.png)

## Deployment

This task is required to be deployed using a dynamic group.

It can be scheduled to run every 1 hour. Follow the below deployment step to schedule it.

- Go to Automation > Tasks.

- Search for `NinjaRMM Deployment - [Windows]`

- Then click on Schedule

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-windows/image-17.png)

- Select the Target group [Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0)

![Target Set](../../../static/img/docs/rmm-ninja-migration-windows/image-19.png)

- Click Device Group -> Search for Ninja -> Select `Ninja RMM Deployment` group and click save selection

![Target select](../../../static/img/docs/rmm-ninja-migration-windows/image-20.png)

- Click on Schedule option, and set the time and click on Repeat to set it to run every hour

![Repeat](../../../static/img/docs/rmm-ninja-migration-windows/image-39.png)

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-windows/image-18.png)

## Output

- Custom field
- Script Log