---
id: '9b06cea7-e39b-46f2-ac30-3d8b5fc6339b'
slug: /9b06cea7-e39b-46f2-ac30-3d8b5fc6339b
title: 'MimiKatz Registry Disable'
title_meta: 'MimiKatz Registry Disable'
keywords: ['autofix', 'mimikatz', 'vulnerability', 'registry', 'monitor', 'ticketing']
description: 'This document provides an overview of an autofix script designed to disable the MimiKatz registry setting if a monitor detects it is enabled. The script is integrated with ticketing to manage service requests and logs its actions for review.'
tags: ['registry', 'security', 'ticketing']
draft: false
unlisted: false
---

## Summary

This autofix script needs to be set up with the monitor @ProVal - Production - Security - Potential MimiKatz Vulnerable System. The script will disable the MimiKatz registry if the monitor finds it enabled.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/9b06cea7-e39b-46f2-ac30-3d8b5fc6339b/image_1.png)

## Dependencies

- @ProVal - Production - Security - Potential MimiKatz Vulnerable System

#### Global Parameters

| Name                     | Example | Required | Description                                          |
|--------------------------|---------|----------|------------------------------------------------------|
| Enable Ticketing         | 1       | False    | If you want ticketing enabled, set it to 1         |
| TicketCreationCategory    | 120     | False    | Helps in managing the service board for tickets     |

## Process

- Set the registry value for "HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/SecurityProviders/WDigest/UseLogonCredential" to 0.
- Verify if the changes are successfully made.
- By default, ticketing is enabled, so success or failure tickets are sent for attention.

## Output

- Script log
- Ticket

