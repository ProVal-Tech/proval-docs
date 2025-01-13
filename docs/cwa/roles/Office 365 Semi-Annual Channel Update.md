---
id: 'cwa-office365-update-channel-verification'
title: 'Office 365 Update Channel Verification'
title_meta: 'Office 365 Update Channel Verification'
keywords: ['office365', 'update', 'verification', 'channel', 'semi-annual']
description: 'This document outlines the process to verify if the Office 365 Update Channel is set to Semi-Annual, including necessary detection strings and applicable operating systems.'
tags: ['office365', 'windows', 'configuration', 'update']
draft: false
unlisted: false
---
## Summary

This role will help to verify if Office 365 Update Channel is set to Semi-Annual.

## Settings

| Detection String                                                        | Comparator | Result                                                                                                   | Applicable OS |
|-------------------------------------------------------------------------|------------|----------------------------------------------------------------------------------------------------------|---------------|
| `{%-HKLM/SOFTWARE/Microsoft/Office/ClickToRun/Configuraion:CDNBaseUrl-%}` | Contains   | [http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114](http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114) | Windows       |



