---
id: 'cwa-run-chkdsk-internal-drives'
title: 'Run CHKDSK for All Internal Drives'
title_meta: 'Run CHKDSK for All Internal Drives - Automated Disk Check'
keywords: ['chkdsk', 'internal', 'drives', 'script', 'automation']
description: 'This document provides a detailed overview of a script designed to automate the CHKDSK process for all internal drives on a machine. It includes parameters for ticket creation and outlines the process for checking and fixing bad sectors, along with logging output.'
tags: ['disk-encryption', 'maintenance', 'ticketing', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This script will run CHKDSK for all internal drives.

Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](../../../static/img/CHKDSK---Run-(All-Drives)/image_1.png)

## Global Parameters

| **Name**                    | **Example** | **Required** | **Description**                                                                                                                                                                                                                       |
|-----------------------------|-------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TicketCreationCategory      | 0           | 0 or 1      | This will represent if the tickets will get created by the script or not. By default, it will be set to 0 and it will not create tickets. If you want to enable the ticketing you need to set the value to 1.                        |

## Process

This script will run check disk for all internal drives a machine has. This script will first check for the existing ticket. The script first runs a Powershell script to check if there are any bad sectors found. If a bad sector is found, then it will schedule a fix for it. If a bad sector is found, then it will comment on the existing ticket, else it will create a new one. After creating a ticket, it will schedule the fix and add comments to the ticket as well. Currently, in the script, the maintenance message and automatic reboot lines are enabled but they can be disabled as per client recommendation.

## Output

- Script log




