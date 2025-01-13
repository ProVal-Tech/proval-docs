---
id: 'cwa-set-teams-firewall-rules'
title: 'Set Teams Firewall Rules for Users'
title_meta: 'Set Teams Firewall Rules for Users'
keywords: ['teams', 'firewall', 'users', 'rules', 'automation']
description: 'This document outlines a PowerShell script that sets firewall rules for Microsoft Teams users, excluding public users and specific administrative accounts. The script checks the PowerShell version, executes the necessary commands, and logs the results for review. It aims to streamline the process and save time in user management.'
tags: ['configuration', 'windows', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

### **This script needs revision.**

This script executes the PowerShell which set rules on teams for all users other than Public and 'ADMINI~*'. Rulename is “Teams.exe for user (username)”.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/TEAMS---Firewall-Rules-Script/image_1.png)

## Dependencies

- Windows OS and PowerShell version greater equal to 3.

## Variables

- `@Result@` -> Result of the PowerShell to add the firewall rule
- `@shellresult@` -> results of checking the PowerShell version on the machine

## Process

1. Checks the PowerShell version on the machine for v3.0 or greater
2. Runs PowerShell to add the firewall rule for Teams
3. Logs the results in the script logs in Automate

## Output

- Script log




