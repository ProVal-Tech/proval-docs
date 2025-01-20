---
id: '174c59f1-8d7f-44a0-b5de-d69145ab4a43'
title: 'Find PHP.exe Using Everything.exe'
title_meta: 'Find PHP.exe Using Everything.exe'
keywords: ['php', 'everything', 'script', 'custom', 'table']
description: 'This document describes a script that utilizes Everything.exe to locate php.exe on a machine and store the results in a custom table. It includes instructions for the first run and regular execution, along with parameter details and output expectations.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

The script uses [Everything.exe](https://www.voidtools.com/) to locate `php.exe` present on the machine and stores the data into a [custom table](<../tables/pvl_php_audit.md>).

## Sample Run

**First Run**: Run the script with the `Set_Environment` parameter set to `1` after importing it to create the [custom table](<../tables/pvl_php_audit.md>) and the EDF being used by the script.  
![First Run](../../../static/img/Locate-PHP.exe/image_1.png)

**Regular Execution**:  
![Regular Execution](../../../static/img/Locate-PHP.exe/image_2.png)

## Variables

| Name                | Description                     |
|---------------------|---------------------------------|
| ProjectName         | Get-EverythingSearch            |
| WorkingDirectory@   | C:/ProgramData/_Automation/Script/Get-EverythingSearch |

## Global Parameters

| Name         | Value         | Required | Description                                        |
|--------------|---------------|----------|----------------------------------------------------|
| SearchString | ^PHP/.exe$    | True     | Regular expression of the file name to look for.  |

## User Parameters

| Name            | Example | Required                | Description                                                                                          |
|-----------------|---------|-------------------------|------------------------------------------------------------------------------------------------------|
| Set_Environment  | 1       | For the First Run       | Run the script with the `Set_Environment` parameter set to `1` after importing it to create the [custom table](<../tables/pvl_php_audit.md>) and the EDF being used by the script. |

## Client Level EDF

| Name          | Section  | Required | Description                                              |
|---------------|----------|----------|----------------------------------------------------------|
| Find PHP.exe  | Default  | True     | Mark this EDF to enable the Auditing for the client.     |

## Output

- Script Log
- Dataview













