---
id: 'bbb9f958-4fd3-4fda-903f-7d303bf26779'
slug: /bbb9f958-4fd3-4fda-903f-7d303bf26779
title: 'PowerShell Version'
title_meta: 'PowerShell Version'
keywords: ['device', 'group', 'audit', 'version', 'criteria']
description: 'This document provides a comprehensive guide for creating three device groups related to the PowerShell version auditing solution. It outlines the necessary dependencies, the steps to create the device groups, and the specific criteria for each group based on the PowerShell version status of the devices.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

There are three device groups related to the PowerShell version auditing solution. Please see the guide below to create the separate device groups.

## Dependencies

- [CW RMM - Custom Field - PowerShell Version](/docs/945d88e0-81a9-4253-8406-63fa7430d45a)  
- [CW RMM - Task - PowerShell Version Information](/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b)  

## Create Device Groups

There are three device groups for this solution. To create device groups, please navigate to **Devices > Device Groups**.

![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_3.webp)  
Select **Add > Dynamic Group**  
![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_4.webp)  
Please repeat the above steps for each device group.

---

### Device Group Name: PowerShell Version Audit - Pending

![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_5.webp)  

**Description:** This group will look for any machines where the PS Version is pending.  
**Criteria:**  
![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_6.webp)  
When adding criteria, please search for the PowerShell Version custom field.  
- **Contains:** "Is Blank"  
- **Condition:** "True"  

This group holds all devices that have not had their PowerShell versions audited.

---

### Device Group Name: PowerShell Version < 5

![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_7.webp)  

**Description:** This group will look for any machines where the PS Version is not version 5 or higher.  
**Criteria:**  
![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_8.webp)  
When adding criteria, please search for the PowerShell Version custom field.  
- **Contains:** "Contains any of"  
- **Condition:** "Failure"  

This group holds all devices that are not on PowerShell version 5 or above.

---

### Device Group Name: PowerShell Version > 5

![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_9.webp)  

**Description:** This group will look for any machines where the PS version is 5 or higher.  
**Criteria:**  
![Image](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_10.webp)  
When adding criteria, please search for the PowerShell Version custom field.  
- **Contains:** "Contains any of"  
- **Condition:** "Success"  

This group holds all devices that are on PowerShell version 5 or above.

