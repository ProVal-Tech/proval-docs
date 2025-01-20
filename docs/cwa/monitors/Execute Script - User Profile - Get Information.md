---
id: '36a5ce5d-5c24-4fe0-9dc7-bc6fc429f4a1'
title: 'Execute Script for User Profile Information on Windows Machines'
title_meta: 'Execute Script for User Profile Information on Windows Machines'
keywords: ['execute', 'script', 'user', 'profile', 'information', 'windows']
description: 'This document outlines an internal monitor that executes a specific script to retrieve user profile information from online Windows machines, excluding servers. The script is executed only if it has not been run in the last 7 days, ensuring timely updates on user profile data.'
tags: ['windows']
draft: false
unlisted: false
---
## Summary

This internal monitor executes the [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>) script on online Windows machines except Servers. It will execute the script on the machines where it has not been executed for more than 07 days.

## Dependencies

[EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>)

## Target

Windows Machines excluding DC servers

## Alert Template

**Name:** `△ Custom - Execute Script - Windows - User Profile - Get Information`  

The alert template should execute the [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>) script.













