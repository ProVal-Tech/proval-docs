---
id: '1d9dbd69-f735-4129-8c9d-e72430313371'
slug: /1d9dbd69-f735-4129-8c9d-e72430313371
title: 'Out of Date Cumulative Update (Autofix)'
title_meta: 'Out of Date Cumulative Update (Autofix)'
keywords: ['cumulative', 'update', 'autofix', 'patching', 'windows']
description: 'This document provides a detailed guide on installing the latest available Cumulative Update on machines where a CU has not been installed in the last 75 days. It includes sample runs, dependencies, variable setup, task creation, and deployment instructions.'
tags: ['patching', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days.

## Sample Run

![Sample Run 1](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_1.webp)  
![Sample Run 2](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_2.webp)

## Dependencies

- [CW RMM - Custom Field - Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206)
- [CW RMM Custom Field - Site - Out_of_Date_CU_Autofix](/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix](/docs/a9e84f5a-0afa-44ef-98b7-c5a70f6a25ea)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Result](/docs/2d24daab-16cb-4b2d-b7e6-0e757b4f2523)
- [CW RMM - Custom Field - EndPoint - Out_of_Date_CU_Autofix_Date](/docs/044210c4-14ae-4996-ab9f-009290bf05e4)
- [CW RMM - Device Group - Out of Date CU _ Autofix Required](/docs/7ef49988-2b75-441e-9373-bda734a03ea1)
- [Custom Fields - Reboot Prompter](/docs/7876f32c-a5ec-4b58-9f7e-b60b710e19d5)

## Variables

| Name                 | Description                                                                                                               |
|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| Company_Selection     | Value stored in the [Company - Out_of_Date_CU_Autofix](/docs/00c4b9c6-ded8-4cde-ba74-47437724d206) Custom Field.   |
| Site_Selection        | Value stored in the [Site - Out_of_Date_CU_Autofix](/docs/7eb4d98b-4199-4f59-a28f-bfdf50f3e36a) Custom Field.     |
| Endpoint_Selection    | Value stored in the [EndPoint - Out_of_Date_CU_Autofix](/docs/a9e84f5a-0afa-44ef-98b7-c5a70f6a25ea) Custom Field. |
| Output                | Output of the previously executed PowerShell script.                                                                     |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_3.webp)  
![Task Creation Image 2](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_4.webp)  

**Name:** Out of Date Cumulative Update (Autofix)  
**Description:** Installs the latest available Cumulative Update on the machines where a CU has not been installed in the last 75 days.  
**Category:** Patching  

![Task Creation Image 3](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_5.webp)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_6.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_8.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_9.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_10.webp)  

- Type `Company_Selection` in the `Variable Name` field.
- Select the `Custom Field` radio button.
- Search and select the company-level `Out_of_Date_CU_Autofix` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_11.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_12.webp)  

### Row 2 Function: Set Pre-defined Variable

Add a new row by clicking on the `Add Row` button.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_8.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_9.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_10.webp)  

- Type `Site_Selection` in the `Variable Name` field.
- Select the `Custom Field` radio button.
- Search and select the site-level `Out_of_Date_CU_Autofix` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_14.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_15.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_16.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_17.webp)  

### Row 3 Function: Set Pre-defined Variable

Add a new row by clicking on the `Add Row` button.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `Set Pre-defined Variable` function.  
![Set Pre-defined Variable](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_8.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_9.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_10.webp)  

- Type `Endpoint_Selection` in the `Variable Name` field.
- Select the `Custom Field` radio button.
- Search and select the Endpoint-level `Out_of_Date_CU_Autofix` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_18.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_19.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_20.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_21.webp)  

### Row 4 Function: PowerShell Script

Add a new row by clicking on the `Add Row` button.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_22.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_23.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_24.webp)  

Paste the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
$os = ( Get-CimInstance -ClassName Win32_OperatingSystem ).Caption
if ( '@EndPoint_Selection@' -eq 'Enable' ) \{
    'Enable'
} elseif ( '@EndPoint_Selection@' -eq 'Disable' ) \{
    'Disable'
} elseif ( $os -match 'Server' ) \{
    if ( '@Site_Selection@' -eq 'Enable for Server' ) \{
        'Enable'
    } elseif ( '@Site_Selection@' -eq 'Disable for Server' ) \{
        'Disable'
    } elseif ( '@Company_Selection@' -eq 'Servers as well' ) \{
        'Enable'
    } else \{
        'Disable'
    }
} elseif ( '@Site_Selection@' -eq 'Enable' ) \{
    'Enable'
} elseif ( '@Site_Selection@' -eq 'Disable' ) \{
    'Disable'
} elseif ( '@Company_Selection@' -eq 'Enable' ) \{
    'Enable'
} elseif ( '@Company_Selection@' -eq 'Disable' ) \{
    'Disable'
} else \{
    'Disable'
}
```

![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_25.webp)  

### Row 5 Logic: If/Then

![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_26.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_27.webp)  

### Row 5a Condition: Output Contains

Type `Disable` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_28.webp)  

### Row 5b Function: Script Log

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_29.webp)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_30.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_31.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_32.webp)  

Type `Autofix is disabled.` in the `Script Log Message` field and click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_33.webp)  

### Row 5c Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_29.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_34.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_35.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_36.webp)  

Click the `Save` button without typing anything in the `Error Message` field.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_37.webp)  

### Row 6 Function: PowerShell Script

Add a new row by clicking on the `Add Row` button outside the `If/Then` logic.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_38.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_22.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_23.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_24.webp)  

Paste the following PowerShell script and set the expected time of script execution to `7200` seconds. Click the `Save` button.

```powershell
# Needs update to JSON format
```

![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_39.webp)  

### Row 7 Logic: If/Then/Else

![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_40.webp)  
![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_41.webp)  

### Row 7a Condition: Output Contains

Type `Failed to Install` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_42.webp)  

### Row 7b Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_43.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_44.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_45.webp)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Failed` in the `Value` field, then click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_46.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_47.webp)  

