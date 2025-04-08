---
id: '58235f08-f095-4242-955f-d369947fb512'
slug: /58235f08-f095-4242-955f-d369947fb512
title: 'cPVAL - Server Role - File Servers'
title_meta: 'cPVAL - Server Role - File Servers'
keywords: ['windows', 'servers', 'role', 'file', 'storage', 'file-server']
description: 'A group tailored for Windows Servers that have the File and Storage Services role installed'
tags: ['windows', 'dynamic-groups', 'ftp']
draft: false
unlisted: false
---

## Summary

A group tailored for Windows Servers that have the `File and Storage Services` role installed

## Details

| Name       | Description |
| ---------- | ----------- |
| cPVAL - Server Role - File Servers | A group tailored for Windows Servers that have the File and Storage Services role installed |

## Dependencies

[cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)  
[cPVAL - Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)  
[Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9)

## Group Creation

### Step 1

Navigate to `Administration` > `Devices` > `Groups`  
![Step1](../../../static/img/ninja-one-groups-common-screenshots/step1.png)

### Step 2

Locate the `Create New Group` button on the right-hand side of the screen, click on it.  
![CreateNewGroup](../../../static/img/ninja-one-groups-common-screenshots/createnewgroup.png)

### Step 3

**Condition:** `More filters` `=>` `Custom Fields`

Search and select the `Custom Fields` from the `More filters` button.  
![MoreFiltersCustomFields](../../../static/img/ninja-one-groups-common-screenshots/morefilterscustomfields.png)

`Filter by: Custom Fields` windows will appear on the screen.  
![FilterByCustomFields](../../../static/img/ninja-one-groups-common-screenshots/filterbycustomfields.png)

### Step 4

Click the `Add` button located in the front of `Has all conditions`.  
![HasAllConditionsAdd](../../../static/img/ninja-one-groups-common-screenshots/hasallconditionsadd.png)

The `Add Custom Field` screen will appear.  
![AddCustomField](../../../static/img/ninja-one-groups-common-screenshots/addcustomfield.png)

### Step 5

Fill in the following conditions and click the `Add` button to proceed.  

**Custom Field:** `cPVAL Roles Detected`  
**Condition:** `Contains`  
**Text:** `File and Storage Services`  

![Image1](../../../static/img/ninja-one-groups-cpval-server-role-file-servers/image1.png)

### Step 6

Click the `Apply` button to proceed.  
![Image2](../../../static/img/ninja-one-groups-cpval-server-role-file-servers/image2.png)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/ninja-one-groups-common-screenshots/savegroup.png)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/ninja-one-groups-common-screenshots/savedevicegroup.png)

### Step 8

Fill in the following details and click the `Save` button to create the group.

**Name:** `cPVAL - Server Role - File Servers`  
**Description:** `A group tailored for Windows Servers that have the File and Storage Services role installed`  
**Permission Type:** `Self (Private) - default`

![Image3](../../../static/img/ninja-one-groups-cpval-server-role-file-servers/image3.png)

## Completed Group

![Image4](../../../static/img/ninja-one-groups-cpval-server-role-file-servers/image4.png)