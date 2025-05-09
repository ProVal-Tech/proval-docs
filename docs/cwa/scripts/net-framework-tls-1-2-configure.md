---
id: '6e1cf3df-873f-4201-9757-215af858d7bb'
slug: /6e1cf3df-873f-4201-9757-215af858d7bb
title: '.Net Framework - TLS 1.2 - Configure'
title_meta: '.Net Framework - TLS 1.2 - Configure'
keywords: ['registry', 'dotnet', 'strongcrypto', 'reboot', 'ticket']
description: 'This document outlines a script that sets the required registry values to configure "SchUseStrongCrypto" for the .Net Framework. A reboot is required after adding the registry keys. The script is designed to be executed as an autofix script from ConnectWise Automate, ensuring proper configuration and ticket management for reboots.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script sets the required registry values to configure "SchUseStrongCrypto" for the .Net Framework.  
**A reboot is required after adding the registry keys.**

## Variables

| Name    | Description                                                                                            |
| ------- | ------------------------------------------------------------------------------------------------------ |
| OutCome | Output of PowerShell script executing to add those registry keys                                       |
| Subject | Subject of the ticket                                                                                  |
| Body    | Ticket Body                                                                                            |
| Tickid  | Ticket ID of the existing open/new ticket, to add a comment instead of creating a new ticket each run. |

## Process

- Adds/Updates the registry keys.
- Verifies the outcome. 
- Creates a ticket for the servers to reboot at the earliest convenience and will mark the `Pending Reboot` EDF for the workstation. Marking the EDF will initiate the Dynamic Reboot Prompt solution and will take care of the reboot.

## Output

- Ticket
- Script logs
