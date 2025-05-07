---
id: 'e9ec73dd-98b1-4436-a027-4ee8906f7cba'
slug: /e9ec73dd-98b1-4436-a027-4ee8906f7cba
title: 'cPVAL Roles Detected'
title_meta: 'cPVAL Roles Detected'
keywords: ['roles', 'custom-fields']
description: 'This custom field stores the list of roles detected on a Windows server.'
tags: ['custom-fields']
draft: false
unlisted: false
---

## Summary

This custom field stores the list of roles detected on a Windows server.

## Details

| Label | Field Name | Definition Scope | Type | Required | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | -------- |  --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Roles Detected | cpvalRolesDetected | Device | Multi-line | No | Editable | Read/Write | Read/Write | This custom field stores the list of roles detected on a Windows machine. | Stores the list of roles detected on the computer. | Detected Roles |

## Dependencies

[Windows Server Roles Detection](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)

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

Select the `Multi-line` custom field type from the dropdown menu.  
![Image1](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image1.png)

Click the `Continue` button to continue with the custom field creation.  
![Image2](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image2.png)

The following Pop-up screen will appear:  
![Image3](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image3.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.  

**Label:** `cPVAL Roles Detected`  
**Name:** `cpvalRolesDetected`  
**Definition Scope:** `Device`  
**Custom field is required:** `<Leave it unchecked>`

![Image4](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image4.png)

The following Pop-up screen will appear:  
![Image5](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image5.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Image6](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image6.png)

The following Pop-up screen will appear:  
![Image7](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image7.png)

### Step 7

Set the following details in the `Details` section and click the `Create` button to complete the creation of custom field.

**Description:** `This custom field stores the list of roles detected on a Windows machine.`  
**Tooltip text:** `Stores the list of roles detected on the computer.`  
**Footer text:** `Detected Roles`

![Image8](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image8.png)

## Completed Custom Field

![Image9](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image9.png)

## Example

![Image10](../../../static/img/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba/image10.png)