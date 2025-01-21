---
id: '07374a48-b25b-47d0-884c-14306a91d0bb'
title: 'Fetch Basic Information from CW Manage'
title_meta: 'Fetch Basic Information from CW Manage'
keywords: ['fetch', 'cwm', 'info', 'dataview', 'automate']
description: 'This document outlines the solution to fetch basic information about the computer from CW Manage and display it in a CW Automate dataview. It includes implementation steps and associated content for successful execution.'
tags: ['report', 'setup', 'software']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to fetch basic information about the computer from CW Manage and display it in a CW Automate dataview.

## Associated Content

| Content                                                                                                                                         | Type         | Function            |
|-------------------------------------------------------------------------------------------------------------------------------------------------|--------------|---------------------|
| [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](<../cwa/scripts/Get CWM Configurations - Active And Managed Only.md>) | Script       | Fetches the data.   |
| [CWM - Automate - Custom Table - pvl_cwm_configurations](<../cwa/tables/pvl_cwm_configurations.md>)                                        | Custom Table | Stores the data.    |
| [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](<../cwa/dataviews/Asset Report - Purchase and Expiration Date.md>)  | Dataview     | Displays the data.   |

## Implementation

- Read the solution-related documents carefully.
- Import the [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](<../cwa/scripts/Get CWM Configurations - Active And Managed Only.md>) script.
- Import the [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](<../cwa/dataviews/Asset Report - Purchase and Expiration Date.md>) dataview.
- Set the relevant values to the script's global variables. Refer to the script's document for more information.
- Run the script against the Automate server or an online server in the partner's internal environment.
- Schedule the script to run once per day/week against the Automate server or an online server in the partner's internal environment to keep the dataview up-to-date.

