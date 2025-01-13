---
id: 'rmm-powershell-version-auditing-solution'
title: 'PowerShell Version Auditing Solution'
title_meta: 'PowerShell Version Auditing Solution'
keywords: ['device', 'group', 'audit', 'version', 'criteria']
description: 'This document provides a comprehensive guide for creating three device groups related to the PowerShell version auditing solution. It outlines the necessary dependencies, the steps to create the device groups, and the specific criteria for each group based on the PowerShell version status of the devices.'
tags: ['group', 'audit', 'criteria', 'windows', 'software']
draft: false
unlisted: false
---
## Summary

There are three device groups related to the PowerShell version auditing solution. Please see the guide below to create the separate device groups.

## Dependencies

- [CW RMM - Custom Field - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824368)  
- [CW RMM - Task - PowerShell Version Information](https://proval.itglue.com/DOC-5078775-12824367)  

## Create Device Groups

There are three device groups for this solution. To create device groups, please navigate to Devices > Device Groups.

![Image](..\..\..\static\img\PowerShell-Version\image_3.png)  
Select Add > Dynamic Group  
![Image](..\..\..\static\img\PowerShell-Version\image_4.png)  
Please repeat the above steps per device group.

---

### Device Group Name: PowerShell Version Audit - Pending

![Image](..\..\..\static\img\PowerShell-Version\image_5.png)  

**Description:** This group will look for any machines where the PS Version is pending.  
**Criteria:**  
![Image](..\..\..\static\img\PowerShell-Version\image_6.png)  
When adding criteria, please search for the PowerShell Version custom field.  
- **Contains:** "Is Blank"  
- **Condition:** "True"  

This group holds all devices that have not had their PowerShell versions audited.

---

### Device Group Name: PowerShell Version < 5

![Image](..\..\..\static\img\PowerShell-Version\image_7.png)  

**Description:** This group will look for any machines where the PS Version is not version 5 or higher.  
**Criteria:**  
![Image](..\..\..\static\img\PowerShell-Version\image_8.png)  
When adding criteria, please search for the PowerShell Version custom field.  
- **Contains:** "Contains any of"  
- **Condition:** "Failure"  

This group holds all devices that are not on PowerShell version 5 or above.

---

### Device Group Name: PowerShell Version > 5

![Image](..\..\..\static\img\PowerShell-Version\image_9.png)  

**Description:** This group will look for any machines where the PS version is 5 or higher.  
**Criteria:**  
![Image](..\..\..\static\img\PowerShell-Version\image_10.png)  
When adding criteria, please search for the PowerShell Version custom field.  
- **Contains:** "Contains any of"  
- **Condition:** "Success"  

This group holds all devices that are on PowerShell version 5 or above.



