---  
id: 'f42c31ea-ee44-4c51-b7b1-04b595f1368b'
slug: /f42c31ea-ee44-4c51-b7b1-04b595f1368b
title:  'Dell Command Update Scan'
title_meta:  'Dell Command Update Scan'
keywords: ['dell', 'workstation', 'update', 'installation', 'firmware', 'bios', 'driver']  
description:  'This fetches the online Dell Windows agent and executes the Dell Command Handler scanning using script if the deployment EDFs are checked.'
tags: ['bios', 'firmware', 'installation', 'software', 'update', 'windows']  
draft: false  
unlisted: false  
last_update:
  date: 2026-03-06
---

## Summary

This monitor fetches the online Dell Windows agent and executes the Dell Command Handler scanning using [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) if the deployment EDFs are checked.

## Dependencies

- [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)

## Target

Global

## Implementation

- Import the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)
- Import the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) 
- Import the [Dataview - Dell Command Scan Audit](/docs/08c932b0-f79a-4c37-bfbe-c2aade829abb) 
- Import the **Alert Template - △ Custom - Execute Script - Dell Command Scan**

- Run the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) with `SetEnvironment` = 1, just after importing it, so that if creates the required table and the EDFs.
- Reload the system cache
- Apply the **Alert Template - △ Custom - Execute Script - Dell Command Scan** with the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b).
- Right click and run now and reset the monitor for setting the auditing.

## Changelog

- Modified the previous dell command update handler solution with this to use the agnostic script and store the detailed information of the Dell command updates into a [Table - pvl_dellcommand_audit](/docs/21a8afce-3a1c-4bdf-b2d2-a5581583e27c)

## Changelog

2026-03-06