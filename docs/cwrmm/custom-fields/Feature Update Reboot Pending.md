---
id: 'rmm-feature-update-install-with-tracking'
title: 'Feature Update Install With Tracking'
title_meta: 'Feature Update Install With Tracking'
keywords: ['update', 'install', 'tracking', 'custom', 'field']
description: 'This document provides details on the Feature Update Install With Tracking script, which flags a custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter. It includes instructions on creating the custom field necessary for tracking the installation status.'
tags: ['endpoint', 'flag', 'reboot', 'configuration']
draft: false
unlisted: false
---
## Summary

The `Feature Update Install With Tracking` script flags this custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter.

# Create the Custom Field

![Image 1](../../../static/img/Feature-Update-Reboot-Pending/image_1.png)

![Image 2](../../../static/img/Feature-Update-Reboot-Pending/image_2.png)

---

**Name:** Feature Update Reboot Pending  
**Type:** Flag  
**Level:** Endpoint  
**Default Value:** No  
**Description:** Will be checked only if the machine has not rebooted since running the Feature Update Install task where the Reboot parameter was not set to reboot.  
**Editable:** Yes  




