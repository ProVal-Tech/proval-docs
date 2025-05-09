---
id: '076d4f1d-6b33-449a-9bf1-d0f8cb42b3de'
slug: /076d4f1d-6b33-449a-9bf1-d0f8cb42b3de
title: 'DUO Authentication for Windows Login InstallUpdateAudit'
title_meta: 'DUO Authentication for Windows Login InstallUpdateAudit'
keywords: ['duo', 'authentication', 'windows', 'login', 'installation', 'update', 'automation', 'auditing']
description: 'This document provides a comprehensive guide to automate the installation and update of DUO Authentication for Windows Login, including the necessary custom fields, device groups, and tasks for efficient deployment and auditing.'
tags: ['auditing', 'deployment', 'software']
draft: false
unlisted: false
---

## Purpose

The aim is to perform the DUO Authentication for Windows Login installation and update automation with auditing.

## Associated Content

#### Custom Field

| Content | Type | Description |
|---------|------|-------------|
| [CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](/docs/a9578dd1-1f6b-4932-a614-5ed823656416) | Custom Field | The custom fields in this document are required for the "Duo Authentication for Windows Logon" deployment. |

#### Groups

| Content | Type | Description |
|---------|------|-------------|
| [CW RMM - Group - DUO Auth for Windows Login Deployment](/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b) | Dynamic | This group adds the member where the DUO Deployment is enabled. The agent gets added if the company custom field "DUO Deployment" is checked. |
| [CW RMM - Group - DUO Auth for Windows Login Installed](/docs/5202450b-3b85-46ff-9f35-6ea804223270) | Dynamic | This group contains the list of agents where the DUO Auth for Windows Login is already installed via the script "DUO Install & Upgrade - Latest Version." It is built for auditing purposes. |
| [CW RMM - Group - DUO Auth for Windows Login Failed](/docs/beaa71b6-62a3-4800-9c24-da92d4566965) | Dynamic | This group records the agents where the "DUO Install & Upgrade - Latest Version" failed to deploy the "DUO Auth for Windows Login" application. It is built for auditing purposes. |

#### Task

| Content | Type | Description |
|---------|------|-------------|
| [CW RMM - Task - DUO Install & Upgrade - Latest Version](/docs/47da7c82-7c27-4730-987a-2d32e22415fa) | Script Editor | This script will install or update DUO if the currently installed instance is older than the latest released version. This script matches the hash of the installer from the official website before deploying it. This script downloads the latest installer from [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe). |

## Implementation

### Step 1
Create the following custom fields:  
[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](/docs/a9578dd1-1f6b-4932-a614-5ed823656416)  
**Note:** The document has multiple custom fields, and it is required to create each one for the solution to work properly.

### Step 2
Create the following device groups:  
[CW RMM - Group - DUO Auth for Windows Login Deployment](/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b)  
[CW RMM - Group - DUO Auth for Windows Login Installed](/docs/5202450b-3b85-46ff-9f35-6ea804223270)  
[CW RMM - Group - DUO Auth for Windows Login Failed](/docs/beaa71b6-62a3-4800-9c24-da92d4566965)  

### Step 3
Create and deploy the following tasks:  
[CW RMM - Task - DUO Install & Upgrade - Latest Version](/docs/47da7c82-7c27-4730-987a-2d32e22415fa)  