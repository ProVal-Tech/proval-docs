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
| [Custom Field - Site - SentinelOne Group Key](/docs/ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5)   | Custom Field | This custom field is to be filled with the SentinelOne Group Key                                              |
| [Custom Field - Site - SentinelOne Site Key](/docs/0c2128f8-2f99-47e7-a0ff-82b854ff2701)    | Custom Field | This custom field is to be filled with the SentinelOne Site Key                                               |
| [Custom Field - Flag - SentinelOne Deployment Exclusion](/docs/a2967009-ef20-4ce5-823e-8b80349325a0) | Custom Field | Select this custom field to exclude machines from SentinelOne deployment                                   |
| [Custom Field - Endpoint - SentinelOne Deployment Result](/docs/7af6b9e0-bf2f-4705-874e-c58c5fa9171d) | Custom Field | This custom field stores the result of the [Task - SentinelOne Deployment](/docs/25651d1f-99d6-4906-8666-220994a4862e) |
| [Task - SentinelOne Deployment](/docs/25651d1f-99d6-4906-8666-220994a4862e)                 | Task         | Deploy the SentinelOne agent on Windows, Linux, and Mac machines.                                             |
| [Device Group - SentinelOne Deployment](/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3)         | Device Group | Filters machines eligible for SentinelOne deployment                                                        |
| [Monitor - SentinelOne Deployment Failure](/docs/9e16691c-a81f-4a59-865c-ac38530ae29f)      | Monitor      | Create tickets if the [Task - SentinelOne Deployment](/docs/25651d1f-99d6-4906-8666-220994a4862e) fails to install SentinelOne on the machines. |

## Implementation

- Read all the associated documents carefully.
- Create [Custom Field - Site - SentinelOne Group Key](/docs/ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5)
- Create [Custom Field - Site - SentinelOne Site Key](/docs/0c2128f8-2f99-47e7-a0ff-82b854ff2701)
- Create [Custom Field - Flag - SentinelOne Deployment Exclusion](/docs/a2967009-ef20-4ce5-823e-8b80349325a0)
- Create [Custom Field - Endpoint - SentinelOne Deployment Result](/docs/7af6b9e0-bf2f-4705-874e-c58c5fa9171d)
- Create [Task - SentinelOne Deployment](/docs/25651d1f-99d6-4906-8666-220994a4862e)
- Create [Device Group - SentinelOne Deployment](/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3)
- Create the deployment schedule as described in this document: [CW RMM - Task - SentinelOne Deployment](/docs/25651d1f-99d6-4906-8666-220994a4862e)
- Create [Monitor - SentinelOne Deployment Failure](/docs/9e16691c-a81f-4a59-865c-ac38530ae29f)


