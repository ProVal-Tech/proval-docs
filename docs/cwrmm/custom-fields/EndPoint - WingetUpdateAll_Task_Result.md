---
id: 'a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f'
title: 'Scheduled Task Winget Update All Result'
title_meta: 'Scheduled Task Winget Update All Result'
keywords: ['winget', 'task', 'result', 'scheduled', 'update']
description: 'This document describes a custom field that stores the outcome of scheduled tasks related to Winget updates in ConnectWise RMM. It details possible values for task results and provides a structured overview of the field characteristics, including editable options and default values.'
tags: ['connectwise', 'update']
draft: false
unlisted: false
---
## Summary

This custom field stores the outcome of both [CW RMM - Task - Scheduled Task Winget Update All (Create)](https://proval.itglue.com/DOC-5078775-15702931) and [CW RMM - Task - Scheduled Task Winget Update All (Delete)](https://proval.itglue.com/DOC-5078775-15702855) tasks. It stores whether the task succeeded or failed.

Possible values:
- NA
- Task Created
- Task Creation Failed
- Task Deleted
- Task Deletion Failed

## Details

| Field Name                          | Level    | Type      | Default Value | Description                                         | Editable |
|-------------------------------------|----------|-----------|---------------|-----------------------------------------------------|----------|
| WingetUpdateAll_Task_Result         | ENDPOINT | Text Box  | NA            | Stores the result of Scheduled Task Winget Update All script. | Yes      |

## ScreenShot

![Screenshot 1](../../../static/img/EndPoint---WingetUpdateAll_Task_Result/image_1.png)

![Screenshot 2](../../../static/img/EndPoint---WingetUpdateAll_Task_Result/image_2.png)











