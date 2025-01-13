---
id: 'cwa-detect-offline-servers'
title: 'Detect Offline Servers'
title_meta: 'Detect Offline Servers'
keywords: ['monitor', 'offline', 'servers', 'heartbeat', 'contact']
description: 'This document details an internal monitor designed to detect offline servers based on their last contact and heartbeat time with the RMM. It includes information on dependencies, properties, and target systems.'
tags: ['monitoring', 'windows', 'networking', 'rmm', 'performance']
draft: false
unlisted: false
---
## Summary

This internal monitor detects offline servers based on the last contact and last heartbeat time with the RMM.

## Dependencies

[CWM - Automate - Script - Agent - Remote Repair - RMM +](https://proval.itglue.com/DOC-5078775-12439587)

## Properties

| Name            | Example | Required | Description                                                                                                                                               |
|-----------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| OfflineThreshold | 11      | False    | This monitor detects the value of the offlineThreshold property. If not found, it inserts the value to 11 by default to the property.                     |

## Target

Windows Server



