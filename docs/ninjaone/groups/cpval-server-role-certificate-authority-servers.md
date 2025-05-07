---
id: '2b5f6e75-c2d7-4c48-b147-dee2527d9922'
slug: /2b5f6e75-c2d7-4c48-b147-dee2527d9922
title: 'cPVAL - Server Role - Certificate Authority Servers'
title_meta: 'cPVAL - Server Role - Certificate Authority Servers'
keywords: ['windows', 'servers', 'role', 'active-directory', 'domain', 'certificate']
description: 'A group tailored for Windows Servers that have the Active Directory Certificate Services role installed.'
tags: ['windows', 'dynamic-groups', 'active-directory', 'certificates']
draft: false
unlisted: false
---

## Summary

A group tailored for Windows Servers that have the `Active Directory Certificate Services` role installed.

## Details

| Name       | Description |
| ---------- | ----------- |
| cPVAL - Server Role - Certificate Authority Servers | A group tailored for Windows Servers that have the Active Directory Certificate Services role installed. |

## Dependencies

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
**Text:** `Active Directory Certificate Services`  

![Image1](../../../static/img/docs/2b5f6e75-c2d7-4c48-b147-dee2527d9922/image1.webp)

### Step 6

Click the `Apply` button to proceed.  
![Image2](../../../static/img/docs/2b5f6e75-c2d7-4c48-b147-dee2527d9922/image2.webp)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savegroup.webp)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/docs/9316845d-5924-4397-80eb-7ecd6b27a1e1/savedevicegroup.webp)

### Step 8

Fill in the following details and click the `Save` button to create the group.

**Name:** `cPVAL - Server Role - Certificate Authority Servers`  
**Description:** `A group tailored for Windows Servers that have the Active Directory Certificate Services role installed.`  
**Permission Type:** `Self (Private) - default`

![Image3](../../../static/img/docs/2b5f6e75-c2d7-4c48-b147-dee2527d9922/image3.webp)

## Completed Group

![Image4](../../../static/img/docs/2b5f6e75-c2d7-4c48-b147-dee2527d9922/image4.webp)