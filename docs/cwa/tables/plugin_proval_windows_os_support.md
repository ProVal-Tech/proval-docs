---
id: '938cd822-f6a3-4ee3-add2-62b407e45622'
slug: /938cd822-f6a3-4ee3-add2-62b407e45622
title: 'plugin_proval_windows_os_support'
title_meta: 'plugin_proval_windows_os_support'
keywords: ['windows', 'support', 'end', 'dates', 'build', 'version']
description: 'This document provides a detailed table of Windows operating systems, including their support end dates, build numbers, and release information. It serves as a reference for users looking to understand the lifecycle of various Windows versions and how to manage updates and support effectively.'
tags: ['database', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This table is a manually updated resource that displays Windows operating systems' support end dates, build numbers, and their respective release information.

References:
- [Microsoft Windows | endoflife.date](https://endoflife.date/windows)
- [Windows 10 version history - Wikipedia](https://en.wikipedia.org/wiki/Windows_10_version_history)
- [Windows 11 version history - Wikipedia](https://en.wikipedia.org/wiki/Windows_11_version_history)
- [Microsoft Windows Server | endoflife.date](https://endoflife.date/windows-server)

## Dependencies

[CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>)

## Table

#### plugin_proval_windows_os_support

| Column                     | Type    | Explanation                                                                 |
|---------------------------|---------|-----------------------------------------------------------------------------|
| BaseOS                    | varchar | The name of the operating system                                            |
| ReleaseID                 | varchar | The Windows 10 Build number/name associated with the Build column          |
| Build                     | varchar | The version of Windows associated with the ReleaseID column                |
| ReleaseDate               | date    | The date the version was released                                          |
| SupportMainstreamEnd      | date    | The date the version will no longer be supported for Mainstream devices    |
| SupportEnterpriseEnd       | date    | The date the version will no longer be supported for Enterprise devices     |
| SupportLTSBEnd           | date    | The date the version will no longer be supported for LTSB devices.         |

## FAQ

**Q:** I need to add more versions to this list. How do I do that?  
**A:** Open the [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>) script and modify line 1 to add the new item.

## For CW RMM

**THE PROVIDED STEPS MUST ONLY BE FOLLOWED AFTER ADDING A NEW ENTRY IN AUTOMATE'S CUSTOM TABLE.**  
**READ THE PROVIDED STEPS BEFORE MAKING ANY CHANGES OR STARTING EDITING.**  
**DO NOT PROCEED WITH THE EDITING IF YOU HAVE ANY DOUBTS ABOUT ANY OF THE PROVIDED STEPS.**

We cannot create a custom table or store this data in a tabular form in CW RMM. To overcome this limitation, we are using a public ITGlue article to store this data and a PowerShell script to compare the Support End Dates.

Please follow these instructions carefully to update the information stored in this article for CW RMM: [CW RMM - Custom Table - Windows OS Support Date](https://proval.itglue.com/DOC-5078775-15739309)

1. Open the article in a new tab.  
   Here is a screenshot of the currently stored data in the article:  
   ![](../../../static/img/plugin_proval_windows_os_support/image_1.png)  
   ![](../../../static/img/plugin_proval_windows_os_support/image_2.png)  
   The document contains further information. These screenshots are attached to explain that the data stored in the article are in two different forms: `Table` and `JSON`.

2. Click the `Edit` button.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_3.png)  

3. Click `Edit` to start editing the document.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_4.png)  

4. Connect to our internal database from a `Heidi SQL` client and execute this SQL query.  
   ```sql
   SELECT * FROM plugin_proval_windows_os_support
   ```  
   ![](../../../static/img/plugin_proval_windows_os_support/image_5.png)  

5. Press `Ctrl + A` in the result section to select all rows.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_6.png)  

6. Right-click anywhere in the selected section.  
   - Hover your cursor over the `Copy As` option and click on the `HTML table` option.  
   This will give you the data to store in the `Table` section of the document.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_7.png)  

7. Remove the tabular data from the ITGlue document.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_8.png)  

8. Paste the `HTML Table` data in the blank section that was copied in `Step 6`.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_9.png)  

9. Remove the `generated by HeidiSQL` comment from the bottom of the table.  
   Before Removal:  
   ![](../../../static/img/plugin_proval_windows_os_support/image_10.png)  
   After Removal:  
   ![](../../../static/img/plugin_proval_windows_os_support/image_11.png)  

10. Now we will update the `JSON` section of the document in the same way.  

11. Go back to `Heidi SQL`.  

12. Copy the data as `JSON`.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_12.png)  

13. Remove everything stored in the `JSON` section of the document.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_13.png)  

14. Paste the `JSON` data in the blank section that was copied in `Step 12`.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_14.png)  

15. Scroll to the bottom of the document.  

16. Click anywhere in the `JSON` section.  

17. Press `Ctrl + A` on your keyboard to select the stored `JSON` content.  

18. The formatting option will appear at the bottom left.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_15.png)  

19. Select the `Code` option from the formatting dropdown menu.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_16.png)  

20. Scroll to the top of the document and click the `Publish` button to save the changes.  
   ![](../../../static/img/plugin_proval_windows_os_support/image_17.png)  



## Table data

