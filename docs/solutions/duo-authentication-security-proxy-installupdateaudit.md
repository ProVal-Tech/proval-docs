---
id: '8fad089d-7b43-4539-b59e-0750ad4c8038'
slug: /8fad089d-7b43-4539-b59e-0750ad4c8038
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
| [CW RMM Custom Fields - DUO Auth Proxy Deployment](/docs/94f21e35-d184-4fb5-9215-898bb367a0e9) | Custom Field | The custom fields in this document are used in the DUO Auth Proxy Deployment Solution.                  |

### Group

| Content                                                                                             | Type         | Description                                                                                              |
|-----------------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------|
| [CW RMM - Group - DUO Auth Proxy Deployment](/docs/64da30ad-04ef-486e-b152-855b51be5896)       | Dynamic Group | This group adds the agent to the group for the "DUO Security Authentication Proxy" deployment. The agent gets added if the company custom field "DUO Proxy Deployment" is checked. |
| [CW RMM - Group - DUO Auth Proxy Deployed Devices](/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7) | Dynamic Group | This shows the devices where the "DUO Security Authentication Proxy" application is deployed by the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes. |
| [CW RMM - Group - DUO Auth Proxy Deployment Failed](/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4) | Dynamic Group | This contains the devices where the "DUO Security Authentication Proxy" application deployment failed by the script "DUO Auth Proxy - Install/Update Latest Version." It is built for auditing purposes. |

### Task

| Content                                                                                             | Type   | Description                                                                                              |
|-----------------------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------------------|
| [CW RMM - Task - DUO Auth Proxy - Install/Update Latest Version](/docs/bfcc2aec-a83b-49ac-bfbe-274cbf112a6e) | Script | The script installs or updates the DUO Authentication Proxy application to the latest available version. |

## Implementation

1. Create the following custom fields:  
   [CW RMM Custom Fields - DUO Auth Proxy Deployment](/docs/94f21e35-d184-4fb5-9215-898bb367a0e9)  
   **Note:** The document has multiple custom fields, and it is required to create each one for the solution to work properly.

2. Create the following device groups:  
   [CW RMM - Group - DUO Auth Proxy Deployment](/docs/64da30ad-04ef-486e-b152-855b51be5896)  
   [CW RMM - Group - DUO Auth Proxy Deployed Devices](/docs/a940aac1-4586-4e35-90f6-749ec3b2e1d7)  
   [CW RMM - Group - DUO Auth Proxy Deployment Failed](/docs/2212752f-e9e3-4a12-af3f-f12972cf9fb4)  

3. Create and deploy the following tasks:  
   [CW RMM - Task - DUO Auth Proxy - Install/Update Latest Version](/docs/bfcc2aec-a83b-49ac-bfbe-274cbf112a6e)  


