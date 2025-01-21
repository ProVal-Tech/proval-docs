---
id: '960ebb92-13ba-4d19-9b02-5e0ce55db592'
title: 'Move Agent to Retired Assets'
title_meta: 'Move Agent to Retired Assets - Automate Agent Management'
keywords: ['agent', 'retired', 'assets', 'sql', 'monitor']
description: 'This document describes a script designed to move an agent to retired assets automatically. It serves as an autofix for retiring agents, saving approximately 3 minutes of manual work. The script should only be executed through the monitor, not manually.'
tags: ['database', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script will move the agent it is run against to retired assets. This can be used as an autofix to automatically retire agents.

**Time Saved by Automation:** 3 Minutes

**Note:** This should not be run manually; it should only be run through the monitor.

## Sample Run

![Sample Run](../../../static/img/Move-Agent-to-Retired-Assets-Autofix/image_1.png)

## Process

This script runs a SQL query against the machine to retire it.
