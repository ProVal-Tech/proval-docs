---
id: 'a6c32cd9-8472-45cc-9260-3aa09510ce20'
slug: /a6c32cd9-8472-45cc-9260-3aa09510ce20
title: 'Adobe Flash Player Uninstaller - V2 Autofix,Ticket'
title_meta: 'Adobe Flash Player Uninstaller - V2 Autofix,Ticket'
keywords: ['uninstall', 'adobe', 'flash', 'player', 'script']
description: 'This document describes an Autofix script designed to uninstall Adobe Flash Player from target machines using multiple methods. The script aims to save time by automating the uninstallation process and includes options for ticket creation in case of failure.'
tags: ['adobe', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script runs as an Autofix script that helps to uninstall Adobe Flash Player from the target machine using multiple methods.

**Time Saved by Automation:** 20 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/a6c32cd9-8472-45cc-9260-3aa09510ce20/image_1.webp)

## Dependencies

This script runs with a monitor named: **"Proval - Production - Adobe Flash Detected"**

### Global Parameters

| Name            | Example | Required | Description                                                                                                                                                          |
|-----------------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TicketCreation   | 0       | False    | This parameter allows users to decide if they want a ticket created if the script fails to uninstall Adobe Flash Player. If yes, change it to 1.                  |

## Process

This script helps to uninstall Adobe Flash Player through multiple methods.  
First, it attempts to uninstall it using `uninstall.exe` of Adobe Flash Player.  
If that fails, it will try to uninstall using the Uninstaller Software script with the uninstaller string.

## Output

- Script log