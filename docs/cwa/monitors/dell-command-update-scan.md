---  
id: 'f42c31ea-ee44-4c51-b7b1-04b595f1368b'
slug: /f42c31ea-ee44-4c51-b7b1-04b595f1368b
title:  'Dell Command Update Scan'
title_meta:  'Dell Command Update Scan'
keywords: ['dell', 'workstation', 'update', 'installation', 'firmware', 'bios', 'driver']  
description:  'This fetches the online Dell Windows agent and executes the Dell Command Handler scanning using script if the deployment EDFs are checked.'
tags: ['bios', 'firmware', 'installation', 'software', 'update', 'windows']  
draft: false  
unlisted: false  
last_update:
  date: 2026-03-12
---

## Summary

This monitor fetches the online Dell Windows agent and executes the Dell Command Handler scanning using [script](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) if the deployment EDFs are checked.

## Dependencies

- [Script - Dell Command Update - Install/Upgrade + Command Handler [DV,Param,Autofix]](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)
- [Solution - Dell Command Update Handler](/docs/5c6d840b-852a-41df-a5e2-08d7d7af564a)

## Target

Global

## Alert Template

- `△ Custom - Execute Script - Dell Command Scan`

## Changelog

### 2026-03-12

- This monitor replaces `Dell Command Update Handler - Run Scan Command` monitor.

### 2025-04-10

- Initial version of the document