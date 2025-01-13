---
id: 'cwa-windows-10-builds'
title: 'Windows 10 Machines by Build Number'
title_meta: 'Windows 10 Machines by Build Number - Data Overview'
keywords: ['windows', 'machines', 'build', 'version', 'percentage', 'filter']
description: 'This document provides an overview of a dataview that displays the number of Windows 10 machines categorized by their build number (ReleaseID), along with calculated percentages of machines on each version compared to the total number of Windows 10 devices. Various filters are available for detailed analysis.'
tags: ['report', 'windows', 'update', 'performance', 'configuration']
draft: false
unlisted: false
---
## Summary

This dataview will display the number of Windows 10 Machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the number of total Windows 10 devices. There are several filters available for this data. See the columns listed below for filter details.

Sample Screenshot:

![Screenshot 1](../../../static/img/Windows---Windows-Feature-Build-Metrics-UPDATED/image_1.png)
![Screenshot 2](../../../static/img/Windows---Windows-Feature-Build-Metrics-UPDATED/image_2.png)

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)

## Columns

| Column                          | Description                                                                                                                                                                                                                                        |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ReleaseID                       | The Build Name/Number for Windows 10. Example: 1709, 21H1                                                                                                                                                                                     |
| Total Machines Unfiltered       | The number of machines on each Windows 10 build with no filters applied                                                                                                                                                                         |
| % Total Unfiltered              | The number of machines on each Windows 10 build / the total number of Windows 10 machines                                                                                                                                                       |
| Online Machines W/ Patch Policy | The number of machines on each Windows 10 build with the following filters: The Windows 10 machine must have a patch policy with "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. The Windows 10 machine must have checked into CW Automate in the last 30 days. |
| % Total Online W/ Patch Policy  | The number of machines on each Windows 10 build with the above filters / the total number of Windows 10 machines with the same filters applied.                                                                                                   |
| Machines Online                 | The number of machines on each Windows 10 build with the following filter: The Windows 10 machine must have checked into CW Automate in the last 30 days. (Available in column chooser)                                                        |
| % Total Online                  | The number of machines on each Windows 10 build with the above filter / the total number of Windows 10 machines with the same filter applied. (Available in column chooser)                                                                        |
| Machines W/ Patch Policy        | The number of machines on each Windows 10 build with the following filter: The Windows 10 machine must have a patch policy with "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. (Available in column chooser)           |
| % Total W/ Patch Policy         | The number of machines on each Windows 10 build with the above filter / the total number of Windows 10 machines with the same filter applied. (Available in column chooser)                                                                        |




