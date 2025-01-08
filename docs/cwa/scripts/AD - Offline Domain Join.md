---
id: 'cwa-join-machine-to-domain-offline'
title: 'Join a Machine to a Domain Offline'
title_meta: 'Join a Machine to a Domain Offline'
keywords: ['domain', 'join', 'offline', 'dc', 'network']
description: 'This document provides a detailed overview of a script that allows a machine to join a domain even when it is not connected to the same network as the Domain Controller (DC). It outlines the variables used, the process involved, and the expected output, highlighting the efficiency gained through automation.'
tags: ['configuration', 'networking', 'windows', 'setup', 'security']
draft: false
unlisted: false
---
## Summary

This script joins a machine to a domain while it is not connected to the same network as the DC.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8165864/images/11377381)

## Variables

| Variable              | Description                                           |
|-----------------------|-------------------------------------------------------|
| DomainName            | It stores the domain name of the discovered DC.      |
| DomainControllerID    | The DC ComputerID.                                   |
| TargetComputerID      | This stores the ComputerID of the target machine.    |
| TargetName            | This stores the computer name of the target machine.  |

## Process

This script joins a machine to a domain while it is not connected to the same network as the DC.  
It first checks the computer has DC server in their environment.  
DSJOIN is then used to gather the configuration data from the domain and import it to the target.  
The target is then checked for success in the offline domain join.

## Output

- Script log


