---
id: '5bfc3175-98f3-4855-9df0-7fb9bf35a954'
slug: /5bfc3175-98f3-4855-9df0-7fb9bf35a954
title: 'Set OST Max Size'
title_meta: 'Set OST Max Size'
keywords: ['registry', 'outlook', 'pst', 'maxlargesize', 'warnlargesize']
description: 'This script modifies the registry settings for Outlook to adjust the MaxLargeFileSize and WarnLargeFileSize parameters based on user-defined values or defaults. It ensures that the MaxLargeFileSize is set to 100,000 MB and WarnLargeFileSize to 95,000 MB if no values are provided.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This script helps to set each user's registry `Software/Microsoft/Office/OfficeVersion/Outlook/PST`: `MaxLargeFileSize` and `WarnLargeFileSize` to custom values as per user parameters or, by default, it sets `MaxLargeFileSize` to 100,000 MB and `WarnLargeFileSize` to 95,000 MB.

## Sample Run

![Sample Run](../../../static/img/docs/5bfc3175-98f3-4855-9df0-7fb9bf35a954/image_1.webp)

## Dependency

Strapper Module

### User Parameters

| Name                | Example  | Required | Description                                                                                          |
|---------------------|----------|----------|------------------------------------------------------------------------------------------------------|
| MaxLargeFileSize    | 100000   | False    | If a value is set, then it will set the size in MB; if left empty, the default user registry is set to 100,000. |
| WarnLargeFileSize   | 120000   | False    | If a value is set, then it will set the size in MB; if left empty, the default user registry is set to 95,000.  |

## Output

- Script log