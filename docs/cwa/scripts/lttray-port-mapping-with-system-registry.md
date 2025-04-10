---
id: 'cc09c16e-c62b-4001-9226-1b92097a6507'
slug: /cc09c16e-c62b-4001-9226-1b92097a6507
title: 'LTTray Port Mapping with System Registry'
title_meta: 'LTTray Port Mapping with System Registry'
keywords: ['lttray', 'port', 'netstat', 'registry', 'automation']
description: 'This document describes a script designed to resolve the intermittent issue of LTTray not showing by mapping the port number from netstat and the Windows registry. It includes a detailed process overview, sample run, and dependencies for effective implementation.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

This script maps the port number from netstat and the Windows registry of the LTTray, resolving the intermittent issue of LTTray not showing.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/LTTray-Port-Mapping-with-System-Registry/image_1.png)

## Dependencies

[LTTray Detection](/docs/28ddee2c-510a-4557-941a-168d155eacdc)

#### Global Parameters

| Name               | Example | Required | Description                                                                 |
|--------------------|---------|----------|-----------------------------------------------------------------------------|
| Ticket Creation     | 0       | False    | 0 -- No ticket; 1 -- Script will create a ticket for failed attempts       |

#### Script States

| Name              | Example    | Description                                                        |
|-------------------|------------|--------------------------------------------------------------------|
| LTTrayAutofix     | %ticketid% | This script state will store the LTTray ticket record for auto-close and commenting |

## Process

- This script checks for the `ltsvc` process.
- Once found, it checks the port information in netstat.
- It then matches the port value with the registry value.
- If the port value is mismatched, it replaces the registry value with the netstat value.
- After resetting, it checks again to confirm if the value is set properly.
- If there is an issue during resetting, it creates a ticket.

## Output

- Script log
- Script state


