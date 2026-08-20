---
id: 'afbc69e1-c57a-4421-af83-781dcceea09a'
slug: /afbc69e1-c57a-4421-af83-781dcceea09a
title: 'ESXi - Snapshot Delete'
title_meta: 'ESXi - Snapshot Delete'
keywords:  ['esxi', 'snapshot', 'vmware', 'powercli']
description: 'This task can be used to delete a snapshot of a machine hosted on an ESXi host server. It utilizes the PowerCLI Module to perform the required action.'
tags: ['backup', 'security', 'virtualization', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-20
---

## Summary
This task can be used to delete a snapshot of a machine hosted on an ESXi host server. It utilizes the PowerCLI Module to perform the required action.

## Sample Run

![Image](../../../static/img/docs/afbc69e1-c57a-4421-af83-781dcceea09a/image9.webp) 

## User Parameters

| Name        | Example                     | Required | Type        | Description                                 |
|-------------|-----------------------------|----------|-------------|---------------------------------------------|
| VMName  | DEV_Test-win10   | True     | Text String | Name of the virtual machine from which to remove the snapshot|
| ESXiHost | 111.111.111.111          | True     | Text String | IP Address of ESXi Host. |
| Username   | ESXIAdmin | True     | Text String | Username to use to connect with the ESXi Host. |
| Password  | "QWfqw2%R@@$@FQW:RVV!'qwdwq" | True     | Text String | Password to use to connect with the ESXi Host. |
| SnapshotName   | CW-RMM-Temp-Snapshot_20230501_081958 | False | Text String | Name of the Snapshot to delete |

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

- **Name:** `ESXi - Snapshot Delete`  
- **Description:** `This task can be used to delete a snapshot of a machine hosted on an ESXi host server. It utilizes the PowerCLI Module to perform the required action.`  
- **Category:** `Custom`

![Image](../../../static/img/docs/afbc69e1-c57a-4421-af83-781dcceea09a/image1.webp) 

### Parameters

### VMName

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `VMName` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/2543f54a-2d4d-46d0-9827-ce94a1ef444d/image2.webp) 

### ESXiHost

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `ESXiHost` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/2543f54a-2d4d-46d0-9827-ce94a1ef444d/image3.webp) 

### Username

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `Username` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/2543f54a-2d4d-46d0-9827-ce94a1ef444d/image4.webp) 

### Password

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `Password` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/2543f54a-2d4d-46d0-9827-ce94a1ef444d/image5.webp) 

### SnapshotName

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  

- Set `SnapshotName` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Image](../../../static/img/docs/2543f54a-2d4d-46d0-9827-ce94a1ef444d/snapshotname.webp) 


### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/esxi-snapshot-delete/script.ps1)



![Image](../../../static/img/docs/afbc69e1-c57a-4421-af83-781dcceea09a/image7.webp) 


### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image](../../../static/img/docs/afbc69e1-c57a-4421-af83-781dcceea09a/image8.webp) 

## Output

- Script Logs

## Changelog

### 2026-03-20

- Initial version of the document

