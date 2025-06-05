---
id: 'ac1500b2-aa22-48fe-b1c2-4d57f9b955de'
slug: /ac1500b2-aa22-48fe-b1c2-4d57f9b955de
title: 'cpval - Windows 11 Incompatible device'
title_meta: 'cpval - Windows 11 Incompatible device'
keywords: ['Windows', 'incompatible', 'upgrade']
description: 'This group contains the Windows 11 incompatible devices detected by the script Windows 11 Compatibility'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This group contains the Windows 11 compatible devices list where the script [Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540) detects the value stored in [Custom field - cPVAL Win 11 Compatibility](/docs/7967028d-d2ff-4afe-a89e-437541c70208) as 'Not Capable' or 'Undetermined'.

## Details

| Name       | Description |
| ---------- | ----------- |
| cpval - Windows 11 Incompatible Device | This group contains the Windows 11 incompatible devices detected by the [Script - Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540) |

## Dependencies

- [Custom field - cPVAL Win 11 Compatibility](/docs/7967028d-d2ff-4afe-a89e-437541c70208)  
- [Script - Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540)  
- [Solution - Windows 11 Compatibility Validation](/docs/fa172fda-07d3-4a7c-bb17-5e7179db991a)

## Group Creation

### Step 1

Navigate to `Administration` > `Devices` > `Groups`  
![Step1](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/step1.webp)

### Step 2

Locate the `Create New Group` button on the right-hand side of the screen, click on it.  
![CreateNewGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/createnewgroup.webp)

### Step 3

**Condition:** `More filters` `=>` `Custom Fields`

Search and select the `Custom Fields` from the `More filters` button.  
![MoreFiltersCustomFields](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/morefilterscustomfields.webp)

`Filter by: Custom Fields` windows will appear on the screen.  
![FilterByCustomFields](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/filterbycustomfields.webp)

### Step 4

Click the `Add` button located in the front of `Has all conditions`.  
![HasAllConditionsAdd](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/hasallconditionsadd.webp)

The `Add Custom Field` screen will appear.  
![AddCustomField](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/addcustomfield.webp)

### Step 5

Fill in the following `Has Any Conditions` and click the `Add` button to proceed.  

- **Custom Field:** `cPVAL Win 11 Compatibility`  
- **Condition:** `Equal`  
- **Text:** `Not Capable`  

![NotCapable](../../../static/img/docs/cpval-windows-11-incompatible-device/image.png)

Click `Add` again in the  `Has Any Conditions`:

- **Custom Field:** `cPVAL Win 11 Compatibility`  
- **Condition:** `Equal`  
- **Text:** `Undetermined`  

![Undetermined](../../../static/img/docs/cpval-windows-11-incompatible-device/image-1.png)

### Step 6

![Any](../../../static/img/docs/cpval-windows-11-incompatible-device/image-2.png)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savegroup.webp)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savedevicegroup.webp)

### Step 8

Fill in the following details and click the `Save` button to create the group.

- **Name:** `Windows 11 Incompatible Device`  
- **Description:** `This group contains the Windows 11 incompatible devices detected by the script "Windows 11 Compatibility".`  
- **Permission Type:** `Self (Private) - default`

![Group](../../../static/img/docs/cpval-windows-11-incompatible-device/image-3.png)

## Complete Group

![Complete](../../../static/img/docs/cpval-windows-11-incompatible-device/image-4.png)