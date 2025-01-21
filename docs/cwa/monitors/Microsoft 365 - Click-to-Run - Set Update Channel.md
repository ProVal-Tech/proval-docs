---
id: '44e0a674-9e54-47ad-be29-6c93611db0b2'
title: 'Microsoft 365 - Click-to-Run - Set Update Channel'
title_meta: 'Microsoft 365 - Click-to-Run - Set Update Channel'
keywords: ['microsoft', 'update', 'channel', 'audit', 'click-to-run']
description: 'This document outlines how to detect computers with differing Microsoft 365 update channels as set in the Client or Computer Level Update Channel. It requires Microsoft 365 Click-to-Run installation and a managed patch policy.'
tags: ['software', 'update']
draft: false
unlisted: false
---

## Summary

The internal monitor detects computers where the Microsoft 365 update channel is different from what is set in the Client or Computer Level `Update Channel`. The computer must have Microsoft 365 Click-to-Run installed and a managed patch policy applied.

## Dependencies

- [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- [SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit](<../../unsorted/SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit.md>)
- [SWM - Software Configuration - Script - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17164646)

## Target

Global

## Alert Template

**Name:** `△ Custom - Microsoft 365 - Click-to-Run - Set Update Channel`



