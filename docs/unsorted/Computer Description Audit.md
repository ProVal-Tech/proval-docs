---
id: '81645955-50e9-45e6-b635-e6780aefc390'
title: 'Computer Description Data Report'
title_meta: 'Computer Description Data Report'
keywords: ['computer', 'description', 'report', 'sql', 'agent']
description: 'This document provides a detailed overview of the Computer Description Data Report, including its dependencies, columns, and SQL representation for fetching computer description messages set on agents within the RMM.'
tags: ['report', 'sql', 'agent', 'rmm', 'database']
draft: false
unlisted: false
---
## Summary

This dataview will show the computer description message set on the agent.

## Dependencies

[Computer Description Data Report](https://proval.itglue.com/DOC-5078775-7998420)

## Columns

| Column               | Description                                                       |
|----------------------|-------------------------------------------------------------------|
| Client Name          | Client Name of an agent                                           |
| Location Name        | Location Name of an agent                                         |
| Computer Name        | Agent Name                                                       |
| LastContact          | Last contact of an agent with the RMM                           |
| Operating System     | Operating system of an agent.                                    |
| Computer Description  | Computer description set information message.                     |
| Script Execution Date | When the last script ran on the agent to fetch the computer description message read check. |

## SQL Representation

```
SELECT c.computerid,
c.clientid,
c.locationid,
cl.name as `Client Name`, 
l.name as `Location Name`, 
c.name as `Computer Name`, 
c.os as `Operating System`,
c.LastContact,
TRIM(SUBSTRING_INDEX(ss.value,'--',1)) as `Computer Description`,
CasE WHEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(ss.value,'--',2),'--',-1)) =' ' 
THEN 'Not Detected' ELSE TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(ss.value,'--',2),'--',-1)) 
END as `Script Execution Date`

FROM (((computers c LEFT JOIN scriptstate ss ON c.computerid=ss.computerid) 
LEFT JOIN clients cl ON cl.clientid=c.clientid) 
LEFT JOIN locations l ON l.locationid=c.locationid)

WHERE ss.variable = 'ComputerDescriptionReport'
```







