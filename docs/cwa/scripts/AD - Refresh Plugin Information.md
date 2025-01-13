---
id: 'cwa-reset-ad-plugin'
title: 'Reset AD Plugin for Domain Controller'
title_meta: 'Reset AD Plugin for Domain Controller'
keywords: ['active-directory', 'plugin', 'synchronize', 'labtech', 'command']
description: 'This document outlines a script designed to reset the Active Directory plugin for the Domain Controller it operates on, detailing the process and expected time savings from automation.'
tags: ['active-directory', 'labtech', 'plugin', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script will reset the AD plugin for the DC it runs on.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/AD---Refresh-Plugin-Information/image_1.png)

## Process

- Runs LabTech Command 13 to reset the AD plugin on the DC
- Run another LabTech command "update plugins" to synchronize plugin data on the agent.




