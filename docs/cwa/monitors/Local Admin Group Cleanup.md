---
id: 'd49db584-9380-486d-a179-c014352f8be1'
title: 'Local Admin Group Cleanup Monitoring'
title_meta: 'Local Admin Group Cleanup Monitoring - Detect Unexecuted Cleanup Processes'
keywords: ['monitoring', 'cleanup', 'admin', 'windows', 'script']
description: 'This document outlines the internal monitor that detects Windows computers where the local admin group cleanup process is enabled but has not been executed in the past 7 days. It provides details on dependencies and alert templates for effective monitoring.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

The internal monitor detects Windows computers where the local admin group cleanup process is enabled, but the [Local Admin Group Cleanup - Add/Remove](https://proval.itglue.com/DOC-5078775-16783511) script has not been executed in the past 7 days.

## Dependencies

[EPM - User Management - Script - Local Admin Group Cleanup - Add/Remove](https://proval.itglue.com/DOC-5078775-16783511)

## Target

Global

## Alert Template

**Name:** `△ Custom - Local Admin Group Cleanup`











