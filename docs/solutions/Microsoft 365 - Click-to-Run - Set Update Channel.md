---
id: 'b605b808-7016-4911-8c37-6b950de40919'
title: 'Set Update Channel for Microsoft 365 Products'
title_meta: 'Set Update Channel for Microsoft 365 Products'
keywords: ['microsoft', 'update', 'channel', 'custom', 'field', 'task']
description: 'This document outlines the steps to set the update channel for Microsoft 365 products using Custom Fields and scheduled tasks in ConnectWise RMM. It includes links to associated content and implementation instructions for creating the necessary fields and tasks.'
tags: ['windows']
draft: false
unlisted: false
---
## Purpose

The purpose of this Solution is to set the update channel for Microsoft 365 products.

## Associated Content

| Content                                                                                         | Type        | Function                                                                                                      |
|-------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - Client - Update Channel](https://proval.itglue.com/DOC-5078775-17435722) | Custom Field | Select Channel Type from the drop down menu for all computers within the Client                             |
| [CW RMM - Custom Field - Endpoint - Update Channel](https://proval.itglue.com/DOC-5078775-17435721) | Custom Field | Select Channel Type from the drop down menu for that particular computer.                                   |
| [CW RMM - Task - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17430050) | Task        | This will make changes in the registry to set the update channel for Microsoft 365 products to the value set in the Client or Computer-level Custom Fields `Update Channel`. |

## Implementation

Create the following Custom Fields:
- [CW RMM - Custom Field - Client - Update Channel](https://proval.itglue.com/DOC-5078775-17435722)
- [CW RMM - Custom Field - Endpoint - Update Channel](https://proval.itglue.com/DOC-5078775-17435721)

Create and schedule this task:
- [CW RMM - Task - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17430050)











