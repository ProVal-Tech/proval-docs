---
id: '6b898ed0-2dfd-447c-9a40-5cc9ce05ea9b'
slug: /6b898ed0-2dfd-447c-9a40-5cc9ce05ea9b
title: 'DNS Assignments'
title_meta: 'DNS Assignments'
keywords: ['dns', 'dataview', 'network', 'epm', 'devices']
description: 'This document outlines the process to enhance the existing EPM Network Dataview to include DNS types and settings for devices. It provides a detailed implementation guide and links to associated scripts and custom tables that support this enhancement.'
tags: ['dns']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to add to the current NON-Stack dataview [EPM - Network - Dataview - DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c) to display the DNS type and DNS settings for the devices shown.

## Associated Content

| Content                                                                                                      | Type         | Function                                                               |
|--------------------------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------|
| [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d) | Script       | Populates a custom table with data to be merged with current data in an existing dataview. |
| [EPM - Network - Custom Table - pvl_network_Adapter](/docs/5a5463d0-0ce3-4c09-bd41-39da28e16d0f) | Custom Table | Holds additional data gathered from the script.                        |
| [EPM - Network - Dataview - DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c)               | Dataview     | Displays data for end users.                                          |
| [EPM - Network - Internal Network - Execute Script - Get - DNS Assignments](/docs/c3e9e7df-9e35-46ab-bca6-a182331ca211) | Internal Monitor | The internal monitor executes the [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d) once per week to keep the data updated in the [EPM - Network - Dataview - DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c).    |
| **△ Custom - Execute Script - Get - DNS Assignments**  | Alert Template | This alert template schedules the script [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d) on the detected agents [EPM - Network - Internal Network - Execute Script - Get - DNS Assignments](/docs/c3e9e7df-9e35-46ab-bca6-a182331ca211) of the monitor |

## Implementation

1. Import the script [EPM - Network - Script - Get - DNS Assignments](/docs/3bf7ea38-4bea-426b-bc6d-f480ba0b895d).
2. Import the dataview [EPM - Network - Dataview - DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c)
3. Import the monitor [EPM - Network - Internal Network - Execute Script - Get - DNS Assignments](/docs/c3e9e7df-9e35-46ab-bca6-a182331ca211)
4. Enable the monitor with the alert template **△ Custom - Execute Script - Get - DNS Assignments** so that script runs on the detected agent.