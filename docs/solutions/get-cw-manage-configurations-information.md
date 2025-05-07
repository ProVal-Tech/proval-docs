---
id: '07374a48-b25b-47d0-884c-14306a91d0bb'
slug: /07374a48-b25b-47d0-884c-14306a91d0bb
title: 'Get - CW Manage Configurations Information'
title_meta: 'Get - CW Manage Configurations Information'
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
| [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](/docs/0b46811b-be88-407b-aa61-6c63a73ff848) | Script       | Fetches the data.   |
| [CWM - Automate - Custom Table - pvl_cwm_configurations](/docs/eb24c920-fd51-4441-962b-520c48e9128e)                                        | Custom Table | Stores the data.    |
| [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](/docs/931fbe83-9616-4ae2-b7ae-128538a5fa73)  | Dataview     | Displays the data.   |

## Implementation

- Read the solution-related documents carefully.
- Import the [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](/docs/0b46811b-be88-407b-aa61-6c63a73ff848) script.
- Import the [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](/docs/931fbe83-9616-4ae2-b7ae-128538a5fa73) dataview.
- Set the relevant values to the script's global variables. Refer to the script's document for more information.
- Run the script against the Automate server or an online server in the partner's internal environment.
- Schedule the script to run once per day/week against the Automate server or an online server in the partner's internal environment to keep the dataview up-to-date.
