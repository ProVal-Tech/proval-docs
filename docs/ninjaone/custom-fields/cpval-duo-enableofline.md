---
id: '4db3e2e3-adfc-465a-8dc8-026b2fc77b45'
slug: /4db3e2e3-adfc-465a-8dc8-026b2fc77b45
title: 'cPVAL DUO ENABLEOFFLINE'
title_meta: 'cPVAL DUO ENABLEOFFLINE'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'If enabled, it will control whether offline access is permitted. For Duo, offline access allows users to authenticate without a real-time connection to Duo’s service, usually by using previously generated passcodes or other offline methods.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

If enabled, it will control whether offline access is permitted. For Duo, offline access allows users to authenticate without a real-time connection to Duo’s service, usually by using previously generated passcodes or other offline methods.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO ENABLEOFFLINE | cpvalDuoEnableoffline | Organization | drop-down | `Windows`, `Windows Workstations`, `Windows Servers`,  `Disabled` | | False | Editable | Read/Write | Read/Write | If enabled, it will control whether offline access is permitted. For Duo, offline access allows users to authenticate without a real-time connection to Duo’s service, usually by using previously generated passcodes or other offline methods. | Select the platform to enable DUO ENABLEOFFLINE. It is enabled by default. | DUO ENABLEOFFLINE |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Global Custom Fields`.  
![Step1](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen and click on it.  
![AddButton](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/addbutton.webp)  

### Step 3

After clicking the `Add` button, select the `Field` button that appears.  
![FieldButton](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/fieldbutton.webp)

The following Pop-up screen will appear:  
![InitialCustomFieldPopup](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/initialcustomfieldpopup.webp)

### Step 4

**Custom Field Type:** `Drop-down`

Select `Drop-down` for the `Custom field type` and click `Continue` to proceed.  
![DropDown](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/dropdown.webp)

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedoverview.webp)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL DUO ENABLEOFFLINE`  
**Name:** `cpvalDuoEnableoffline`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/4db3e2e3-adfc-465a-8dc8-026b2fc77b45/image1.webp)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedpermissions.webp)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedgenericpermissions.webp)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advanceddetails.webp)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

**Description:** `If enabled, it will control whether offline access is permitted. For Duo, offline access allows users to authenticate without a real-time connection to Duo’s service, usually by using previously generated passcodes or other offline methods.`  
**Tooltip Text:** `Select the platform to enable DUO ENABLEOFFLINE. It is enabled by default.`  
**Footer Text:** `DUO ENABLEOFFLINE`

![Image2](../../../static/img/docs/4db3e2e3-adfc-465a-8dc8-026b2fc77b45/image2.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.webp)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Windows  
- Windows Workstations
- Windows Servers
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/4db3e2e3-adfc-465a-8dc8-026b2fc77b45/image3.webp)

## Completed Custom Field

![Image4](../../../static/img/docs/4db3e2e3-adfc-465a-8dc8-026b2fc77b45/image4.webp)

## Example

![Image5](../../../static/img/docs/4db3e2e3-adfc-465a-8dc8-026b2fc77b45/image5.webp)