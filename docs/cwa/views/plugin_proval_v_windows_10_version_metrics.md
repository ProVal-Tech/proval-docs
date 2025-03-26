---
id: 'ea558c06-8fef-4c9f-87c7-42a3aa289dad'
slug: /ea558c06-8fef-4c9f-87c7-42a3aa289dad
title: 'plugin_proval_v_windows_10_version_metrics'
title_meta: 'plugin_proval_v_windows_10_version_metrics'
keywords: ['windows', 'metrics', 'filters', 'dataview', 'support', 'releaseid']
description: 'This document provides an overview of the Windows 10 Version Metrics dataview, including its purpose, dependencies, and detailed table structures. It addresses the limitations of SQLBody in the dataview and outlines the relationships between various components.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this view is to serve the [Windows - Windows 10 Version Metrics + Filters + Client Filters (reference table)](https://proval.itglue.com/5078775/docs/9373201) dataview because the "SQLBody" used in the dataview was exceeding the limit of 2048 characters.

Unsupported for MySQL version < 5.7

## Dependencies

- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)
- [Windows - Windows 10 Version Metrics + Filters + Client Filters (reference table)](/docs/13b8b937-0d9f-44b7-a7e5-5abf38ab9cda)
- [Create View plugin_proval_v_windows_10_version_metrics*](/docs/ac098d84-7d28-4b69-933f-74ab861d2b89)

## Tables

#### plugin_proval_v_windows_10_version_metrics

| Column                             | Type            | Explanation                                                                                                                                                                                                                             |
|------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ReleaseID                          | mediumtext      | The Build Name/Number for Windows 10. Example: 1709, 21H1, 1803 - LTSC. It will show 'Windows 10' for the Summary Row.                                                                                                              |
| Total Machines Unfiltered           | decimal(23,0)   | The number of Windows 10 machines for the client for the concerned release ID. For the summary row, it's the total number of Windows 10 machines.                                                                                       |
| % Total Unfiltered                  | varchar(27)     | The number of machines on that Windows 10 release ID for the client / the total number of Windows 10 machines for the client. For the Summary row, it will be 100.                                                                       |
| Count Machines Online               | decimal(23,0)   | The number of machines on the respective Windows 10 release ID for the client with the following filter: The machine must have checked into CW Automate in the last 15 minutes. For the Summary row, it's the number of online Windows 10 machines for the client. |
| % Total Online                      | decimal(28,1)   | The number of machines on the respective Windows 10 release ID for the client with the above filter / the total number of Windows 10 machines for the client with the same release ID. For the Summary row, it's the percentage of online Windows 10 machines. |
| clientid                           | int(11)         | Client ID                                                                                                                                                                                                                                 |
| Machines W/ Patch Policy            | decimal(23,0)   | The number of machines on the respective Windows 10 release ID for the client with the following filter: The machine must have a patch policy with "Managed Mode" or "Managed Mode UI Disabled" as its patch install method.            |
| % Total W/ Patch Policy             | decimal(28,1)   | The number of machines on the respective Windows 10 release ID for the client with the above filter / the total number of Windows 10 machines for the client with the same release ID. For the Summary row, it's the percentage of Windows 10 machines with a Managed Patch policy assigned. |
| Online Machines W/ Patch Policy      | decimal(23,0)   | The number of machines on the respective Windows 10 release ID for each client with the following filters: The machine must have a patch policy with "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. The machine must have checked into CW Automate in the last 15 minutes. |
| % Total Online W/ Patch Policy       | decimal(28,1)   | The number of machines on the respective Windows 10 release ID for each client with the above filters / the total number of Windows 10 machines for the client with the same release ID. For the Summary row, it's the percentage of online Windows 10 machines with a Managed Mode or Managed Mode UI Disabled as its patch install method. |
| Client_Name                         | varchar(50)     | Name of the Client                                                                                                                                                                                                                       |
| Support End Date                   | varchar(10)     | Official Support End Date for the Release ID, NULL/Blank for the Client Summary row.                                                                                                                                                   |
| Count Supported Machines            | varchar(21)     | Number of Machines supported for the concerned release ID, depending on the `Support End Date`. For the Summary row, it's the total count of all the supported Windows 10 for that client.                                           |
| Count Unsupported Machines          | varchar(25)     | Number of unsupported machines for the concerned release ID, depending on the `Support End Date`. For the Summary row, it's the total count of all the unsupported Windows 10 for that client.                                        |
| % Supported Machines                | varchar(27)     | Either 100 or 0 for the release ID row depending upon whether the concerned release ID is supported till today or not. For the Summary row, it's the percentage of the supported Windows 10 out of all the available Windows 10 machines. |
| % Unsupported Machines              | varchar(31)     | Either 0 or 100 for the release ID row depending upon whether the concerned release ID is supported till today or not. For the Summary row, it's the percentage of the unsupported Windows 10 out of all the available Windows 10 machines. |
| Build                               | varchar(60)     | Build Number for the concerned release ID. e.g., 10.0.19044, 10.0.19043. It will show 'Windows 10' for the Summary Row.                                                                                                               |


