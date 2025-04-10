---
id: '6a427581-70ba-456b-8985-f16d9b051c35'
slug: /6a427581-70ba-456b-8985-f16d9b051c35
title: 'AD - Offline Domain Join'
title_meta: 'AD - Offline Domain Join'
keywords: ['domain', 'join', 'offline', 'dc', 'network']
description: 'This document provides a detailed overview of a script that allows a machine to join a domain even when it is not connected to the same network as the Domain Controller (DC). It outlines the variables used, the process involved, and the expected output, highlighting the efficiency gained through automation.'
tags: ['networking', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script joins a machine to a domain while it is not connected to the same network as the DC.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/AD---Offline-Domain-Join/image_1.png)

## Variables

| Variable              | Description                                           |
|-----------------------|-------------------------------------------------------|
| DomainName            | Stores the domain name of the discovered DC.         |
| DomainControllerID    | The DC Computer ID.                                  |
| TargetComputerID      | Stores the Computer ID of the target machine.        |
| TargetName            | Stores the computer name of the target machine.      |

## Process

This script joins a machine to a domain while it is not connected to the same network as the DC. It first checks if the computer has a DC server in its environment. DSJOIN is then used to gather the configuration data from the domain and import it to the target. The target is then checked for success in the offline domain join.

## Output

- Script log


