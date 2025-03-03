---
id: '9cc58a6b-0ba0-42c5-a82d-3495dad2bcd7'
title: 'Microsoft Outlook - OST/PST Audit'
title_meta: 'Microsoft Outlook - OST/PST Audit'
keywords: ['Microsoft','Outlook','OST','PST','Audit']
description: 'This is the RMM Implementation of Microsoft Outlook - OST/PST Audit Script'
tags: ['microsoft365','office','windows']
draft: False
unlisted: false
---

## Summary
This is the RMM implementation of [Microsoft Outlook - OST/PST - Audit](<../../cwa/scripts/Microsoft Outlook - OSTPST - Audit.md>) script. It collects all the OST/PST file names, sizes and last write time from Windows machines and stores them in Custom Fields.

## Sample Run

![Sample Run](../../../static/img/CWRMM-OSTPST--Audit/image14.png)

## Dependencies
[Endpoint-OSTPSTAudi](<../custom-fields/Endpoint-OSTPSTAudit.md>)

## Task Creation
Create a new `Script Editor` style script in the system to implement this task.  
![Create Script](../../../static/img/Set---DisplayScaling/image_3.png)  
![Script Creation](../../../static/img/Set---DisplayScaling/image_4.png)

**Name:** Microsoft Outlook - OST/PST - Audit
**Description:** This task retrieve the file path and size details of OST and PST files from all Windows Workstations
**Category:** Custom  
![Category](../../../static/img/CWRMM-OSTPST--Audit/image4.png)


## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/Set---DisplayScaling/image_11.png)

A blank function will appear.  
![Blank Function](../../../static/img/Set---DisplayScaling/image_12.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Function Image](../../../static/img/Set-NetAdapterDNS/image_15.png)

The following function will pop up on the screen:

![Function Popup Image](../../../static/img/Set-NetAdapterDNS/image_16.png)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
$files = Get-ChildItem -Path C:\Users -Include *.ost, *.pst -Recurse -File -ErrorAction SilentlyContinue -Force
if ( $files ) {
    return 'File exists'
} else {
    return 'File Not Found.'
}
```
### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Image](../../../static/img/Set-NetAdapterDNS/image_17.png)

## Step 3 Logic: If/Then

- Add a new `If/Then` logic from the Add Logic dropdown menu.  
![Image 5](../../../static/img/CWRMM-OSTPST--Audit/image5.png)  

## ROW 3a Condition: Output Contains

- Type `File exists` in the Value box.  
![Image 6](../../../static/img/CWRMM-OSTPST--Audit/image6.png)

## ROW 3b Function: Powershell Script

- Add a new row in the If Section of the If-Else part by clicking the Add Row button  
- Search and select the `PowerShell Script` function.
- Paste in the following PowerShell script in the pop up box and set the expected time of script execution to 300 seconds. Click the Save button.

```powershell
$outputString = ''
$files = Get-ChildItem -Path C:\Users -Include *.ost, *.pst -Recurse -File -ErrorAction SilentlyContinue -Force
if ( $files ) {
    foreach ( $file in $files ) {
        $outputString += "$($file.fullname -replace "'", "\'" -replace "$([char]0x2018)|$([char]0x2019)", "\'")"
    }
    return $outputString.TrimEnd(',')
} else {
    return 'File Not Found.'
}
```
![Image 7](../../../static/img/CWRMM-OSTPST--Audit/image7.png)

## ROW 3c Function: Set Custom Field
- Add a new row in the If Section by clicking the Add Row button  
- Search and select the `Set Custom Field` function.  
![Image 8](../../../static/img/CWRMM-OSTPST--Audit/image8.png)

- Search and select the `Outlook Data File Paths` Custom Field.  
- Type `%output%` in the `Value` box and click the Save button.  

## ROW 3d Function: Powershell Script
- Add a new row in the If Section.
- Search and select the `PowerShell Script` function.
- Paste in the following PowerShell script in the pop up box and set the expected time of script execution to 300 seconds. Click the Save button.

```powershell
$outputString = ''
$files = Get-ChildItem -Path C:\Users -Include *.ost, *.pst -Recurse -File -ErrorAction SilentlyContinue -Force
if ( $files ) {
    foreach ( $file in $files ) {
        $outputString += "$([Math]::Round($file.Length / 1024 / 1024,2))"
    }
    return $outputString.TrimEnd(',')
} else {
    return 'File Not Found.'
}
```
![Image 9](../../../static/img/CWRMM-OSTPST--Audit/image9.png)

## ROW 3e Function: Set Custom Field
- Add a new row in the If Section by clicking the Add Row button  
- Search and select the `Set Custom Field` function.  
![Image 10](../../../static/img/CWRMM-OSTPST--Audit/image10.png)

- Search and select the `Outlook Data File Size` Custom Field.  
- Type `%output%` in the `Value` box and click the Save button. 

## ROW 3f Function: Powershell Script
- Add a new row in the If Section.
- Search and select the `PowerShell Script` function.
- Paste in the following PowerShell script in the pop up box and set the expected time of script execution to 300 seconds. Click the Save button.

```powershell
$outputString = ''
$files = Get-ChildItem -Path C:\Users -Include *.ost, *.pst -Recurse -File -ErrorAction SilentlyContinue -Force
if ( $files ) {
    foreach ( $file in $files ) {
        $outputString += "$($file.lastwritetime.ToString('yyyy-MM-dd HH:mm:ss'))"
    }
    return $outputString.TrimEnd(',')
} else {
    return 'File Not Found.'
}
```
![Image 11](../../../static/img/CWRMM-OSTPST--Audit/image11.png)

## ROW 3g Function: Set Custom Field
- Add a new row in the If Section by clicking the Add Row button  
- Search and select the `Set Custom Field` function.  
![Image 12](../../../static/img/CWRMM-OSTPST--Audit/image12.png)

- Search and select the `Outlook Data File LWT` Custom Field.  
- Type `%output%` in the `Value` box and click the Save button.  


## Completed Task
![Image 13](../../../static/img/CWRMM-OSTPST--Audit/image13.png)

## Output
- Script Logs

