---
id: '4be73d27-2026-4380-9d00-de9e825dd5e1'
slug: /4be73d27-2026-4380-9d00-de9e825dd5e1
title: 'Office 365 Semi-Annual Channel Update'
title_meta: 'Office 365 Semi-Annual Channel Update'
keywords: ['office365', 'update', 'verification', 'channel', 'semi-annual']
description: 'This document outlines the process to verify if the Office 365 Update Channel is set to Semi-Annual, including necessary detection strings and applicable operating systems.'
tags: ['office365', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the process to verify if the Office 365 Update Channel is set to Semi-Annual.

## Settings

| Detection String                                                        | Comparator | Result                                                                                                   | Applicable OS |
|-------------------------------------------------------------------------|------------|----------------------------------------------------------------------------------------------------------|---------------|
| `{%-HKLM/SOFTWARE/Microsoft/Office/ClickToRun/Configuration:CDNBaseUrl-%}` | Contains   | [http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114](http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114) | Windows       |
