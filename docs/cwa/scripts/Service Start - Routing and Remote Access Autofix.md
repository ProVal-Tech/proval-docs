---
id: '2ce8cbad-6df7-4d57-bb96-50f43f002491'
title: 'Set RemoteAccess Startup Type to Automatic'
title_meta: 'Set RemoteAccess Startup Type to Automatic'
keywords: ['remoteaccess', 'service', 'startup', 'automatic', 'monitor']
description: 'This document outlines the process to set the startup type of the RemoteAccess service to Automatic and restart the service on endpoints. It includes an alert template and a sample run output for reference.'
tags: ['windows']
draft: false
unlisted: false
---
## Summary

This will set the startup type to Automatic and will restart the RemoteAccess service on endpoints.

Alert Template -  ~Autofix - Set RemoteAccess Startup Type to Auto

This should be called by the monitor [CWM - Automate -Remote Monitor - ProVal - Development - RemoteAccess Service - Set StartType To Auto](<../monitors/RemoteAccess Service Check.md>)

## Sample Run

![Sample Run](../../../static/img/Service-Start---Routing-and-Remote-Access-Autofix/image_1.png)

## Output

Startup Type = Automatic  
Status = Running












