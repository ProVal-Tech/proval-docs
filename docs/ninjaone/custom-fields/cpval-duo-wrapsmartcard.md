---
id: 'f7519fa5-6ffd-49a1-aab2-d63e3d1c1d3e'
slug: /f7519fa5-6ffd-49a1-aab2-d63e3d1c1d3e
title: 'cPVAL DUO WRAPSMARTCARD'
title_meta: 'cPVAL DUO WRAPSMARTCARD'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO WRAPSMARTCARD | cpvalDuoWrapsmartcard | Organization | drop-down | `Windows`, `Windows Workstations`, `Windows Servers`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward. | Select the platform to require Duo after smart card primary logon | DUO WRAPSMARTCARD |

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

**Label:** `cPVAL DUO WRAPSMARTCARD`  
**Name:** `cpvalDuoWrapsmartcard`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-duo-wrapsmartcard/image1.png)

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

**Description:** `Enable this custom property to require Duo after smart card primary logon, or not to allow smart card logon without Duo approval afterward.`  
**Tooltip Text:** `Select the platform to require Duo after smart card primary logon`  
**Footer Text:** `DUO WRAPSMARTCARD`

![Image2](../../../static/img/ninja-one-custom-field-cpval-duo-wrapsmartcard/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Windows  
- Windows Workstations
- Windows Servers
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/ninja-one-custom-field-cpval-duo-enableoffline/image3.png)

## Completed Custom Field

![Image4](../../../static/img/ninja-one-custom-field-cpval-duo-wrapsmartcard/image4.png)

## Example

![Image5](../../../static/img/ninja-one-custom-field-cpval-duo-wrapsmartcard/image5.png)
