---
id: 'ddad0c3b-65e2-436a-bdba-54f696ac5bbb'
slug: /ddad0c3b-65e2-436a-bdba-54f696ac5bbb
title: 'Monitor Override - Change'
title_meta: 'Monitor Override - Change'
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

![Sample Run](../../../static/img/docs/ddad0c3b-65e2-436a-bdba-54f696ac5bbb/image_1.webp)

#### User Parameters

| Name              | Example                                         | Required | Description                                         |
|-------------------|-------------------------------------------------|----------|-----------------------------------------------------|
| Monitor Name      | ProVal - Submitted - AD Recycle Bin State Check | True     | Provide the exact name of the monitor                |
| Alert Template     | Default - Do Nothing                            | True     | The alert name that you would like to set on the agent |

## Process

- Takes input of the Monitor Name and the Alert Template from the user.
- Executes SQL queries to set the override and the alert template.