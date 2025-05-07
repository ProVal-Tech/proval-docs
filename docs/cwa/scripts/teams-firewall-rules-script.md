---
id: '12806812-6720-41bc-9b7c-632fe1620db8'
slug: /12806812-6720-41bc-9b7c-632fe1620db8
title: 'TEAMS - Firewall Rules Script'
title_meta: 'TEAMS - Firewall Rules Script'
keywords: ['teams', 'firewall', 'users', 'rules', 'automation']
description: 'This document outlines a PowerShell script that sets firewall rules for Microsoft Teams users, excluding public users and specific administrative accounts. The script checks the PowerShell version, executes the necessary commands, and logs the results for review. It aims to streamline the process and save time in user management.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

### **This script needs revision.**

This script executes PowerShell commands that set rules for Teams for all users except public users and those with administrative accounts matching 'ADMINI~*'. The rule name is "Teams.exe for user (username)."

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/12806812-6720-41bc-9b7c-632fe1620db8/image_1.png)

## Dependencies

- Windows OS and PowerShell version 3.0 or greater.

## Variables

- `@Result@` -> Result of the PowerShell command to add the firewall rule.
- `@shellresult@` -> Results of checking the PowerShell version on the machine.

## Process

1. Check the PowerShell version on the machine for v3.0 or greater.
2. Run PowerShell to add the firewall rule for Teams.
3. Log the results in the script logs in Automate.

## Output

- Script log

