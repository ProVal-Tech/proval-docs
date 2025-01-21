---
id: 'b6a6f79c-ee8a-43f8-8965-98b1ce40a9a0'
title: 'Enable or Disable Modern Authentication for Office 2013'
title_meta: 'Enable or Disable Modern Authentication for Office 2013'
keywords: ['modern', 'authentication', 'office', '2013', 'enable', 'disable']
description: 'This document provides a script to enable or disable Modern authentication for Office 2013 based on user input. It outlines the process, variables, and expected output, ensuring users can manage authentication settings effectively.'
tags: ['office365', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script will enable or disable Modern authentication for Office 2013 as per the instructions found at [Enable Modern Authentication for Office 2013 on Windows devices - Microsoft 365 admin | Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/admin/security-and-compliance/enable-modern-authentication?view=o365-worldwide), depending on the action provided.

## Sample Run

![Sample Run 1](../../../static/img/Office-2013-Modern-Auth---Command/image_1.png)  
Entering nothing or anything other than "Disable" will enable Modern authentication.

![Sample Run 2](../../../static/img/Office-2013-Modern-Auth---Command/image_2.png)  
Entering "Disable" will disable Modern Authentication.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name  | Description                                                       |
|-------|-------------------------------------------------------------------|
| psout | Holds the response from running the user registry command via the bootstrap. |

#### User Parameters

| Name    | Example                   | Required | Description                                               |
|---------|---------------------------|----------|-----------------------------------------------------------|
| Action  | anything or 'Disable'     | False    | Blank or anything other than 'Disable' will enable Modern authentication. |

## Process

1. Log the requested action (Enable or Disable).
2. Use the bootstrap to run the user-set registry built-in commands.
3. Log the results.

## Output

- Script log

