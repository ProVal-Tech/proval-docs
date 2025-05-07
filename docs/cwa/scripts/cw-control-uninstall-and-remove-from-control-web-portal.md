---
id: 'd69c20e1-e605-4cf9-bf35-bbe4c74f134f'
slug: /d69c20e1-e605-4cf9-bf35-bbe4c74f134f
title: 'CW Control - Uninstall and Remove from Control Web Portal'
title_meta: 'CW Control - Uninstall and Remove from Control Web Portal'
keywords: ['uninstall', 'cw', 'control', 'rmm', 'script']
description: 'This document details a script designed to uninstall CW Control and utilize the Offboarding - CW Control RMM+ API - EndSession Command to terminate the session from the CW Control web portal, saving approximately 10 minutes through automation.'
tags: ['api', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script will uninstall CW Control and call the [Offboarding - CW Control RMM+ API - EndSession Command](/docs/6357c957-b5b6-42eb-aacc-f4f2a12d3021) script to end the session from the CW Control web portal.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/d69c20e1-e605-4cf9-bf35-bbe4c74f134f/image_1.webp)

## Dependencies

[Offboarding - CW Control RMM+ API - EndSession Command](/docs/6357c957-b5b6-42eb-aacc-f4f2a12d3021)

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
