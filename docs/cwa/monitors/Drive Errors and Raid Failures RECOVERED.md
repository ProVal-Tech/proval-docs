---
id: 'fc982478-9b78-470f-b9c0-35d21761c7ef'
title: 'Drive Errors and RAID Failures Monitor'
title_meta: 'Drive Errors and RAID Failures Monitor'
keywords: ['drive', 'raid', 'errors', 'monitor', 'windows', 'eventlogs']
description: 'This document provides a comprehensive overview of a monitoring solution that proactively checks for drive errors and RAID failure events on Windows OS, detailing the SQL query used and answering common questions related to its configuration and usage.'
tags: ['eventlogs', 'performance', 'windows']
draft: false
unlisted: false
---
## Summary

This monitor proactively looks for all the Drive errors and Raid failures events generated in the last 24 hours.

## Target

Windows OS

## Translated SQL

```
SELECT  
  CONCAT(
    'Latest Event ',  
    eventlogs.`TimeGen`,  
    ': ',  
    REPLACE(
      REPLACE(eventlogs.`message`, '//'', ''),  
      '//n',  
      ''  
    ),  
    ' (',  
    COUNT(eventlogs.computerid),  
    ' events found)'  
  ) AS TestValue,  
  computers.name AS identityfield,  
  computers.computerid,  
  AgentComputerData.uptimestart,  
  AgentComputerData.uptimeend,  
  AgentComputerData.noalerts  
FROM  
  EventLogs  
  LEFT JOIN Computers ON EventLogs.ComputerID = Computers.ComputerID  
  LEFT JOIN Locations ON Locations.LocationID = Computers.Locationid  
  LEFT JOIN Clients ON Clients.ClientID = Computers.clientid  
  JOIN AgentComputerData ON Computers.ComputerID = AgentComputerData.ComputerID  
WHERE  
  (Eventlogs.Source LIKE 'disk')  
  AND timegen > DATE_SUB(  
    CURRENT_DATE(),  
    INTERVAL 1 DAY  
  )  
  AND eventlogs.message NOT LIKE '%paging operation%'  
  AND eventlogs.message NOT LIKE '%controller error on%'  
  AND eventlogs.message NOT LIKE '%was retried%'  
  AND eventlogs.message NOT LIKE '%surprise removed%'  
  AND eventlogs.message NOT LIKE '%same disk identifiers%'  
  AND eventlogs.message NOT LIKE '%the capacity of%'  
  AND eventlogs.message NOT LIKE '%is not ready for access yet%' 
  #AND Computers.Computerid IN (SELECT computerid FROM tcomp)  
GROUP BY  
  eventlogs.computerid,  
  eventlogs.message 
  #HAVING `TestValue` NOT REGEXP 'controller error on.*////(([1-9]|1[0-9]|20) events* found////)'  
HAVING  
  `TestValue` NOT REGEXP 'has a bad block.*////([1-9] events{0,1} found////)'  
```

## FAQ

**Q: How do I ignore certain error types or only alert on a number of events?**  
**A:** At the end of the query there is a commented-out (by default) line for this behavior.  
![Image](../../../static/img/Drive-Errors-and-Raid-Failures-RECOVERED/image_1.png)

Remove the `#` from this line and that will allow this line to go into production. In this example, we want to ignore controller errors if there are less than 20 of them on a specific drive. The portion:  
![Image](../../../static/img/Drive-Errors-and-Raid-Failures-RECOVERED/image_2.png)  
is the subject line of the event log that we want to exclude unless there are X results. The portion here:  
![Image](../../../static/img/Drive-Errors-and-Raid-Failures-RECOVERED/image_3.png)  
is the number of events.

Translated from programming to human, this essentially says "Do not tell me about controller errors unless there are more than 20 of them". 

This could work for Paging Errors or Bad Blocks or really anything you can match.













