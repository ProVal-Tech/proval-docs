---
id: '52caa288-ae6c-4047-a2d1-6d34b806d673'
title: 'MSRT Scanner Monitor'
title_meta: 'MSRT Scanner Monitor for Windows Agents'
keywords: ['monitor', 'msrt', 'scanner', 'windows', 'agents', 'audit']
description: 'This document provides a detailed overview of the MSRT Scanner Monitor, which detects online Windows-supported agents and ensures compliance with the client EDF settings for the Malicious Software Removal Tool. It outlines the dependencies, target systems, and ticketing information for effective reporting and monitoring.'
tags: ['monitoring', 'windows', 'security', 'report', 'configuration']
draft: false
unlisted: false
---
## Summary

This monitor detects the online Windows-supported agents (Windows 10, 11, 2016, 2019, and 2022 only) where the client EDF 'MSRT Scanner Enable' is checked and the exclusion location and computer EDFs 'MSRT Scanner Exclude' is not checked. It also excludes the agents where the MSRT scanner script [Malicious Software Removal Tool Scanner](https://proval.itglue.com/DOC-5078775-16445571) ran in the past 7 days.

## Dependencies

[Malicious Software Removal Tool Scanner](https://proval.itglue.com/DOC-5078775-16445571)  
**△ Custom - Execute Script - MSRT Scanner**

## Target

Windows 10, 11, 2016, 2019, and 2022 only where the client EDF 'MSRT Scanner Enable' is checked and the exclusion location and computer EDFs 'MSRT Scanner Exclude' is not checked.

## Ticketing

**Subject**  
Microsoft Malicious Software Removal Tool ScanReport Audit Report of %computername%

**Body**  
MSRT ScanReport Audited on Computer: %computername% of Client/Location: %clientname%//%locationname%. Refer to the below logs:  
@ScanResult@

OR

ScanResult couldn't able to generate properly.  

OR  

MSRT ScanReport Audited on Computer: %computername% of Client/Location: %clientname%//%locationname%. Refer to the below logs:  
@ScanResult@. The Autofix extended scan of the computer and automatically cleans any infections that are found is scheduled.






