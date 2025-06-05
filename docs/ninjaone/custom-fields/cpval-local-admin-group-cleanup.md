---
id: 'd39ab865-2fad-461f-8c39-6540e0199b8e'
slug: /d39ab865-2fad-461f-8c39-6540e0199b8e
title: 'cPVAL Local Admin Group Cleanup'
title_meta: 'cPVAL Local Admin Group Cleanup'
keywords: ['local', 'admin', 'cleanup', 'windows']
description: 'Select the operating system to activate the local admin group cleanup solution for the client. To exclude a specific location or computer, set this field to `Disable` at that level.'
tags: ['cleanup', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

Select the operating system to activate the local admin group cleanup solution for the client. To exclude a specific location or computer, set this field to `Disable` at that level.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Local Admin Group Cleanup | cpvalLocalAdminGroupCleanup | `Organization`, `Location`, `Device` | Drop-down | False | | Editable | Read/Write | Read/Write | Select the operating system to activate the local admin group cleanup solution for the client. To exclude a specific location or computer, set this field to `Disable` at that level. | Select the operating system to enable the local admin group cleanup solution for the client. To exclude a specific location or computer, set this field to `Disable` at that level. | Local Admin Group Cleanup |

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

**Label:** `cPVAL Local Admin Group Cleanup`  
**Name:** `cpvalLocalAdminGroupCleanup`  
**Definition Scope:** `Organization`, `Location`, `Device`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/d39ab865-2fad-461f-8c39-6540e0199b8e/image1.webp)

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

**Description:** `Select the operating system to activate the local admin group cleanup solution for the client. To exclude a specific location or computer, set this field to Disable at that level.`  
**Tooltip Text:** `Select the operating system to activate the local admin group cleanup solution for the client. To exclude a specific location or computer, set this field to Disable at that level.`  
**Footer Text:** `Local Admin Group Cleanup`

![Image2](../../../static/img/docs/d39ab865-2fad-461f-8c39-6540e0199b8e/image2.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.webp)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Windows  
- Windows Workstations
- Windows Servers
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/d39ab865-2fad-461f-8c39-6540e0199b8e/image3.webp)

## Completed Custom Field

![Image4](../../../static/img/docs/d39ab865-2fad-461f-8c39-6540e0199b8e/image4.webp)

## Example

![Image5](../../../static/img/docs/d39ab865-2fad-461f-8c39-6540e0199b8e/image5.webp)
