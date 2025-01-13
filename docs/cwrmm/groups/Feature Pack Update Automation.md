---
id: 'rmm-feature-pack-update-automation'
title: 'Feature Pack Update Automation'
title_meta: 'Feature Pack Update Automation'
keywords: ['windows', 'build', 'update', 'group', 'criteria', 'dynamic', 'automation']
description: 'This document outlines the process for organizing computers running on older build versions of Windows 10 and 11 by creating a dynamic group that categorizes these systems based on their OS build numbers and other criteria. It includes step-by-step instructions and dependencies for effective implementation.'
tags: ['windows', 'update', 'group', 'criteria', 'automation', 'dynamic']
draft: false
unlisted: false
---
## Summary

Organize computers operating on older build versions of Windows 10 and 11. The grouping involves comparing the computer's build version with the latest available build for the operating system. Currently, the latest builds are 22631 for Windows 11 and 19045 for Windows 10; these values should be updated manually in the group's criteria after Microsoft releases the newer builds.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845)
- [CW RMM - Custom Field - WinFeatUpgradeAttempts](https://proval.itglue.com/DOC-5078775-12949095)
- [CW RMM - Custom Field - Feature Update Reboot Pending](https://proval.itglue.com/DOC-5078775-14592255)

## Summary

![Image](../../../static/img/Feature-Pack-Update-Automation/image_1.png)

**Group Type:** Dynamic Group  
**Group Name:** Feature Pack Update Automation  
**Description:** Categorize computers running Windows 10 and 11 that are using the older build version.

## Criteria

- Select `OS Build Number` for the Criteria `Does Not Contain any` for comparator and type `19045` and `22631` in the condition box.  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_2.png)  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_3.png)  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_4.png)

- Click the `Add Criteria` button to add another Criteria.  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_5.png)

- Select `OS` for the Criteria `Contains any of` for comparator and `Microsoft Windows 10 and 11` for the condition.  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_6.png)  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_7.png)  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_8.png)

- Add another criteria by clicking the `Add Criteria` button.

- Select `Feature Update Reboot Pending` custom field for criteria, `Equal` for comparator and type `False` in the condition box.  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_9.png)

- Add another criteria by clicking the `Add Criteria` button.

- Choose the `WinFeatUpgradeAttempts` custom field for criteria, select `Does Not Contain any` for the comparator, and enter the integers from 3 to 15 in the condition field. Enter each number individually, pressing Enter after each one: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15.  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_10.png)  
  ![Image](../../../static/img/Feature-Pack-Update-Automation/image_11.png)

## Group

Click the Save button to Save the Group.  
![Image](../../../static/img/Feature-Pack-Update-Automation/image_12.png)

![Image](../../../static/img/Feature-Pack-Update-Automation/image_13.png)



