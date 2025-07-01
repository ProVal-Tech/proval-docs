---
id: '7db8dfdf-6825-4349-94e1-f86348fdec03'
slug: /7db8dfdf-6825-4349-94e1-f86348fdec03
title: 'cPVAL Manage Time Zone'
title_meta: 'cPVAL Manage Time Zone'
keywords: ['time', 'time-zone', 'windows']
description: 'Select OS to enable Automatic Time Zone Management'
tags: ['timezone', 'windows']
draft: false
unlisted: false
---

## Summary

Select OS to enable Automatic Time Zone Management

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Manage Time Zone | cpvalManageTimeZone | `Organization`, `Location`, `Device` | Drop-down | False | | Editable | Read/Write | Read/Write | Select OS to enable Automatic Time Zone Management | Select OS to enable Automatic Time Zone Management | Manage Time Zone |

## Dependencies

- [Solution: Time Zone Management](/docs/3641dd0d-82d8-4137-b987-0b6c0d8238da)

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

- **Label:** `cPVAL Manage Time Zone`  
- **Name:** `cpvalManageTimeZone`  
- **Definition Scope:** `Organization`, `Location`, `Device`  
- **Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/7db8dfdf-6825-4349-94e1-f86348fdec03/image1.webp)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedpermissions.webp)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

- **Technician:** `Editable`  
- **Automation:** `Read/Write`  
- **API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedgenericpermissions.webp)

Clicking the `Next` button will take you to the `Details` tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advanceddetails.webp)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

- **Description:** `Select OS to enable Automatic Time Zone Management`  
- **Tooltip Text:** `Select OS to enable Automatic Time Zone Management`  
- **Footer Text:** `Manage Time Zone`

![Image2](../../../static/img/docs/7db8dfdf-6825-4349-94e1-f86348fdec03/image2.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.webp)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Windows  
- Windows Workstations
- Windows Servers
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/7db8dfdf-6825-4349-94e1-f86348fdec03/image3.webp)

## Completed Custom Field

![Image4](../../../static/img/docs/7db8dfdf-6825-4349-94e1-f86348fdec03/image4.webp)

## Example

![Image5](../../../static/img/docs/7db8dfdf-6825-4349-94e1-f86348fdec03/image5.webp)
