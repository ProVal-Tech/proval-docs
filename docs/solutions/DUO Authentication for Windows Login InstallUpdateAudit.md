---
id: 'rmm-duo-authentication-windows-login'
title: 'DUO Authentication for Windows Login Installation and Update Automation'
title_meta: 'DUO Authentication for Windows Login Installation and Update Automation'
keywords: ['duo', 'authentication', 'windows', 'login', 'installation', 'update', 'automation', 'auditing']
description: 'This document provides a comprehensive guide to automate the installation and update of DUO Authentication for Windows Login, including the necessary custom fields, device groups, and tasks for efficient deployment and auditing.'
tags: ['custom-field', 'group', 'task', 'deployment', 'auditing', 'software']
draft: false
unlisted: false
---
## Purpose

The aim is to perform the DUO Authentication for Windows Login installation and update automation with auditing.

## Associated Content

#### Custom Field

| Content | Type | Description |
|---------|------|-------------|
| [CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](https://proval.itglue.com/DOC-5078775-17914127) | Custom Field | The custom fields in this document are required for the "Duo Authentication for Windows Logon" deployment. |

#### Groups

| Content | Type | Description |
|---------|------|-------------|
| [CW RMM - Group - DUO Auth for Windows Login Deployment](https://proval.itglue.com/DOC-5078775-17914126) | Dynamic | This group adds the member where the DUO Deployment is enabled. The agent gets added if the company custom field "DUO Deployment" is checked. |
| [CW RMM - Group - DUO Auth for Windows Login Installed](https://proval.itglue.com/DOC-5078775-17914493) | Dynamic | This group contains the list of agents where the DUO Auth for Windows Login is already installed via the script "DUO Install & Upgrade - Latest Version". It is built for auditing purposes. |
| [CW RMM - Group - DUO Auth for Windows Login Failed](https://proval.itglue.com/DOC-5078775-17914501) | Dynamic | This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application. It is built for auditing purposes. |

#### Task

| Content | Type | Description |
|---------|------|-------------|
| [CW RMM - Task - DUO Install & Upgrade - Latest Version](https://proval.itglue.com/DOC-5078775-17914131) | Script Editor | This script will install or update DUO if the currently installed instance is older than the latest released version. This script does match the hash of the installer from the official website before deploying it. This script downloads the latest installer from [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe). |

## Implementation

### Step 1.
Create the following custom fields:  
[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](https://proval.itglue.com/DOC-5078775-17914127)  
Note: The document has multiple custom fields and it is required to create each one for the solution to work properly.

### Step 2.
Create the following device groups:  
[CW RMM - Group - DUO Auth for Windows Login Deployment](https://proval.itglue.com/DOC-5078775-17914126)  
[CW RMM - Group - DUO Auth for Windows Login Installed](https://proval.itglue.com/DOC-5078775-17914493)  
[CW RMM - Group - DUO Auth for Windows Login Failed](https://proval.itglue.com/DOC-5078775-17914501)  

### Step 3.
Create and deploy the following tasks:  
[CW RMM - Task - DUO Install & Upgrade - Latest Version](https://proval.itglue.com/DOC-5078775-17914131)  


