---
id: 'c61453e58-57fd-425e-aa68-0a1e003784d5'
slug: /c61453e58-57fd-425e-aa68-0a1e003784d5
title: 'cPVAL DUO UAC_PROTECTMODE'
title_meta: 'cPVAL DUO UAC_PROTECTMODE'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: '0 to respect existing Duo authentication control around logon; 1 to Disable Duo at logon and only prompt during User Elevation; 2 to enforce Duo at logon and User Elevation'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

0 to respect existing Duo authentication control around logon; 1 to Disable Duo at logon and only prompt during User Elevation; 2 to enforce Duo at logon and User Elevation

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO UAC_PROTECTMODE | cpvalDuoUacprotectmode | Organization | drop-down | `0`, `1`, `2` | `0` | False | Editable | Read/Write | Read/Write | 0 to respect existing Duo authentication control around logon; 1 to Disable Duo at logon and only prompt during User Elevation; 2 to enforce Duo at logon and User Elevation | Select the UAC Protect Mode. The default value is 0 | DUO UAC_PROTECTMODE |

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

**Label:** `cPVAL DUO UAC_PROTECTMODE`  
**Name:** `cpvalDuoUacprotectmode`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-duo-uacprotectmode/image1.png)

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

**Description:** `0 to respect existing Duo authentication control around logon; 1 to Disable Duo at logon and only prompt during User Elevation; 2 to enforce Duo at logon and User Elevation`  
**Tooltip Text:** `Select the UAC Protect Mode. The default value is 0`  
**Footer Text:** `DUO UAC_PROTECTMODE`

![Image2](../../../static/img/ninja-one-custom-field-cpval-duo-uacprotectmode/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- 0  
- 1
- 2

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/ninja-one-custom-field-cpval-duo-usernameformat/image3.png)

## Completed Custom Field

![Image4](../../../static/img/ninja-one-custom-field-cpval-duo-uacprotectmode/image4.png)

## Example

![Image5](../../../static/img/ninja-one-custom-field-cpval-duo-uacprotectmode/image5.png)
