---
id: 'e0abdce8-a697-43b1-a404-18168a616627'
title: 'SentinelOne Deployment Guide'
title_meta: 'SentinelOne Deployment Guide'
keywords: ['sentinelone', 'deployment', 'windows', 'linux', 'mac']
description: 'This document provides a comprehensive guide for deploying the SentinelOne agent on Windows, Linux, and Mac machines, including associated custom fields, tasks, and monitoring setups.'
tags: ['deployment', 'windows', 'linux', 'mac', 'monitor', 'custom-field']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to deploy SentinelOne agent on Windows, Linux, and Mac machines.

## Associated Content

| Content                                                                                          | Type         | Function                                                                                                    |
|--------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------|
| [Custom Field - Site - SentinelOne Group Key](https://proval.itglue.com/DOC-5078775-15805085)   | Custom Field | This Custom field is to be filled with SentinelOne Group Key                                              |
| [Custom Field - Site - SentinelOne Site Key](https://proval.itglue.com/DOC-5078775-15805088)    | Custom Field | This Custom field is to be filled with SentinelOne Site Key                                               |
| [Custom Field - Flag - SentinelOne Deployment Exclusion](https://proval.itglue.com/DOC-5078775-15805740) | Custom Field | Select this custom field to exclude machines from SentinelOne deployment                                   |
| [Custom Field - Endpoint - SentinelOne Deployment Result](https://proval.itglue.com/DOC-5078775-15805737) | Custom Field | This custom field stores the result of the [Task - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15806354) |
| [Task - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15806354)                 | Task         | Deploy SentinelOne agent on Windows, Linux, and Mac machines.                                             |
| [Device Group - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15808853)         | Device Group | Filters machines eligible for SentinelOne deployment                                                        |
| [Monitor - SentinelOne Deployment Failure](https://proval.itglue.com/DOC-5078775-15822005)      | Monitor      | Create tickets if the [Task - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15806354) fails to install SentinelOne on the machines. |

## Implementation

- Read all the associated documents carefully.
- Create [Custom Field - Site - SentinelOne Group Key](https://proval.itglue.com/DOC-5078775-15805085)
- Create [Custom Field - Site - SentinelOne Site Key](https://proval.itglue.com/DOC-5078775-15805088)
- Create [Custom Field - Flag - SentinelOne Deployment Exclusion](https://proval.itglue.com/DOC-5078775-15805740)
- Create [Custom Field - Endpoint - SentinelOne Deployment Result](https://proval.itglue.com/DOC-5078775-15805737)
- Create [Task - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15806354)
- Create [Device Group - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15808853)
- Create the deployment schedule as described in this document: [CW RMM - Task - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15806354)
- Create [Monitor - SentinelOne Deployment Failure](https://proval.itglue.com/DOC-5078775-15822005)






