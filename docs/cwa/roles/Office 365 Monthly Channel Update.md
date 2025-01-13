---
id: 'cwa-track-365-updates'
title: 'Tracking 365 Updates on Monthly Channel'
title_meta: 'Tracking 365 Updates on Monthly Channel'
keywords: ['updates', 'office365', 'windows', 'channel', 'detection']
description: 'This document provides a role definition that assists in identifying machines configured to receive Microsoft 365 updates on the monthly channel. It includes detection strings, comparators, and applicable operating systems for effective tracking.'
tags: ['office365', 'update', 'windows', 'configuration', 'report']
draft: false
unlisted: false
---
## Summary

This role definition helps you track down machines where 365 updates are set on monthly channel

## Settings

| Detection String                                           | Comparator | Result                                                                                               | Applicable OS |
|-----------------------------------------------------------|------------|------------------------------------------------------------------------------------------------------|----------------|
| {%-HKLM/SOFTWARE/Microsoft/Office/ClickToRun/Configura... | Contains   | [http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6](http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6) | Windows        |



