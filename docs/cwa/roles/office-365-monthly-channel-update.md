---
id: 'eb059723-1681-49d4-a8df-62aebf3656b2'
slug: /eb059723-1681-49d4-a8df-62aebf3656b2
title: 'Office 365 Monthly Channel Update'
title_meta: 'Office 365 Monthly Channel Update'
keywords: ['updates', 'office365', 'windows', 'channel', 'detection']
description: 'This document provides a role definition that assists in identifying machines configured to receive Microsoft 365 updates on the monthly channel. It includes detection strings, comparators, and applicable operating systems for effective tracking.'
tags: ['office365', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This role definition helps you track machines where Microsoft 365 updates are set to the monthly channel.

## Settings

| Detection String                                           | Comparator | Result                                                                                               | Applicable OS |
|-----------------------------------------------------------|------------|------------------------------------------------------------------------------------------------------|----------------|
| \\\{%-HKLM/SOFTWARE/Microsoft/Office/ClickToRun/Configura... | Contains   | [http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6](http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6) | Windows        |


