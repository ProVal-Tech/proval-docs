---
id: '70bf86a4-3ddf-46b1-947d-e2dc580209a5'
slug: /70bf86a4-3ddf-46b1-947d-e2dc580209a5
title: 'Webroot Keycode Verification EDF'
title_meta: 'Webroot Keycode Verification EDF'
keywords: ['monitor', 'webroot', 'keycode', 'verification', 'agent']
description: 'This document outlines the setup and dependencies for the Webroot Keycode Verification Monitor, which checks for online agents that have not run the specified script in the last 30 days, ensuring that Webroot is installed and deployment is enabled.'
tags: ['deployment', 'ticketing', 'webroot']
draft: false
unlisted: false
---

## Summary

This monitor checks the online agent where the script [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](/docs/2e7517b7-3d3c-47b0-a885-bb8293c55263) has not run in the last 30 days, and the agent has Webroot installed with deployment enabled.

## Dependencies

- [EPM - Data Collection - Script - Webroot Keycode Verification [EDF]](/docs/2e7517b7-3d3c-47b0-a885-bb8293c55263)
- EDFs:
  - Enable Webroot Deployment - Computer EDF
  - Exclude Webroot Deployment - Location EDF
  - Exclude Webroot Deployment - Client EDF

## Ticketing

To set up the ticketing for the keycode mismatch detection, it is mandatory to set the ticket category in the monitor.

![Ticketing Setup](../../../static/img/docs/70bf86a4-3ddf-46b1-947d-e2dc580209a5/image_1_2.webp)

## Target

- Global