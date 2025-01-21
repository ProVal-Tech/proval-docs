---
id: '7940894c-700c-442d-b0ba-0f197548a8fd'
title: 'Uninstall Symantec Endpoint Protection'
title_meta: 'Uninstall Symantec Endpoint Protection using PowerShell'
keywords: ['uninstall', 'symantec', 'endpoint', 'protection', 'script']
description: 'This document provides a PowerShell script designed to uninstall Symantec Endpoint Protection from a target machine, detailing the process, dependencies, and expected output.'
tags: ['security', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script attempts to uninstall Symantec Endpoint Protection by running a PowerShell command.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Symantec-Endpoint-Protection-Uninstaller/image_1.png)

## Dependencies

- Symantec Endpoint Protection must be installed on the target machine.

## Variables

- `@Result@` -> The output results of the PowerShell command.

## Process

1. The script will not run unless Symantec Endpoint Protection is detected.
2. It executes a PowerShell script attempting to uninstall Symantec Endpoint Protection.
3. Logs the results in Automate's script logs.
4. Verifies that the software has been removed.
   1. If Symantec Endpoint Protection is still detected in Automate, it logs a failure in Automate.

## Output

- Script log.

