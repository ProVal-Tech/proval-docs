---
id: 'cwa_override-monitor-alert'
title: 'Override Monitor Alert Action'
title_meta: 'Override Monitor Alert Action - Custom Alert Configuration'
keywords: ['monitor', 'alert', 'override', 'configuration', 'sql']
description: 'This document provides a detailed overview of a script designed to override the monitor settings applied by a group, allowing for custom alert actions on agents. It includes user parameters, a sample run, and a step-by-step process for executing the script.'
tags: ['configuration', 'alert', 'monitor', 'sql', 'windows']
draft: false
unlisted: false
---
## Summary

This script helps to override the monitor which is being applied by a group and where you would like to set the alert action different than the existing group agents.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Monitor-Override---Change/image_1.png)

#### User Parameters

| Name              | Example                                         | Required | Description                                         |
|-------------------|-------------------------------------------------|----------|-----------------------------------------------------|
| Monitor Name      | ProVal - Submitted - AD Recycle Bin State Check | True     | Provide the exact same monitor name                  |
| Alert Template     | Default - Do Nothing                            | True     | The alert name which you would like to set on the agent |

## Process

- Takes input of Monitor Name and the alert template from the user
- Executes SQL queries to set the override and the alert template




