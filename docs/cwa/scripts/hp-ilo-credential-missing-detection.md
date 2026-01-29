---
id: '4d27ff0e-704d-47dd-8c07-3008b7fbfafb'
slug: /4d27ff0e-704d-47dd-8c07-3008b7fbfafb
title: 'HP iLO Credential Missing Detection [Ticket]'
title_meta: 'HP iLO Credential Missing Detection [Ticket]'
keywords: ['client', 'script', 'hp', 'ilo', 'ticketing']
description: 'This document provides a client script designed to create tickets for clients with HP Servers that have HP iLO enabled but lack credentials. It includes instructions for implementation, dependencies, and expected output.'
tags: ['networking', 'security', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This is a client script that creates tickets for all clients who have an HP Server with HP iLO enabled but are missing credentials.

Flag the Computer-Level EDF `Exclude From HPE iLO Monitoring` to exclude a computer/server from generating a ticket.

## Sample Run

![Sample Run](../../../static/img/docs/4d27ff0e-704d-47dd-8c07-3008b7fbfafb/image_1.webp)

## Dependencies

- [Solution - HP iLO Health Check](/docs/7bd9dad1-d463-468b-a3b1-2eef8e060352)


## Implementation

- Import the script.
- After importing, please reload the system cache and refresh the scripts to have the EDF automatically imported with the script.
- Schedule it from the dashboard -> Scheduled Client Scripts.  
  Note: This is an optional feature. Please ensure the client wants ticketing for the missing credentials alerting.

## Output

- Script log
- Ticket