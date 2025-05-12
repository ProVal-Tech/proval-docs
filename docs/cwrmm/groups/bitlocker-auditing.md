---
id: '38b92368-f583-426c-b8f1-5f3b6d56b410'
slug: /38b92368-f583-426c-b8f1-5f3b6d56b410
title: 'BitLocker Auditing'
title_meta: 'BitLocker Auditing'
keywords: ['bitlocker', 'encryption', 'auditing', 'device', 'group', 'status', 'recovery', 'key']
description: 'This document provides a comprehensive guide to creating device groups for the BitLocker drive encryption auditing solution in ConnectWise RMM. It details the necessary dependencies and outlines the criteria for four specific device groups: BitLocker - Audit Required, BitLocker - Enabled, BitLocker - Disabled, and BitLocker - Regular Auditing.'
tags: ['encryption', 'security']
draft: false
unlisted: false
---

## Summary

There are four device groups related to the BitLocker drive encryption auditing solution. Please see the guide below to create the separate device groups.

## Dependencies

- [CW RMM - Custom Field - BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f)
- [CW RMM - Custom Field - BitLocker Status and Recovery Key Audit](/docs/a7785954-5a6d-4003-9d0e-c919e1a96b0c)

## Create Device Groups

To create device groups, please navigate to **Devices > Device Groups**.

**![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_1.webp)**

Select **Add > Dynamic Group**

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_2.webp)

Please repeat the above steps for each device group.

---

### Device Group Name: BitLocker - Audit Required

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_3.webp)

**Description:** Holds all devices that have not had their drives evaluated for drive encryption status via BitLocker (where the custom field is blank).

**Criteria:**

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_4.webp)

When adding criteria, please search for the **BitLocker Status and Recovery Key Audit** field.

- Contains: "Is Blank"
- Condition: "True"

This group holds all devices that have not had their BitLocker status audited.

---

### Device Group Name: BitLocker - Enabled

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_5.webp)

**Description:** Holds devices that have BitLocker drive encryption enabled on the device (custom field = Enabled).

**Criteria:**

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_6.webp)

When adding criteria, please search for the **BitLocker Status and Recovery Key Audit** field.

- Row 1: Contains: "Does Not Contain any of"
  - Condition: "Not Enabled"
  - + Add Criteria
- AND
- Row 2: Contains "Does Not Contain any of"
  - Condition: unavailable
  - + Add Criteria
- AND
- Row 3: Contains "Is Blank"
  - Condition: False

This group holds all devices where BitLocker is enabled and will include the details of the recovery key (if available).

---

### Device Group Name: BitLocker - Disabled

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_7.webp)

**Description:** Holds devices that have BitLocker drive encryption disabled on the device (custom field != Enabled).

**Criteria:**

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_8.webp)

When adding criteria, please search for the **BitLocker Status and Recovery Key Audit** field.

- Row 1: Contains: "Is Blank"
  - Condition: "False"
  - + Add Criteria
- AND
- Row 2: Contains "Contain any of"
  - Condition: "Not Enabled"

This group holds all devices where BitLocker is not enabled.

---

### Device Group Name: BitLocker - Regular Auditing

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_9.webp)

**Description:** This group contains all devices that have already been audited for BitLocker. The audit script for BitLocker on an ongoing basis is scheduled against this device group.

**Criteria:**

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_10.webp)

When adding criteria, please search for the **BitLocker Status and Recovery Key Audit** field.

- Contains: "Is Blank"
- Condition: "False"

This group holds all devices that have been audited for BitLocker and checks their status on a regular basis.

This is the scheduled recurrence of the [CW RMM - Task - BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) task.

![Image](../../../static/img/docs/38b92368-f583-426c-b8f1-5f3b6d56b410/image_11.webp)