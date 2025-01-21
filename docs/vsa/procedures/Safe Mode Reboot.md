---
id: 'e2ceb0d3-d186-4010-b4e5-f2ea582294e3'
title: 'Boot an Endpoint into Safe Mode'
title_meta: 'Boot an Endpoint into Safe Mode'
keywords: ['endpoint', 'safemode', 'reboot', 'windows', 'vsa']
description: 'This document outlines the procedure to boot an endpoint into Safe Mode using the VSA Agent Service. It includes a summary of the process, example logs, and detailed steps to ensure successful execution.'
tags: ['performance', 'reboot', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

Boots an endpoint into Safe Mode.

## Example Agent Procedure Log

| Time                   | Action                                    | Status                         | User                          |
|------------------------|-------------------------------------------|--------------------------------|-------------------------------|
| 1:22:24 PM 28-Oct-22   | Safe Mode Reboot                          | Success THEN                   | provaltech.com/dan.hicks      |
| 1:22:23 PM 28-Oct-22   | Windows - 32 or 64 bit OS                | Success THEN                   | provaltech.com/dan.hicks      |
| 1:22:23 PM 28-Oct-22   | Windows - 32 or 64 bit OS-0011           | Windows OS is 64-bit.         | provaltech.com/dan.hicks      |
| 1:22:16 PM 28-Oct-22   | Run Now - Safe Mode Reboot                | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Safe Mode Reboot to run at Oct 28 2022 1:22 PM |

## Process

Sets the VSA Agent Service to start in Safe Mode, then restarts the endpoint into Safe Boot network.

