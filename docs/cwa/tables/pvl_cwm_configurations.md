---
id: 'cwa-get-cwm-configurations'
title: 'Get CWM Configurations - Active And Managed Only'
title_meta: 'Get CWM Configurations - Active And Managed Only'
keywords: ['cwm', 'configurations', 'managed', 'active', 'data', 'collection']
description: 'This document outlines the purpose and structure of the data stored by the Get CWM Configurations script, which gathers information on active and managed configurations from ConnectWise Manage. It includes details on dependencies and the schema of the data collected.'
tags: ['database', 'configuration', 'report', 'windows', 'software']
draft: false
unlisted: false
---
## Purpose

Stores the data gathered by [CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](https://proval.itglue.com/DOC-5078775-13403824) script.

## Dependencies

[CWM - Automate - Script - Get CWM Configurations - Active And Managed Only](https://proval.itglue.com/DOC-5078775-13403824)

#### pvl_cwm_configurations

| Column             | Type     | Explanation                                                                                   |
|--------------------|----------|-----------------------------------------------------------------------------------------------|
| ConfigurationID    | int      | ID of Computer/Configuration returned from CW Manage.                                        |
| ConfigurationName  | varchar  | Name of the Computer/Configuration returned from CW Manage.                                  |
| CompanyID          | int      | ID of the Company/Client returned from CW Manage.                                            |
| CompanyName        | varchar  | Name of the Company/Client returned from CW Manage.                                          |
| ModelNumber        | varchar  | Model of the Computer/Configuration returned from CW Manage.                                 |
| PurchaseDate       | datetime | Purchase Date of the Computer/Configuration returned from CW Manage.                         |
| ExpirationDate     | datetime | Warranty Expiration Date of the Computer/Configuration returned from CW Manage.              |
| ScriptRunTime      | datetime | Data Collection Time.                                                                         |



