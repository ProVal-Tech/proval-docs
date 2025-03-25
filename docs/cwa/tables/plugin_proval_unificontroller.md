---
id: '317fccab-60e6-4af7-8866-1b4d862d973e'
slug: /317fccab-60e6-4af7-8866-1b4d862d973e
title: 'plugin_proval_unificontroller'
title_meta: 'plugin_proval_unificontroller'
keywords: ['unifi', 'data', 'collection', 'update', 'table']
description: 'This document outlines the purpose and dependencies for the EPM - Data Collection solution that updates table data specific to the Unifi Controller. It includes detailed information about the relevant database tables and their structure.'
tags: ['database', 'security', 'update']
draft: false
unlisted: false
---

## Child of Solution

[EPM - Data Collection - Solution - CWA - Update Table Data - UnifiController](<../../solutions/CWA - Update Table Data - UnifiController.md>)  

## Purpose

Holds requested Unifi Controller data specific to the controller only.

## Dependencies

- [EPM - Data Collection - Agnostic - Script - Get-UnifiController](<../../powershell/Get-UnifiController.md>)
- [CWM - Automate - Script - Update Table Data - UnifiController](<../scripts/Update Table Data - UnifiController.md>)

## Tables

### plugin_proval_unificontroller

| Column       | Type   | Explanation                                                                 |
|--------------|--------|-----------------------------------------------------------------------------|
| ControllerID | String | The unique Controller ID from the Unifi Controller.                        |
| ClientID     | Int    | The ID of the client that housed the computer that ran this script.       |
| LocationID   | Int    | The ID of the location that housed the computer that ran this script.     |
| HostName     | String | The name of the computer that ran this script.                            |
| Port         | Int    | The port that the Controller communicates on.                             |
| UserName     | String | The username for the admin user on the Unifi Controller.                 |
| Password     | Blob   | Encrypted admin user password for the user on the Unifi Controller.      |


