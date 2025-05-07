---
id: '67554954-e8da-48af-bda9-13a6a37c8295'
slug: /67554954-e8da-48af-bda9-13a6a37c8295
title: 'cPVAL Huntress Deployment'
title_meta: 'cPVAL Huntress Deployment'
keywords: ['huntress', 'antivirus', 'auto-deploy']
description: 'Choose the operating system to activate the auto deployment of the Huntress Agent. Auto deployment can be enabled for Windows machines only or for both Windows and Macintosh computers.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Summary

Choose the operating system to activate the auto deployment of the Huntress Agent. Auto deployment can be enabled for Windows machines only or for both Windows and Macintosh computers.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Huntress Deployment | cpvalHuntressDeployment | Organization | drop-down | `Windows`, `Windows and Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | Choose the operating system to activate the auto deployment of the Huntress Agent. Auto deployment can be enabled for Windows machines only or for both Windows and Macintosh computers. | Choose the Operating System to enable the Auto Deployment of the Huntress Agent | Default is Disabled |

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

**Label:** `cPVAL Huntress Deployment`  
**Name:** `cpvalHuntressDeployment`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/67554954-e8da-48af-bda9-13a6a37c8295/image1.png)

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

**Description:** `Choose the operating system to activate the auto deployment of the Huntress Agent. Auto deployment can be enabled for Windows machines only or for both Windows and Macintosh computers.`  
**Tooltip Text:** `Choose the Operating System to enable the Auto Deployment of the Huntress Agent`  
**Footer Text:** `Default is Disabled`

![Image2](../../../static/img/docs/67554954-e8da-48af-bda9-13a6a37c8295/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Windows  
- Windows and Macintosh  
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/67554954-e8da-48af-bda9-13a6a37c8295/image3.png)

## Completed Custom Field

![Image4](../../../static/img/docs/67554954-e8da-48af-bda9-13a6a37c8295/image4.png)

## Example

![Image5](../../../static/img/docs/67554954-e8da-48af-bda9-13a6a37c8295/image5.png)