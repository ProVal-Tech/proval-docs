---
id: 'ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5'
title: 'Site - SentinelOne Group Key'
title_meta: 'Site - SentinelOne Group Key'
keywords: ['sentinelone', 'group', 'key', 'management', 'endpoints']
description: 'This document provides an overview of the custom field at the site level for storing the Sentinel Group Key, which is essential for grouping and managing endpoints according to logical criteria such as departments or security policies. It also includes details on dependencies, field specifications, and a visual reference.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This custom field at the site level stores the Sentinel Group Key, which is utilized for grouping and managing endpoints based on logical criteria like departments or security policies. If this custom field is empty, the script will then search for the @SentinelOne Site Key instead.

## Dependencies

[CW RMM - Solution - SentinelOne Deployment](<../../solutions/SentinelOne Deployment.md>)

## Details

| Field Name                     | Level | Type     | Default Value | Description                           | Editable |
|--------------------------------|-------|----------|---------------|---------------------------------------|----------|
| SentinelOne Group Key          | Site  | TextBox  | NA            | The SentinelOne group key for this site. | Yes      |

## Screenshot

![Screenshot](../../../static/img/Site---SentinelOne-Group-Key/image_1.png)




