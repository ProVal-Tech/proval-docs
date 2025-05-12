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
| [EPM - Network - Script - Create and Populate plugin_proval_dns_extradata](/docs/4bc996bc-1b11-4819-a7c9-73e7c61aa9db) | Script       | Populates a custom table with data to be merged with current data in an existing dataview. |
| [EPM - Network - Custom Table - plugin_proval_dns_extradata](/docs/cd3368d8-d0b0-4ca4-972e-4adc8c1cfcfa) | Custom Table | Holds additional data gathered from the script.                        |
| [EPM - Network - Dataview - DNS Assignments](/docs/8e53a0ed-4b8a-4aec-9d92-99423964f53c)               | Dataview     | Displays data for end users.                                          |

## Implementation

1. Import the [EPM - Network - Script - Create and Populate plugin_proval_dns_extradata](/docs/4bc996bc-1b11-4819-a7c9-73e7c61aa9db) script.
2. Schedule the script to run against any target groups or endpoints.
3. Review the data in the dataview for accuracy.