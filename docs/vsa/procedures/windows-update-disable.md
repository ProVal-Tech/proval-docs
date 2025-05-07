---
id: '23ff7552-2521-43f5-9b6a-bb090a2b5ae6'
slug: /23ff7552-2521-43f5-9b6a-bb090a2b5ae6
title: 'Windows Update Disable'
title_meta: 'Windows Update Disable'
keywords: ['windows', 'update', 'registry', 'disable', 'configuration']
description: 'This document provides a detailed procedure for disabling Windows Update through registry modifications. It includes example logs from the agent procedure, outlining the steps taken to change registry settings and verify success.'
tags: ['registry', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the procedure to disable Windows Update using the Windows Registry.

## Example Agent Procedure Log

- **1:51:45 PM 24-Jan-23**   Disable Windows Update   Success  
  provaltech.com/dan.hicks  
- **1:51:45 PM 24-Jan-23**   Disable Windows Update-0003   Registry in the expected state. Procedure successful.  
  provaltech.com/dan.hicks  
- **1:51:44 PM 24-Jan-23**   Disable Windows Update   Checking for successful completion...  
  provaltech.com/dan.hicks  
- **1:51:44 PM 24-Jan-23**   Disable Windows Update-0001   'AUOptions' exists. Removing value from the registry.  
  provaltech.com/dan.hicks  
- **1:51:43 PM 24-Jan-23**   Disable Windows Update   Checking for 'AUOptions'  
  provaltech.com/dan.hicks  
- **1:51:43 PM 24-Jan-23**   Disable Windows Update   Setting 'NoAutoUpdate' to 1  
  provaltech.com/dan.hicks  
- **1:51:35 PM 24-Jan-23**   Run Now - Disable Windows Update   Admin provaltech.com/dan.hicks scheduled procedure Run Now - Disable Windows Update to run at Jan 24 2023 1:51 PM  

## Process

1. Set `HKEY_LOCAL_MACHINE/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU/NoAutoUpdate` to `1` (DWORD).
2. Delete `HKEY_LOCAL_MACHINE/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU/AUOptions` if it exists.
3. Check for success after changes.

## Output

Agent Procedure Log
