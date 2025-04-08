---
id: 'c5dffd43-67a3-47af-83ef-68e24c4e6c07'
slug: /c5dffd43-67a3-47af-83ef-68e24c4e6c07
title: 'cPVAL - Server Role - FSMO - Schema Master'
title_meta: 'cPVAL - Server Role - FSMO - Schema Master'
keywords: ['windows', 'servers', 'role', 'fsmo', 'schema-master', 'domain-controller']
description: 'A group tailored for Windows Servers that have the Schema Master role installed'
tags: ['windows', 'dynamic-groups', 'active-directory', 'domain']
draft: false
unlisted: false
---

## Summary

A group tailored for Windows Servers that have the `Schema Master` role installed

## Details

| Name       | Description |
| ---------- | ----------- |
| cPVAL - Server Role - FSMO - Schema Master | A group tailored for Windows Servers that have the Schema Master role installed |

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
**Text:** `Schema Master`  

![Image1](../../../static/img/ninja-one-groups-cpval-server-role-fsmo-schema-master/image1.png)

### Step 6

Click the `Apply` button to proceed.  
![Image2](../../../static/img/ninja-one-groups-cpval-server-role-fsmo-schema-master/image2.png)

### Step 7

Click the `Save group` button to save changes.  
![SaveGroup](../../../static/img/ninja-one-groups-common-screenshots/savegroup.png)

`Save device group` window will appear on the screen.  
![SaveDeviceGroup](../../../static/img/ninja-one-groups-common-screenshots/savedevicegroup.png)

### Step 8

Fill in the following details and click the `Save` button to create the group.

**Name:** `cPVAL - Server Role - FSMO - Schema Master`  
**Description:** `A group tailored for Windows Servers that have the Schema Master role installed`  
**Permission Type:** `Self (Private) - default`

![Image3](../../../static/img/ninja-one-groups-cpval-server-role-fsmo-schema-master/image3.png)

## Completed Group

![Image4](../../../static/img/ninja-one-groups-cpval-server-role-fsmo-schema-master/image4.png)