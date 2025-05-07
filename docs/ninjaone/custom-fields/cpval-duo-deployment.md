---
id: '22469c4c-79f2-4a87-9650-f418f4327e07'
slug: /22469c4c-79f2-4a87-9650-f418f4327e07
title: 'cPVAL DUO Deployment'
title_meta: 'cPVAL DUO Deployment'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'Select the required platform to enable Duo to auto-deploy.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Select the required platform to enable Duo to auto-deploy.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO Deployment | cpvalDuoDeployment | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | Select the required platform to enable Duo to auto-deploy. | Select the required platform to enable Duo to auto-deploy. | DUO Deployment |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Global Custom Fields`.  
![Step1](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/step1.png)

### Step 2

Locate the `Add` button on the right-hand side of the screen and click on it.  
![AddButton](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/addbutton.png)  

### Step 3

After clicking the `Add` button, select the `Field` button that appears.  
![FieldButton](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/fieldbutton.png)

The following Pop-up screen will appear:  
![InitialCustomFieldPopup](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/initialcustomfieldpopup.png)

### Step 4

**Custom Field Type:** `Drop-down`

Select `Drop-down` for the `Custom field type` and click `Continue` to proceed.  
![DropDown](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/dropdown.png)

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedoverview.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL DUO Deployment`  
**Name:** `cpvalDuoDeployment`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image1_1.png)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedpermissions.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedgenericpermissions.png)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advanceddetails.png)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

**Description:** `Select the required platform to enable Duo to auto-deploy.`  
**Tooltip Text:** `Select the required platform to enable Duo to auto-deploy.`  
**Footer Text:** `DUO Deployment`

![Image2](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image2_1.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- All
- Windows  
- Windows Workstations
- Windows Servers
- Macintosh
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image3.png)

## Completed Custom Field

![Image4](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image4_1.png)

## Example

![Image5](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image5_1.png)