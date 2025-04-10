---
id: '4d27ff0e-704d-47dd-8c07-3008b7fbfafb'
slug: /4d27ff0e-704d-47dd-8c07-3008b7fbfafb
title: 'HP iLO Credential Missing Detection'
title_meta: 'HP iLO Credential Missing Detection'
keywords: ['client', 'script', 'hp', 'ilo', 'ticketing']
description: 'This document provides a client script designed to create tickets for clients with HP Servers that have HP iLO enabled but lack credentials. It includes instructions for implementation, dependencies, and expected output.'
tags: []
draft: false
unlisted: false
---

## Summary

This is a client script that creates tickets for all clients who have an HP Server with HP iLO enabled but are missing credentials.

Flag the Computer-Level EDF `Exclude From HPE iLO Monitoring` to exclude a computer/server from generating a ticket.

## Sample Run

![Sample Run](../../../static/img/HP-iLO-Credential-Missing-Detection/image_1.png)

## Dependencies

- Computer-Level EDF - Exclude From HPE iLO Monitoring

## Implementation

- Import the script.
- After importing, please reload the system cache and refresh the scripts to have the EDF automatically imported with the script.
- Schedule it from the dashboard -> Scheduled Client Scripts.  
  Note: This is an optional feature. Please ensure the client wants ticketing for the missing credentials alerting.

## Output

- Script log
- Ticket


