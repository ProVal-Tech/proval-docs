---
id: 'e06f0af4-33e6-4a5a-93eb-5e56e8b06e0d'
title: 'cPVAL - Server Role - Web Servers'
title_meta: 'cPVAL - Server Role - Web Servers'
keywords: ['windows', 'servers', 'role', 'iis', 'web-server']
description: 'A group tailored for Windows Servers that have the Web Server (IIS) role installed'
tags: ['windows', 'dynamic-groups', 'iis']
draft: false
unlisted: false
---

## Summary

A group tailored for Windows Servers that have the `Web Server (IIS)` role installed

## Details

| Name       | Description |
| ---------- | ----------- |
| cPVAL - Server Role - Web Servers | A group tailored for Windows Servers that have the Web Server (IIS) role installed |

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
**Text:** `Web Server (IIS)`  

![Image1](../../../static/img/ninja-one-groups-cpval-server-role-web-servers/image1.png)

### Step 6

Click the `Apply` button to proceed.  
![Image2](../../../static/img/ninja-one-groups-cpval-server-role-web-servers/image2.png)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/ninja-one-groups-common-screenshots/savegroup.png)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/ninja-one-groups-common-screenshots/savedevicegroup.png)

### Step 8

Fill in the following details and click the `Save` button to create the group.

**Name:** `cPVAL - Server Role - Web Servers`  
**Description:** `A group tailored for Windows Servers that have the Web Server (IIS) role installed`  
**Permission Type:** `Self (Private) - default`

![Image3](../../../static/img/ninja-one-groups-cpval-server-role-web-servers/image3.png)

## Completed Group

![Image4](../../../static/img/ninja-one-groups-cpval-server-role-web-servers/image4.png)