| BaseOS                     | ReleaseID               | Build              | ReleaseDate | SupportMainstreamEnd | SupportEnterpriseEnd | SupportLTSBEnd |
|----------------------------|-------------------------|--------------------|-------------|----------------------|----------------------|----------------|
| Windows Server 2003        |                         |                    | 2003-04-24  | 2010-07-13           | 2015-07-14           | 0000-00-00     |
| Windows Server 2008        |                         |                    | 2008-02-27  | 2015-01-13           | 2020-01-14           | 0000-00-00     |
| Windows Server 2008 R2     | 6.1.7601 Service Pack 1 |                    | 2009-04-29  | 2015-01-13           | 2020-01-14           | 0000-00-00     |
| Windows Server 2012        | 6.2.9200                |                    | 2012-09-04  | 2018-10-09           | 2023-10-10           | 0000-00-00     |
| Windows Server 2012 R2     | 6.3.9600                |                    | 2013-11-25  | 2018-10-09           | 2023-10-10           | 0000-00-00     |
| Windows Server 2016        | 10.0.14393              |                    | 2016-10-12  | 2022-01-11           | 2027-01-12           | 2027-01-12     |
| Windows Server 2019        | 10.0.17763              |                    | 2018-11-13  | 2024-01-09           | 2029-01-09           | 2029-01-09     |
| Windows Server 2022        | 10.0.20348              |                    | 2021-08-18  | 2026-10-13           | 2031-10-14           | 0000-00-00     |
| Windows Server 2025        | 10.0.26100              |                    | 2024-11-01  | 2029-10-09           | 2034-10-10           | 0000-00-00     |
| Windows Storage Server 2016| 10.0.14393              |                    | 2016-10-12  | 2022-01-11           | 2027-01-12           | 2027-01-12     |
| Windows XP                 |                         |                    | 2001-08-24  | 2009-04-14           | 2014-04-08           | 0000-00-00     |
| Windows Vista              |                         |                    | 2006-11-08  | 2012-04-10           | 2017-04-11           | 0000-00-00     |
| Windows 7                  | 6.1.7601 Service Pack 1 |                    | 2009-07-22  | 2015-01-13           | 2020-01-14           | 0000-00-00     |
| Windows 8                  | 6.2.9200                |                    | 2012-08-01  | 2016-01-12           | 2016-01-12           | 0000-00-00     |
| Windows 8.1                | 6.3.9600                |                    | 2013-08-27  | 2018-01-09           | 2023-01-10           | 0000-00-00     |
| Windows 10                 | 1507                    | 10.0.10240         | 2015-07-29  | 2017-05-09           | 2017-05-09           | 2025-10-14     |
| Windows 10                 | 1511                    | 10.0.10586         | 2015-11-10  | 2017-10-10           | 2017-10-10           | 0000-00-00     |
| Windows 10                 | 1607                    | 10.0.14393         | 2016-08-02  | 2018-04-10           | 2019-04-09           | 2026-10-13     |
| Windows 10                 | 1703                    | 10.0.15063         | 2017-04-05  | 2018-10-09           | 2019-10-08           | 0000-00-00     |
| Windows 10                 | 1709                    | 10.0.16299         | 2017-10-17  | 2019-04-09           | 2020-10-13           | 0000-00-00     |
| Windows 10                 | 1803                    | 10.0.17134         | 2018-04-30  | 2019-11-12           | 2021-05-11           | 0000-00-00     |
| Windows 10                 | 1809                    | 10.0.17763         | 2018-11-13  | 2020-11-10           | 2020-11-10           | 2029-01-09     |
| Windows 10                 | 1903                    | 10.0.18362         | 2019-05-21  | 2020-12-08           | 2020-12-08           | 0000-00-00     |
| Windows 10                 | 1909                    | 10.0.18363         | 2019-11-12  | 2021-05-11           | 2022-05-10           | 0000-00-00     |
| Windows 10                 | 20H1                    | 10.0.19041         | 2020-05-27  | 2021-12-14           | 2021-12-14           | 0000-00-00     |
| Windows 10                 | 20H2                    | 10.0.19042         | 2020-10-27  | 2022-05-10           | 2023-05-09           | 0000-00-00     |
| Windows 10                 | 21H1                    | 10.0.19043         | 2021-05-18  | 2022-12-13           | 2022-12-13           | 0000-00-00     |
| Windows 10                 | 21H2                    | 10.0.19044         | 2021-11-16  | 2023-06-13           | 2024-06-11           | 2027-01-12     |
| Windows 10                 | 22H2                    | 10.0.19045         | 2022-10-18  | 2025-10-14           | 2025-10-14           | 0000-00-00     |
| Windows 11                 | 21H2                    | 10.0.22000         | 2021-10-04  | 2023-10-10           | 2024-10-08           | 0000-00-00     |
| Windows 11                 | 22H2                    | 10.0.22621         | 2022-09-20  | 2024-10-08           | 2025-10-14           | 0000-00-00     |
| Windows 11                 | 23H2                    | 10.0.22631         | 2023-10-31  | 2025-11-11           | 2026-11-10           | 0000-00-00     |
| Windows 11                 | 24H2                    | 10.0.26100         | 2024-10-01  | 2026-10-13           | 2027-10-12           | 2029-10-09     |