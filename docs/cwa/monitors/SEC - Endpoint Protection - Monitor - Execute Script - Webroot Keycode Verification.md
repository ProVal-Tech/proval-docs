---
id: '1c0eae92-6783-4a1c-8c75-6a02571ef9de'
title: 'Webroot Keycode Verification Monitor'
title_meta: 'Webroot Keycode Verification Monitor - Check Agent Status'
keywords: ['monitor', 'webroot', 'keycode', 'verification', 'agent', 'deployment']
description: 'This document describes the Webroot Keycode Verification Monitor, which checks for online agents where the script has not run in the last 30 days and ensures that Webroot is installed and deployment is enabled. It also covers dependencies and ticketing setup for keycode mismatch detection.'
tags: ['deployment', 'ticketing', 'webroot']
draft: false
unlisted: false
---

## Summary

This monitor checks for online agents where the script [EPM - Data Collection - Script - Webroot Keycode Verification](<../scripts/Webroot Keycode Verification.md>) has not run in the last 30 days, and ensures that the agent has Webroot installed and deployment enabled.

## Dependencies

- [EPM - Data Collection - Script - Webroot Keycode Verification](<../scripts/Webroot Keycode Verification.md>)

## Ticketing

- To set up ticketing for keycode mismatch detection, it is mandatory to set the ticket category in the monitor.  
  ![Ticket Category Setup](../../../static/img/SEC---Endpoint-Protection---Monitor---Execute-Script---Webroot-Keycode-Verification/image_1.png)

## Target

- Global
