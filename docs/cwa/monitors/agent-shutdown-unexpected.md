---
id: '749e13b3-d289-4622-87fa-5f1bae94b00d'
slug: /749e13b3-d289-4622-87fa-5f1bae94b00d
title: 'Agent - Shutdown Unexpected'
title_meta: 'Agent - Shutdown Unexpected'
keywords: ['monitor', 'shutdown', 'windows', 'event', 'server']
description: 'This document outlines the implementation of a monitor that detects unexpected shutdowns on Windows machines by tracking event ID 6008. It details the dependencies required for the monitor to function effectively and identifies the target devices for monitoring, primarily focusing on servers but also applicable to workstations if necessary.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This monitor will look for machines with event ID 6008. This Windows event is usually associated with an "Unexpected Shutdown."

## Dependencies

The machine must be a Windows-based device.  
Automate must be gathering event logs into the database for this internal monitor to function.

## Target

Primarily, this monitor targets servers, but it will work properly for workstations if this data is of value to the MSP.  
**Servers** - Should be run on servers  
**Windows Machines** - Should be run on all Windows machines  