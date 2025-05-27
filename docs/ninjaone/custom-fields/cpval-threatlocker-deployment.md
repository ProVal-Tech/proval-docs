---
id: 'c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2'
slug: /c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2
title: 'cPVAL Threatlocker Deployment'
title_meta: 'cPVAL Threatlocker Deployment'
keywords: ['Threatlocker','windows','Mac','Deployment']
description: 'Enables Threatlocker auto-deployment for Windows or both Windows and Macintosh machines at the organization level.'
tags: ['security','setup','windows','macos']
draft: false
unlisted: false
---

## Summary
Enables Threatlocker auto-deployment for Windows or both Windows and Macintosh machines at the organization level.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Threatlocker Deployment | cpvalThreatlockerDeployment | Organization | drop-down | `Windows`, `Windows and Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | Enables Threatlocker auto-deployment for Windows or both Windows and Macintosh machines at the organization level. | - | Default is Disabled |

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

**Label:** `cPVAL Threatlocker Deployment`  
**Name:** `cpvalThreatlockerDeployment`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2/image1.webp)

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

**Description:** `Enables Threatlocker auto-deployment for Windows or both Windows and Macintosh machines at the organization level.`  
**Tooltip Text:** `<Leave it Blank>`  
**Footer Text:** `Default is Disabled`

![Image2](../../../static/img/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2/image2.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.webp)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Windows  
- Windows and Macintosh  
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/67554954-e8da-48af-bda9-13a6a37c8295/image3.webp)

## Completed Custom Field

![Image4](../../../static/img/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2/image3.webp)

## Example

![Image5](../../../static/img/docs/c7aa0c9d-9b6b-4a78-bbf4-01a626acd6c2/image4.webp)