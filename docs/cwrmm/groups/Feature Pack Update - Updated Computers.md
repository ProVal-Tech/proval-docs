---
id: '72490aca-9d0d-47b9-88a9-437279e21d7a'
title: 'Feature Pack Update - Updated Computers'
title_meta: 'Feature Pack Update - Updated Computers'
keywords: ['windows', 'update', 'group', 'criteria', 'custom', 'field', 'install', 'failure', 'reboot', 'pending']
description: 'This document outlines the process to classify Windows 10 and 11 computers that are on the latest build version while still having values in associated custom fields. It includes dependencies, criteria setup, and group creation steps for effective management in ConnectWise RMM.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document explains how to classify Windows 10 and 11 computers that are already using the latest build version but still possess a value in any of the associated custom fields.

## Dependencies

- [CW RMM - Task - Feature Update Install With Tracking](<../tasks/Feature Update Install With Tracking.md>)
- [CW RMM - Custom Field - WinFeatUpgradeAttempts](<../custom-fields/WinFeatUpgradeAttempts.md>)
- [CW RMM - Custom Field - Feature Update Reboot Pending](<../custom-fields/Feature Update Reboot Pending.md>)
- [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254)
- [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](<../tasks/Feature Update Install with Tracking (Reset Custom Fields).md>)

## Group Details

**Group Type:** Dynamic

**Group Name:** Feature Pack Update - Updated Computers

**Description:** Categorize the Windows 10 and 11 computers that are already on the latest build version.

## Criteria

- Select `OS Build Number` for the criteria:
  - Contains any of `19045` and `22631` in the condition box.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_1.png)

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_2.png)

- Click the `Add Criteria` button to add another criterion.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_3.png)

- Select `OS` for the criteria:
  - Contains any of `Microsoft Windows 10 and 11` for the condition.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_4.png)

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_5.png)

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_6.png)

- Add an outer block by clicking the `Add Outer Block` button.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_7.png)

- The main outer block should use AND and not OR.

- In the `Outer Block`, select the `Feature Update Install Failure` custom field for criteria:
  - Contains any of `Error` in the condition box.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_8.png)

- Select the `Feature Update Reboot Pending` custom field for criteria, `Equal` for comparator, and type `True` in the condition box.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_9.png)

- Add another criterion by clicking the `Add Criteria` button inside the outer block.

- Choose the `WinFeatUpgradeAttempts` custom field for criteria:
  - Contains any of the integers from 1 to 15 in the condition field. Enter each number individually, pressing Enter after each one: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_10.png)

- Now, change the comparators from `AND` to `OR` inside the outer block.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_11.png)

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_12.png)

## Group Creation

Click the Save button to save the group.

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_13.png)

![Image](../../../static/img/Feature-Pack-Update---Updated-Computers/image_14.png)

