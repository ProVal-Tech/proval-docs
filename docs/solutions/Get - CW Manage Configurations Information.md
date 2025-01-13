---
id: 'cwa-fetch-cwm-info'
title: 'Fetch Basic Information from CW Manage'
title_meta: 'Fetch Basic Information from CW Manage'
keywords: ['fetch', 'cwm', 'info', 'dataview', 'automate']
description: 'This document outlines the solution to fetch basic information about the computer from CW Manage and display it in a CW Automate dataview. It includes implementation steps and associated content for successful execution.'
tags: ['configuration', 'report', 'software', 'setup']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to fetch basic information about the computer from CW Manage and display it in a CW Automate dataview.

## Associated Content

| Content                                                                                                                                         | Type         | Function            |
|-------------------------------------------------------------------------------------------------------------------------------------------------|--------------|---------------------|
| [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](https://proval.itglue.com/DOC-5078775-13403824)                  | Script       | Fetches the data.   |
| [CWM - Automate - Custom Table - pvl_cwm_configurations](https://proval.itglue.com/DOC-5078775-13403881)                                   | Custom Table | Stores the data.    |
| [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](https://proval.itglue.com/DOC-5078775-13403823)                    | Dataview     | Displays the data.   |

## Implementation

- Read the solution-related documents carefully.
- Import the [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](https://proval.itglue.com/DOC-5078775-13403824) script.
- Import the [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](https://proval.itglue.com/DOC-5078775-13403823) dataview.
- Set the relevant values to the script's global variables. Refer to the script's document for more information.
- Run the script against the Automate server or an online server in the partner's internal environment.
- Schedule the script to run once per day/week against the Automate server or an online server in the partner's internal environment to keep the dataview up-to-date.



