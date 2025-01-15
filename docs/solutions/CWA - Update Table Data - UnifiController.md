---
id: '59fbb11b-df98-46a4-9b97-986b4f8e16f9'
title: 'Unifi Data Collection for ConnectWise Automate'
title_meta: 'Unifi Data Collection for ConnectWise Automate'
keywords: ['unifi', 'connectwise', 'data', 'collection', 'automation']
description: 'This document provides a comprehensive guide on how to collect and integrate data from the Unifi controller into the ConnectWise Automate environment, including associated scripts and custom tables for efficient data management.'
tags: ['configuration', 'database', 'installation', 'networking', 'report', 'software', 'update', 'windows']
draft: false
unlisted: false
---
## Purpose

Provides requested data from the Unifi controller to the Connectwise Automate environment.

## Associated Content

| Content                                                                                           | Type            | Function                                                                                      |
|---------------------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Agnostic - Script - Get-UnifiController](https://proval.itglue.com/DOC-5078775-7291568) | Agnostic Script  | Returns all available data from the Unifi Controller.                                       |
| [CWM - Automate - Script - Update Table Data - UnifiController](https://proval.itglue.com/DOC-5078775-10243077) | Script          | 1. Executes Agnostic Script<br>2. Creates Custom Tables<br>3. Populates those tables with data |
| [CWM - Automate - Custom Table - plugin_proval_unificontroller](https://proval.itglue.com/DOC-5078775-10536773) | Custom Table    | Holds individual controller to Client / Location Data.                                       |
| [CWM - Automate - Custom Table - plugin_proval_unifidevices](https://proval.itglue.com/DOC-5078775-10536775) | Custom Table    | Each controller has devices, this information is stored here.                               |
| [CWM - Automate - Custom Table - plugin_proval_unifiwireless](https://proval.itglue.com/DOC-5078775-10536774) | Custom Table    | Each Site has wireless information, this information is stored here.                        |

## Implementation

Write how to implement this solution. Is there any manual configuration that needs to happen for this solution to succeed?

1. Import the Automate script into the environment.
2. Find the devices that either host the unifi controller or target a machine that can access that controller, and run the script.
   - Notes:
     1. Depending on the size of the controller and how many sites and/or devices that controller has, this script could take a while to complete.
     2. The script is written in a way to where the SQL injection statement should never exceed the character limit of the Automate platform; the script should loop through until all requested information is uploaded to the table.

## FAQ








