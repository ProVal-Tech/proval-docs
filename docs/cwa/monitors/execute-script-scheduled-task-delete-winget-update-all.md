---
id: 'dc75761e-6b11-40be-973e-e01290c8c134'
slug: /dc75761e-6b11-40be-973e-e01290c8c134
title: 'Execute Script - Scheduled Task - Delete - Winget Update All'
title_meta: 'Execute Script - Scheduled Task - Delete - Winget Update All'
keywords: ['windows', 'monitor', 'task', 'winget', 'update', 'client']
description: 'This document details the internal monitor that identifies Windows 10 and 11 computers with existing Winget Update tasks, while ensuring that task creation is enabled at the appropriate levels. It outlines the dependencies and target for the associated alert template.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

The internal monitor identifies Windows 10 and 11 computers where either the `Winget Update All [Logged on User]` or `Winget Update All [System]` tasks exist, but task creation is disabled either at the computer or the location level, or task creation is not enabled at the client level.

Task creation settings are controlled by the Extra Data Fields outlined in the [Script - Scheduled Task - Create - Winget Update All [Autofix]](/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1) document.

## Dependencies

- [Script - Scheduled Task - Create - Winget Update All [Autofix]](/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1)
- [Script - Scheduled Task - Delete - Winget Update All [Autofix]](/docs/23d4e4bf-1a80-4db0-983b-99da88e8ba34)

## Target

Global

## Alert Template

**Name:** △ Custom - Execute Script - Scheduled Task - Delete - Winget Update All

The alert template executes the [Script - Scheduled Task - Delete - Winget Update All [Autofix]](/docs/23d4e4bf-1a80-4db0-983b-99da88e8ba34) against the detected machines.


