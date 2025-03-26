---
id: '25040f3b-ef1d-4ebb-af45-e0df3d12ebae'
slug: /25040f3b-ef1d-4ebb-af45-e0df3d12ebae
title: 'Active - Directory - GPO Modified'
title_meta: 'Active - Directory - GPO Modified'
keywords: ['gpo', 'monitor', 'domain', 'controller', 'alert']
description: 'This document provides a detailed implementation guide for a Custom RAWSQL monitor that tracks GPO modifications on Domain Controllers, alerting when changes have occurred within the last day. It includes setup instructions, dependencies, and a sample ticket template for notifying administrators of detected modifications.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This Custom RAWSQL monitor shows the GPO modified time on the computer if the GPO was modified in the last day.

## Implementation

- Replace `\\<MonitorID>` in the additional condition with the ID of the monitor set.  
  ![Image 1](../../../static/img/GPO-Modified/image_1.png)  
  ![Image 2](../../../static/img/GPO-Modified/image_2.png)  
- Ensure that the monitor set is targeted on the Domain Controllers group.  
  ![Image 3](../../../static/img/GPO-Modified/image_3.png)  

## Dependencies

- [plugin_proval_ad_gpo](/docs/c7cf649a-dd80-4e9d-8c80-eb95b813b7c9)  
- [Group Policy Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a)

## Target

Domain Controller

## Alert Template

△ Custom - Ticket Creation - Computer

## Ticketing

**Subject:** `GPO Modification detected on %COMPUTERNAME%`

**Ticket Body:**  
```
A GPO modification was detected on %COMPUTERNAME% for %DOMAIN%. Please review if necessary.
Number of GPO(s) Modified: %RESULT%
Details:  
%FIELDNAME%
```

**%RESULT%:** Total number of modified GPOs  

**%FIELDNAME%:** GPO: `\\<Name of GPO>` (Modified Time: `\\<Modification Time of GPO>`)  

**Sample Ticket:**  
![Sample Ticket Image](../../../static/img/GPO-Modified/image_4.png)  


