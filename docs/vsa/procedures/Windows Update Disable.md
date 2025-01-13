---
id: 'vsa-disable-windows-update'
title: 'Disable Windows Update using Registry'
title_meta: 'Disable Windows Update using Registry'
keywords: ['windows', 'update', 'registry', 'disable', 'configuration']
description: 'This document provides a detailed procedure for disabling Windows Update through registry modifications. It includes example logs from the agent procedure, outlining the steps taken to change registry settings and verify success.'
tags: ['windows', 'configuration', 'registry', 'security']
draft: false
unlisted: false
---
## Summary

Disables Windows Update using Registry.

## Example Agent Procedure Log

1:51:45 pm 24-Jan-23   Disable Windows Update   Success THEN   provaltech.com/dan.hicks  
1:51:45 pm 24-Jan-23   Disable Windows Update-0003   Registry in the expected state. Procedure successful.   provaltech.com/dan.hicks  
1:51:44 pm 24-Jan-23   Disable Windows Update   Checking for successful completion...   provaltech.com/dan.hicks  
1:51:44 pm 24-Jan-23   Disable Windows Update-0001   'AUOptions exists. Removing value from the registry.   provaltech.com/dan.hicks  
1:51:43 pm 24-Jan-23   Disable Windows Update   Checking for 'AUOptions'   provaltech.com/dan.hicks  
1:51:43 pm 24-Jan-23   Disable Windows Update   Setting 'NoAutoUpdate' to 1   provaltech.com/dan.hicks  
1:51:35 pm 24-Jan-23   Run Now - Disable Windows Update   Admin provaltech.com/dan.hicks scheduled procedure Run Now - Disable Windows Update to run at Jan 24 2023 1:51PM  

## Process

Sets HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate to 1 (DWORD)  
Deletes HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\AUOptions if it exists.  
Checks for success after changes.  

## Output

Agent Procedure Log  



