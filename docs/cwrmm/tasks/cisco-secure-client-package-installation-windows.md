---
id: 'ab05999e-28bb-45af-adac-ba7bf32fd3a4'
slug: /ab05999e-28bb-45af-adac-ba7bf32fd3a4
title: 'Cisco Secure Client Package Installation (Windows)'
title_meta: 'Cisco Secure Client Package Installation (Windows)'
keywords: ['cisco', 'secure', 'client', 'installation', 'windows', 'vpn']
description: 'This document provides a comprehensive guide for implementing the Cisco Secure Client Package Installation via ConnectWise RMM. It details prerequisites, dependencies, script creation steps, and module definitions to ensure a successful installation of the Cisco Secure Client and its components.'
tags: ['application', 'installation', 'networking', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This task is a CW RMM implementation of the agnostic script [Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea). It allows for the installation of either the entire suite or specific modules of the Cisco Secure Client. Parameters are utilized in a manner consistent with the agnostic script approach.

## Prerequisites

Download the `Cisco Secure Client Pre-Deployment Package (Windows) - includes individual MSI files` and place it in a downloadable location as `Cisco_Secure_Client.zip`.

**NOTE**  
To access/download these files, you will need a login to the Cisco portal. If you do not have a portal login, please create one and validate your access before attempting to download the files, or you will receive an error like this:  
![Error Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_1.webp)

The file can be downloaded from [Cisco Software Download](https://software.cisco.com/download/home/286330811/type/282364313/release/5.0.03076). Cisco changes this download URL for each release. Prefer downloading the latest stable version of the tool.  
![Download Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_2.webp)

Example of a Download URL: [https://file.provaltech.com/apps/packages/cisco_secure_client.zip](https://file.provaltech.com/apps/packages/cisco_secure_client.zip)

## Dependencies

- [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03)
- [Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea)

## Sample Run

![Sample Run Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_3.webp)

## Variables

| Name      | Description                                                                                                                                                                                                                 |
|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Parameter | Parameter stored in the [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) custom field for the company.                                            |
| Output    | Stores the output of the previously executed PowerShell script, and its value changes after each execution of a PowerShell script.                                                                                         |

## Script Creation

Create the company-level Custom Field [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03).

Create a new `Script Editor` style script in the system to implement this task.

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image1.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image2.webp)

**Name:** `Cisco Secure Client Package Installation (Windows)`  
**Description:** `How to use parameters: [Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea)  
Note: To install the Umbrella module, it is required to install the Core VPN module.`  
**Category:** `Application`

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image3.webp)

### Script

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image4.webp)

#### Row 1 Function: Set Pre-defined Variable

Select `Set Pre-defined Variable` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image5.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image6.webp)  
Select the `Custom Field` option.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image7.webp)  
Type `Parameter` in the `Variable Name` field and search and select the `Cisco Secure Client Parameter` in the `Search Custom Field` field.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image8.webp)  
Click the `Save` button to save the function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image9.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image10.webp)  

#### Row 2 Logic: If/Then

Insert a new row by selecting the `If/Then` option from the `Add Logic` dropdown button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image11.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image12.webp)  

##### Row 2a Condition: Value Does Not Contain

Select the `Value` option from the drop-down button next to the `Output` option.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image13.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image14.webp)  
Enter `Parameter` in the `Enter Value` field and press the `Enter` button on your keyboard.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image15.webp)  
Select `Does Not Contain` comparator from the drop-down button next to the `Contains` option. 
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image16.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image17.webp)  
Type `-downloadURL` in the `Input Value and Variable` field and press the `Enter` button on your keyboard.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image18.webp)  

##### Row 2b Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the `If/Then` logic after the `Output Contains` condition.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image19.webp)  
Select `Script Exit` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image20.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image21.webp)  
Paste this line in the `Error Message` box and click the `Save` button.  
`Parameter is not set at the company level Custom field Cisco Secure Client Parameter.  
Exiting script with error.`  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image22.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image23.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image24.webp)  

#### Row 3 Function: Script Log

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image25.webp)  
Select `Script Log` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image26.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image27.webp)  
Paste this line in the `Script Log Message` box and click the `Save` button.  

```PlainText
Parameters Used:  
@Parameter@
```

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image28.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image29.webp)  

#### Row 4 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image30.webp)  
Select `PowerShell Script` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image31.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image32.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image33.webp)  
Paste in the following PowerShell script, set the expected time of script execution to `900` seconds, and click the `Save` button.

```PowerShell
#region Setup - Variables
$ProjectName = 'Install-CiscoSecureClient'

$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
#endregion

#region Setup - Folder Structure
mkdir -Path $WorkingDirectory -ErrorAction SilentlyContinue | Out-Null
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    Write-Error -Message "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
    return
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    Write-Error -Message 'An error occurred and the script was unable to be downloaded. Exiting.'
    return
}
#endregion
$workingpath = $WorkingDirectory
#region Execution
    & $PS1Path @Parameter@
#endregion
```

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image34.webp)  
Mark the `Continue on Failure` checkbox.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image35.webp)  

#### Row 5 Function: Script Log

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image36.webp)  
Select `Script Log` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image37.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image38.webp)  
Paste this line in the `Script Log Message` box and click the `Save` button.  

