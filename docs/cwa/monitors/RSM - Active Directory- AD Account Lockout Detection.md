---
id: 'cwa-ad-account-lockout-detection'
title: 'AD Account LockOut Detection'
title_meta: 'AD Account LockOut Detection'
keywords: ['monitoring', 'alert', 'eventid', 'domaincontroller', 'ticketing']
description: 'This document outlines the setup for monitoring event ID 4740 to detect account lockouts in Active Directory. It includes configuration details for alert generation, dependencies, implementation instructions, and ticketing format for incidents.'
tags: ['active-directory', 'alert', 'monitoring', 'ticketing', 'configuration']
draft: false
unlisted: false
---
## Summary

The monitoring system is set up to gather data on event ID 4740 that occurred within the last 15 minutes and to generate an alert with the relevant information.

## Details

**Suggested "Limit to"**: Primary Domain Controllers of Each Domain `<Distinct  Domain Controller Per Client>`

**Suggested Alert Style**: Continuous

**Suggested Alert Template**: △ Custom - Ticket Creation Computer - Failures Only

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based | 900      | <Screenshot Below> |

![Screenshot](..\..\..\static\img\RSM---Active-Directory--AD-Account-Lockout-Detection\image_1.png)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer [Failures Only]*](https://proval.itglue.com/DOC-5078775-13459854)

## Target

Domain Controllers  
![Image](..\..\..\static\img\RSM---Active-Directory--AD-Account-Lockout-Detection\image_2.png)  
The monitor set should be limited to the `<Server Role - AD - Infrastructure Master>` search.  
![Image](..\..\..\static\img\RSM---Active-Directory--AD-Account-Lockout-Detection\image_3.png)

## Implementation

Please follow the instructions provided in the implementation article to implement the solution:  
[Implement - Remote Monitor - AD Account LockOut Detection](https://proval.itglue.com/DOC-5078775-14952901)

## Ticketing

**Subject:** `<AD Account LockOut Detected on %COMPUTERNAME%>`

**Body:**  
Here are the details of the user(s) who were locked out:  
`%RESULT%.`

**Sample %RESULT%:**  
```
EventID    :    4740
EventDate   :   1/24/2024 7:34:50 AM
Username    :   TestUser1
Endpoint    :    DEV-Win11DomainJoined
Domain      :    provaltestdomain.local
DC          :    DEV-SERVER-2019$
```


