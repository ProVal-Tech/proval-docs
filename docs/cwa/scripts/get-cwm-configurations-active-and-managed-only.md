---
id: '0b46811b-be88-407b-aa61-6c63a73ff848'
slug: /0b46811b-be88-407b-aa61-6c63a73ff848
title: 'Get CWM Configurations - Active And Managed Only'
title_meta: 'Get CWM Configurations - Active And Managed Only'
keywords: ['connectwise', 'configurations', 'database', 'custom', 'table', 'dataview', 'sql', 'api']
description: 'This document outlines a script that retrieves basic information from ConnectWise Manage configurations and stores it in a custom database table. It also details the necessary variables, global parameters, and provides links for creating API keys and obtaining client IDs.'
tags: ['connectwise', 'database', 'report', 'sql']
draft: false
unlisted: false
---

## Summary

The script fetches basic information from ConnectWise Manage configurations and stores it in a custom table [CWM - Automate - Custom Table - pvl_cwm_configurations](/docs/eb24c920-fd51-4441-962b-520c48e9128e), which is further displayed by the [CWM - Automate - Dataview - Asset Report - Purchase and Expiration Date](/docs/931fbe83-9616-4ae2-b7ae-128538a5fa73) dataview.

## Sample Run

![Sample Run](../../../static/img/docs/0b46811b-be88-407b-aa61-6c63a73ff848/image_1.webp)

## Sub-Script

[CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)

## Variables

| Name                | Description                                                                                      |
|---------------------|--------------------------------------------------------------------------------------------------|
| ProjectName         | Get-CWMConfiguration                                                                             |
| WorkingDirectory     | C:/ProgramData/_automation/Script/Get-CWMConfiguration                                          |
| JsonFileName        | Get-CWMConfiguration.Json                                                                        |
| TableName           | [pvl_cwm_configurations](/docs/eb24c920-fd51-4441-962b-520c48e9128e)                               |
| SQLDeleteStatement   | Stores SQL query to remove stale data from [pvl_cwm_configurations](/docs/eb24c920-fd51-4441-962b-520c48e9128e) table |
| SQLStartStatement    | Stores SQL query to input new data into [pvl_cwm_configurations](/docs/eb24c920-fd51-4441-962b-520c48e9128e) table |

#### Global Parameters

| Name          | Example                                         | Required | Description                                                                                      |
|---------------|-------------------------------------------------|----------|--------------------------------------------------------------------------------------------------|
| serverurl     | [stage.cwmanage.com](http://stage.cwmanage.com) | True     | ConnectWise Manage Instance URL without http or https.                                          |
| CompanyID     | CWManage                                       | True     | CompanyID used to access the CW Manage instance. ![CompanyID](../../../static/img/docs/0b46811b-be88-407b-aa61-6c63a73ff848/image_2.webp) |
| PublicKey     | abC1dEFg23HIjk45L                             | True     | Public API Key                                                                                   |
| PrivateKey    | L54kjIH32gFEd1ae87                            | True     | Private API Key                                                                                  |
| CWMClientid   | 97e76471-52b5-43c9-a5ec-0153ec905881         | True     | ClientID provided by ConnectWise for API development                                             |

How to create API Keys: [How to Create API Keys](https://connectwise20.my.site.com/serviceandsupport/s/article/How-to-Create-API-Keys)

How to get clientID: [Request to get a Client ID](https://connectwise20.my.site.com/serviceandsupport/s/article/Request-to-get-a-Client-ID)

## Output

- Script Log
- Custom Table
- Dataview