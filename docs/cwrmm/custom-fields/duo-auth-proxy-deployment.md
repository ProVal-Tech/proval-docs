---
id: '94f21e35-d184-4fb5-9215-898bb367a0e9'
slug: /94f21e35-d184-4fb5-9215-898bb367a0e9
title: 'DUO Auth Proxy Deployment'
title_meta: 'DUO Auth Proxy Deployment'
keywords: ['duo', 'deployment', 'custom', 'fields', 'proxy', 'authentication', 'solution']
description: 'This document provides detailed information about the custom fields used in the DUO Auth Proxy Deployment Solution, including dependencies, field types, and step-by-step instructions for creating custom fields within the system.'
tags: ['security', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

The custom fields listed below are used in the DUO Auth Proxy Deployment Solution.

## Dependencies

## Details

| Name                       | Level   | Type | Required | Editable | Default Value? | Description                                                                                                        |
|----------------------------|---------|------|----------|----------|-----------------|--------------------------------------------------------------------------------------------------------------------|
| Duo Proxy Deployment       | Company | Flag | False    | Yes      | No              | This checkbox allows the deployment of the application "Duo Security Authentication Proxy" by adding the agents of the company to the deployment group. |
| DUO Proxy Exclusion        | Endpoint| Flag | False    | Yes      | No              | This checkbox excludes the agent from the deployment of the application "Duo Security Authentication Proxy".      |
| DUO Auth Proxy Result      | Company | Text | False    | No       | \<Blank>         | This stores the success or failure result from the script "DUO Auth Proxy - Install/Update Latest Version".      |

## Steps to Create Custom Fields

1. Go to Settings > Custom Fields  
   ![Step 1](../../../static/img/DUO-Auth-Proxy-Deployment/image_1.png)

2. Click the Add option  
   ![Step 2](../../../static/img/DUO-Auth-Proxy-Deployment/image_2.png)

3. Create Custom Field  
   Provide Name: Duo Proxy Deployment  
   Select Level: Company  
   ![Step 3](../../../static/img/DUO-Auth-Proxy-Deployment/image_3.png)  
   Then check the Type option:  
   Type: Flag  
   ![Type Option](../../../static/img/DUO-Auth-Proxy-Deployment/image_4.png)  
   Then provide Default Value and Description:  
   Default: No  
   Description: This checkbox allows the deployment of the application "Duo Security Authentication Proxy" by adding the agents of the company to the deployment group.  
   Editable: Yes  
   ![Default Value](../../../static/img/DUO-Auth-Proxy-Deployment/image_5.png)  
   **Note:** The description is mandatory to fill out and does not accept **'NEW LINE'**. Write everything in one phrase to describe the details of the custom field.

4. Please follow the same steps to create other custom fields.



