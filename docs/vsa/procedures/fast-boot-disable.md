---
id: 'd0e2ff26-8148-47fc-a482-af212c9659db'
slug: /d0e2ff26-8148-47fc-a482-af212c9659db
title: 'Fast Boot Disable'
title_meta: 'Fast Boot Disable'
keywords: ['fast', 'boot', 'disable', 'windows', 'registry']
description: 'This document provides a detailed guide on disabling fast boot in Windows through registry modifications. It includes sample runs, processes involved, and output logs to ensure successful execution.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the steps to disable fast boot in the Windows registry.

## Sample Run

| Time                    | Action                    | Status                                                                 | User                        |
|-------------------------|---------------------------|------------------------------------------------------------------------|-----------------------------|
| 11:39:23 am 3-May-22   | Fast Startup Disable       | Success THEN                                                          | provaltech.com/dan.hicks    |
| 11:39:23 am 3-May-22   | Fast Startup Disable       | Fast Boot Disabled. Please reboot this endpoint when convenient for settings to take effect. | provaltech.com/dan.hicks    |
| 11:39:15 am 3-May-22   | Run Now - Fast Startup Disable | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Fast Startup Disable to run at May 3, 2022, 11:39 AM |                             |

## Process

The following command is executed:  
`REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d "0" /f`

## Output

- Agent Procedure Log

## Export Attachment

Attach the content XML VSA Export to this document.

