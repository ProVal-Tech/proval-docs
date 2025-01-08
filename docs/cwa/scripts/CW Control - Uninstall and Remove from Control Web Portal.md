---
id: 'cwa-uninstall-cw-control'
title: 'Uninstall CW Control'
title_meta: 'Uninstall CW Control Script'
keywords: ['uninstall', 'cw', 'control', 'rmm', 'script']
description: 'This document details a script designed to uninstall CW Control and utilize the Offboarding - CW Control RMM+ API - EndSession Command to terminate the session from the CW Control web portal, saving approximately 10 minutes through automation.'
tags: ['uninstallation', 'ticket', 'api', 'session', 'automation']
draft: false
unlisted: false
---
## Summary

This script will uninstall CW Control and call the [Offboarding - CW Control RMM+ API - EndSession Command](https://proval.itglue.com/DOC-5078775-7721259) script to end the session from the CW Control web portal.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/7770031/images/10821468)

## Dependencies

[Offboarding - CW Control RMM+ API - EndSession Command](https://proval.itglue.com/DOC-5078775-7721259)

## Process

- The script will first check if CW Control is installed or not
- An attempt will be made to uninstall CW Control using WMIC
- If the uninstall fails with wmic then an attempt will be made to uninstall using LTCommand
- If the LTCommand uninstall failed then a ticket will be created to denote the failure
- If any of the above attempts succeeded, then the dependent script will be called to remove the machine from the Control web portal.
- If the machine is unable to be removed from the Control portal, then a ticket will be created

## Output

- Script log
- Ticket if failure found

