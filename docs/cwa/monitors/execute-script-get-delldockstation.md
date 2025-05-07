---
id: '131057f0-24aa-418c-90f7-b0f316a5b9a8'
slug: /131057f0-24aa-418c-90f7-b0f316a5b9a8
title: 'Execute Script - Get-DellDockStation'
title_meta: 'Execute Script - Get-DellDockStation'
keywords: ['dell', 'monitor', 'windows', 'script', 'execution']
description: 'This document outlines the setup of a monitor that executes the Dell Dock Station script on Windows 10 and 11 machines, ensuring it runs if it has not been executed in the last two days. It includes dependencies and alert template details for effective monitoring.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of this monitor is to execute the [Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0) on Windows 10 and 11 Dell machines where it has not been executed in the last two days.

## Dependencies

[CWM - Automate - Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0)

## Target

Windows 10 and 11 machines.

## Alert Template

**Name:** `△ Custom - Execute Script - Get-DellDockStation`

The alert template should execute the [CWM - Automate - Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0) script.
