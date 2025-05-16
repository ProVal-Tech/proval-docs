---
id: '573751d4-0648-4da9-8ec3-0ab96d4730de'
slug: /573751d4-0648-4da9-8ec3-0ab96d4730de
title: 'cPVAL Threatlocker Organization Name'
title_meta: 'cPVAL Threatlocker Organization Name'
keywords: ['Threatlocker','windows','GroupKey','Deployment']
description: 'Organization name to be used for Threatlocker deployment. If deploying to an existing organization, the name must match the organization name in the ThreatLocker portal.'
tags: ['security','setup','windows']
draft: false
unlisted: false
---

## Summary
Organization name to be used for Threatlocker deployment. If deploying to an existing organization, the name must match the organization's name in the ThreatLocker portal.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Threatlocker Organization Name | cPVALThreatlockerOrganizationName | Organization | Text | False | - | Editable | Read/Write | Read/Write | Organization name to be used for Threatlocker deployment. If deploying to an existing organization, the name must match the organization's name in the ThreatLocker portal. | - | - |

## Dependencies
- [Automation - Threatlocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527) 

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Global Custom Fields`.  
![Step1](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/step1.webp)
](../../../
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
Select Text for the Custom field type and click Continue to proceed.
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image1.webp)

### Step 5

A Pop-up screen will appear. Set the following details in the Overview section and click the Next button.

Label: `cPVAL Threatlocker Organization Name`  
Name: `cpvalThreatlockerOrganizationName`  
Definition Scope: `Organization`  
Custom field is required: `<Leave it unchecked>`
![Configurationstatic/img/docs/573751d4-0648-4da9-8ec3-0ab96d4730de/image1.webp)

Clicking the Next button will take you to the Permission section.

### Step 5

Set the following details in the Permission section and click the Next button.

Technician: `Editable`  
Automation: `Read/Write`  
API: `Read/Write`  
![Configuration](../../../static/img/docs/0ff9eab8-6df8-4154-9ecc-4f5bdedd648a/image3.webp)

### Step 6

Set the following details in the `Details` section and click the `Create` button to complete the creation of custom field.

**Description:** `Organization name to be used for Threatlocker deployment. If deploying to an existing organization, the name must match the organization's name in the ThreatLocker portal`    
**Tooltip text:** `<Leave it blank>`   
**Footer text:** `<Leave it blank>`  

![Configuration](../../../static/img/docs/573751d4-0648-4da9-8ec3-0ab96d4730de/image2.webp)

### Completed Custom Field
![CompleteCustomField](../../../static/img/docs/573751d4-0648-4da9-8ec3-0ab96d4730de/image3.webp)

### Example
![Example](../../../static/img/docs/573751d4-0648-4da9-8ec3-0ab96d4730de/image4.webp)
