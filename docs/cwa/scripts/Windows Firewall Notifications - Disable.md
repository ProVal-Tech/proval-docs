---
id: '9b906a5c-919c-4799-85db-c43359bd6a15'
title: 'Windows Firewall Notifications - Disable'
title_meta: 'Windows Firewall Notifications - Disable'
keywords: ['firewall', 'notifications', 'windows', 'script', 'disable']
description: 'This document provides a detailed overview of a script designed to disable firewall notifications for all users on a Windows system, streamlining user experience and enhancing system management.'
tags: ['firewall', 'notifications', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will disable the firewall notifications for all users on a Windows system.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/Windows-Firewall-Notifications---Disable/image_1.png)

## Process

- This script will run a PowerShell script to disable the firewall notifications on a Windows system.
- It will check the output of the PowerShell script; if there is no error, it will exit. Otherwise, it will check for Windows 10 machines.
- If a Windows 10 machine is found, it will run a new PowerShell script on the machine to disable the firewall notifications for all users.

## Output

- Script logs



