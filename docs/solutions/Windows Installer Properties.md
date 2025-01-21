---
id: '9342283f-7ca1-4df1-85cd-3c3563e7b67e'
title: 'Windows Installer Properties Overview'
title_meta: 'Windows Installer Properties Overview'
keywords: ['applications', 'software', 'dataview', 'properties', 'installation']
description: 'This document provides a comprehensive overview of a solution designed to display information about applications installed on a machine, including their name, version number, and installation date. It describes the functionality of the script that gathers this information, how it is stored in a custom SQL table, and how users can access it through a dataview for effective management and monitoring of installed software.'
tags: ['database', 'report', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution is designed to display a specific set of information about the applications installed on a machine. It aims to help users quickly and easily identify what software is installed on their computer. The displayed information includes the name of the application, the version number, and the date the application was installed. This information is presented in a clear and easy-to-read format, making it simple for users to identify the software installed on their machine.

The "CWM - Automate - Script - Windows Installer Properties [DV]" script is a tool that gathers a set of properties for the applications installed on a machine. The gathered information includes properties such as the product name, version, installation date, and more. The script is designed to collect information only for the applications listed in the `software` table.

The gathered information is stored in a custom SQL table named "pvl_win_installer_properties." Users can review the gathered information in the "Windows Installer Properties [Script]" dataview, which presents the information in a tabular format.

It is important to note that the information presented in the dataview is directly fetched from the machine. If there is no data available for a particular property, the corresponding cell in the dataview will be blank. This indicates that the data is not present on the machine itself.

Overall, these tools provide a comprehensive solution for managing and monitoring the applications installed on a machine. Users can easily access the gathered information in the "Windows Installer Properties [Script]" dataview, and the data is conveniently stored in the "pvl_win_installer_properties" table for future reference. The inclusion of the note regarding blank cells ensures that users understand the limitations of the data presented and can interpret it correctly.

## Associated Content

| Content                                                                                                 | Type         | Function                                                |
|---------------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------|
| [CWM - Automate - Script - Windows Installer Properties [DV]](<../cwa/scripts/Windows Installer Properties DV.md>) | Script       | Obtains the data from the machine and stores it in a custom table. |
| [CWM - Automate - Custom Table - pvl_win_installer_properties](<../cwa/tables/pvl_win_installer_properties.md>) | Custom Table | Stores the data gathered by the script.                |
| [CWM - Automate - Dataview - Windows Installer Properties [Script]](<../cwa/dataviews/Windows Installer Properties Script.md>) | Dataview     | Displays the results of the script.                    |

## Implementation

- Import the script [CWM - Automate - Script - Windows Installer Properties [DV]](<../cwa/scripts/Windows Installer Properties DV.md>).
- Import the dataview [CWM - Automate - Dataview - Windows Installer Properties [Script]](<../cwa/dataviews/Windows Installer Properties Script.md>).
- Debug the script against an online Windows machine to create the table.
- Check the dataview for the data.
- Schedule the script against the group of concerned machines to keep the dataview up-to-date.

