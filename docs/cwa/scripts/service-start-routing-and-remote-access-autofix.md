---
id: '2ce8cbad-6df7-4d57-bb96-50f43f002491'
slug: /2ce8cbad-6df7-4d57-bb96-50f43f002491
title: 'Service Start - Routing and Remote Access Autofix'
title_meta: 'Service Start - Routing and Remote Access Autofix'
keywords: ['remoteaccess', 'service', 'startup', 'automatic', 'monitor']
description: 'This document outlines the process to set the startup type of the RemoteAccess service to Automatic and restart the service on endpoints. It includes an alert template and a sample run output for reference.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document describes how to set the startup type to Automatic and restart the RemoteAccess service on endpoints.

### Alert Template

- Autofix - Set RemoteAccess Startup Type to Auto

This should be called by the monitor [CWM - Automate - Remote Monitor - ProVal - Development - RemoteAccess Service - Set StartType To Auto](/docs/487873f8-4b59-47bc-b938-c64903898d8a).

## Sample Run

![Sample Run](../../../static/img/docs/2ce8cbad-6df7-4d57-bb96-50f43f002491/image_1.webp)

## Output

- Startup Type: Automatic  
- Status: Running