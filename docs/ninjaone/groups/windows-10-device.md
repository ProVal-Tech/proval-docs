---
id: '3b41d9f6-f7f2-44f2-9ec3-3d9349e584f0'
slug: /3b41d9f6-f7f2-44f2-9ec3-3d9349e584f0
title: 'Windows 10 Device'
title_meta: 'Windows 10 Device'
keywords: ['Windows', 'Windows10', 'Windows 10']
description: 'This group contains the Windows 10 devices.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This group contains the Windows 10 devices list to schedule the [Script - Windows 11 Compatibility](/docs/fd6f7153-0a36-4a0b-a46d-ce403f13a540) to detect the compatibility check on it. It excludes devices where the script already ran.

## Details

| Name       | Description |
| ---------- | ----------- |
| cpval - Windows 10 Device | This group contains the Windows 10 devices. |

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
- **Condition:** `Not Exists`  

![test](../../../static/img/docs/windows-10-device/image.png)


### Step 6

![Custom](../../../static/img/docs/windows-10-device/image-1.png)


### Step 7

Select `OS` in the `More Filters` option

![alt text](../../../static/img/docs/windows-10-device/image-2.png)

Select the `Windows 10`

![Win10](../../../static/img/docs/windows-10-device/image-3.png)

### Step 8

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savegroup.webp)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savedevicegroup.webp)

### Step 9

Fill in the following details and click the `Save` button to create the group.

- **Name:** `Windows 10 Device`  
- **Description:** `This group contains the Windows 10 devices.`  
- **Permission Type:** `Self (Private) - default`

![Save](../../../static/img/docs/windows-10-device/image-4.png)

## Completed Group

![Complete](../../../static/img/docs/windows-10-device/{072DC899-92B8-42A2-B763-CAF4D3122453}.png)