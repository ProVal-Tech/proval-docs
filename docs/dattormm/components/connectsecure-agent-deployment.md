---
id: 'aaa6bc03-31ff-44bc-a097-35149dee1c71'
slug: /aaa6bc03-31ff-44bc-a097-35149dee1c71
title: 'Deploy ConnectSecure Agent [Windows]'
title_meta: 'Deploy ConnectSecure Agent [Windows]'
keywords: ['connectsecure', 'windows', 'installer']
description: 'Downloads and deploys the ConnectSecure Vulnerability Scan Agent utilizing Site-level variables for automated authentication.'
tags: ['datto','installation', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-07-08
---

## Overview

The script performs an installation of the ConnectSecure Vulnerability Scan Agent by securely retrieving the latest installer, executing a silent installation, and registering the endpoint using the provided authentication parameters. It then validates the installation to ensure the agent has been successfully deployed.

The implementation is designed for automated deployment, supports secure content delivery through code-signature validation, and helps ensure endpoints are onboarded to the ConnectSecure platform for continuous vulnerability assessment and security monitoring.

## Implementation

1. Download the component `Deploy ConnectSecure Agent [Windows]` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/aaa6bc03-31ff-44bc-a097-35149dee1c71/import.webp) 

4. Create the Site Variables mentioned in the document.

## Site Variables

- Go to `Setup` `>` `Global Settings` `>` `Variables` 
- Create the below global Variable

| Name | Example | Description |
| ---- | ------- | ---------- |
| cpvalConnectSecureCompanyID | `123456` | The unique identifier mapped to the specific company within the ConnectSecure portal. | 
| cpvalConnectSecureTenantID | `1234567890` | The top-level tenant identifier for the ConnectSecure environment.  |
| cpvalConnectSecureUserSecret | `uiohwfnuhfwfwf15fwfg5fereerfrger56545` | The authentication secret/token required to register the agent to the portal.  |

**Note** : To override the global settings, create the variable with same name under  
`Site` > `All Sites` > `Select the site` > `Settings`  > `Variables` > `Add Variable`

> For instructions on obtaining the required IDs for running the script, refer to the *[Instructions section of this article](https://cybercns.atlassian.net/wiki/spaces/CVB/pages/2103410891/How+To+Install+ConnectSecure+Agent#Instructions)*.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| Force | Boolean |`False`| This forces a re-download and re-installation of the agent even if the CyberCnsAgent service is already detected on the endpoint. |

## Sample Run

To execute the `Deploy ConnectSecure Agent [Windows]` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Deploy ConnectSecure Agent [Windows]` on from the Datto RMM.  

2. Click on the `Quick Job` button.   
![Image 2](../../../static/img/docs/aaa6bc03-31ff-44bc-a097-35149dee1c71/quickjob.webp)  

3. Search the component `Deploy ConnectSecure Agent [Windows]`  
 ![Image 3](../../../static/img/docs/aaa6bc03-31ff-44bc-a097-35149dee1c71/find.webp)

4. Click on `Select` and then `Run`  
 ![Image 4](../../../static/img/docs/aaa6bc03-31ff-44bc-a097-35149dee1c71/run.webp)

## Output

- Activity log

## Attachments  

[Deploy ConnectSecure Agent [Windows]](../../../static/attachments/deploy-connectsecure-agent-windows.cpt)

## Changelog
 
### 2026-07-08
 
- Initial version of the document
