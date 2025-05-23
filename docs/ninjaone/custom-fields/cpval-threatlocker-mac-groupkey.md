---
id: '8305e5b2-41ee-44bb-848e-758ac72b185f'
slug: /8305e5b2-41ee-44bb-848e-758ac72b185f
title: 'cPVAL ThreatLocker Mac GroupKey'
title_meta: 'cPVAL ThreatLocker Mac GroupKey'
keywords: ['Threatlocker','MAC','GroupKey','Deployment']
description: 'Stores the Threatlocker group key for agent deployment on Macintosh machines'
tags: ['security','setup','macos']
draft: false
unlisted: false
---

## Summary
Stores the Threatlocker group key for agent deployment on Macintosh machines

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| 	
cPVAL ThreatLocker Mac GroupKey | cpvalThreatlockerMacGroupkey | Organization | Text | False | - | Editable | Read/Write | Read/Write | Stores the Threatlocker group key for agent deployment on Macintosh machines | - | - |

## Dependencies
- [Threatlocker Deployment [MAC]](/docs/11444307-4a3f-4388-b5c5-096a50725b4e)

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

Custom Field Type: `Text`  
Select Text for the `Custom field type` and click `Continue` to proceed.
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image1.webp)

### Step 5

A Pop-up screen will appear. Set the following details in the `Overview` section and click the `Next` button.

Label: `cPVAL ThreatLocker Mac GroupKey`  
Name: `cpvalThreatlockerMacGroupkey`  
Definition Scope: `Organization`  
Custom field is required: `<Leave it unchecked>`
![Configuration](../../../static/img/docs/8305e5b2-41ee-44bb-848e-758ac72b185f/image1.webp)

Clicking the `Next` button will take you to the `Permission` section.

### Step 5

Set the following details in the `Permission` section and click the `Next` button.

Technician: `Editable`  
Automation: `Read/Write`  
API: `Read/Write`  
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image3.webp)

### Step 6

Set the following details in the `Details` section and click the `Create` button to complete the creation of custom field.

**Description:** `Stores the Threatlocker group key for agent deployment on Macintosh machines`    
**Tooltip text:** `<Leave it blank>`   
**Footer text:** `<Leave it blank>`  

![Configuration](../../../static/img/docs/8305e5b2-41ee-44bb-848e-758ac72b185f/image2.webp)

### Completed Custom Field
![CompleteCustomField](../../../static/img/docs/8305e5b2-41ee-44bb-848e-758ac72b185f/image3.webp)

### Example
![Example](../../../static/img/docs/8305e5b2-41ee-44bb-848e-758ac72b185f/image4.webp)
