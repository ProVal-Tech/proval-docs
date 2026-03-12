---
id: 'e27e56f2-f080-4233-ae07-4097ae721dbe'
slug: /e27e56f2-f080-4233-ae07-4097ae721dbe
title: 'CyberCNS Agent Uninstall'
title_meta: 'CyberCNS Agent Uninstall'
keywords: ['cybercns', 'agent', 'uninstallation', 'client', 'edf']
description: 'This monitor detects the online Automate agent where the CyberCNS Agent is installed, and attempts to uninstall the CyberCNS agent from it.'
tags: ['uninstallation', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This monitor detects the online Automate agent where the CyberCNS Agent is installed, and attempts to uninstall the CyberCNS agent from it.

## Dependencies

- [Script - Cybercns Agent Uninstallation](/docs/d4e3e9b3-bdf1-404a-9db0-2c4be4468a5d)
- [Solution - CyberCNS Agent](/docs/f68fc157-ae00-4c3f-bb05-b53cefab28ac)

## Target

- Global

## Implementation

- Import the monitor
- Import the alert template `△ Custom - Execute Script - CyberCNS Agent Uninstall`
- Apply the alert template to the monitor
- Right click on monitor and then click the Run now and reset the monitor
 ![Run](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image6.webp)
  


## Changelog

 ### 2026-03-12

 - Initial version of the document