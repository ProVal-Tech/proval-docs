---
id: '3d5b37dc-7ea4-4d06-a83d-7acdf91b8e1c'
title: 'Huntress - Managed EDR - Uninstall'
title_meta: 'Huntress - Managed EDR - Uninstall'
keywords: ['uninstall', 'huntress', 'edr', 'agent', 'procedure']
description: 'This document outlines the agent procedure for uninstalling the Huntress EDR agent, updater, and related components. It provides a detailed implementation guide, including dependencies, process steps, and output log locations for successful uninstallation.'
tags: ['cleanup', 'logging', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure will uninstall the Huntress EDR agent, Huntress updater, and Rio.

## Implementation

This agent procedure is designed as a template and meant to be exported.  
**Name:** Huntress - Managed EDR - Uninstall  

![Image](../../../static/img/Huntress---Managed-EDR---Uninstall/image_1.png)  

The agent procedure requires no customization.  

![Image](../../../static/img/Huntress---Managed-EDR---Uninstall/image_2.png)  

## Dependencies

[Vendor Provided Uninstall Script](https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1)

## Process

1. The agent procedure pushes a script to the endpoint.
2. Data is logged regarding the current installation detected.
3. Services for Huntress are stopped.
4. Executables for Huntress are terminated.
5. The built-in uninstaller is run on the machine, silently.
6. The uninstall will loop until all Huntress assets are successfully removed, or it will exit and report if the timer exceeds 15 seconds.
7. Manual cleanup of the Huntress folder after the uninstall completes.
8. Manual cleanup of Huntress registry keys after the uninstall completes.

## Output

`%SystemRoot%/temp/HuntressPoShInstaller.log`  
`%TEMP%/HuntressPoShInstaller.log`  
Agent Procedure Log

