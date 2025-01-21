---
id: 'd7f9015f-0d7c-4bfb-b624-4600f4774b65'
title: 'SonicWall NetExtender Install/Update Script'
title_meta: 'SonicWall NetExtender Install/Update Script'
keywords: ['sonicwall', 'netextender', 'winget', 'install', 'update']
description: 'This document provides a comprehensive overview of a script designed to install or update the SonicWall NetExtender application on target devices using Winget. It includes sample runs, variable descriptions, and process details to ensure effective deployment.'
tags: ['installation', 'networking', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script attempts to install or update the SonicWall NetExtender application on the target device using Winget.

## Sample Run

![Sample Run](../../../static/img/SWM---Software---InstallUpdate-Sonicwall-NetExtender-Winget/image_1.png)

## Variables

| Name           | Description                                                             |
|----------------|-------------------------------------------------------------------------|
| psout          | Stores the SonicWall NetExtender install/update result                  |
| LogContent     | Stores the content of the file `SonicWall.NetExtender-log.txt`        |
| DataLogContent | Stores the content of the file `SonicWall.NetExtender-data.txt`       |
| ErrorLog       | Stores the content of the file `SonicWall.NetExtender-error.txt`      |

## Process

This script performs the SonicWall NetExtender install/update using Winget. It can be run directly or scheduled with the monitor [SonicWall NetExtender Deployment](<../monitors/SonicWall NetExtender Deployment.md>).

**Note:** This script needs to be scheduled on at least one machine permanently so that the maximum version keeps updating in the database to trigger the monitor for the update of the SonicWall NetExtender on all agents where it is installed.

## Output

- Script Log