### Row 7c Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_29.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_34.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_35.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_36.webp)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
```plaintext
Script Failed.  
Output: %Output%
```
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_48.webp)  

### Row 7d Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_49.webp)  
![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_50.webp)  

### Row 7d(i) Condition: Output Contains

Change the comparator to `Does Not Contain`.  
![Change Comparator](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_51.webp)  

Type `Successfully installed the latest available Cumulative Update` in the `Input Value or Variable` field and press `Enter`.  
![Input Value](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_52.webp)  

### Row 7d(ii) Function: Script Log

Click the `Add Row` button after the condition.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_53.webp)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_30.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_31.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_32.webp)  

Type `Script Result: %Output%` in the `Script Log Message` field and click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_54.webp)  

### Row 7d(iii) Function: Script Exit

Click the `Add Row` button inside the `If/Then` logic.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_55.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_34.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_35.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_36.webp)  

Click the `Save` button without typing anything in the `Error Message` field.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_37.webp)  

### Row 7d(iv) Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_49.webp)  
![Logic](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_50.webp)  

### Row 7d(iv)\<1> Condition: Output Does Not Contain

Change the comparator to `Does Not Contain`.  
![Change Comparator](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_51.webp)  

Type `Successfully installed the latest available Cumulative Update` in the `Input Value or Variable` field and press `Enter`.  
![Input Value](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_52.webp)  

### Row 7d(iv)\<2> Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_56.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_44.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_45.webp)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Failed` in the `Value` field, then click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_46.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_47.webp)  

### Row 7d(iv)\<3> Function: Script Exit

Click the `Add Row` button inside the `If` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_56.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_34.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_35.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_36.webp)  

Paste the following lines in the `Error Message` field and click the `Save` button.  
```plaintext
Script Failed.  
Output: %Output%
```
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_48.webp)  

### Row 7d(iv)\<4> Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_57.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_44.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_45.webp)  

Search and select `Out_of_Date_CU_Autofix_Result` in the `Search Custom Field` field and set `Reboot Pending` in the `Value` field, then click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_58.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_59.webp)  

### Row 7d(iv)\<5> Function: PowerShell Script

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_56.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_22.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_23.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_24.webp)  

Paste the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
(Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
```
![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_60.webp)  

### Row 7d(iv)\<6> Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_56.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_44.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_45.webp)  

Search and select `Out_of_Date_CU_Autofix_Date` in the `Search Custom Field` field and set `%Output%` in the `Value` field, then click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_61.webp)  
![Save Confirmation](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_62.webp)  

### Row 7d(iv)\<7> Function: PowerShell Script

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_56.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_22.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_23.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_24.webp)  

Paste the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
$os = ( Get-CimInstance -ClassName Win32_OperatingSystem ).Caption; 
if ( $os -match 'Server' ) \{ 
    'This is a Server Operating System. It should be restarted manually. Exiting the Script.' 
} else \{ 
    'Initiating the reboot pending prompt solution on the machine.' 
}
```
![PowerShell Script](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_63.webp)  

### Row 7d(iv)\<8> Function: Script Log

Add a new row by clicking the `Add Row` button inside the `Else` section.  
![Add Row](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_56.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_7.webp)  

Search and select the `Script Log` function in the newly appeared row.  
![Script Log](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_30.webp)  
![Select Function](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_31.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_32.webp)  

Type `%Output%` in the `Script Log Message` field and click the `Save` button.  
![Save Changes](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_64.webp)  

## Completed Script

![Completed Script 1](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_65.webp)  
![Completed Script 2](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_66.webp)  
![Completed Script 3](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_67.webp)  
![Completed Script 4](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_68.webp)  

## Deployment

It is suggested to run the Task once per week against the [Out of Date CU _ Autofix Required](/docs/7ef49988-2b75-441e-9373-bda734a03ea1) device group.

1. Go to `Automation` > `Tasks`.
2. Search for `Out of Date Cumulative Update (Autofix)` Task.
3. Select the concerned task.
4. Click on the `Schedule` button to schedule the task.  
![Schedule Task](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_69.webp)  
5. This screen will appear.  
![Schedule Screen](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_70.webp)  
6. Click the `Does not repeat` button.  
![Does Not Repeat](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_71.webp)  
7. This pop-up box will appear.  
![Pop-up Box](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_72.webp)  
8. Change the Repeat interval to `Week(s)`, select an appropriate day; I have selected `Monday` in the attached screenshot. Click the `OK` button to save the changes.  
![Change Repeat Interval](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_73.webp)  
9. Recurrence will be updated to `Every Week on \<Selected Weekday>`.  
![Recurrence Updated](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_74.webp)  
10. Select the `Device Groups` option in the `Targeted Resources` section.  
![Targeted Resources](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_75.webp)  
11. Search and Select the [Out of Date CU _ Autofix Required](/docs/7ef49988-2b75-441e-9373-bda734a03ea1) device group.  
![Select Device Group](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_76.webp)  
12. Now click the `Run` button to initiate the task.  
![Run Task](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_77.webp)  
13. The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_78.webp)  
![Scheduled Tasks](../../../static/img/docs/1d9dbd69-f735-4129-8c9d-e72430313371/image_79.webp)  

## Output

- Script Log
- Custom Field

