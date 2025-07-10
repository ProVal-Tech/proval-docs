---
id: 'e99ec890-ae05-4ad5-bdbc-6b0599be67e9'
slug: /e99ec890-ae05-4ad5-bdbc-6b0599be67e9
title: 'Excessive Logon Attempts'
title_meta: 'Excessive Logon Attempts'
keywords: ['excessive-logon-attempts', 'excessive', 'logon', 'bruteforce', 'brute']
description: 'This will Detect and summarize failed logon attempts (Event ID 4625) from the Windows Security event log within a specified time window.'
tags: ['security', 'accounts', 'eventlogs']
draft: false
unlisted: false
---

## Purpose
This solution is built to detect and summarize failed logon attempts (Event ID 4625) from the Windows Security event log within a specified time window on a given machine and based on it, if it meets the criteria then it creates a ticket. 

It simply checks the computer for security event log event ID 4625 where the count of occurrences is greater than 10 in the last 60 minutes. This is default setting and can be changed using the `Threshold` and `Minutes` parameters.

## Associated Content

| Name                                | Type               | Function                                                                                                      |
|-------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------|
|[Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) | Automation             | Detects and summarizes failed logon attempts (Event ID 4625) from the Windows Security event log within a specified time window. |
| [Condition - Excessive Logon Attempts](/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae) | Conditions | The condition runs the automation once per hour and generates a ticket with the script’s results if any monitored event log is detected.     |
| [CW Manage - Ticket Template - Excessive Logon Attempts](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea)|CW Manage Ticket Template|This ticket template is used to manage the CW Manage ticket generation settings for the Excessive Logon Attempts Alert Condition |


## Implementation

- Create the [Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) using the implementation instruction provided in the document.  
- Create the [Condition - Excessive Logon Attempts](/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae) using the implementation instruction provided in the document.
- Create the [CW Manage - Ticket Template - Excessive Logon Attempts](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) using the implementation instruction provided in the document.


## FAQ

- This solution is built to alert for the Excessive Failed Logon Attempts on a device.