---
id: '24509826-3f15-4594-8bb2-4f801709720b'
slug: /24509826-3f15-4594-8bb2-4f801709720b
title: 'Infrastructure Master - Without Recycle Bin'
title_meta: 'Infrastructure Master - Without Recycle Bin'
keywords: ['windows', 'infrastructure', 'recycle', 'bin', 'ad', 'group', 'criteria']
description: 'This document outlines the process to create a dynamic group in ConnectWise RMM that filters Infrastructure Masters where the Recycle Bin is not enabled. It includes criteria for the group and dependencies for enabling the AD Recycle Bin.'
tags: ['active-directory', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The purpose of this group is to filter Windows Infrastructure Masters where the Recycle Bin is not enabled.

## Dependencies

[CW RMM - Task - Enable AD Recycle Bin](/docs/bb53445d-532a-4ec4-b4c5-3f8d0610d6f7)

## Group Details

![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_1.png)

**Group Type:** Dynamic  
**Group Name:** Infrastructure Master - Without Recycle Bin  
**Description:** Contains Infrastructure Masters where the Recycle Bin is not enabled  

### Criteria

![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_2.png)

- Is Primary Domain Controller should be equal to `Yes`
- AD Recycle Bin does not contain any of `Does not meet minimum Criteria`
- AD Recycle Bin does not contain any of `Enabled`
- Available should be True.
- AD Recycle Bin does not contain any of `failed more than 3 times`
- AD Recycle Bin does not contain any of `Outdated PS version`

## Group Creation

Once you have added the above criteria, click the Save button to save the group.  
![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_3.png)

![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_4.png)



