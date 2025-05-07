---
id: 'c48b8ff6-9189-49b2-bd2a-442fb26e7bbe'
slug: /c48b8ff6-9189-49b2-bd2a-442fb26e7bbe
title: 'Internet Explorer Installed'
title_meta: 'Internet Explorer Installed'
keywords: ['internet', 'explorer', 'detection', 'feature', 'windows']
description: 'This document outlines the process for detecting machines where the Internet Explorer feature is enabled or where Internet Explorer is installed. It includes a detection string and applicable settings for Windows operating systems.'
tags: ['performance', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this document is to detect the machines where the Internet Explorer feature is enabled or where Internet Explorer is installed.

## Settings

| Detection String                                                                                          | Comparator | Result | Applicable OS |
|-----------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `{%@C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -Command "Get-WindowsOptionalFeature -Online -FeatureName Internet-Explorer* "@%}` | Contains   | Enable | Windows        |

