---
id: '631bc7d8-99fd-4d19-b67a-58d7476f4861'
slug: /631bc7d8-99fd-4d19-b67a-58d7476f4861
title: 'Purge Old Windows Update Folders'
title_meta: 'Purge Old Windows Update Folders'
keywords: ['Purge','Windows','SoftwareDistribution','Catroot2']
description: 'This Script deletes old Windows Update backup folders (SoftwareDistribution.bak* and Catroot2.bak*) that haven’t been modified in a specified number of days.'
tags: ['windows','update']
draft: False
unlisted: false
---

## Summary
This Script deletes old Windows Update backup folders (SoftwareDistribution.bak* and Catroot2.bak*) that haven’t been modified in a specified number of days (default 30 days)

## Sample Run

![Sample Run](../../../static/img/docs/631bc7d8-99fd-4d19-b67a-58d7476f4861/image1.webp)

## Global Parameters

| Name                 | Default    | Description   | 
|--------------------------|----------------|--------------|
| AgeInDays   | 30 | Specifies the minimum age (in days) of backup folders; only folders last modified earlier than this value will be deleted. |


## Output

- Script Logs
