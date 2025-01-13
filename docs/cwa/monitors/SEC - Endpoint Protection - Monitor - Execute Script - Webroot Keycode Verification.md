---
id: 'cwa-webroot-keycode-verification-monitor'
title: 'Webroot Keycode Verification Monitor'
title_meta: 'Webroot Keycode Verification Monitor - Check Agent Status'
keywords: ['monitor', 'webroot', 'keycode', 'verification', 'agent', 'deployment']
description: 'This document describes the Webroot Keycode Verification Monitor, which checks for online agents where the script has not run in the last 30 days and ensures that Webroot is installed and deployment is enabled. It also covers dependencies and ticketing setup for keycode mismatch detection.'
tags: ['monitor', 'webroot', 'ticketing', 'agent', 'deployment']
draft: false
unlisted: false
---
## Summary

This monitor checks the online agent where the script [EPM - Data Collection - Script - Webroot Keycode Verification](https://proval.itglue.com/DOC-5078775-8223773) has not run in the last 30 days and the agent has Webroot installed and the deployment enabled.

## Dependencies

- [EPM - Data Collection - Script - Webroot Keycode Verification](https://proval.itglue.com/DOC-5078775-8223773)

## Ticketing

- To set up the ticketing for the keycode mismatch detection it is mandatory to set the ticket category in the monitor.  
  ![Ticket Category Setup](..\..\..\static\img\SEC---Endpoint-Protection---Monitor---Execute-Script---Webroot-Keycode-Verification\image_1.png)

## Target

- Global


