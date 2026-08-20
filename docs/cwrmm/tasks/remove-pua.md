---
id: '5f664f90-26b9-4082-9a99-73954de0c840'
slug: /5f664f90-26b9-4082-9a99-73954de0c840
title: 'Remove PUA'
title_meta: 'Remove PUA'
keywords: ['PUA', 'bloatware', 'application', 'remove']
description: 'This script manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage.'
tags: ['uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-08-12
---

## Summary

This script manages the removal of predefined bloatware packages or lists installed bloatware based on a centrally maintained list. It offers three primary operations: bulk removal, selective removal, and bloatware listing. The remove parameter allows bypassing the PUA List to remove any installed AppxPackage.

**PUA List:** [https://content.provaltech.com/attachments/potentially-unwanted-applications.json](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)

## Sample Run

![Sample Run 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image1.webp>)

To get the list of installed Bloatware:  
![Sample Run 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image2.webp>)

To remove all installed Bloatware installed on the computer from the [PUA List](https://content.provaltech.com/attachments/potentially-unwanted-applications.json):  
![Sample Run 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image3.webp>)

To remove all installed Bloatware except any of `WindowsStoreApps` category apps and `Microsoft.BingNews`,  and `Microsoft.MSPaint`:  
![Sample Run 4](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image4.webp>)

To remove individual AppxPackages installed on the machine like `Microsoft.MicrosoftOfficeHub`, `Microsoft.XboxApp`, `Microsoft.Messaging`, and `Microsoft.People`:  
![Sample Run 5](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image5.webp>)

![Sample Run 6](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image6.webp>)

## Dependencies

[Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443)


## User Parameters

| Name          | Example    | Required | Type        | Description  |
|---------------|------------|----------|--------------|----------------|
| ListBloatware  |  Yes  | False | Flag | Select Yes to list installed bloatwares without making changes. |
| Remove  | Microsoft.MicrosoftOfficeHub,Microsoft.XboxApp  | False | Text | Specify name(s) of the bloatwares to uninstall. |
| RemoveAll |  Yes | False | Flag | Set it to Yes to remove all bloatware by category or all found bloatware with or without exceptions |
| Category | XboxFeaturesApps | False | Text | Used with RemoveAll to filter bloatware to a certain category, allowing you to select just a specific category of bloatware. Accepted Values includes <br></br> - MsftBloatApps <br></br> - ThirdPartyBloatApps <br></br> - WindowsStoreApps <br></br> - XboxFeaturesApps <br></br> - NonAppxApps |
| Except | xboxGameOverlay | False | Text | Used with RemoveAll or Category to remove all except some item(s) from a category or all together |
| PUAListSource | `https://my.cdn.example/pua.json`, `C:\ProgramData\_Automation\Script\PUA\pua.json` | False | Text String | Optional source for an alternate PUA list JSON. When provided, the script will use the specified local JSON file or downloadable URL instead of the default PUA list (https://content.provaltech.com/attachments/potentially-unwanted-applications.json). |

**Note** : `The optional JSON file must contain only the following two supported categories: "MsftBloatApps" and "ThirdPartyBloatApps". All bloatware package names must be listed under one of these categories, as the script only processes these two categories. Any other categories included in the JSON file will not be recognized or processed by the script. `


## Implementation

### Script Details

#### Step 1

Navigate to `Automation`  ➞  `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

**Name:** `Remove - PUA`  
**Description:**

[Bash Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/remove-pua/script.sh)



**Category:** Application  

![Task Detail](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image7.webp>)

### Parameters

#### ListBloatware

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `ListBloatware` in the `Parameter Name` field.  
- Select `Flag` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image10.webp>)

#### Remove

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `Remove` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 6](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image11.webp>)

#### RemoveAll

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `RemoveAll` in the `Parameter Name` field.  
- Select `Flag` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 9](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image12.webp>)

#### Category

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `Category` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 12](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image13.webp>)

#### Except

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `Except` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  
![Add Parameter 15](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image14.webp>)

#### PUAListSource

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add  Parameter 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image8.webp>)

This screen will appear.  
![Add Parameter 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image9.webp>)

- Set `PUAListSource` in the `Parameter Name` field.  
- Select `Text String` from the `Parameter Type` dropdown menu.  
- Click the `Save` button.  

![Image](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image01.webp>)


### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![Add Row continued](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image15.webp>)

#### Row 1: Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Image 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image16.webp>)

The following function will pop up on the screen:  
![Row 1 Image 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image17.webp>)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/remove-pua/script.ps1)



![Row 1 Image 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image18.webp>)

#### Row 2: Function: Script Log

Add a new row by clicking the `Add Row` button.  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![Row 2 Image 2](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image15.webp>)

Search and select the `Script Log` function.  
![Row 2 Image 3](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image19.webp>)

![Row 2 Image 4](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image20.webp>)

The following function will pop up on the screen:  
![Row 2 Image 5](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image21.webp>)

In the script log message, simply type %output% and click the `Save` button  
![Row 2 Image 6](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image22.webp>)

Click the `Save` button at the top-right corner of the screen to save the script.  
![Row 2 Image 8](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image23.webp>)

## Completed Script

![Row 3 Image 1](<../../../static/img/docs/5f664f90-26b9-4082-9a99-73954de0c840/image24.webp>)

## Output

- Script log

## Changelog

### 2025-08-12

- Added another parameter `PuaListSource`. Its an Optional source for an alternate PUA list JSON. When provided, the script will use the specified local JSON file or downloadable URL instead of the default PUA list.
- Updated powershell to use this new parameter and as per our new cwrmm script standards.

### 2026-04-02

- Updated the PowerShell used in the script as per our new standards.

### 2025-05-02

- Fixed the bug where the script contained several outdated and potentially incorrect AppxPackage IDs in the bloatware removal arrays. Some Microsoft apps have changed their package identifiers in newer Windows versions, and some third-party apps may have incorrect publisher IDs.

### 2025-04-01

- Initial version of the document
