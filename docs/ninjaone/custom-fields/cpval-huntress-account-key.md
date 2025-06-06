---
id: '2b62c710-cd01-4c0a-ab26-58f637e3226a'
slug: /2b62c710-cd01-4c0a-ab26-58f637e3226a
title: 'cPVAL Huntress Account Key'
title_meta: 'cPVAL Huntress Account Key'
keywords: ['huntress', 'antivirus', 'auto-deploy']
description: 'This is the Account Key that determines which Huntress Account an Agent should be associated with.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Summary

This is the Account Key that determines which Huntress Account an Agent should be associated with.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Huntress Account Key | cpvalHuntressAccountKey | Organization | Text | False | Editable | Read/Write | Read/Write | This is the Account Key that determines which Huntress Account an Agent should be associated with. | Paste your account secret key (from your Huntress portal's "download agent" section) | Huntress Agent Account Key |

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

**Custom Field Type:** `Text`

Select `Text` for the `Custom field type` and click `Continue` to proceed.  
![Text](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/text.webp)

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/overview.webp)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL Huntress Account Key`  
**Name:** `cpvalHuntressAccountKey`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/2b62c710-cd01-4c0a-ab26-58f637e3226a/image1.webp)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/permissions.webp)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/genericpermissions.webp)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/details.webp)

### Step 7

Fill in the following information in the `Details` section and click the `Create` button to create the `Custom Field`.

**Description:** `This is the Account Key that determines which Huntress Account an Agent should be associated with.`  
**Tooltip Text:** `Paste your account secret key (from your Huntress portal's "download agent" section)`  
**Footer Text:** `Huntress Agent Account Key`

![Image2](../../../static/img/docs/2b62c710-cd01-4c0a-ab26-58f637e3226a/image2.webp)

## Completed Custom Field

![Image3](../../../static/img/docs/2b62c710-cd01-4c0a-ab26-58f637e3226a/image3.webp)

## Example

![Image4](../../../static/img/docs/2b62c710-cd01-4c0a-ab26-58f637e3226a/image4.webp)