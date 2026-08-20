---
id: '132fbfad-43d9-488b-bf73-343c72424485'
slug: /132fbfad-43d9-488b-bf73-343c72424485
title: 'Set-ServiceLogin'
title_meta: 'Set-ServiceLogin'
keywords: ['service', 'login', 'account', 'rmm', 'task']
description: 'This document provides a detailed guide on how to implement the Set-ServiceLogin task in an RMM environment, allowing users to change the service login account for a target service. It includes sample runs, user parameters, task creation steps, and script details.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This task is used to change the service login account for a target service. This is an RMM version of [Set-ServiceLogin](/docs/ec673596-37f8-4da2-b0ed-fdc347a98dfc). Please review the process mentioned in [Set-ServiceLogin](/docs/ec673596-37f8-4da2-b0ed-fdc347a98dfc) on how to use USER or SYSTEM mode in the script.

## Sample Run

![Sample Run 1](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_1.webp)

Sets the Print Spooler service to run as 'Local System'.

![Sample Run 2](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_2.webp)

Sets the Print Spooler service to run as 'User1'. Grants 'User1' the Logon as a Service right.

![Sample Run 3](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_3.webp)

## Dependencies

[Set-ServiceLogin](/docs/ec673596-37f8-4da2-b0ed-fdc347a98dfc)

## User Parameters

| Name          | Example          | Accepted Values | Required | Default | Type   | Description                                           |
|---------------|-------------------|-----------------|----------|---------|--------|-------------------------------------------------------|
| `Name`        | Spooler           |                 | False    |         | String | The service name to alter.                            |
| `DisplayName` | Print Spooler     |                 | False    | $false  | String | The service display name to alter.                    |
| `User`        | User1             |                 | False    |         | String | The username of the account to set the service to run as. |
| `Password`    | p@55w0rD          |                 | False    |         | String | The password of the account to set the service to run as. |
| `System`      | Marked            |                 | False    |         | Flag   | Use this switch to set the service to run as the Local System account. |
| `Force`       | Marked            |                 | False    | $false  | Flag   | Intended to force DNS address updates to DHCP-enabled adapters. |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_4.webp)

**Name:** Set-ServiceLogin  
**Description:** Used to change the service login account for a target service.  
**Category:** Custom  

![Task Creation Step 2](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_5.webp)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Step 1](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_6.webp)

This screen will appear.

![Add Parameter Step 2](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_7.webp)

- Set `Name` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Toggle Required Field.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_8.webp)

It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.

![Add Parameter Confirmation](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_9.webp)

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Step 4](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_10.webp)

- Set `System` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Toggle Default Value.
- Set Default Value as `False`.
- Click the `Save` button.
- Click the `Confirm` button to create the parameter.

![Add Parameter Step 5](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_11.webp)

Add another parameter.

- Set `User` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Toggle Required Field.
- Click the `Save` button.

![Add Parameter Step 6](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_12.webp)

Add another parameter.

- Set `Password` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Toggle Required Field.
- Click the `Save` button.

![Add Parameter Step 7](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_13.webp)

Add another parameter.

- Set `DisplayName` in the `Parameter Name` field.
- Select `String` from the `Parameter Type` dropdown menu.
- Toggle Required Field.
- Click the `Save` button.

![Add Parameter Step 8](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_14.webp)

Add another parameter.

- Set `Force` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Toggle Default Value.
- Set Default Value as `False`.
- Click the `Save` button.
- Click the `Confirm` button to create the parameter.

Parameters will look like as shown below:

![Parameters Overview](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_15.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_16.webp)

A blank function will appear.

![Blank Function](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_17.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_18.webp)

The following function will pop up on the screen:

![PowerShell Script Function](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_19.webp)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/set-servicelogin/script.ps1)



### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_20.webp)

## Completed Task

![Completed Task](../../../static/img/docs/132fbfad-43d9-488b-bf73-343c72424485/image_21.webp)

## Output

- Script Log

## Changelog

### 2025-04-10

- Initial version of the document

