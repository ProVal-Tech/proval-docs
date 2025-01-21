---
id: '6b898ed0-2dfd-447c-9a40-5cc9ce05ea9b'
title: 'Enhancing EPM Network Dataview for DNS Assignments'
title_meta: 'Enhancing EPM Network Dataview for DNS Assignments'
keywords: ['dns', 'dataview', 'network', 'epm', 'devices']
description: 'This document outlines the process to enhance the existing EPM Network Dataview to include DNS types and settings for devices. It provides a detailed implementation guide and links to associated scripts and custom tables that support this enhancement.'
tags: ['dns']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to add to the current NON-Stack dataview [EPM - Network - Dataview - DNS Assignments](https://proval.itglue.com/DOC-5078775-12184160) to display the DNS type and DNS settings for the devices shown.

## Associated Content

| Content                                                                                                      | Type         | Function                                                               |
|--------------------------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------|
| [EPM - Network - Script - Create and Populate plugin_proval_dns_extradata](<../cwa/scripts/Create and Populate plugin_proval_dns_extradata.md>) | Script       | Populates a custom table with data to be merged with current data in an existing dataview. |
| [EPM - Network - Custom Table - plugin_proval_dns_extradata](<../cwa/tables/plugin_proval_dns_extradata.md>) | Custom Table | Holds additional data gathered from the script.                        |
| [EPM - Network - Dataview - DNS Assignments](https://proval.itglue.com/DOC-5078775-12184160)               | Dataview     | Displays data for end users.                                          |

## Implementation

1. Import the [EPM - Network - Script - Create and Populate plugin_proval_dns_extradata](<../cwa/scripts/Create and Populate plugin_proval_dns_extradata.md>) script.
2. Schedule the script to run against any target groups or endpoints.
3. Review the data in the dataview for accuracy.

