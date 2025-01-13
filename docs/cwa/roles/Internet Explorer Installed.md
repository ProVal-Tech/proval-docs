---
id: 'cwa-detect-internet-explorer'
title: 'Detecting Internet Explorer Installation and Features'
title_meta: 'Detecting Internet Explorer Installation and Features'
keywords: ['internet', 'explorer', 'detection', 'feature', 'windows']
description: 'This document outlines the process for detecting machines where the Internet Explorer feature is enabled or where Internet Explorer is installed. It includes a detection string and applicable settings for Windows operating systems.'
tags: ['windows', 'configuration', 'performance', 'software']
draft: false
unlisted: false
---
## Summary

The purpose of this role is to detect the machines where Internet Explorer feature is enabled or Internet Explorer is installed.

## Settings

| Detection String                                                                                          | Comparator | Result | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `{%@C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -Command "Get-WindowsOptionalFeature -Online -FeatureName Internet-Explorer* "@%}` | Contains   | Enable | Windows        |



