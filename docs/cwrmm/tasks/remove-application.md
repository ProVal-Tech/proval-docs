---
id: '9f850e35-aca9-4255-b692-4b31d33f7ab1'
slug: /9f850e35-aca9-4255-b692-4b31d33f7ab1
title: 'Remove Application'
title_meta: 'Remove Application'
keywords: ['uninstall', 'application', 'cw', 'rmm', 'script']
description: 'This document provides a detailed guide on how to create and implement a script in ConnectWise RMM for uninstalling specified applications from devices. It includes sample runs, user parameters, and step-by-step instructions for setting up the task and handling outputs effectively.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script is designed to perform the uninstallation of the application provided in the parameter. The script requires the application name(s) to precisely match those listed under the `Applications` tile in the device available in CW RMM.

## Sample Run

![Sample Run 1](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_14.webp)  
![Sample Run 2](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_15.webp)  
![Sample Run 3](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_16.webp)  

## Dependencies

[Custom Field - Remove Application Result](/docs/c893b839-b951-4b0c-b1d0-879361818839)  

## User Parameters

| Name             | Example                                                                                           | Required | Description                                                                                                                                                                                                                                                                                                                                 |
|------------------|---------------------------------------------------------------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ApplicationName  | 'Google Chrome', 'Microsoft OneDrive', 'VMware Tools'                                          | True     | The name of the application(s) to remove is encoded in single quotation marks. When specifying multiple application names, ensure they are separated by a comma (,) without any spaces, with each application encoded in single quotation marks, as depicted in the example.                                                               |

## Implementation

### Create Task

Remove Application: To implement this script, please create a new "PowerShell" style script in the system.  
![Create Task](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_17.webp)  

Name: Remove Application  
Description: This script is designed to perform the uninstallation of the application provided in the parameter. The script requires the application name(s) to precisely match those listed under the `Applications` tile in the device available in CW RMM.  
Category: Custom  

![Task Category](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_18.webp)  

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.  
![Add Row](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_19.webp)  

### Row 1: Function: Script Log

![Row 1 Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_20.webp)  

Paste the highlighted text:  
`Validating the application name(s) to precisely match in the list of installed applications and bloatware programs detected on the computer.`  
![Row 1 Log Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_21.webp)  

### Row 2: Function: PowerShell Script

![Row 2 PowerShell](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_22.webp)  
![Row 2 PowerShell Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_23.webp)  

Paste in the following PowerShell script and set the expected time of script execution to **300** seconds.

```powershell
$ErrorActionPreference = 'SilentlyContinue'
$to_Remove = @ApplicationName@
if ($to_Remove) {
    $Applications = @()
    $for_removal = @()
    $Applications = [string[]]($(Get-AppxPackage).Name) + [string[]]((Get-AppxProvisionedPackage -online).DisplayName) + [string[]]((Get-ChildItem 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Get-ItemProperty).DisplayName); $for_removal = foreach ($application in $applications) { if ( $to_remove -contains $application) { $application } }; 
    if ($for_removal) { return " '$($for_removal -join ''',''')' " } else { return 'Not Installed' }
}
else {
    return 'Parameter missing'
}
```

### Row 3: Function: Script Log

![Row 3 Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_24.webp)  

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Row 3 Log Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_25.webp)  

### Row 4: Logic: If/Then/Else

![Row 4 Logic](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_26.webp)  
![Row 4 Logic Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_27.webp)  

#### Row 4a: Condition: Output Contains

In the IF part, enter **Not Installed** in the right box of the "Output Contains" part.  
Add Condition OR  
Enter **Parameter Missing** in the right box of the "Output Contains" part.  
![Row 4a Condition](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_28.webp)  

#### Row 4b: Function: Script Log

![Row 4b Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_20.webp)  

Paste the highlighted text:  
`Application Name does not exist. Exiting script.`  
![Row 4b Log Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_29.webp)  

#### Row 4c: Function: Script Exit

Add a new row by clicking on the Add Row button.  
![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_48.webp)  

In the script exit message, leave it blank.  
![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_49.webp)  

### Row 5: Function: Script Log

![Row 5 Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_20.webp)  

Paste the highlighted text:  
`Executing the PowerShell script to perform the uninstallation of the @ApplicationName@.`  

![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_50.webp)  

### Row 6: Function: PowerShell Script

![Row 6 PowerShell](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_22.webp)  

Paste in the following PowerShell script and set the expected time of script execution to **3600** seconds.

