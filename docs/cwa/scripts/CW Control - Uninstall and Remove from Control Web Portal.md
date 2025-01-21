---
id: 'd69c20e1-e605-4cf9-bf35-bbe4c74f134f'
title: 'Uninstall CW Control'
title_meta: 'Uninstall CW Control Script'
keywords: ['uninstall', 'cw', 'control', 'rmm', 'script']
description: 'This document details a script designed to uninstall CW Control and utilize the Offboarding - CW Control RMM+ API - EndSession Command to terminate the session from the CW Control web portal, saving approximately 10 minutes through automation.'
tags: ['api', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script will uninstall CW Control and call the [Offboarding - CW Control RMM+ API - EndSession Command](<./ScreenConnect - End Session Command RMM+.md>) script to end the session from the CW Control web portal.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/CW-Control---Uninstall-and-Remove-from-Control-Web-Portal/image_1.png)

## Dependencies

[Offboarding - CW Control RMM+ API - EndSession Command](<./ScreenConnect - End Session Command RMM+.md>)

## Process

- The script will first check if CW Control is installed.
- An attempt will be made to uninstall CW Control using WMIC.
- If the uninstall fails with WMIC, then an attempt will be made to uninstall using LTCommand.
- If the LTCommand uninstall fails, a ticket will be created to denote the failure.
- If any of the above attempts succeed, then the dependent script will be called to remove the machine from the Control web portal.
- If the machine is unable to be removed from the Control portal, then a ticket will be created.

## Output

- Script log
- Ticket if failure found

