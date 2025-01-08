---
id: 'cwa-child-of-solution'
title: 'Child of Solution'
title_meta: 'Child of Solution - Data Collection for Unifi Controller'
keywords: ['network', 'controller', 'data', 'unifi', 'site', 'security', 'wireless', 'passphrase']
description: 'This document outlines the structure and purpose of the Child of Solution, which holds network data for each Unifi Controller. It includes essential dependencies and a detailed table of the data fields associated with the Unifi wireless networks.'
tags: ['network', 'unifi', 'wireless', 'database', 'configuration', 'security']
draft: false
unlisted: false
---
## Child of Solution

[EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](https://proval.itglue.com/DOC-5078775-9913178)  

## Purpose

Holds network data for each controller listed in [EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](https://proval.itglue.com/DOC-5078775-9913178)

## Dependencies

- [EPM - Data Collection - Agnostic - Script - Get-UnifiController](https://proval.itglue.com/DOC-5078775-7291568)
- [CWM - Automate - Script - Update Table Data - UnifiController](https://proval.itglue.com/DOC-5078775-10243077)

## Tables

#### plugin_proval_unifiwireless

| Column        | Type   | Explanation                                                                                         |
|---------------|--------|-----------------------------------------------------------------------------------------------------|
| ControllerID  | String | The Unique Controller Id from the Unifi Controller that holds this Network.                        |
| SiteName      | String | The name of the Site from the Unifi Controller that holds this Network.                            |
| SiteDesc      | String | The site description from the Unifi Controller that holds this Network.                            |
| Name          | String | The Name of the broadcasted Network as it appears in the Unifi Controller.                         |
| Passphrase    | Blob   | The encrypted passphrase that allows access to the Network.                                        |
| Enabled       | String | True if the network is enabled, otherwise false.                                                  |
| IsGuest       | String | True if the network is a guest network, otherwise false.                                          |
| Security      | String | The security platform being used by the network.                                                  |
| WPAMode       | String | The WPA mode being used by the network.                                                            |

