---
id: 'd49db584-9380-486d-a179-c014352f8be1'
slug: /d49db584-9380-486d-a179-c014352f8be1
title: 'Local Admin Group Cleanup'
title_meta: 'Local Admin Group Cleanup'
keywords: ['monitoring', 'cleanup', 'admin', 'windows', 'script']
description: 'This document outlines the internal monitor that detects Windows computers where the local admin group cleanup process is enabled but has not been executed in the past 7 days. It provides details on dependencies and alert templates for effective monitoring.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The internal monitor detects Windows computers where the local admin group cleanup process is enabled, but the [Local Admin Group Cleanup - Add/Remove](<../scripts/Local Admin Group Cleanup - AddRemove.md>) script has not been executed in the past 7 days.

## Dependencies

[EPM - User Management - Script - Local Admin Group Cleanup - Add/Remove](<../scripts/Local Admin Group Cleanup - AddRemove.md>)

## Target

Global

## Alert Template

**Name:** `△ Custom - Local Admin Group Cleanup`