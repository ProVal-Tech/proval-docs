---
id: '5c6b4bbb-732d-4d97-af38-f10d51a8a96c'
slug: /5c6b4bbb-732d-4d97-af38-f10d51a8a96c
title: 'Ticket Creation - HP iLO Health Check'
title_meta: 'Ticket Creation - HP iLO Health Check'
keywords: ['automation', 'ticketing', 'monitoring', 'client', 'server']
description: 'This document provides an overview of an auto-fix script designed for the HP iLO Health Check monitor, which automatically generates tickets in Automate for detected devices or servers, enhancing efficiency in ticket management.'
tags: []
draft: false
unlisted: false
---

## Summary

This is an auto-fix script used by the [EPM - Vendor Specific - Solution - HP iLO Health Check](/docs/7bd9dad1-d463-468b-a3b1-2eef8e060352) monitor set to manage ticketing.

The script's primary function is to automatically generate a computer-level ticket when a device or server is detected in Automate. By comparing the name set in the 'iLO Automation Password' entry with the available client computers, it swiftly identifies matches and initiates ticket creation for the corresponding computer. In cases where no match is found, it seamlessly generates a client-level ticket.

## Sample Run

The script should be executed from the `△ Custom - Ticket Creation - HP iLO Health Check` alert template only.

## Dependencies

[EPM - Vendor Specific - Solution - HP iLO Health Check](/docs/7bd9dad1-d463-468b-a3b1-2eef8e060352)

## Output

- Script Log
- Ticket

