---
id: '9292f135-cca4-4eba-97ff-cd4276ab62e9'
title: 'Scripting Engine Hung Monitor'
title_meta: 'Scripting Engine Hung Monitor'
keywords: ['monitor', 'email', 'alert', 'mysql', 'troubleshooting', 'scripts']
description: 'This document outlines a monitor that sends an email alert for the scripting engine hung state in a client environment. It detects scripts stuck in the pending scripts table for too long and notifies the designated email for proactive review.'
tags: ['email', 'mysql']
draft: false
unlisted: false
---

## Summary

This monitor sends an email to [alerts@provaltech.com](mailto:alerts@provaltech.com) to proactively review why the script engine hung in the client's environment. The monitor detects the number of scripts stuck in the `pendingscripts` table for longer than the specified time after their scheduled execution.

The email is sent to the address specified in the system property `"ProVal_Alerts_Email_Address,"` which is typically [alerts@provaltech.com](mailto:alerts@provaltech.com), for proactive review.

**Requirement:** `MySQL 8.0+`

## Dependencies

[Scripting Engine Hung - Troubleshooting](<../../unsorted/Scripting Engine Hung - Troubleshooting.md>)  
**Alert Template:** `△ Custom - Email RAWSQL Monitor set results to ProVal`

## Target

- Global

## Ticketing

**Subject:** `CWA - Scripting Engine Hung`  
**Body:**  
**Failure:**  
`%RESULT%`  
`Troubleshooting Article:`  
[https://proval.itglue.com/5078775/docs/16981877](https://proval.itglue.com/5078775/docs/16981877)  
**Success:** `Script engine hung state resolved`  
**Example %RESULT%:**  
`Total Running Scripts: 1800`  
`Top Script IDs shown below:`  
`4569 - 1000`  
`1567 - 568`  
`1892 - 100`  

## Troubleshooting

Please follow the article below to perform troubleshooting if this issue arises.  
[Scripting Engine Hung - Troubleshooting](<../../unsorted/Scripting Engine Hung - Troubleshooting.md>)
