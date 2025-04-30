---
id: '905f38b9-492e-43d8-b687-7b4df48c3b97'
slug: /905f38b9-492e-43d8-b687-7b4df48c3b97
title: 'NinjaRMM Deployment - [Windows]'
title_meta: 'NinjaRMM Deployment - [Windows]'
keywords: ['RMM', 'Ninja', 'Migration', 'Windows', 'Agent', 'Install']
description: 'This script deploys the NinjaRMMAgent to Windows-supported OS, based on the article provided below: https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization. It depends on the Authorization token, which will be kept in the company or site custom fields.'
tags: ['RMM', 'Ninja', 'Migration', 'Windows']
draft: false
unlisted: false
---

## Summary
This script deploys the NinjaRMMAgent to Windows-supported OS, based on the article provided below:
https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization.
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

![Script Detail](../../../static/img/docs/rmm-ninja-migration-windows/{D67F5434-6571-4758-B4E3-8927774B14D1}.png)

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

![Set Pre-defined 1](../../../static/img/docs/rmm-ninja-migration-windows/{6D1A9CF8-491A-468B-814E-CE4D0F0A4D4F}.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Enable](../../../static/img/docs/rmm-ninja-migration-windows/{B6493CE0-6772-447A-B8A4-05078B4D0D2F}.png)

#### Row 2 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `DeploymentExL`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 2](../../../static/img/docs/rmm-ninja-migration-windows/{0669F0B4-1AF8-425D-B20F-67CE6EECCF53}.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Exclude Location](../../../static/img/docs/rmm-ninja-migration-windows/{28BC1FB3-64AD-4BCC-8A29-7B5F7C4B3063}.png)

#### Row 3 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `DeploymentExC`

Custom Field: `Ninja Deployment Exclude`

![Set Pre-defined 3](../../../static/img/docs/rmm-ninja-migration-windows/{8F84361F-5BCE-4581-BC94-2AAEDDE7759B}.png)

After clicking on Save the Pre-defined will show data as:

![Deployment Exclude Computer](../../../static/img/docs/rmm-ninja-migration-windows/{AC705BD3-F770-44AF-874D-907D69404C0F}.png)

#### Row 4 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `OrgID`

Custom Field: `Ninja_Org_ID`

![Set Pre-defined 4](../../../static/img/docs/rmm-ninja-migration-windows/{43557D2D-BFA2-4477-9626-B73ED12BFA0F}.png)

After clicking on Save the Pre-defined will show data as:

![Org ID](../../../static/img/docs/rmm-ninja-migration-windows/{1C0C0E82-9353-4C60-BD11-73A7D8B2919B}.png)

#### Row 5 Function: `Pre-defined Variable`

Select the Pre-defined Variable and provide the details and click on Save.

Variable: `LocID`

Custom Field: `Ninja_Site_ID`

![Set Pre-defined 5](../../../static/img/docs/rmm-ninja-migration-windows/{AA7418D1-D334-42A4-8337-23055A77EBDE}.png)

After clicking on Save the Pre-defined will show data as:

![Loc ID](../../../static/img/docs/rmm-ninja-migration-windows/{6E8E85B6-841E-43E6-8675-37F7ECA4BC85}.png)


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

![PowerShell Script](../../../static/img/docs/rmm-ninja-migration-windows/{3C09873E-FD09-444A-8784-4038845446E0}.png)

#### Row 7 Logic: If/Then

![Logic If/Then](../../../static/img/docs/rmm-ninja-migration-windows/image-6.png) 
![Logic Selected](../../../static/img/docs/rmm-ninja-migration-windows/image-7.png) 

#### Row 7a Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Contains" part.  

![Condition](../../../static/img/docs/rmm-ninja-migration-windows/{8B1FC9D0-1421-4796-ACBE-388C6889F8F7}.png)

#### Row 7b Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 1](../../../static/img/docs/rmm-ninja-migration-windows/image-8.png)

Search and select the `Set Custom Field` function.

![Select Custom field 1](../../../static/img/docs/rmm-ninja-migration-windows/image-16.png)

Search and select `Ninja Deployment Result` in the `Search Custom Field` field, set `Failed` in the `Value` field, and click the `Save` button.

![Set Custom field 2](../../../static/img/docs/rmm-ninja-migration-windows/{F2031C84-1F90-4B1A-AC79-B5542960F765}.png)

![Set Custom field 3](../../../static/img/docs/rmm-ninja-migration-windows/{905B7362-95C7-4A1F-A92F-804AF252FF1E}.png)

#### Row 7c Function: Script Exit

Add a new row by clicking on the Add row button.  

![Add Row 3](../../../static/img/docs/rmm-ninja-migration-windows/image-11.png)

In the script exit message, simply type `The Ninja deployment failed. Refer to the logs: %Output%`  

![Script Exit](../../../static/img/docs/rmm-ninja-migration-windows/{4349013D-846A-4A02-9DB7-C052BEE2A3AB}.png)

#### Row 8 Function: Script Log

Add a new row by clicking the `Add Row` button.

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

![Set Custom field 6](../../../static/img/docs/rmm-ninja-migration-windows/{5654A45B-832E-4EDE-B937-2D7413A97E7B}.png)

![Set Custom field 7](../../../static/img/docs/rmm-ninja-migration-windows/{08226894-0E9F-416B-8BCA-49289F8860F6}.png)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/cw-rmm-tasks-common-screenshots/savebutton.png)

## Completed Task

![Complete Task](../../../static/img/docs/rmm-ninja-migration-windows/{45854EA3-C808-4981-A6E6-A50237CB31D0}.png)

## Deployment

This task is required to be deployed using a dynamic group.

It can be scheduled to run every 1 hour. Follow the below deployment step to schedule it.

- Go to Automations > Tasks.

- Search for `NinjaRMM Deployment - [Windows]`

- Then click on Schedule

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-windows/image-17.png)

- Select the Target group [Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0)

![Target Set](../../../static/img/docs/rmm-ninja-migration-windows/image-19.png)

- Click Device Group -> Search for Ninja -> Select `Ninja RMM Deployment` group and click save selection

![Target select](../../../static/img/docs/rmm-ninja-migration-windows/image-20.png)

- Click on Schedule option, and set the time and click on Repeat to set it to run every hour

![Repeat Every 1 Hour](../../../static/img/docs/rmm-ninja-migration-windows/{379014B5-A273-42CD-8892-475FE52D7346}.png)

![Schedule Task](../../../static/img/docs/rmm-ninja-migration-windows/image-18.png)

## Output

- Custom field
- Script Log