---
id: '58b312bd-f26c-4b05-ab92-c184520d05de'
title: 'WinFeatUpgradeAttempts'
title_meta: 'WinFeatUpgradeAttempts'
keywords: ['windows', 'upgrade', 'tracking', 'feature', 'endpoint']
description: 'This document provides a guide on creating a custom field to track the number of attempts a Windows 10/11 device has made to install a feature upgrade using the Feature Update Install With Tracking task. The default value for this custom field is set to 0.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document will keep a record of how many times a Windows 10/11 device has attempted to install the feature upgrade using the `Feature Update Install With Tracking` task, with the default value set to 0.

## Create the Custom Field

![Image 1](../../../static/img/WinFeatUpgradeAttempts/image_1.png)

![Image 2](../../../static/img/WinFeatUpgradeAttempts/image_2.png)

---

**Name:** WinFeatUpgradeAttempts  
**Type:** Text Box  
**Default Value:** 0  
**Level:** Endpoint  
**Description:** This field will keep a record of how many times a Windows 10/11 device has attempted to install the feature upgrade using the `Feature Update Install With Tracking` task, with the default value set to 0.  
**Editable:** Yes  



