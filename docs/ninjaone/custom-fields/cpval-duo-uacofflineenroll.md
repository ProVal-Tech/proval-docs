---
id: 'a83d55b5-c765-4a82-84e1-03fbeb3e8606'
slug: /a83d55b5-c765-4a82-84e1-03fbeb3e8606
title: 'cPVAL DUO UAC_OFFLINE_ENROLL'
title_meta: 'cPVAL DUO UAC_OFFLINE_ENROLL'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: '0 to prevent Offline Enrollment during User Elevation; 1 to Enable Offline Enrollment during User Elevation'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

0 to prevent Offline Enrollment during User Elevation; 1 to Enable Offline Enrollment during User Elevation

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO UAC_OFFLINE_ENROLL | cpvalDuoUacofflineenroll | Organization | drop-down | `0`, `1` | `1` | False | Editable | Read/Write | Read/Write | 0 to prevent Offline Enrollment during User Elevation; 1 to Enable Offline Enrollment during User Elevation | Select the option for Offline Enrollment during User Elevation. The default value is 1 | DUO UAC_OFFLINE_ENROLL |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Global Custom Fields`.  
![Step1](../../../static/img/ninja-one-custom-fields-common-screenshots/step1.png)

### Step 2

Locate the `Add` button on the right-hand side of the screen and click on it.  
![AddButton](../../../static/img/ninja-one-custom-fields-common-screenshots/addbutton.png)  

### Step 3

After clicking the `Add` button, select the `Field` button that appears.  
![FieldButton](../../../static/img/ninja-one-custom-fields-common-screenshots/fieldbutton.png)

The following Pop-up screen will appear:  
![InitialCustomFieldPopup](../../../static/img/ninja-one-custom-fields-common-screenshots/initialcustomfieldpopup.png)

### Step 4

**Custom Field Type:** `Drop-down`

Select `Drop-down` for the `Custom field type` and click `Continue` to proceed.  
![DropDown](../../../static/img/ninja-one-custom-fields-common-screenshots/dropdown.png)

The following Pop-up screen will appear:  
![Overview](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedoverview.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL DUO UAC_OFFLINE_ENROLL`  
**Name:** `cpvalDuoUacofflineenroll`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-duo-uacofflineenroll/image1.png)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedpermissions.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedgenericpermissions.png)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/ninja-one-custom-fields-common-screenshots/advanceddetails.png)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

**Description:** `0 to prevent Offline Enrollment during User Elevation; 1 to Enable Offline Enrollment during User Elevation`  
**Tooltip Text:** `Select the UAC Protect Mode. The default value is 0`  
**Footer Text:** `DUO UAC_OFFLINE_ENROLL`

![Image2](../../../static/img/ninja-one-custom-field-cpval-duo-uacofflineenroll/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- 0  
- 1

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/ninja-one-custom-field-cpval-duo-uacoffline/image3.png)

## Completed Custom Field

![Image4](../../../static/img/ninja-one-custom-field-cpval-duo-uacofflineenroll/image4.png)

## Example

![Image5](../../../static/img/ninja-one-custom-field-cpval-duo-uacofflineenroll/image5.png)
