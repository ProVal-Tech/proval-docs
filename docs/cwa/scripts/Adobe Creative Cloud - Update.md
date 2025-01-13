---
id: 'cwa-adobe-cc-update-script'
title: 'Adobe CC Update Script'
title_meta: 'Adobe CC Update Script'
keywords: ['adobe', 'update', 'script', 'apps', 'automation']
description: 'This document details a script that can either list available updates or execute updates for Adobe Creative Cloud applications on the specified machine, saving significant time through automation.'
tags: ['adobe', 'update', 'software', 'automation']
draft: false
unlisted: false
---
## Summary

This script will either list the available updates or run updates for the Adobe CC apps on the target machine.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run 1](..\..\..\static\img\Adobe-Creative-Cloud---Update\image_1.png)

![Sample Run 2](..\..\..\static\img\Adobe-Creative-Cloud---Update\image_2.png)

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this script depends.

- [Update-AdobeCC](https://proval.itglue.com/DOC-5078775-7667368)

## Variables

### User Parameters

| Name  | Example | Required | Description                                                |
|-------|---------|----------|------------------------------------------------------------|
| Mode  | Update  | True     | The mode that the script should be run in. Can only be either "Update" or "List" |

## Process

[Update-AdobeCC](https://proval.itglue.com/DOC-5078775-7667368)

## Output

- Script log
- Local log files


