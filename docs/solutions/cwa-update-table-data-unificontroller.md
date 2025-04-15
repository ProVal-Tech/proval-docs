---
id: '59fbb11b-df98-46a4-9b97-986b4f8e16f9'
slug: /59fbb11b-df98-46a4-9b97-986b4f8e16f9
title: 'CWA - Update Table Data - UnifiController'
title_meta: 'CWA - Update Table Data - UnifiController'
keywords: ['unifi', 'connectwise', 'data', 'collection', 'automation']
description: 'This document provides a comprehensive guide on how to collect and integrate data from the Unifi controller into the ConnectWise Automate environment, including associated scripts and custom tables for efficient data management.'
tags: ['database', 'installation', 'networking', 'report', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This document provides the requested data from the Unifi controller to the ConnectWise Automate environment.

## Associated Content

| Content                                                                                           | Type            | Function                                                                                      |
|---------------------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Agnostic - Script - Get-UnifiController](/docs/d5d5fe24-6009-48cf-9d51-ac4763a1be7f) | Agnostic Script  | Returns all available data from the Unifi Controller.                                       |
| [CWM - Automate - Script - Update Table Data - UnifiController](/docs/7a09c023-231a-4574-a367-ef8009537e23) | Script          | 1. Executes Agnostic Script  2. Creates Custom Tables  3. Populates those tables with data |
| [CWM - Automate - Custom Table - plugin_proval_unificontroller](/docs/317fccab-60e6-4af7-8866-1b4d862d973e) | Custom Table    | Holds individual controller to Client / Location Data.                                       |
| [CWM - Automate - Custom Table - plugin_proval_unifidevices](/docs/048bcde3-a1b4-45a9-a86c-ba19c0a40933) | Custom Table    | Each controller has devices; this information is stored here.                               |
| [CWM - Automate - Custom Table - plugin_proval_unifiwireless](/docs/e4a1a60d-1e35-4336-a1a3-28e2ffb12855) | Custom Table    | Each site has wireless information; this information is stored here.                        |

## Implementation

To implement this solution, follow these steps. Is there any manual configuration that needs to happen for this solution to succeed?

1. Import the Automate script into the environment.
2. Identify the devices that either host the Unifi controller or target a machine that can access that controller, and run the script.
   - Notes:
     1. Depending on the size of the controller and the number of sites and/or devices that controller has, this script could take a while to complete.
     2. The script is written in a way that the SQL injection statement should never exceed the character limit of the Automate platform; the script should loop through until all requested information is uploaded to the table.

## FAQ

*(This section can be filled with frequently asked questions related to the implementation or usage of the solution.)*


