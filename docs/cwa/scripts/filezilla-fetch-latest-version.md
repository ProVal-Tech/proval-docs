---
id: '71141737-d88f-43d3-9e75-e3f5468f888f'
slug: /71141737-d88f-43d3-9e75-e3f5468f888f
title: 'FileZilla - Fetch Latest Version'
title_meta: 'FileZilla - Fetch Latest Version'
keywords: ['filezilla', 'latest-version', 'fetch-version', 'useragent']
description: 'The script retrieves the most recent version of FileZilla from its official website.'
tags: ['application', 'update']
draft: false
unlisted: false
last_update:
  date: 2025-08-21
---

## Summary

The script fetches the latest version of FileZilla from its official website and saves it to the system property `Filezilla_Latest_Version`. *It requires at least one Windows 10/11 computer with FileZilla installed in the environment to function.*

## Update Notice: 2025-08-21

Updated the logic to fetch latest available version of Filezilla.

## Sample Run

This is a client script and is recommended to be scheduled to run daily during working hours.  
![Image1](../../../static/img/docs/71141737-d88f-43d3-9e75-e3f5468f888f/image1.webp)

## Properties

| Name | Example | Required | Description |
| ---- | ------- | -------- | ----------- |
| Filezilla_Latest_Version | 3.68.1 | True | Stores the latest available version of FileZilla, which is utilized by the [Update FileZilla](/docs/ea7ef637-8620-499a-a982-a805a11e14c7). *Modifying it is not recommended.* |

## Output

- Property

## Changelog

### 2025-08-25

- FileZilla changed their website's structure, breaking our existing logic to fetch the latest version and download URL.

Therefore, updated the script according to their website's current structure.

### 2025-04-04

- Initial version of the document
