---
id: '45e14854-ba83-4737-8264-b5cd809fca56'
slug: /45e14854-ba83-4737-8264-b5cd809fca56
title: 'Feature Update Reboot Pending'
title_meta: 'Feature Update Reboot Pending'
keywords: ['update', 'install', 'tracking', 'custom', 'field']
description: 'This document provides details on the Feature Update Install With Tracking script, which flags a custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter. It includes instructions on creating the custom field necessary for tracking the installation status.'
tags: ['reboot']
draft: false
unlisted: false
---

## Summary

The `Feature Update Install With Tracking` script flags a custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter.

## Create the Custom Field

![Image 1](../../../static/img/docs/45e14854-ba83-4737-8264-b5cd809fca56/image_1.webp)

![Image 2](../../../static/img/docs/45e14854-ba83-4737-8264-b5cd809fca56/image_2.webp)

---

**Name:** Feature Update Reboot Pending  
**Type:** Flag  
**Level:** Endpoint  
**Default Value:** No  
**Description:** Will be checked only if the machine has not rebooted since running the Feature Update Install task where the Reboot parameter was not set to reboot.  
**Editable:** Yes  
