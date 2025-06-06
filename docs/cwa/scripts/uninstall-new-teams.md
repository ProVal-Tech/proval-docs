---
id: 'dad7ec2a-4998-47f9-bcb2-c886d3bea833'
slug: /dad7ec2a-4998-47f9-bcb2-c886d3bea833
title: 'Uninstall New Teams'
title_meta: 'Uninstall New Teams'
keywords: ['uninstall', 'teams', 'windows', 'script', 'software']
description: 'This document provides a script for uninstalling New Teams from Windows machines, specifically designed to work with logged-in users. It includes details on file paths, hashes, global parameters, output, and ticketing information for failures.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The script uninstalls `New Teams` from Windows machines. It will only work on computers with a logged-in user.

**File Path:** `C:/ProgramData/_Automation/Script/Uninstall-NewTeams/Uninstall-NewTeams.ps1`

**File Hash (SHA256):** `B1A3E764F1384A9E15E0B9B8DDAF8E2E093FA52CEA82446C89A38D216E039883`

**File Hash (MD5):** `17F1C8FED7120443E532FECD7D460B80`

## Sample Run

![Sample Run](../../../static/img/docs/dad7ec2a-4998-47f9-bcb2-c886d3bea833/image_1.webp)

#### Global Parameters

| Name                     | Required | Example | Description                                                                                   |
|--------------------------|----------|---------|-----------------------------------------------------------------------------------------------|
| Ticket_On_Failure        | False    | 1       | Fill it as '1' if you would like to receive a ticket on failure; otherwise, leave it blank or enter '0'.    |
| TicketCreationCategory    | False    | 298     | Mention the ticket creation category to direct the tickets to the right board in Manage. |

## Output

- Script Logs
- Ticket (if enabled)

## Ticketing

**Subject:** `New Microsoft Teams Uninstallation Failed on %ComputerName% (%ComputerID%)`

**Ticket Body:** `Failed to uninstall New Microsoft Teams from machine on %computername% at %clientname%. Here are the results returned from the installer: @psout@`

The PC information is outlined below:  
**PC Name:** %computername%  
**Last Login:** %lastuser%  
**PC Model:** @biosname@  
**OS:** %os%  
**S/N OF PC:** @biosver@