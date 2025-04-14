---
id: 'd6b85a77-e6bc-4ff1-9279-9d17487655ba'
slug: /d6b85a77-e6bc-4ff1-9279-9d17487655ba
title: 'HP Hardware Monitoring'
title_meta: 'HP Hardware Monitoring'
keywords: ['hp', 'event', 'monitoring', 'servers', 'ticketing']
description: 'This document outlines the process for monitoring HP server event logs using HP Server management software. It details the necessary dependencies, target systems, and ticketing format for alert notifications related to HP hardware issues.'
tags: ['hp', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor looks for several event types and IDs coming from the HP Server management software installed on the HP servers.

The "△ Custom - Ticket Creation - Computer" alert template should be used for proper alerting.

## Dependencies

- HP Insights (HP Server management software) installed properly
  - Pulls event logs generated only when this software is installed and running

## Target

HP servers

## Ticketing

**Subject:** `HP Event Log Errors: %CLIENTNAME%/%COMPUTERNAME%`

**Ticket Body:**  
`HP Hardware Monitoring has detected an issue with %Computername% at %clientname%. The message details are outlined below:`  
`%FIELDNAME%`

**%FIELDNAME%:**  

```
Computer Name: <ComputerName>
Source: <Event Source>

Event ID: <EventID1>
Event Type: Error
Message: <Event Message>
TimeGen: <Time of Generation>

Event ID: <EventID2>
Event Type: Error
Message: <Event Message>
TimeGen: <Time of Generation>

Event ID: <EventID3>
Event Type: Error
Message: <Event Message>
TimeGen: <Time of Generation>

Event ID: <EventIDN>
Event Type: Error
Message: <Event Message>
TimeGen: <Time of Generation>
```

