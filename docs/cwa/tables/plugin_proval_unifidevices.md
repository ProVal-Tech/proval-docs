---
id: '048bcde3-a1b4-45a9-a86c-ba19c0a40933'
title: 'EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController'
title_meta: 'EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController'
keywords: ['data', 'collection', 'unifi', 'controller', 'table', 'update']
description: 'This document outlines the structure and purpose of the EPM Data Collection for the UnifiController, detailing the dependencies and table schema used for holding device data associated with each controller.'
tags: ['database', 'networking', 'software', 'update']
draft: false
unlisted: false
---

## Child of Solution

[EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](<../../solutions/CWA - Update Table Data - UnifiController.md>)  

## Purpose

Holds device data for each controller listed in [EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](<../../solutions/CWA - Update Table Data - UnifiController.md>).

## Dependencies

- [EPM - Data Collection - Agnostic - Script - Get-UnifiController](<../../powershell/Get-UnifiController.md>)
- [CWM - Automate - Script - Update Table Data - UnifiController](<../scripts/Update Table Data - UnifiController.md>)

## Tables

### plugin_proval_unifidevices

| Column        | Type   | Explanation                                                                                  |
|---------------|--------|----------------------------------------------------------------------------------------------|
| ControllerID  | String | The unique ControllerID of the Unifi Controller that holds this device.                    |
| SiteName      | String | The name of the site that the device belongs to in the Unifi Controller.                    |
| SiteDesc      | String | At times, the SiteName may display a value different from the description you provided in the controller; this should clarify the site. |
| Mad           | String | The MAC address of the device.                                                               |
| State         | Int    | The state of the device.                                                                     |
| Adopted       | String | True if adopted, false if not.                                                              |
| Disabled      | String | True if disabled, false if not.                                                              |
| Model         | String | The model of the device.                                                                     |
| Type          | String | The type of Unifi device.                                                                    |
