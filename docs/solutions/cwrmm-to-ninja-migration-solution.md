---
id: 'b388aa6a-3e60-482c-9a13-ce6425c55dd3'
slug: /b388aa6a-3e60-482c-9a13-ce6425c55dd3
title: 'CW RMM to Ninja Migration Solution'
title_meta: 'CW RMM to Ninja Migration Solution'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Windows', 'Agent', 'Install']
description: 'This solution is built to perform the CW RMM to Ninja migration.'
tags: ['macos', 'windows', 'installation', 'deployment', 'application', 'connectwise']
draft: false
unlisted: false
---

## Purpose

This solution is built to perform the CW RMM to Ninja migration.

## Associated Content

| Content                        | Type         | Function                                                                                                                                            |
|--------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| [NinjaRMM Deployment - [Windows]](/docs/905f38b9-492e-43d8-b687-7b4df48c3b97)| Task         | This script deploys the NinjaRMMAgent to Windows-supported OS, based on the article provided below: https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization. It depends on the Authorization token, which will be kept in the company or site custom fields. |
| [NinjaRMM Deployment - [MAC]](/docs/2893ba48-9686-424e-ba32-0c799c38f9fd)    | Task         | This script deploys the NinjaRMMAgent to MAC OS, based on the article provided below: https://ninjarmm.zendesk.com/hc/en-us/articles/27524794230669-NinjaOne-Agent-Installation-Agent-Tokenization. It depends on the Authorization token, which will be kept in the company or site custom fields. |
| [CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae) | Custom field | This document contains the custom fields that are used in the CW RMM to Ninja migration.                                                             |
| [Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0)           | Dynamic Group| This group contains the endpoints where the Ninja RMM deployment is enabled, the software "NinjaRMMAgent" is missing, and the custom field "Ninja Deployment Result" is blank. |
| [Ninja Deployment Success](/docs/4185cf9b-b76e-42b9-8559-08940c343e7d)       | Dynamic Group| This group contains the endpoint where the Ninja Deployment succeeded.                                                                               |
| [Ninja Deployment Failure](/docs/9718a5fd-535b-4faf-abe9-86d55f37e620)       | Dynamic Group| This group contains the endpoint where the Ninja deployment failed.                                                                                  |

## Implementation

- Create the [CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae)
- Create the [Task - NinjaRMM Deployment - [Windows]](/docs/905f38b9-492e-43d8-b687-7b4df48c3b97)
- Create the [Task - NinjaRMM Deployment - [MAC]](/docs/2893ba48-9686-424e-ba32-0c799c38f9fd)
- Create the [Dynamic Group - Ninja RMM Deployment](/docs/b2d8d0e7-2310-43ae-b623-4e9fc8d295b0) 
- Create the [Dynamic Group - Ninja Deployment Success](/docs/4185cf9b-b76e-42b9-8559-08940c343e7d) 
- Create the [Dynamic Group - Ninja Deployment Failure](/docs/9718a5fd-535b-4faf-abe9-86d55f37e620) 

- Follow the implementation instruction provided in each tasks: [Task - NinjaRMM Deployment - [Windows]](/docs/905f38b9-492e-43d8-b687-7b4df48c3b97) and [Task - NinjaRMM Deployment - [MAC]](/docs/2893ba48-9686-424e-ba32-0c799c38f9fd) for the deployment.