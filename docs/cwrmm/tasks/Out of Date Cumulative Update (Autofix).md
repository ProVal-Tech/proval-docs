---
id: 'rmm-out-of-date-cumulative-update-autofix'
title: 'Out of Date Cumulative Update (Autofix)'
title_meta: 'Out of Date Cumulative Update (Autofix)'
keywords: ['cumulative', 'update', 'autofix', 'patching', 'windows']
description: 'This document provides a detailed guide on installing the latest available Cumulative Update on machines where a CU has not been installed in the last 75 days. It includes sample runs, dependencies, variable setup, task creation, and deployment instructions.'
tags: ['patching', 'windows', 'update', 'automation', 'scripting']
draft: false
unlisted: false
---
## Summary

Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days.

## Sample Run

![Sample Run 1](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_1.png)  
![Sample Run 2](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_2.png)

## Dependencies

- [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259)
- [CW RMM Custom Field - Site - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748260)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748262)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](https://proval.itglue.com/DOC-5078775-15748265)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Date](https://proval.itglue.com/DOC-5078775-15748263)
- [CW RMM - Device Group - Out of Date CU _ Autofix Required](https://proval.itglue.com/DOC-5078775-15748268)
- [Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)

## Variables

| Name                 | Description                                                                                                               |
|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| Company_Selection     | Value stored in the [Company - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748259) Custom Field.   |
| Site_Selection        | Value stored in the [Site - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748260) Custom Field.     |
| Endpoint_Selection    | Value stored in the [EndPoint - Out_of_Date_CU_Autofix](https://proval.itglue.com/DOC-5078775-15748262) Custom Field. |
| Output                | Output of the previously executed PowerShell script.                                                                     |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_3.png)  
![Task Creation Image 2](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_4.png)  

**Name:** Out of Date Cumulative Update (Autofix)  
**Description:** Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days.  
**Category:** Patching  

![Task Creation Image 3](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_5.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_6.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_8.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_9.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_10.png)  

- Type `Company_Selection` in the `Variable Name` field.
- Select the `Custom Field` Radio button.
- Search and select the company-level `Out_of_Date_CU_Autofix` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_11.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_12.png)  

### Row 2 Function: Set Pre-defined Variable

Add a new row by clicking on `Add Row` button.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_13.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_8.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_9.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_10.png)  

- Type `Site_Selection` in the `Variable Name` field.
- Select the `Custom Field` Radio button.
- Search and select the site-level `Out_of_Date_CU_Autofix` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_14.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_15.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_16.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_17.png)  

### Row 3 Function: Set Pre-defined Variable

Add a new row by clicking on `Add Row` button.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_13.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_8.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_9.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_10.png)  

- Type `Endpoint_Selection` in the `Variable Name` field.
- Select the `Custom Field` Radio button.
- Search and select the Endpoint-level `Out_of_Date_CU_Autofix` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_18.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_19.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_20.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_21.png)  

### Row 4 Function: PowerShell Script

Add a new row by clicking on `Add Row` button.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_13.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_22.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_23.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_24.png)  

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.  

```powershell
$os = ( Get-CimInstance -ClassName Win32_OperatingSystem ).Caption
if ( '@EndPoint_Selection@' -eq 'Enable' ) {
    'Enable'
} elseif ( '@EndPoint_Selection@' -eq 'Disable' ) {
    'Disable'
} elseif ( $os -match 'Server' ) {
    if ( '@Site_Selection@' -eq 'Enable for Server' ) {
        'Enable'
    } elseif ( '@Site_Selection@' -eq 'Disable for Server' ) {
        'Disable'
    } elseif ( '@Company_Selection@' -eq 'Servers as well' ) {
        'Enable'
    } else {
        'Disable'
    }
} elseif ( '@Site_Selection@' -eq 'Enable' ) {
    'Enable'
} elseif ( '@Site_Selection@' -eq 'Disable' ) {
    'Disable'
} elseif ( '@Company_Selection@' -eq 'Enable' ) {
    'Enable'
} elseif ( '@Company_Selection@' -eq 'Disable' ) {
    'Disable'
} else {
    'Disable'
}
```

![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_25.png)  

### Row 5 Logic: If/Then

![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_26.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_27.png)  

### Row 5a Condition: Output Contains

Type `Disable` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_28.png)  

### Row 5b Function: Script Log

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_29.png)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_30.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_31.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_32.png)  

Type `Autofix is disabled.` in the `Script Log Message` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_33.png)  

### Row 5c Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_29.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_34.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_35.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_36.png)  

Click the `Save` button without typing anything in the `Error Message` field.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_37.png)  

### Row 6 Function: PowerShell Script

Add a new row by clicking on `Add Row` button outside the `If/Then` logic.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_38.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_22.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_23.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_24.png)  

Paste in the following PowerShell script and set the expected time of script execution to `7200` seconds. Click the `Save` button.  

```powershell
#requires -RunAsAdministrator
#requires -Version 5
$ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
$url = 'https://proval.itglue.com/DOC-5078775-15739309'
$iwr = Invoke-WebRequest -Uri $url -UseBasicParsing
$json = $($iwr.content -split '<code>' -split '</code>' ) -match 'plugin_proval_windows_os_support'
$json = $json -replace '<br>', "`n" -replace '//', '//' -replace "'", "/'" -replace "$([char]0x2018)|$([char]0x2019)", "/'" -replace '&amp;#x2014;', ' ' -replace '&amp;nbsp;', ''
$rows = ( $json | ConvertFrom-Json ).rows
$os = Get-CimInstance -ClassName Win32_OperatingSystem
if ( !( $os.caption -match '(Windows 1[01])|(Server 20(1[69]|22))' ) ) {
    return 'Unsupported OS'
}
```

![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_39.png)  

### Row 7 Logic: If/Then/Else

![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_40.png)  
![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_41.png)  

### Row 7a Condition: Output Contains

Type `Failed to Install` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_42.png)  

### Row 7b Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_43.png)  

Search and select `Set Custom Field` function.  
![Set Custom Field](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_44.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_45.png)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Failed` in the `Value` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_46.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_47.png)  

