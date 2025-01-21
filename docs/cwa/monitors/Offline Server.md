---
id: 'f0a04369-c67b-49e1-a042-8ca3a343881f'
title: 'Offline Server'
title_meta: 'Offline Server'
keywords: ['monitor', 'offline', 'servers', 'heartbeat', 'contact']
description: 'This document details an internal monitor designed to detect offline servers based on their last contact and heartbeat time with the RMM. It includes information on dependencies, properties, and target systems.'
tags: ['networking', 'performance', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor detects offline servers based on the last contact and last heartbeat time with the RMM.

## Dependencies

[CWM - Automate - Script - Agent - Remote Repair - RMM +](<../scripts/Agent - Remote Repair - RMM +.md>)

## Properties

| Name             | Example | Required | Description                                                                                                                                               |
|------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| OfflineThreshold  | 11      | False    | This monitor detects the value of the OfflineThreshold property. If not found, it defaults to a value of 11 for the property.                             |

## Target

Windows Server



