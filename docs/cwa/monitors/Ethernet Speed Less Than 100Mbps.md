---
id: '69ce4eef-6126-486a-9b28-8626f847754e'
title: 'Ethernet Speed Monitor'
title_meta: 'Ethernet Speed Monitor for Network Performance'
keywords: ['ethernet', 'monitor', 'network', 'performance', 'ticket']
description: 'This document outlines a monitor designed to detect and create tickets when an agent reports an Ethernet adapter running at speeds less than 100Mbps. It addresses common issues like bad cable connections or malfunctioning devices that can lead to reduced network performance.'
tags: ['networking', 'windows', 'performance', 'alert', 'ticket']
draft: false
unlisted: false
---
## Summary

This monitor is designed to detect and ticket when an agent is reporting an Ethernet adapter is running at a speed less than 100Mbps. Normally customers do not have networks that are intended to run under 100Mbps, however, negotiated speeds can end up at 10Mbps due to a bad cable connection or malfunctioning phone that needs to be rebooted.

## Dependencies

There are no dependencies that are required for this monitor to work.

## Target

- Windows Workstations
- Windows Servers

## Suggested Alert Template

Apply the `△ Custom - Ticket Creation Computer` alert template unless otherwise specified.







