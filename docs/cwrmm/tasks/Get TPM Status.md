---
id: '678a70ca-c156-4568-95bd-f3df413433e3'
title: 'Get TPM Status'
title_meta: 'Get TPM Status'
keywords: ['tpm', 'status', 'security', 'custom', 'field']
description: 'This document provides a detailed guide on how to fetch the TPM Status of a machine and store it in a custom field within ConnectWise RMM. It includes sample runs, task creation steps, and the required PowerShell script to execute the task successfully.'
tags: ['connectwise', 'security']
draft: false
unlisted: false
---

## Summary

Fetches the TPM Status of the machine and stores it in the [TPM Status](<../custom-fields/Endpoint - TPM Status.md>) custom field.

## Sample Run

![Sample Run 1](../../../static/img/Get-TPM-Status/image_1.png)

![Sample Run 2](../../../static/img/Get-TPM-Status/image_2.png)

## Dependencies

[CW RMM - Custom Field - Endpoint - TPM Status](<../custom-fields/Endpoint - TPM Status.md>)  
Create the dependent Custom Field before creating the task.

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](../../../static/img/Get-TPM-Status/image_3.png)

![Task Creation Image 2](../../../static/img/Get-TPM-Status/image_4.png)

**Name:** `Get TPM Status`  
**Description:** `Fetches the TPM Status of the machine and stores it in the TPM Status custom field.`  
**Category:** Security

![Task Creation Image 3](../../../static/img/Get-TPM-Status/image_5.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Get-TPM-Status/image_6.png)

A blank function will appear.

![Blank Function](../../../static/img/Get-TPM-Status/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Function](../../../static/img/Get-TPM-Status/image_8.png)

![PowerShell Script Function Image 2](../../../static/img/Get-TPM-Status/image_9.png)

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/Get-TPM-Status/image_10.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
try {
    $tpmResults = Get-Tpm -ErrorAction Stop
} catch {
    throw "The script did not return the expected result. Reason: $($Error[0].Exception.Message)"
}
return "TpmEnabled: $($tpmResults.TpmEnabled) | TpmActivated: $($tpmResults.TpmActivated) | TpmReady: $($tpmResults.TpmReady) | TpmPresent: $($tpmResults.TpmPresent) | RestartPending: $($tpmResults.RestartPending)"
```

![PowerShell Script Execution Image](../../../static/img/Get-TPM-Status/image_11.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row for Script Log](../../../static/img/Get-TPM-Status/image_12.png)

A blank function will appear.

![Blank Function for Script Log](../../../static/img/Get-TPM-Status/image_13.png)

Search and select the `Script Log` function.

![Script Log Function](../../../static/img/Get-TPM-Status/image_14.png)

![Script Log Function Image 2](../../../static/img/Get-TPM-Status/image_15.png)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Get-TPM-Status/image_16.png)

In the script log message, simply type `%output%` and click the `Save` button.

![Script Log Save](../../../static/img/Get-TPM-Status/image_17.png)

### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row for Set Custom Field](../../../static/img/Get-TPM-Status/image_12.png)

A blank function will appear.

![Blank Function for Set Custom Field](../../../static/img/Get-TPM-Status/image_13.png)

Search and select the `Set Custom Field` function.

![Set Custom Field Function](../../../static/img/Get-TPM-Status/image_18.png)

The following function will pop up on the screen:

![Set Custom Field Popup](../../../static/img/Get-TPM-Status/image_19.png)

- Search and select the Computer-Level Custom Field `TPM Status` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save](../../../static/img/Get-TPM-Status/image_20.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/Get-TPM-Status/image_21.png)

## Completed Script

![Completed Script](../../../static/img/Get-TPM-Status/image_22.png)

## Output

- Script log  
![Script Log Output](../../../static/img/Get-TPM-Status/image_23.png)

- Custom Field  
![Custom Field Output](../../../static/img/Get-TPM-Status/image_24.png)  
Example: `TpmEnabled: True | TpmActivated: True | TpmReady: True | TpmPresent: True | RestartPending: False`
