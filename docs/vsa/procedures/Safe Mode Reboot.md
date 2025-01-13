---
id: 'vsa_boots-endpoint-into-safemode'
title: 'Boots an Endpoint into Safe Mode'
title_meta: 'Boots an Endpoint into Safe Mode'
keywords: ['endpoint', 'safemode', 'reboot', 'windows', 'vsa']
description: 'This document outlines the procedure to boot an endpoint into Safe Mode using the VSA Agent Service. It includes a summary of the process, example logs, and detailed steps to ensure successful execution.'
tags: ['windows', 'reboot', 'setup', 'performance', 'configuration']
draft: false
unlisted: false
---
## Summary

Boots an endpoint into safemode.

## Example Agent Procedure Log

| Time                   | Action                                    | Status                         | User                          |
|------------------------|-------------------------------------------|--------------------------------|-------------------------------|
| 1:22:24 pm 28-Oct-22   | Safe Mode Reboot                          | Success THEN                   | provaltech.com/dan.hicks      |
| 1:22:23 pm 28-Oct-22   | Windows - 32 or 64 bit OS                | Success THEN                   | provaltech.com/dan.hicks      |
| 1:22:23 pm 28-Oct-22   | Windows - 32 or 64 bit OS-0011           | Windows OS is 64-bit.         | provaltech.com/dan.hicks      |
| 1:22:16 pm 28-Oct-22   | Run Now - Safe Mode Reboot                | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Safe Mode Reboot to run at Oct 28 2022 1:22PM |

## Process

Sets the VSA Agent Service to start in safe mode, then restarts the endpoint into safeboot network.


