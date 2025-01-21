---
id: '64fb8fa3-20f6-4167-8ec1-be322b3d6c07'
title: 'Disable Windows Hello for Business'
title_meta: 'Disable Windows Hello for Business - Automation Script'
keywords: ['windows', 'hello', 'business', 'registry', 'disable']
description: 'This document outlines a script that disables Windows Hello for Business by modifying the registry key to prevent its use. The automation process is designed to save approximately 10 minutes of manual effort, streamlining the configuration for users and administrators.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script disables Windows Hello for Business.  
**Time Saved by Automation:** 10 Minutes  

## Sample Run

![Sample Run](../../../static/img/Windows-Hello-for-Business---Disable/image_1.png)  

## Process

This script disables Windows Hello for Business by adding the registry key `HKLM:/SOFTWARE/Policies/Microsoft/PassportForWork:Enabled` and setting its value to `0`.  

## Output

- Script log  

