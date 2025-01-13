---
id: 'cwa-execute-script-user-profile-get-information'
title: 'Execute Script for User Profile Information on Windows Machines'
title_meta: 'Execute Script for User Profile Information on Windows Machines'
keywords: ['execute', 'script', 'user', 'profile', 'information', 'windows']
description: 'This document outlines an internal monitor that executes a specific script to retrieve user profile information from online Windows machines, excluding servers. The script is executed only if it has not been run in the last 7 days, ensuring timely updates on user profile data.'
tags: ['windows', 'script', 'monitor', 'alert', 'execution']
draft: false
unlisted: false
---
## Summary

This internal monitor executes the [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) script on online Windows machines except Servers. It will execute the script on the machines where it has not been executed for more than 07 days.

## Dependencies

[EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496)

## Target

Windows Machines excluding DC servers

## Alert Template

**Name:** `△ Custom - Execute Script - Windows - User Profile - Get Information`  

The alert template should execute the [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) script.


