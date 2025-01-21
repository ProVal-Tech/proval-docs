---
id: 'dd8dbfbe-f8eb-4909-9cbf-8662cafb4fd4'
title: 'Adobe CC Update Script'
title_meta: 'Adobe CC Update Script'
keywords: ['adobe', 'update', 'script', 'apps', 'automation']
description: 'This document details a script that can either list available updates or execute updates for Adobe Creative Cloud applications on the specified machine, saving significant time through automation.'
tags: ['adobe', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This script will either list the available updates or run updates for the Adobe CC apps on the target machine.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run 1](../../../static/img/Adobe-Creative-Cloud---Update/image_1.png)

![Sample Run 2](../../../static/img/Adobe-Creative-Cloud---Update/image_2.png)

## Dependencies

This section should list the ITGlue documents found in the Related Items sidebar that this script depends on.

- [Update-AdobeCC](<../../powershell/Update-AdobeCC.md>)

## Variables

### User Parameters

| Name  | Example | Required | Description                                                |
|-------|---------|----------|------------------------------------------------------------|
| Mode  | Update  | True     | The mode in which the script should be run. Can only be either "Update" or "List". |

## Process

[Update-AdobeCC](<../../powershell/Update-AdobeCC.md>)

## Output

- Script log
- Local log files
