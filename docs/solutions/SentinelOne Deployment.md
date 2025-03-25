---
id: 'e0abdce8-a697-43b1-a404-18168a616627'
slug: /e0abdce8-a697-43b1-a404-18168a616627
title: 'SentinelOne Deployment'
title_meta: 'SentinelOne Deployment'
keywords: ['sentinelone', 'deployment', 'windows', 'linux', 'mac']
description: 'This document provides a comprehensive guide for deploying the SentinelOne agent on Windows, Linux, and Mac machines, including associated custom fields, tasks, and monitoring setups.'
tags: ['deployment', 'linux', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to deploy the SentinelOne agent on Windows, Linux, and Mac machines.

## Associated Content

| Content                                                                                          | Type         | Function                                                                                                    |
|--------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------|
| [Custom Field - Site - SentinelOne Group Key](<../cwrmm/custom-fields/Site - SentinelOne Group Key.md>)   | Custom Field | This custom field is to be filled with the SentinelOne Group Key                                              |
| [Custom Field - Site - SentinelOne Site Key](<../cwrmm/custom-fields/Company - SentinelOne Site Key.md>)    | Custom Field | This custom field is to be filled with the SentinelOne Site Key                                               |
| [Custom Field - Flag - SentinelOne Deployment Exclusion](<../cwrmm/custom-fields/Flag - SentinelOne Deployment Exclusion.md>) | Custom Field | Select this custom field to exclude machines from SentinelOne deployment                                   |
| [Custom Field - Endpoint - SentinelOne Deployment Result](<../cwrmm/custom-fields/Endpoint - SentinelOne Deployment Result.md>) | Custom Field | This custom field stores the result of the [Task - SentinelOne Deployment](<../cwrmm/tasks/SentinelOne Deployment.md>) |
| [Task - SentinelOne Deployment](<../cwrmm/tasks/SentinelOne Deployment.md>)                 | Task         | Deploy the SentinelOne agent on Windows, Linux, and Mac machines.                                             |
| [Device Group - SentinelOne Deployment](<../cwrmm/groups/SentinelOne Deployment.md>)         | Device Group | Filters machines eligible for SentinelOne deployment                                                        |
| [Monitor - SentinelOne Deployment Failure](<../cwrmm/monitors/SentinelOne Deployment Failure.md>)      | Monitor      | Create tickets if the [Task - SentinelOne Deployment](<../cwrmm/tasks/SentinelOne Deployment.md>) fails to install SentinelOne on the machines. |

## Implementation

- Read all the associated documents carefully.
- Create [Custom Field - Site - SentinelOne Group Key](<../cwrmm/custom-fields/Site - SentinelOne Group Key.md>)
- Create [Custom Field - Site - SentinelOne Site Key](<../cwrmm/custom-fields/Company - SentinelOne Site Key.md>)
- Create [Custom Field - Flag - SentinelOne Deployment Exclusion](<../cwrmm/custom-fields/Flag - SentinelOne Deployment Exclusion.md>)
- Create [Custom Field - Endpoint - SentinelOne Deployment Result](<../cwrmm/custom-fields/Endpoint - SentinelOne Deployment Result.md>)
- Create [Task - SentinelOne Deployment](<../cwrmm/tasks/SentinelOne Deployment.md>)
- Create [Device Group - SentinelOne Deployment](<../cwrmm/groups/SentinelOne Deployment.md>)
- Create the deployment schedule as described in this document: [CW RMM - Task - SentinelOne Deployment](<../cwrmm/tasks/SentinelOne Deployment.md>)
- Create [Monitor - SentinelOne Deployment Failure](<../cwrmm/monitors/SentinelOne Deployment Failure.md>)



