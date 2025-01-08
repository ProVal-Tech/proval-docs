---
id: 'cwa-set-registry-outlook-pst-size'
title: 'Set Outlook PST Size in Registry'
title_meta: 'Set Outlook PST Size in Registry'
keywords: ['registry', 'outlook', 'pst', 'maxlargesize', 'warnlargesize']
description: 'This script modifies the registry settings for Outlook to adjust the MaxLargeFileSize and WarnLargeFileSize parameters based on user-defined values or defaults. It ensures that the MaxLargeFileSize is set to 100000 MB and WarnLargeFileSize to 95000 MB if no values are provided.'
tags: ['windows', 'configuration', 'software', 'notification']
draft: false
unlisted: false
---
## Summary

This script helps to set each user's registry Software\Microsoft\Office\OfficeVersion\Outlook\PST: MaxLargeFileSize and WarnLargeFileSize to custom as per user param or by default it sets MaxLargeFileSize to 100000 and WarnLargeFileSize to 95000.

## Sample Run

![Sample Run](5078775/docs/12684815/images/18468242)

## Dependency

Strapper Module

#### User Parameters

| Name                | Example  | Required | Description                                                                                          |
|---------------------|----------|----------|------------------------------------------------------------------------------------------------------|
| MaxLargeFileSize    | 100000   | False    | If set value, then it will set the size in MB, if left empty then by default user registry set to 100000 |
| WarnLargeFileSize   | 120000   | False    | If set value, then it will set the size in MB, if left empty then by default user registry set to 95000  |

## Output

- Script log


