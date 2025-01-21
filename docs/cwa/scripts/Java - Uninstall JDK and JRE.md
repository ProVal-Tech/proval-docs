---
id: '46e361b5-3657-4e5b-800a-858f331b3b8b'
title: 'Java - Uninstall JDK and JRE'
title_meta: 'Java - Uninstall JDK and JRE'
keywords: ['java', 'uninstall', 'script', 'windows', 'software']
description: 'This document details a script designed to check and uninstall all installed versions of Java from a target machine. It automates the process by creating and executing a RemoveJAVA.cmd file, streamlining software management and saving time in system maintenance.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script checks and uninstalls all installed versions of Java from the target machine. It creates a `RemoveJAVA.cmd` file, which is then executed to uninstall Java from the machine.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Java---Uninstall-JDK-and-JRE/image_1.png)

## Dependencies

- Windows OS
- Java Removal Procedure (Agnostic content)

## Variables

- `@SoftwareCnt@` -> The number of versions of Java installed

## Process

1. The script verifies that Java is installed.
2. It counts how many versions of Java are installed on the machine.
3. It writes the required uninstall `RemoveJAVA.cmd` file and runs it.
4. The script loops through each detected Java installation.
5. It verifies that all versions of Java are removed.
   - Logs a failure in the Automate's script logs if any Java installation is still detected.

## Output

- Script log



