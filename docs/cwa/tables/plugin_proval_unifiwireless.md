---
id: 'e4a1a60d-1e35-4336-a1a3-28e2ffb12855'
title: 'plugin_proval_unifiwireless'
title_meta: 'plugin_proval_unifiwireless'
keywords: ['network', 'controller', 'data', 'unifi', 'site', 'security', 'wireless', 'passphrase']
description: 'This document outlines the structure and purpose of the Child of Solution, which holds network data for each Unifi Controller. It includes essential dependencies and a detailed table of the data fields associated with the Unifi wireless networks.'
tags: ['database', 'security', 'unifi', 'wireless']
draft: false
unlisted: false
---

## Child of Solution

[EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](<../../solutions/CWA - Update Table Data - UnifiController.md>)  

## Purpose

This document holds network data for each controller listed in [EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](<../../solutions/CWA - Update Table Data - UnifiController.md>).

## Dependencies

- [EPM - Data Collection - Agnostic - Script - Get-UnifiController](<../../powershell/Get-UnifiController.md>)
- [CWM - Automate - Script - Update Table Data - UnifiController](<../scripts/Update Table Data - UnifiController.md>)

## Tables

#### plugin_proval_unifiwireless

| Column        | Type   | Explanation                                                                                         |
|---------------|--------|-----------------------------------------------------------------------------------------------------|
| ControllerID  | String | The unique Controller ID from the Unifi Controller that holds this network.                        |
| SiteName      | String | The name of the site from the Unifi Controller that holds this network.                            |
| SiteDesc      | String | The site description from the Unifi Controller that holds this network.                            |
| Name          | String | The name of the broadcasted network as it appears in the Unifi Controller.                         |
| Passphrase    | Blob   | The encrypted passphrase that allows access to the network.                                        |
| Enabled       | String | True if the network is enabled; otherwise, false.                                                  |
| IsGuest       | String | True if the network is a guest network; otherwise, false.                                          |
| Security      | String | The security platform being used by the network.                                                  |
| WPAMode       | String | The WPA mode being used by the network.                                                            |



