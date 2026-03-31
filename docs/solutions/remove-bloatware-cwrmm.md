---
id: '0b1f4077-1cf3-43ea-9c9d-93e2db94e24f'
slug: /0b1f4077-1cf3-43ea-9c9d-93e2db94e24f  
title: 'Filename'
title_meta: 'Remove Bloatware'
keywords: ['bloatware', 'pua', 'remove-pua', 'remove-bloatware', 'uninstallation', 'application-management']
description: 'Comprehensive CW RMM solution for identifying and removing specified bloatware (potentially unwanted applications) from Windows systems.'
tags:  ['windows', 'uninstallation', 'application']
draft: False
unlisted: false
last_update:
  date: 2026-03-30
---

## Purpose

A comprehensive solution for identifying and automatically removing the specified bloatware (potentially unwanted applications) from Windows systems.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field - Bloatware to Remove](/docs/806cb4b9-2300-4f4c-96c5-c3f504476aa6) | Custom Field | Custom field to define which applications will be removed as bloatware |
| [Custom Field - Enable Bloatware Removal](/docs/9e5da9e3-cac1-42e0-8081-3b4504102cad) | Custom Field | 	Controls bloatware removal based on selected operating system |
| [Custom Field - Exclude Bloatware Removal](/docs/5a9231ff-216b-42ce-a3fc-22794df30ebe) | Custom Field | Custom fields to exclude site/endpoint from the solution |
| [Group - Machines Opted for Bloatware Removal](/docs/9ab7b938-24e3-47dc-b884-487ca0a8188f) | Group | Includes Windows machines on which bloatware removal is enabled.|
| [Task  - Find Bloatware](/docs/ce7aa01e-28e5-4fc7-8691-eb3bed7b4c79) | Task | Detects specified bloatware (potentially unwanted applications) installed on the local Windows machine. |
| [Task  - Remove Bloatware](/docs/d3acf26e-3f15-4d46-a7e6-4401b9e04adf) | Task |Removes specified bloatware (potentially unwanted applications) from the local Windows machine. |


## Implementation

- Create the following custom fields using the implementation instruction provided in the document.
  - [Custom Field - Bloatware to Remove](/docs/806cb4b9-2300-4f4c-96c5-c3f504476aa6) 
  - [Custom Field - Enable Bloatware Removal](/docs/9e5da9e3-cac1-42e0-8081-3b4504102cad) 
  - [Custom Field - Exclude Bloatware Removal](/docs/5a9231ff-216b-42ce-a3fc-22794df30ebe) 
- Create the following Groups using the implementation instruction provided in the document.
  - [Group - Machines Opted for Bloatware Removal](/docs/9ab7b938-24e3-47dc-b884-487ca0a8188f) 
- Create the following Tasks using the implementation instruction provided in the document.  
  - [Task  - Find Bloatware](/docs/ce7aa01e-28e5-4fc7-8691-eb3bed7b4c79)
  - [Task  - Find Bloatware](/docs/ce7aa01e-28e5-4fc7-8691-eb3bed7b4c79)

## Changelog

### 2026-03-30

- Initial version of the document
