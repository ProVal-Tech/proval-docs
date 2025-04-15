---
id: '3ce9e690-2bf1-4e78-9e66-04960f3f1b25'
slug: /3ce9e690-2bf1-4e78-9e66-04960f3f1b25
title: 'cPVAL DUO AUTOPUSH'
title_meta: 'cPVAL DUO AUTOPUSH'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'If enabled, this option will automatically send a push request to the user''s device when they attempt to log in. The default value is blank, which requires the user to manually request the push.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

If enabled, this option will automatically send a push request to the user's device when they attempt to log in. The default value is blank, which requires the user to manually request the push.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO AUTOPUSH | cpvalDuoAutopush | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | If enabled, this option will automatically send a push request to the user's device when they attempt to log in. The default value is blank, which requires the user to manually request the push. | Select the platform to enable DUO AutoPush | DUO AUTOPUSH |

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

**Label:** `cPVAL DUO AUTOPUSH`  
**Name:** `cpvalDuoAutopush`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-duo-autopush/image1.png)

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

**Description:** `If enabled, this option will automatically send a push request to the user's device when they attempt to log in. The default value is blank, which requires the user to manually request the push.`  
**Tooltip Text:** `Select the platform to enable DUO AutoPush`  
**Footer Text:** `DUO AUTOPUSH`

![Image2](../../../static/img/ninja-one-custom-field-cpval-duo-autopush/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- All
- Windows  
- Windows Workstations
- Windows Servers
- Macintosh
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/ninja-one-custom-field-cpval-duo-deployment/image3.png)

## Completed Custom Field

![Image4](../../../static/img/ninja-one-custom-field-cpval-duo-autopush/image4.png)

## Example

![Image5](../../../static/img/ninja-one-custom-field-cpval-duo-autopush/image5.png)
