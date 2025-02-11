---
id: 'b605b808-7016-4911-8c37-6b950de40919'
title: 'Microsoft 365 - Click-to-Run - Set Update Channel'
title_meta: 'Microsoft 365 - Click-to-Run - Set Update Channel'
keywords: ['microsoft', 'update', 'channel', 'custom', 'field', 'task']
description: 'This document outlines the steps to set the update channel for Microsoft 365 products using Custom Fields and scheduled tasks in ConnectWise RMM. It includes links to associated content and implementation instructions for creating the necessary fields and tasks.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to set the update channel for Microsoft 365 products.

## Associated Content

| Content                                                                                         | Type        | Function                                                                                                      |
|-------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - Client - Update Channel](<../cwrmm/custom-fields/Client - Update Channel.md>) | Custom Field | Select Channel Type from the drop-down menu for all computers within the client.                             |
| [CW RMM - Custom Field - Endpoint - Update Channel](<../cwrmm/custom-fields/Endpoint - Update Channel.md>) | Custom Field | Select Channel Type from the drop-down menu for that particular computer.                                   |
| [CW RMM - Task - Microsoft 365 - Click-to-Run - Set Update Channel](<../cwrmm/tasks/Microsoft 365 - Click-to-Run - Set Update Channel.md>) | Task        | This will make changes in the registry to set the update channel for Microsoft 365 products to the value set in the client or computer-level custom fields `Update Channel`. |

## Implementation

Create the following custom fields:
- [CW RMM - Custom Field - Client - Update Channel](<../cwrmm/custom-fields/Client - Update Channel.md>)
- [CW RMM - Custom Field - Endpoint - Update Channel](<../cwrmm/custom-fields/Endpoint - Update Channel.md>)

Create and schedule this task:
- [CW RMM - Task - Microsoft 365 - Click-to-Run - Set Update Channel](<../cwrmm/tasks/Microsoft 365 - Click-to-Run - Set Update Channel.md>)




