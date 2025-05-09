---
id: 'a7234fd9-615c-4862-ae0a-b93fd84f7af6'
slug: /a7234fd9-615c-4862-ae0a-b93fd84f7af6
title: 'Microsoft 365 - Set Update Channel - Monthly Enterprise'
title_meta: 'Microsoft 365 - Set Update Channel - Monthly Enterprise'
keywords: ['microsoft', '365', 'update', 'registry', 'automation']
description: 'This document outlines a script that modifies registry settings to enable Microsoft 365 products to update on a monthly basis, in line with current channel updates. It also executes a follow-up script to update the relevant dataview in ConnectWise Automate, thereby enhancing the management and auditing of Office versions.'
tags: ['office365', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This script will make changes in the registry and allow Microsoft 365 products to update on a monthly basis as per current channel updates.

It will execute the [SWM - Script - Microsoft Office - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e) script at the end of the successful run to update the information in the [CWM - Automate - Dataview - C2R Office Version Audit](/docs/d48f4966-b281-4aaa-8bf0-5059221b7ff3) Dataview.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/a7234fd9-615c-4862-ae0a-b93fd84f7af6/image_1.webp)

## Dependencies

- Office installed on the target machine
- [SWM - Script - Microsoft Office - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e)

## Process

1. Logs a message in Automate stating that we're updating the channel to Monthly.
2. Changes the appropriate registry keys.
3. Checks to ensure the registry key was successfully changed.

## Output

- Script log

