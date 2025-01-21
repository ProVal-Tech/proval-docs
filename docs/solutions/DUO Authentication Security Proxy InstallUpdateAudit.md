---
id: '8fad089d-7b43-4539-b59e-0750ad4c8038'
title: 'DUO Authentication Security Proxy InstallUpdateAudit'
title_meta: 'DUO Authentication Security Proxy InstallUpdateAudit'
keywords: ['duo', 'authentication', 'security', 'proxy', 'installation', 'update', 'automation', 'auditing']
description: 'This document outlines the process for automating the installation and update of the DUO Authentication Security Proxy, including the necessary custom fields, dynamic groups, and tasks for effective management and auditing.'
tags: ['auditing', 'deployment', 'software']
draft: false
unlisted: false
---

## Purpose

The aim is to perform the DUO Authentication Security Proxy installation and update automation with auditing.

## Associated Content

### Custom Field

| Content                                                                                             | Type        | Description                                                                                              |
|-----------------------------------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------------------------|
| [CW RMM Custom Fields - DUO Auth Proxy Deployment](https://proval.itglue.com/DOC-5078775-17914128) | Custom Field | The custom fields in this document are used in the DUO Auth Proxy Deployment Solution.                  |

### Group

| Content                                                                                             | Type         | Description                                                                                              |
|-----------------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------|
| [CW RMM - Group - DUO Auth Proxy Deployment](https://proval.itglue.com/DOC-5078775-17914130)       | Dynamic Group | This group adds the agent to the group for the "DUO Security Authentication Proxy" deployment. The agent gets added if the company custom field "DUO Proxy Deployment" is checked. |
| [CW RMM - Group - DUO Auth Proxy Deployed Devices](<../cwrmm/groups/DUO Auth Proxy Deployed Devices.md>) | Dynamic Group | This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes. |
| [CW RMM - Group - DUO Auth Proxy Deployment Failed](<../cwrmm/groups/DUO Auth Proxy Deployment Failed.md>) | Dynamic Group | This contains the devices where the "DUO Security Authentication Proxy" application deployment failed by the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes. |

### Task

| Content                                                                                             | Type   | Description                                                                                              |
|-----------------------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------------------|
| [CW RMM - Task - DUO Auth Proxy - Install/Update Latest Version](<../cwrmm/tasks/DUO Auth Proxy - InstallUpdate Latest Version.md>) | Script | The script installs or updates the DUO Authentication Proxy application to the latest available version. |

## Implementation

1. Create the following custom fields:  
   [CW RMM Custom Fields - DUO Auth Proxy Deployment](https://proval.itglue.com/DOC-5078775-17914128)  
   **Note:** The document has multiple custom fields, and it is required to create each one for the solution to work properly.

2. Create the following device groups:  
   [CW RMM - Group - DUO Auth Proxy Deployment](https://proval.itglue.com/DOC-5078775-17914130)  
   [CW RMM - Group - DUO Auth Proxy Deployed Devices](<../cwrmm/groups/DUO Auth Proxy Deployed Devices.md>)  
   [CW RMM - Group - DUO Auth Proxy Deployment Failed](<../cwrmm/groups/DUO Auth Proxy Deployment Failed.md>)  

3. Create and deploy the following tasks:  
   [CW RMM - Task - DUO Auth Proxy - Install/Update Latest Version](<../cwrmm/tasks/DUO Auth Proxy - InstallUpdate Latest Version.md>)  