```PlainText
PowerShell Output:  
%Output%
```

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image39.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image40.webp)  

#### Row 6 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image30.webp)  
Select `PowerShell Script` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image31.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image32.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image33.webp)  
Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```PowerShell
$logPath = 'C:\ProgramData\_automation\script\Install-CiscoSecureClient\Install-CiscoSecureClient-log.txt'
if ( Test-Path $logPath ) {
    Get-Content -Path $logPath 
} else {
    return 'Log file not generated'
}
```

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image41.webp)  
Mark the `Continue on Failure` checkbox.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image42.webp)  

#### Row 7 Function: Script Log

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image36.webp)  
Select `Script Log` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image37.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image38.webp)  
Paste this line in the `Script Log Message` box and click the `Save` button.  

```PlainText
Log Content:  
%Output%
```

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image43.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image40.webp)  

#### Row 8 Function: PowerShell Script

Insert a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image30.webp)  
Select `PowerShell Script` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image31.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image32.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image33.webp)  
Paste in the following PowerShell script, set the expected time of script execution to `300` seconds, and click the `Save` button.

```PowerShell
$errorLogPath = 'C:\ProgramData\_automation\script\Install-CiscoSecureClient\Install-CiscoSecureClient-Error.txt'
if ( Test-Path $errorlogPath ) {
    Get-Content -Path $errorLogPath 
} else {
    return 'Errors Logs not generated.'
}
``` 

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image44.webp)  
Mark the `Continue on Failure` checkbox.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image42.webp)  

#### Row 9 Logic: If/Then/Else

Insert a new row by selecting the `If/Then/Else` option from the `Add Logic` dropdown button.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image45.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image46.webp)  

##### Row 9a Condition: Output Contains

Type `Errors Logs not generated.` in the `Input Value or Variable` field.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image47.webp)  

##### Row 9b Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the `If/Then/Else` logic after the `Output Contains` condition.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image48.webp)  
Select `Script Exit` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image49.webp)  
Click the `Save` button for the `Error Message` prompt box without adding anything to the text field.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image50.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image51.webp)  

##### Row 9c Function: Script Exit

Insert a new row by clicking the `Add Row` button inside the `If/Then/Else` logic in the `Else` section.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image52.webp)  
Select `Script Exit` function.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image53.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image54.webp)  
Paste this line in the `Error Message` box and click the `Save` button.  

```PlainText
Error Log Content:  
%Output%
```

![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image55.webp)  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image56.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image57.webp)  

Store the proper parameter at the company-level custom field [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) before scheduling or running the script.

## Completed Script

![Completed Script Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_4.webp)

## Module Definitions

### Core-VPN

- Core-VPN must be installed with any additional module.
- All modules require that Core-VPN be installed.
- When only installing Core-VPN, you can expect to see the following.

![Core-VPN Image 1](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_5.webp)  
![Core-VPN Image 2](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_6.webp)  
![Core-VPN Image 3](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_7.webp)  
![Core-VPN Image 4](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_8.webp)  

### Start Before Login

- SBL stands for Start Before Login; it adds no direct user GUI, however, it does add an entry into programs and features.
- It enables the execution of the AnyConnect VPN prior to a user being logged in.

![Start Before Login Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_9.webp)

### Diagnostic and Reporting Tool

- DART stands for Diagnostics and Reporting Tool.
- When installing this, you can expect to see the following items.

![DART Image 1](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_10.webp)  
![DART Image 2](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_11.webp)  
![DART Image 3](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_12.webp)  

### Network Access Manager

- NAM stands for Network Access Manager.
- When installing this module, you can expect to see the following items.

![NAM Image 1](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_13.webp)  
![NAM Image 2](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_14.webp)  

### Network Visibility Module

- NVM stands for Network Visibility Manager.
- Network Visibility Manager does not include a GUI but does the following:
- Network Visibility Manager **helps you see user and endpoint behavior both on and off premises**. It collects standard flows from endpoints (laptops, for example) along with context like user, application, device, location, and destination information.

![NVM Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_15.webp)

### VPN Posture - HostScan Module

- Posture provides the Cisco AnyConnect Secure Mobility Client with the ability to assess an endpoint's compliance for things like antivirus, antispyware, and firewall software installed on the host.
- It does not provide a User GUI.

![HostScan Image](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_16.webp)

### ISE Posture

- ISE Posture provides the Cisco AnyConnect Secure Mobility Client with the ability to assess an endpoint's compliance for things like antivirus, antispyware, and firewall software installed on the host, with a user GUI interface.
- When installing this module, you can expect to see the following:

![ISE Posture Image 1](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_17.webp)  
![ISE Posture Image 2](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_18.webp)  

### Umbrella

- Umbrella installs the Cisco Umbrella module.
- When installing this module, you can expect to see the following:

![Umbrella Image 1](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_19.webp)  
![Umbrella Image 2](../../../static/img/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4/image_20.webp)  

## Uninstalling

- When uninstalling this package, you can simply uninstall the Core-VPN module, and it will remove all embedded modules except for the DART module; that module will have to be removed separately.

## FAQ

- Will this installation update older versions of Cisco AnyConnect?
  - Yes, each requested component will be updated if run against a machine that has that component already installed. Components that are not requested will not be updated.

## Output

- Script log
