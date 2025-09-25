---
id: '5e0d8f5a-0a7c-4b71-879c-f24d616af32e'
slug: /5e0d8f5a-0a7c-4b71-879c-f24d616af32e
title: 'CW RMM Agent Deployment [MAC]'
title_meta: 'CW RMM Agent Deployment [MAC]'
keywords: ['cw-rmm', 'rmm-agent', 'migration', 'cw-rmm-agent', 'mac']
description: 'This script deploys ConnectWise Asio Platform agents to mac endpoints'
tags:  ['installation', 'application']
draft: false
unlisted: false
---

## Overview

This script deploys ConnectWise Asio Platform agents to the Datto RMM MAC endpoints.

## Implementation  

1. Download the component [CW RMM Agent Deployment](../../../static/attachments/cw-rmm-agent-deployment-mac.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on, from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `CW RMM Agent Deployment [MAC]` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Click `Run` to initiate the component
 ![Imag 4](../../../static/img/docs/5e0d8f5a-0a7c-4b71-879c-f24d616af32e/image3.webp)

## Global Settings

- Go to `Setup` > `Global Settings` > `Variables`  
- Create the below global Variable

| Name | Value | Description |
| ---- | ------- | ----------- |
| cPvalCwRmmSiteKey | `71918cbc-981e-465d-9cb4-627e2883a10b` | CW RMM Agent token. |

 ![Globalsettings](../../../static/img/docs/423c69f5-36ce-4f69-87be-974b05101812/image1.webp)

**Note** : To override the global settings, create the variable with same name under  
`Site` > `All Sites` > `Select the site` > `Settings`  > `Variables` > `Add Variable`

 ![Globalsettings](../../../static/img/docs/423c69f5-36ce-4f69-87be-974b05101812/image2.webp)

## Output

- stdOut  
- stdError  

## Attachments

[CW RMM Agent Deployment [MAC]](../../../static/attachments/cw-rmm-agent-deployment-mac.cpt)
