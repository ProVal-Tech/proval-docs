---
id: 'fc109cdb-9f88-448b-8c57-b866b2e3c7c2'
slug: /fc109cdb-9f88-448b-8c57-b866b2e3c7c2
title: 'Heartbeat Anomaly Audit'
title_meta: 'Heartbeat Anomaly Audit'
keywords: ['heartbeat', 'monitor', 'ticketing', 'anomaly', 'autotask']
description: "This document outlines the implementation of a monitor that creates a ticket in ProVal's AutoTask Portal when fewer heartbeats than expected are detected from machines checking in within the environment. It includes dependencies, target settings, and ticketing details for alerts."
tags: ['networking', 'security', 'ticketing']
draft: false
unlisted: false
---

## Summary

This monitor is intended to create a ticket in our (ProVal's) AutoTask Portal if there are fewer heartbeats than expected from the machines checking in within the environment.

## Dependencies

[Email RAWSQL Monitor Set Failures* [Autofix]](/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41)  
"△ Custom - Email RAWSQL Monitor set results to ProVal" Alert template should be applied.

## Target

Global - Should be run without explicitly defined targets.

## Ticketing

**Subject**: CWA - Heartbeat Anomaly Detected  

**Body**: It has been detected that more than half of the agents do not appear to be properly updating their heartbeat, which can cause some false positives with offline alerting:

%result%

This typically indicates one of three issues:

1. The Windows Firewall on your Automate Server has UDP port 75 blocked.
2. Your Router/Firewall is not forwarding UDP port 75.
3. Something is obstructing traffic on UDP port 75 (such as an AV/Security Appliance).