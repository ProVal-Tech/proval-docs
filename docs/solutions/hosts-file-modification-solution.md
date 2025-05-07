---
id: '6fd1f1cb-f487-47cf-89b2-8568ef4bc292'
slug: /6fd1f1cb-f487-47cf-89b2-8568ef4bc292
title: 'Hosts File Modification Solution'
title_meta: 'Hosts File Modification Solution'
keywords: ['windows', 'host', 'file', 'modify', 'audit', 'add', 'reset', 'dns']
description: 'This document provides a comprehensive guide on how to modify the Windows host file, including adding entries, gathering information, and resetting it to default settings. It outlines associated scripts for auditing, adding, and resetting host file entries, as well as implementation steps to ensure regular updates.'
tags: ['dns', 'setup', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to provide a quick and easy way to modify the Windows host file, either by adding values, gathering information, or resetting the host file to its defaults.

## Associated Content

| Content                                                                                      | Type    | Function                                                                                                                      |
|----------------------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| [EPM - Windows Configuration - Script - Hosts File - Audit](/docs/19d3cc45-e5bd-4705-b82d-c0657b2e6195) | Script  | This script gathers information on the contents of the Windows host file and outputs them to the Host File Contents EDF.     |
| [EPM - Windows Configuration - Script - Hosts File - Add](/docs/3067b867-c1d4-4f7b-9a21-5344c7078931)   | Script  | This script takes user parameters set when running the script and adds a host file entry to the machine's host file, then runs `ipconfig /flushdns`. |
| [EPM - Windows Configuration - Script - Hosts File - Reset](/docs/d4f874ae-e2d5-4a6c-b0c3-14972813012d)  | Script  | This script resets the host file to defaults, removing any and all customizations, and then runs `ipconfig /flushdns`.    |
| [CWM - Automate - Dataview - Hosts File - Audit [Script]](/docs/cfa8fd80-7dc0-4d6b-9861-0467d7e4af94)   | Dataview| It shows the uncommented content of the host file in a single place.                                                          |

## Implementation

1. Import the following scripts:
   1. [EPM - Windows Configuration - Script - Hosts File - Audit](/docs/19d3cc45-e5bd-4705-b82d-c0657b2e6195)  
   2. [EPM - Windows Configuration - Script - Hosts File - Add](/docs/3067b867-c1d4-4f7b-9a21-5344c7078931)  
   3. [EPM - Windows Configuration - Script - Hosts File - Reset](/docs/d4f874ae-e2d5-4a6c-b0c3-14972813012d)  
2. Import the Dataview [CWM - Automate - Dataview - Hosts File - Audit [Script]](/docs/cfa8fd80-7dc0-4d6b-9861-0467d7e4af94)  
3. Schedule the script [EPM - Windows Configuration - Script - Hosts File - Audit](/docs/19d3cc45-e5bd-4705-b82d-c0657b2e6195) to run against the desired computers at regular intervals to keep the dataview up to date.

