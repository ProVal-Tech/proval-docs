---
id: 'c9969bad-d2da-45ec-90fe-d6be82479ebc'
slug: /c9969bad-d2da-45ec-90fe-d6be82479ebc
title: 'Threatlocker Deployment'
title_meta: 'Threatlocker Deployment'
keywords: ['threatlocker', 'deployment', 'windows', 'mac', 'agent', 'customfield', 'dynamicgroup', 'task']
description: 'This document outlines the process for deploying the Threatlocker agent on both Windows and Mac operating systems. It includes necessary custom fields, device group creation, and task deployment steps to ensure successful implementation.'
tags: ['deployment', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to deploy the Threatlocker agent on Windows and Mac agents.

## Associated Content

#### Custom Fields

| Content                                                                                          | Type      | Level   | Function                                                                                                     |
|--------------------------------------------------------------------------------------------------|-----------|---------|--------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - Company - Threatlocker_Organization_Name](/docs/bf8fac11-d525-4cea-a6e7-f402af581f77) | Text      | Company | Fill it with the organization name under which the Threatlocker agent is to be installed                    |
| [CW RMM - Custom Field - Site - Exclude Threatlocker](/docs/de2e1944-e0cc-4b5a-8b87-4f09cfafe4a9) | Flag      | Site    | Mark this custom field to exclude the endpoints of this site from Threatlocker deployment                   |
| [CW RMM - Custom Field - Endpoint - Exclude Threatlocker](/docs/c18a4b16-772a-42f3-9d1e-ec136d643d43) | Flag      | Endpoint| Mark this custom field to exclude the individual endpoint from Threatlocker deployment                       |
| [CW RMM - Custom Field - Company - ThreatLockerAuthKey](/docs/5ffed5a2-c8d9-4e43-964a-54f1ac563268) | Text Box  | Company | Stores the Threatlocker authorization key for Windows machines                                              |
| [CW RMM - Custom Field - Company - ThreatLockerMacGroupKey](/docs/a9d8b61d-304f-442b-b7e3-54efe8ae150e) | Text Box  | Company | Stores the Threatlocker group key for Macintosh machines                                                    |

#### Device Group

| Content                                                                                          | Type      | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------------------------|
| [CW RMM - Dynamic Group - Deploy Threatlocker](/docs/8645a522-a9e3-4755-a498-32c2904e51c6) | Dynamic   | Filters the machines that are eligible for Threatlocker deployment.                                        |

#### Task

| Content                                                                                          | Type          | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|
| [CW RMM - Task - Threatlocker Deployment](/docs/50838fdf-4f88-4fa4-a3b2-f4827af7a86c)     | Script Editor | Installs Threatlocker on both Windows and Mac operating systems.                                           |

## Implementation

1. Create the following custom fields:
   - [CW RMM - Custom Field - Company - Threatlocker_Organization_Name](/docs/bf8fac11-d525-4cea-a6e7-f402af581f77)
   - [CW RMM - Custom Field - Site - Exclude Threatlocker](/docs/de2e1944-e0cc-4b5a-8b87-4f09cfafe4a9)
   - [CW RMM - Custom Field - Endpoint - Exclude Threatlocker](/docs/c18a4b16-772a-42f3-9d1e-ec136d643d43)
   - [CW RMM - Custom Field - Company - ThreatLockerAuthKey](/docs/5ffed5a2-c8d9-4e43-964a-54f1ac563268)
   - [CW RMM - Custom Field - Company - ThreatLockerMacGroupKey](/docs/a9d8b61d-304f-442b-b7e3-54efe8ae150e)

2. Create the following device group:
   - [CW RMM - Dynamic Group - Deploy Threatlocker](/docs/8645a522-a9e3-4755-a498-32c2904e51c6)

3. Create and deploy the following task:
   - [CW RMM - Task - Threatlocker Deployment](/docs/50838fdf-4f88-4fa4-a3b2-f4827af7a86c)