```powershell
#region Setup - Variables
$ProjectName = 'Remove-Application'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
# # Parameters and Globals
# # Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
$Parameters = @{
     Name = @ApplicationName@
 }
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
#endregion
#region Setup - Folder Structure
mkdir -Path $WorkingDirectory -ErrorAction SilentlyContinue | Out-Null
try {
    Invoke-WebRequest -Uri $PS1URL -OutFile $PS1path -UseBasicParsing -ErrorAction Stop
} catch {
    if (!(Test-Path -Path $PS1Path )) {
        throw ('Failed to download the script from ''{0}'', and no local copy of the script exists on the machine. Reason: {1}' -f $PS1URL, $($Error[0].Exception.Message))
    }
}
#endregion
#region Execution
& $PS1Path @Parameters
#endregion
```

### Row 7: Function: Script Log

![Row 7 Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_24.webp)  

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Row 7 Log Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_25.webp)  

### Row 8: Function: PowerShell Script

![Row 8 PowerShell](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_22.webp)  
![Row 8 PowerShell Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_23.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$ErrorActionPreference = 'SilentlyContinue'
$to_Remove = @ApplicationName@
if ($to_Remove) {
    $Applications = @()
    $for_removal = @()
    $Applications = [string[]]($(Get-AppxPackage).Name) + [string[]]((Get-AppxProvisionedPackage -online).DisplayName) + [string[]]((Get-ChildItem 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Get-ItemProperty).DisplayName); $for_removal = foreach ($application in $applications) { if ( $to_remove -contains $application) { $application } }; 
    if ($for_removal) { return " '$($for_removal -join ''',''')' " } else { return 'Not Installed' }
}
else {
    return 'Parameter missing'
}
```

### Row 9: Function: Script Log

![Row 9 Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_24.webp)  

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Row 9 Log Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_25.webp)  

### Row 10: Logic: If/Then/Else

#### Row 10a: Condition: Output Contains

In the IF part, enter **Not Installed** in the right box of the "Output Contains" part.  
![Row 10a Condition](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_34.webp)  

#### Row 10b: Function: Script Log

![Row 10b Log](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_20.webp)  

Paste the highlighted text:  
`@ApplicationName@ successfully uninstalled. Exiting script.`  
![Row 10b Log Image](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_35.webp)  

#### Row 10c: Function: Set Custom Field

Add a new row by clicking on the Add Row button.  
Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.  

In this window, search for the **Remove Application Result** field.  
**Custom Field:** Remove Application Result  
**Value:** `Success`  

![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_36.webp)  

#### Row 10d: Function: Script Exit

Add a new row by clicking on the Add Row button.  
![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_48.webp)  

In the script exit message, leave it blank.  
![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_49.webp)  

### Row 11: Function: Script Exit

Add a new row by clicking on the Add Row button.  
![Image](../../../static/img/docs/9f850e35-aca9-4255-b692-4b31d33f7ab1/image_48.webp)  
  
In the script exit message, write `@ApplicationName@ failed to uninstall. Exiting script with error.`  
![Row 11 Exit](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_51.webp)  

### Row 12: Function: Set Custom Field

Add a new row by clicking on the Add Row button.  
Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.  

In this window, search for the **Remove Application Result** field.  
**Custom Field:** Remove Application Result  
**Value:** `Failed`  
![Row 12 Set Custom Field](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_38.webp)  

### Row 13: Complete

![Row 13 Complete 1](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_39.webp)  
![Row 13 Complete 2](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_40.webp)  

## Deployment

It is suggested to run the Task every 2 hours against the group `Remove Application`.

- Go to `Automation` > `Tasks.`
- Search for `Remove Application` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Schedule Task](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_41.webp)  

This screen will appear.  
![Schedule Screen](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_42.webp)  

Select the relevant time to run the script and click the Do not repeat button.  
![Select Time](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_43.webp)  

A pop-up box will appear.  
Change the number of hours to `2` and click `OK`.  
![Change Hours](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_44.webp)  
![Change Hours Confirmation](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_45.webp)  

Select the target to schedule at site 'ProVal - Development'.  
For example:  
![Select Target](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_46.webp)  

Now click the `Run` button once all customization is set to initiate the task.  
![Run Task](../../../static/img/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be/image_47.webp)  

The task will start appearing in the Scheduled Tasks.

## Output

- Task log
- Custom field 'Remove Application Result'