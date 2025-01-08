---
id: 'cwa-disable-windows-hello'
title: 'Disable Windows Hello for Business'
title_meta: 'Disable Windows Hello for Business - Automation Script'
keywords: ['windows', 'hello', 'business', 'registry', 'disable']
description: 'This document outlines a script that disables Windows Hello for Business by modifying the registry key to prevent its use. The automation process is designed to save approximately 10 minutes of manual effort, streamlining the configuration for users and administrators.'
tags: ['configuration', 'windows', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This script disables Windows Hello for Business.  
Time Saved by Automation: 10 Minutes  

## Sample Run

![Sample Run](5078775/docs/8156774/images/11437988)  

## Process

This script disables Windows Hello for Business by adding in the registry key `HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork:Enabled` equal to `0`.  

## Output

- Script log  


