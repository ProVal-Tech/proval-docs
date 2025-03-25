---
id: 'bfe883fc-125c-44fc-b2d6-beb27efefd8a'
slug: /bfe883fc-125c-44fc-b2d6-beb27efefd8a
title: 'Windows Patching - Quick Audit (Reference Table)'
title_meta: 'Windows Patching - Quick Audit (Reference Table)'
keywords: ['patching', 'windows', 'audit', 'dataview', 'troubleshooting']
description: 'This document provides a detailed overview of a dataview that displays essential patching-related information for all Windows machines in the environment, aiding in troubleshooting patching issues. It includes dependencies, column descriptions, and FAQs for better understanding and usage.'
tags: ['database', 'patching', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays basic patching-related information for all the Windows machines present in the environment. This can be helpful while troubleshooting patching-related issues.  

Sample Screenshot:  
![Sample Screenshot](../../../static/img/Windows-Patching---Quick-Audit-(Reference-Table)/image_1.png)  

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)  
**The updated version of this table must be imported to get better results from the dataview.**  

## Columns

| Column                        | Description                                                         |
|-------------------------------|---------------------------------------------------------------------|
| Client Name                   | Client Name                                                         |
| Location Name                 | Location Name                                                       |
| Computer Name                 | Computer Name                                                       |
| Operating System              | Operating System                                                    |
| Build                         | OS Build or Version                                                |
| Is Patch Policy Applied       | 'Yes' if a managed patching policy is applied, else 'No'          |
| Current Update Policy         | Name of the Effective Microsoft Update Policy                       |
| Reboot Policy                 | Name of the Effective Reboot Policy                                 |
| Is DayTime Patching Enabled   | 'Yes' if DayTime Patching is enabled, else 'No'                   |
| patchingdate                  | Last Install Date for Cumulative or Security Updates                |
| patchingtitle                 | Last Cumulative or Security Updates installed.                      |
| DaysSinceLastPatch            | Days Since Last Patch                                              |
| Supported Till                | Support End Date for the Computer, depends on the OS and Build Number |
| Is EOL                        | 'Yes' if the computer is End Of Life, else 'No'                    |
| Last Contact                  | Last Contact With RMM                                              |
| Days Since Last Contact       | Days Since Last Contact With RMM                                   |

## SQL Representation

## FAQs

**Q: Applying the filter is taking forever?**  
**A:** This is likely because the dataview is complex and processing a large amount of data. There is no better way to overcome this; however, the [CWM - Automate - Script - Dataview - Email as CSV [Param]](<../scripts/Dataview - Email as CSV Param.md>) script can be used to email the dataview and apply the filters in the CSV rather than in the dataview.  

**Step 1:** Find the ID of the `Windows Patching - Quick Audit (Reference Table)` dataview.  
![Step 1](../../../static/img/Windows-Patching---Quick-Audit-(Reference-Table)/image_2.png)  

**Step 2:** Run the [CWM - Automate - Script - Dataview - Email as CSV [Param]](<../scripts/Dataview - Email as CSV Param.md>) script against any online Windows machine with the correct parameters.  
![Step 2](../../../static/img/Windows-Patching---Quick-Audit-(Reference-Table)/image_3.png)  

Once you receive the CSV in your email, you can easily apply the required filters.


