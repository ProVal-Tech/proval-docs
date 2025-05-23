---
id: '0ff9eab8-6df8-4154-9ecc-4f5bdedd648a'
slug: /0ff9eab8-6df8-4154-9ecc-4f5bdedd648a
title: 'cPVAL Threatlocker Auth Key'
title_meta: 'cPVAL Threatlocker Auth Key'
keywords: ['Threatlocker','windows','GroupKey','Deployment']
description: 'Threatlocker Authentication Key to deploy threatlocker Agent on windows machines'
tags: ['security','setup','windows']
draft: false
unlisted: false
---

## Summary
Threatlocker Authentication Key to deploy threatlocker Agent on windows machines

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Threatlocker Auth Key | cPVALThreatlockerAuthKey | Organization | Text | True | - | Editable | Read/Write | Read/Write | Threatlocker Authentication Key to deploy threatlocker Agent on windows machines | - | - |


## Dependencies
- [Automation - Threatlocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527) 

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
Select `Text` for the `Custom field type` and click `Continue` to proceed.
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image1.webp)

### Step 5

A Pop-up screen will appear. Set the following details in the Overview section and click the Next button.

Label: `cPVAL Threatlocker Auth Key`  
Name: `cPVALThreatlockerAuthKey`  
Definition Scope: `Organization`  
Custom field is required: `<Leave it unchecked>`
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image2.webp)

Clicking the `Next` button will take you to the `Permission` section.

### Step 5

Set the following details in the `Permission` section and click the `Next` button.

Technician: `Editable`  
Automation: `Read/Write`  
API: `Read/Write`  
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image3.webp)

### Step 6

Set the following details in the `Details` section and click the `Create` button to complete the creation of custom field.

**Description:** `Threatlocker Authentication Key to deploy threatlocker Agent on windows machines`    
**Tooltip text:** `<Leave it blank>`   
**Footer text:** `<Leave it blank>`  

![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image4.webp)

### Completed Custom Field
![CompleteCustomField](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image5.webp)

### Example
![Example](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image6.webp)
