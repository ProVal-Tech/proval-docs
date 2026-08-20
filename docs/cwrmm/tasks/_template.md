---
id: 'New GUID'
slug: /New GUID
title: 'Filename'
title_meta: 'Filename'
keywords: []
description: ''
tags: []
draft: true
unlisted: false
last_update:
  date: 2025-05-07
---

## Summary

## Sample Run

## Dependencies

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |

> 📝 **Document Author Workflow (Read Before Proceeding)**
> 
> **Do not paste raw PowerShell, Bash, or CMD scripts directly into this public document.** 
> To keep our public documentation clean and our code secure, all scripts must be hosted in our central repository.
> 
> 1. **Author & Format:** Write the script adhering strictly to the organization's PowerShell/Bash formatting rules (single quotes, `-f` composition, explicit parameters, etc.).
> 2. **Commit to Repository:** Push the finalized script to the **[`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm)**.
> 3. **Directory Structure:** Save the file using the exact name of this markdown document (without the `.md` extension). 
>    * *Example Path:* `tasks/<this-document-filename>/script.ps1` (or `.sh` / `.cmd`).
>    * *Multiple Scripts:* If the task requires multiple scripts of the same type, name them `script1.ps1`, `script2.ps1`, etc.
> 4. **Link in Document:** Replace the raw code blocks in the "Script Editor" section below with the permanent GitHub URLs pointing to your committed scripts.

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

**Name:** `<Script Name>`  
**Description:** `<Script's Description>`  
**Category:** `<Script's Category>`

`<Insert a screenshot showing what the Description section should look like>`

### Parameters

Locate the `Add Parameter` button on the right-hand side of the screen and click on it to create a new parameter.  
![AddParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addparameter.webp)

The `Add New Script Parameter` page will appear on clicking the `Add Parameter` button.  
![AddNewScriptParameter](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addnewscriptparameter.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: `<Function Name>`

<!-- Example for standard non-script functions -->
- **Notes:** `<Notes>`
- **Operating System:** `Windows`
<!-- Add other relevant function fields here -->

#### Row 2 Function: PowerShell Script

- **Notes:** `<Notes>`
- **Use Generative AI Assist for script creation:** `False`
- **Expected time of script execution in seconds:** `<Time in Seconds>`
- **Continue on Failure:** `<True/False>`
- **Run As:** `System`
- **Operating System:** `Windows`
- **PowerShell Script Editor:**

  Navigate to the [`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm), open the script linked below, copy the raw code, and paste it into the RMM script editor:
  
  [PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/<filename>/script.ps1)

#### Row 3 Function: Bash Script

- **Notes:** `<Notes>`
- **Expected time of script execution in seconds:** `<Time in Seconds>`
- **Continue on Failure:** `<True/False>`
- **Operating System:** `Mac`
- **Bash Script Editor:**

  Navigate to the [`cw-rmm` repository](https://github.com/ProVal-Tech/cw-rmm), open the script linked below, copy the raw code, and paste it into the RMM script editor:
  
  [Bash Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/<filename>/script.sh)

#### Row 4 Function: Script Log

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Script Log Message:** `%Output%`

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

`<Screenshot(s) of completed task>`

## Deployment

## Output

## Changelog