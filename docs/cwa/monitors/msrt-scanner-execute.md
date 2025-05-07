---
id: '52caa288-ae6c-4047-a2d1-6d34b806d673'
slug: /52caa288-ae6c-4047-a2d1-6d34b806d673
title: 'MSRT Scanner Execute'
title_meta: 'MSRT Scanner Execute'
keywords: ['monitor', 'msrt', 'scanner', 'windows', 'agents', 'audit']
description: 'This document provides a detailed overview of the MSRT Scanner Monitor, which detects online Windows-supported agents and ensures compliance with the client EDF settings for the Malicious Software Removal Tool. It outlines the dependencies, target systems, and ticketing information for effective reporting and monitoring.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects the online Windows-supported agents (Windows 10, 11, 2016, 2019, and 2022 only) where the client EDF 'MSRT Scanner Enable' is checked and the exclusion location and computer EDFs 'MSRT Scanner Exclude' are not checked. It also excludes the agents where the MSRT scanner script [Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) ran in the past 7 days.

## Dependencies

[Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257)  
**△ Custom - Execute Script - MSRT Scanner**

## Target

Windows 10, 11, 2016, 2019, and 2022 only where the client EDF 'MSRT Scanner Enable' is checked and the exclusion location and computer EDFs 'MSRT Scanner Exclude' are not checked.

## Ticketing

**Subject**  
Microsoft Malicious Software Removal Tool Scan Report Audit Report of %computername%

**Body**  
MSRT Scan Report Audited on Computer: %computername% of Client/Location: %clientname%//%locationname%. Refer to the logs below:  
@ScanResult@

OR

Scan Result couldn't be generated properly.

OR  

MSRT Scan Report Audited on Computer: %computername% of Client/Location: %clientname%//%locationname%. Refer to the logs below:  
@ScanResult@. The Autofix extended scan of the computer, which automatically cleans any infections that are found, is scheduled.

