---
id: '71141737-d88f-43d3-9e75-e3f5468f888f'
title: 'FileZilla - Fetch Latest Version'
title_meta: 'FileZilla - Fetch Latest Version'
keywords: ['filezilla', 'latest-version', 'fetch-version', 'useragent']
description: 'The script retrieves the most recent version of FileZilla from its official website.'
tags: ['application', 'update']
draft: false
unlisted: false
---

## Summary

The script fetches the latest version of FileZilla from its official website and saves it to the system property `Filezilla_Latest_Version`. *It requires at least one Windows 10/11 computer with FileZilla installed in the environment to function.*

## Sample Run

This is a client script and is recommended to be scheduled to run daily during working hours.  
![Image1](../../../static/img/cwa-script-filezilla-fetch-latest-version/image1.png)

## Properties

| Name | Example | Required | Description |
| ---- | ------- | -------- | ----------- |
| Filezilla_Latest_Version | 3.68.1 | True | Stores the latest available version of FileZilla, which is utilized by the [Update FileZilla](../monitors/update-filezilla.md). *Modifying it is not recommended.* |

## Output

- Property
