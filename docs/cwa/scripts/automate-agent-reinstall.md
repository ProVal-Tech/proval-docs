---
id: '567b8db7-a87a-45c1-a81a-b3178090fb52'
slug: /567b8db7-a87a-45c1-a81a-b3178090fb52
title: 'Automate Agent - Reinstall'
title_meta: 'Automate Agent - Reinstall'
keywords: ['uninstall', 'reinstall', 'cwa', 'agent', 'connectwise']
description: 'This document provides a comprehensive guide on using a script to perform a full uninstall and reinstall of the CWA Agent on target machines through the ConnectWise Control RMM+ add-in, including dependencies and system properties required for execution.'
tags: ['connectwise', 'windows']
draft: false
unlisted: false
---

## Summary

This script is used to perform a full uninstall and reinstall of the CWA Agent on the target machine through the ConnectWise Control RMM+ add-in.

**Time Saved by Automation:** 5 Minutes

## Sample Run

**Target:** Windows and Mac agents

![Sample Run](../../../static/img/Automate-Agent---Reinstall/image_1.png)

## Dependencies

- LTPoSH Community Module ([https://bit.ly/LTPoSH](https://bit.ly/LTPoSH))
- [CW RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246)
- [CWM - Control - Script - ScreenConnect Client - Connectivity - Audit*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458)
- [CWM - Control - Script - ScreenConnect Client - Command - Execute*](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6)
- Agent - Generate Location Installer URL*

#### System Properties

| Name                          | Example                                    | Required | Description                                                                                                                                   |
|-------------------------------|--------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| RMMPlus_AccessKey             | ajw8fh2p93ufn;o31ifu2091j23oif            | True     | This is the key set up in the CW Control RMM+ Plugin so Automate can reach out to gain access to the API.                                   |
| RMMPlus_Headers               | Origin: [site.site.com](http://site.site.com) | True     | This is the URL (without http/https) for the CW Control server. This value needs to match the value in the RMM+ Plugin configuration in CW Control. |
| RMMPlus_StaleAgentThreshold   | 30                                         | True     | The number of days to indicate what a "stale" agent is to the scripts. 30 is the default.                                                  |
| RMMPlus_Timeout               | 1000                                       | True     | The default timeout for commands run via RMM+ through Automate. 1000 is the default.                                                      |

## Output

- Script log messages only.


