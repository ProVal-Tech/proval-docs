---
id: 'd743519c-45d0-4adb-80c9-775e4b5273d2'
slug: /d743519c-45d0-4adb-80c9-775e4b5273d2
title: 'cPVAL - Server Role - NPS Servers'
title_meta: 'cPVAL - Server Role - NPS Servers'
keywords: ['windows', 'servers', 'role', 'nps', 'network-policy']
description: 'A group tailored for Windows Servers that have the Network Policy and Access Services role installed'
tags: ['windows', 'dynamic-groups']
draft: false
unlisted: false
---

## Summary

A group tailored for Windows Servers that have the `Network Policy and Access Services` role installed

## Details

| Name       | Description |
| ---------- | ----------- |
| cPVAL - Server Role - NPS Servers | A group tailored for Windows Servers that have the Network Policy and Access Services role installed |

## Dependencies
[Solution - Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)  
[cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)  
[cPVAL - Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)  
[Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9)

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

Fill in the following conditions and click the `Add` button to proceed.  

**Custom Field:** `cPVAL Roles Detected`  
**Condition:** `Contains`  
**Text:** `Network Policy and Access Services`  

![Image1](../../../static/img/docs/d743519c-45d0-4adb-80c9-775e4b5273d2/image1.webp)

### Step 6

Click the `Apply` button to proceed.  
![Image2](../../../static/img/docs/d743519c-45d0-4adb-80c9-775e4b5273d2/image2.webp)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savegroup.webp)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savedevicegroup.webp)

### Step 8

Fill in the following details and click the `Save` button to create the group.

**Name:** `cPVAL - Server Role - NPS Servers`  
**Description:** `A group tailored for Windows Servers that have the Network Policy and Access Services role installed`  
**Permission Type:** `Self (Private) - default`

![Image3](../../../static/img/docs/d743519c-45d0-4adb-80c9-775e4b5273d2/image3.webp)

## Completed Group

![Image4](../../../static/img/docs/d743519c-45d0-4adb-80c9-775e4b5273d2/image4.webp)