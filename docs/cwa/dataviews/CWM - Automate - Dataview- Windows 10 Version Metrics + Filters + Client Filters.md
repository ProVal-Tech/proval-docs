---
id: 'cwa-windows-10-version-metrics'
title: 'Windows 10 Version Metrics Dataview'
title_meta: 'Windows 10 Version Metrics Dataview'
keywords: ['windows', 'metrics', 'dataview', 'build', 'client', 'machines', 'releaseid', 'patch']
description: 'This document details a dataview that displays the number of Windows 10 machines by their build number, including calculated percentages of each version against the total number of Windows 10 devices for each client. It includes various filters and a summary row for each client.'
tags: ['windows', 'client', 'metrics', 'dataview', 'releaseid', 'patch']
draft: false
unlisted: false
---
## Summary

This dataview will display the number of Windows 10 Machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the number of total Windows 10 devices for each client. There are several filters available for this data. See the columns listed below for filter details.

Additional Summarized row per client are added to the dataview.

Sample Screenshot:

![Sample Screenshot](5078775/docs/9373201/images/14885370)

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)  
[CWM - Automate - View - plugin_proval_v_windows_10_version_metrics](https://proval.itglue.com/DOC-5078775-9373661)  
[Create View plugin_proval_v_windows_10_version_metrics*](https://proval.itglue.com/DOC-5078775-10101234)

## Columns

| Column                           | Type            | Explanation                                                                                                                                                                                                 |
|----------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ReleaseID                        | mediumtext      | The Build Name/Number for Windows 10. Example: 1709, 21H1, 1803 - LTSC. It will Show 'Windows 10' for the Summary Row.                                                                                   |
| Total Machines Unfiltered        | decimal(23,0)   | The number of windows 10 machines for the client for the concerned releaseid. For the summary row, it's total number of windows 10 Machines.                                                               |
| % Total Unfiltered               | varchar(27)     | The number of machines on that window 10 releaseid for the client/ the total number of Windows 10 machines for the client. For the Summary row, it will be 100.                                          |
| Count Machines Online            | decimal(23,0)   | The number of machines on the respective Windows 10 releaseid for the client with the following filter: The machine must have checked into CW Automate in the last 15 Minutes. For the Summary row, it's the number of online windows 10 machines for the client. |
| % Total Online                   | decimal(28,1)   | The number of machines on the respective Windows 10 releaseid for the client with the above filter / the total number of the Windows 10 machines for the client with the same releaseid. For the Summary row, it's the percentage of online windows 10 machines out of the total windows 10 machines for the client. |
| clientid                         | int(11)         | Clientid                                                                                                                                                                                                      |
| Machines W/ Patch Policy         | decimal(23,0)   | The number of machines on the respective Windows 10 releaseid for the client with the following filter: The machine must have a patch policy with "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. For the Summary row, it's the total number of windows 10 machines for the client with a "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. |
| % Total W/ Patch Policy          | decimal(28,1)   | The number of machines on the respective Windows 10 releaseid for the client with the above filter / the total number of Windows 10 machines for the client with the same releaseid. For the Summary row, it's the percentage of windows 10 machines for the client with a Managed Patch policy assigned out of the total windows 10 machines for the client. |
| Online Machines W/ Patch Policy   | decimal(23,0)   | The number of machines on the respective Windows 10 releaseid for each client with the following filters: The machine must have a patch policy with "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. The machine must have checked into CW Automate in the last 15 Minutes. For the Summary row, it's the count of online windows 10 machines for the client with a "Managed Mode" or "Managed Mode UI Disabled" as its patch install method. |
| % Total Online W/ Patch Policy   | decimal(28,1)   | The number of machines on the respective Windows 10 releaseid for each client with the above filters / the total number of Windows 10 machines for the client with the same releaseid. For the Summary row, it's the percentage of online windows 10 machines for the client with a "Managed Mode" or "Managed Mode UI Disabled" as its patch install method out of the total number of windows 10 machines for the client. |
| Client_Name                      | varchar(50)     | Name of the Client                                                                                                                                                                                           |
| Support End Date                 | varchar(10)     | Official Support End Date for the ReleaseID, NULL/Blank for the Client Summary row.                                                                                                                      |
| Count Supported Machines          | varchar(21)     | Number of Machines supported for the concerned release id, depending on the `Support End Date`. It's going to be either the total number of the machine for that releaseid or 0 for the releaseid rows. For the Summary row, it's the total count of all the Supported windows 10 for that client. |
| Count Unsupported Machines        | varchar(25)     | Number of unsupported machines for the concerned release id, depending on the `Support End Date`. It's going to be either the total number of the machine for that releaseid or 0 for the releaseid rows. For the Summary row, it's the total count of all the Unsupported windows 10 for that client. |
| % Supported Machines              | varchar(27)     | Either 100 or 0 for the releaseid row depending upon whether the concerned releaseid is supported till today or not. For the Summary row, it's the percentage of the supported windows 10 out of all the available windows 10 machines. |
| % Unsupported Machines            | varchar(31)     | Either 0 or 100 for the releaseid row depending upon whether the concerned releaseid is supported till today or not. For the Summary row, it's the percentage of the unsupported windows 10 out of all the available windows 10 machines. |
| Build                             | varchar(60)     | Build Number for the concerned releaseid. e.g, 10.0.19044, 10.0.19043. It will Show 'Windows 10' for the Summary Row.                                                                                     |

