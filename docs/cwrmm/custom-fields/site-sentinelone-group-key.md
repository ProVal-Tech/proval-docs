---
id: 'ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5'
slug: /ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5
title: 'SentinelOne Group Key'
title_meta: 'SentinelOne Group Key'
keywords: ['sentinelone', 'group', 'key', 'management', 'endpoints']
description: 'This document provides an overview of the custom field at the site level for storing the Sentinel Group Key, which is essential for grouping and managing endpoints according to logical criteria such as departments or security policies. It also includes details on dependencies, field specifications, and a visual reference.'
tags: ['security']
draft: false
unlisted: false
---

## Summary

This custom field at the site level stores the Sentinel Group Key, which is utilized for grouping and managing endpoints based on logical criteria like departments or security policies. If this custom field is empty, the script will then search for the @SentinelOne Site Key instead.

## Dependencies

[SentinelOne Deployment](/docs/e0abdce8-a697-43b1-a404-18168a616627)

## Details

| Field Name                     | Level | Type     | Default Value | Description                           | Editable |
|--------------------------------|-------|----------|---------------|---------------------------------------|----------|
| SentinelOne Group Key          | Site  | TextBox  | NA            | The SentinelOne group key for this site. | Yes      |

## Screenshot

![Screenshot](../../../static/img/docs/ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5/image_1.webp)