### Row 7c Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_29.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_34.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_35.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_36.png)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
```plaintext
Script Failed.  
Output: %Output%
```
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_48.png)  

### Row 7d Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_49.png)  
![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_50.png)  

### Row 7d(i) Condition: Output Contains

Change the comparator to `Does Not Contain`.  
![Change Comparator](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_51.png)  

Type `Successfully installed the latest available Cumulative Update` in the `Input Value or Variable` field and press `Enter`.  
![Input Value](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_52.png)  

### Row 7d(ii) Function: Script Log

Click the `Add Row` button after the condition.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_53.png)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_30.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_31.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_32.png)  

Type `Script Result: %Output%` in the `Script Log Message` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_54.png)  

### Row 7d(iii) Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_55.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_34.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_35.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_36.png)  

Click the `Save` button without typing anything in the `Error Message` field.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_37.png)  

### Row 7d(iv) Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_49.png)  
![Logic](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_50.png)  

### Row 7d(iv)<1> Condition: Output Does Not Contain

Change the comparator to `Does Not Contain`.  
![Change Comparator](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_51.png)  

Type `Successfully installed the latest available Cumulative Update` in the `Input Value or Variable` field and press `Enter`.  
![Input Value](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_52.png)  

### Row 7d(iv)<2> Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_56.png)  

Search and select `Set Custom Field` function.  
![Set Custom Field](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_44.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_45.png)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Failed` in the `Value` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_46.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_47.png)  

### Row 7d(iv)<3> Function: Script Exit

Click the `Add Row` button inside the `If` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_56.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_34.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_35.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_36.png)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
```plaintext
Script Failed.  
Output: %Output%
```
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_48.png)  

### Row 7d(iv)<4> Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_57.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select `Set Custom Field` function.  
![Set Custom Field](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_44.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_45.png)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Reboot Pending` in the `Value` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_58.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_59.png)  

### Row 7d(iv)<5> Function: PowerShell Script

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_56.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_22.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_23.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_24.png)  

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.  

```powershell
(Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
```
![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_60.png)  

### Row 7d(iv)<6> Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_56.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select `Set Custom Field` function.  
![Set Custom Field](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_44.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_45.png)  

Search and select `Out_of_Date_CU_Autofix_Date` in the `Search Custom Field` field and set `%Output%` in the `Value` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_61.png)  
![Save Confirmation](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_62.png)  

### Row 7d(iv)<7> Function: PowerShell Script

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_56.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_22.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_23.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_24.png)  

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.  

```powershell
$os = ( Get-CimInstance -ClassName Win32_OperatingSystem ).Caption; 
if ( $os -match 'Server' ) { 
    'This is a Server Operating System. It should be restarted manually. Exiting the Script.' 
} else { 
    'Initiating the reboot pending prompt solution on the machine.' 
}
```
![PowerShell Script](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_63.png)  

### Row 7d(iv)<8> Function: Script Log

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_56.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_7.png)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_30.png)  
![Select Function](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_31.png)  

Following function will pop-up on to the screen:  
![Function Popup](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_32.png)  

Type `%Output%` in the `Script Log Message` field and click the `Save` button.  
![Save Changes](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_64.png)  

## Completed Script

![Completed Script 1](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_65.png)  
![Completed Script 2](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_66.png)  
![Completed Script 3](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_67.png)  
![Completed Script 4](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_68.png)  

## Deployment

It is suggested to run the Task once per week against the [Out of Date CU _ Autofix Required](https://proval.itglue.com/DOC-5078775-15748268) device group.

1. Goto `Automation` > `Tasks.`
2. Search for `Out of Date Cumulative Update (Autofix)` Task.
3. Select the concerned task.
4. Click on `Schedule` button to schedule the task.  
![Schedule Task](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_69.png)  
5. This screen will appear.  
![Schedule Screen](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_70.png)  
6. Click the `Does not repeat` button.  
![Does Not Repeat](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_71.png)  
7. This pop-up box will appear.  
![Pop-up Box](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_72.png)  
8. Change the Repeat interval to `Week(s)`, select an appropriate day; I have selected `Monday` in the attached screenshot. Click the `OK` button to save the changes.  
![Change Repeat Interval](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_73.png)  
9. Recurrence will be updated to `Every Week on <Selected Weekday>`.  
![Recurrence Updated](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_74.png)  
10. Select the `Device Groups` option in the `Targeted Resources` section.  
![Targeted Resources](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_75.png)  
11. Search and Select the [Out of Date CU _ Autofix Required](https://proval.itglue.com/DOC-5078775-15748268) device group.  
![Select Device Group](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_76.png)  
12. Now click the `Run` button to initiate the task.  
![Run Task](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_77.png)  
13. The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_78.png)  
![Scheduled Tasks](../../../static/img/Out-of-Date-Cumulative-Update-(Autofix)/image_79.png)  

## Output

- Script Log
- Custom Field



