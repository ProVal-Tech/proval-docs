---
id: 'c9969bad-d2da-45ec-90fe-d6be82479ebc'
title: 'Threatlocker Deployment on Windows and Mac Agents'
title_meta: 'Threatlocker Deployment on Windows and Mac Agents'
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
| [CW RMM - Custom Field - Company - Threatlocker_Organization_Name](<../cwrmm/custom-fields/Company - Threatlocker_Organization_Name.md>) | Text      | Company | Fill it with the organization name under which the Threatlocker agent is to be installed                    |
| [CW RMM - Custom Field - Site - Exclude Threatlocker](<../cwrmm/custom-fields/Site - Exclude Threatlocker.md>) | Flag      | Site    | Mark this custom field to exclude the endpoints of this site from Threatlocker deployment                   |
| [CW RMM - Custom Field - Endpoint - Exclude Threatlocker](<../cwrmm/custom-fields/Endpoint - Exclude Threatlocker.md>) | Flag      | Endpoint| Mark this custom field to exclude the individual endpoint from Threatlocker deployment                       |
| [CW RMM - Custom Field - Company - ThreatLockerAuthKey](<../cwrmm/custom-fields/Company - ThreatLockerAuthKey.md>) | Text Box  | Company | Stores the Threatlocker authorization key for Windows machines                                              |
| [CW RMM - Custom Field - Company - ThreatLockerMacGroupKey](<../cwrmm/custom-fields/Company - ThreatLockerMacGroupKey.md>) | Text Box  | Company | Stores the Threatlocker group key for Macintosh machines                                                    |

#### Device Group

| Content                                                                                          | Type      | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------------------------|
| [CW RMM - Dynamic Group - Deploy Threatlocker](<../cwrmm/groups/Deploy Threatlocker.md>) | Dynamic   | Filters the machines that are eligible for Threatlocker deployment.                                        |

#### Task

| Content                                                                                          | Type          | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|
| [CW RMM - Task - Threatlocker Deployment](https://proval.itglue.com/DOC-5078775-17730645)     | Script Editor | Installs Threatlocker on both Windows and Mac operating systems.                                           |

## Implementation

1. Create the following custom fields:
   - [CW RMM - Custom Field - Company - Threatlocker_Organization_Name](<../cwrmm/custom-fields/Company - Threatlocker_Organization_Name.md>)
   - [CW RMM - Custom Field - Site - Exclude Threatlocker](<../cwrmm/custom-fields/Site - Exclude Threatlocker.md>)
   - [CW RMM - Custom Field - Endpoint - Exclude Threatlocker](<../cwrmm/custom-fields/Endpoint - Exclude Threatlocker.md>)
   - [CW RMM - Custom Field - Company - ThreatLockerAuthKey](<../cwrmm/custom-fields/Company - ThreatLockerAuthKey.md>)
   - [CW RMM - Custom Field - Company - ThreatLockerMacGroupKey](<../cwrmm/custom-fields/Company - ThreatLockerMacGroupKey.md>)

2. Create the following device group:
   - [CW RMM - Dynamic Group - Deploy Threatlocker](<../cwrmm/groups/Deploy Threatlocker.md>)

3. Create and deploy the following task:
   - [CW RMM - Task - Threatlocker Deployment](https://proval.itglue.com/DOC-5078775-17730645)
