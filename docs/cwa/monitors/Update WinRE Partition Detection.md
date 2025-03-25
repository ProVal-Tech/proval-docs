---
id: '857bac8a-a3f1-408d-9b1f-73b0e5ec6e07'
slug: /857bac8a-a3f1-408d-9b1f-73b0e5ec6e07
title: 'Update WinRE Partition Detection'
title_meta: 'Update WinRE Partition Detection'
keywords: ['monitoring', 'windows', 'os', 'version', 'cve']
description: 'This document outlines a monitoring solution that detects online Windows machines based on specific operating system criteria. It ensures that only supported versions are monitored and provides details on ticketing for failures related to updating the WinRE partition.'
tags: ['security', 'ticketing', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects online Windows machines whose OS falls under the following criteria:  
`c.os NOT REGEXP 'Windows.* (XP|20(03|12)|8|7)' AND c.version REGEXP '22(621|631|000)|190(41|42|44|45)|20348'.`  
It also ensures that the script runs once on the agent.

## Dependencies

[KB5034957 - CVE-2024-20666 - Updating the WinRE partition](<../scripts/KB5034957 - CVE-2024-20666 - Updating the WinRE partition.md>) 

## Target

- Windows Workstations  
- Windows Servers  

The monitor itself has the criteria to filter out the supported OS.

## Ticketing

**Subject**  

```
KB5034957 - CVE-2024-20666 - Updating the WinRE partition failed for %ClientName%/%ComputerName%
```

**Body**  

```
The script failed to execute the requested process.  
PowerShell Full Output: @psout@  
@Compinfo@
```

Note: Here, `@psout@` is the result of the script and `@compinfo@` contains the computer details:  
- Computer Name  
- OS  
- Last User Name  
- Serial Number  
- BIOS Version (Manufacturer)  

Additionally, ticketing is enabled under the script. Refer to the script document for instructions on how to enable it under Global Parameters.


