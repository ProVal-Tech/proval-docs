---
id: 'd743519c-45d0-4adb-80c9-775e4b5273d2'
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

[cPVAL - Windows Servers](./cpval-windows-servers.md)  
[cPVAL - Roles Detected](../custom-fields/cpval-roles-detected.md)  
[Windows Server Roles Detection](../automations/windows-server-roles-detection.md)

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
**Text:** `Network Policy and Access Services`  

![Image1](../../../static/img/ninja-one-groups-cpval-server-role-nps-servers/image1.png)

### Step 6

Click the `Apply` button to proceed.  
![Image2](../../../static/img/ninja-one-groups-cpval-server-role-nps-servers/image2.png)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/ninja-one-groups-common-screenshots/savegroup.png)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/ninja-one-groups-common-screenshots/savedevicegroup.png)

### Step 8

Fill in the following details and click the `Save` button to create the group.

**Name:** `cPVAL - Server Role - NPS Servers`  
**Description:** `A group tailored for Windows Servers that have the Network Policy and Access Services role installed`  
**Permission Type:** `Self (Private) - default`

![Image3](../../../static/img/ninja-one-groups-cpval-server-role-nps-servers/image3.png)

## Completed Group

![Image4](../../../static/img/ninja-one-groups-cpval-server-role-nps-servers/image4.png)
