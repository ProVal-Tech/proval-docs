---
id: 'rmm-sentinelone-site-key'
title: 'SentinelOne Site Key Configuration'
title_meta: 'SentinelOne Site Key Configuration for Endpoint Management'
keywords: ['sentinelone', 'site', 'key', 'configuration', 'endpoints']
description: 'This document explains the configuration of the SentinelOne Site Key at the company level, which is essential for organizing and managing endpoints based on their network location. It includes details on dependencies, field specifications, and a screenshot for reference.'
tags: ['configuration', 'networking', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This custom field at the company level stores the Sentinel Site Key, the Site Key is used for organizing and managing endpoints based on their physical or logical network location within the organization.

## Dependencies

[CW RMM - Solution - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15822040)

## Details

| Field Name                | Level | Type     | Default Value | Description                      | Editable |
|---------------------------|-------|----------|---------------|----------------------------------|----------|
| SentinelOne Site Key      | Site  | TextBox  | NA            | The S1 site key for this company | Yes      |

## ScreenShot

![ScreenShot](..\..\..\static\img\Company---SentinelOne-Site-Key\image_1.png)



