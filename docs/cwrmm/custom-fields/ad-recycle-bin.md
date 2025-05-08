---
id: 'e4801a6f-1945-4aee-bd39-1601a185b9eb'
slug: /e4801a6f-1945-4aee-bd39-1601a185b9eb
title: 'AD Recycle Bin'
title_meta: 'AD Recycle Bin'
keywords: ['active-directory', 'recycle', 'custom', 'field', 'status']
description: 'This document provides a detailed guide on creating a custom field for tracking the status of the Active Directory Recycle Bin. It outlines the necessary steps to set up the field, including its properties and usage in the Enable Recycle Bin Task.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Summary

The [Task - Enable AD Recycle Bin](/docs/bb53445d-532a-4ec4-b4c5-3f8d0610d6f7) utilizes this custom field to store information regarding the AD Recycle Bin status. It will indicate whether it is enabled or if the infrastructure master does not meet the minimum criteria.

## Create the Custom Field

![Image](../../../static/img/docs/5041d497-ae6c-4209-a338-60f1da396106/image_1.webp)

![Image](../../../static/img/docs/5041d497-ae6c-4209-a338-60f1da396106/image_2.webp)

**Name:** AD Recycle Bin  
**Type:** Text Box  
**Level:** Endpoint  
**Default Value:** 0  
**Description:** This custom field is used by the Enable Recycle Bin Task to store the Recycle Bin status on AD Infrastructure Masters.  
**Editable:** Yes  

