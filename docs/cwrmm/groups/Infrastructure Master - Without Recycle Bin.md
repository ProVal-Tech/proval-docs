---
id: 'rmm-infrastructure-master-without-recycle-bin'
title: 'Infrastructure Master - Without Recycle Bin'
title_meta: 'Infrastructure Master - Without Recycle Bin'
keywords: ['windows', 'infrastructure', 'recycle', 'bin', 'ad', 'group', 'criteria']
description: 'This document outlines the process to create a dynamic group in ConnectWise RMM that filters Infrastructure Masters where the Recycle Bin is not enabled. It includes criteria for the group and dependencies for enabling the AD Recycle Bin.'
tags: ['active-directory', 'configuration', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

The purpose of this group is to filter Windows Infrastructure master where the Recycle bin is not enabled.

## Dependencies

[CW RMM - Task - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-15349513)

## Summary

![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_1.png)

**Group Type:** Dynamic  
**Group Name:** Infrastructure Master - Without Recycle Bin  
**Description:** Contains Infrastructure masters where Recycle Bin is not enabled  

### Criteria

![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_2.png)

- Is Primary Domain Controller should be equal to `Yes`
- AD Recycle Bin Does not contain any of `Does not meet minimum Criteria`
- AD Recycle Bin Does not contain any of `Enabled`
- Available Should be True.
- AD Recycle Bin Does not contain any of `failed more than 3 times`
- AD Recycle Bin Does not contain any of `Outdated PS version`

## Group

Once adding the above criteria, click the Save button to Save the Group.  
![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_3.png)

![Image](../../../static/img/Infrastructure-Master---Without-Recycle-Bin/image_4.png)



