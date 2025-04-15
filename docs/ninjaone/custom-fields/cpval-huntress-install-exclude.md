---
id: 'bdb92684-f093-49f8-9568-09874f9f79d5'
slug: /bdb92684-f093-49f8-9568-09874f9f79d5
title: 'cPVAL Huntress Install - Exclude'
title_meta: 'cPVAL Huntress Install - Exclude'
keywords: ['huntress', 'antivirus', 'auto-deploy']
description: 'Enable this custom field to exclude the location or device from the automatic installation of the Huntress Agent.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Summary

Enable this custom field to exclude the location or device from the automatic installation of the Huntress Agent.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Huntress Install - Exclude | cpvalHuntressInstallExclude | `Device`, `Location` | drop-down | `Yes`, `No` | `No` | False | Editable | Read/Write | Read/Write | Enable this custom field to exclude the location or device from the automatic installation of the Huntress Agent. | Select Yes to exclude the location or device from the automatic installation of the Huntress Agent. | cPVAL Huntress Install - Exclude |

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

**Label:** `cPVAL Huntress Install - Exclude`  
**Name:** `cpvalHuntressInstallExclude`  
**Definition Scope:** `Device`, `Location`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-huntress-install-exclude/image1.png)

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

**Description:** `Enable this custom field to exclude the location or device from the automatic installation of the Huntress Agent.`  
**Tooltip Text:** `Select Yes to exclude the location or device from the automatic installation of the Huntress Agent.`  
**Footer Text:** `cPVAL Huntress Install - Exclude`

![Image2](../../../static/img/ninja-one-custom-field-cpval-huntress-install-exclude/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Yes  
- No

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/ninja-one-custom-field-cpval-huntress-install-exclude/image3.png)

## Completed Custom Field

![Image4](../../../static/img/ninja-one-custom-field-cpval-huntress-install-exclude/image4.png)

## Example

![Image5](../../../static/img/ninja-one-custom-field-cpval-huntress-install-exclude/image5.png)
