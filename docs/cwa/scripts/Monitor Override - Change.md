---
id: 'ddad0c3b-65e2-436a-bdba-54f696ac5bbb'
title: 'Override Monitor Alert Action'
title_meta: 'Override Monitor Alert Action - Custom Alert Configuration'
keywords: ['monitor', 'alert', 'override', 'configuration', 'sql']
description: 'This document provides a detailed overview of a script designed to override the monitor settings applied by a group, allowing for custom alert actions on agents. It includes user parameters, a sample run, and a step-by-step process for executing the script.'
tags: ['sql', 'windows']
draft: false
unlisted: false
---

## Summary

This script helps to override the monitor settings applied by a group, allowing you to set a different alert action than the existing group agents.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Monitor-Override---Change/image_1.png)

#### User Parameters

| Name              | Example                                         | Required | Description                                         |
|-------------------|-------------------------------------------------|----------|-----------------------------------------------------|
| Monitor Name      | ProVal - Submitted - AD Recycle Bin State Check | True     | Provide the exact name of the monitor                |
| Alert Template     | Default - Do Nothing                            | True     | The alert name that you would like to set on the agent |

## Process

- Takes input of the Monitor Name and the Alert Template from the user.
- Executes SQL queries to set the override and the alert template.

