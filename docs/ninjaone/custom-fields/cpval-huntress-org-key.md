---
id: 'a746555d-f311-449f-ace0-c8a3b67a2ba4'
slug: /a746555d-f311-449f-ace0-c8a3b67a2ba4
title: 'cPVAL Huntress Org Key'
title_meta: 'cPVAL Huntress Org Key'
keywords: ['huntress', 'antivirus', 'auto-deploy']
description: 'By default, the Huntress Organization key is the name of the Organization. Set this custom field if it''s different for the Organization.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Summary

By default, the Huntress Organization key is the name of the Organization. Set this custom field if it''s different for the Organization.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Huntress Org Key | cpvalHuntressOrgKey | Organization | Text | False | Editable | Read/Write | Read/Write | By default, the Huntress Organization key is the name of the Organization. Set this custom field if it's different for the Organization. | Leave it blank if the Organization name is the same in both Ninja and Huntress portals. | Huntress Organization Name |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Global Custom Fields`.  
![Step1](../../../static/img/ninja-one-custom-fields-common-screenshots/step1.png)

### Step 2

Locate the `Add` button on the right-hand side of the screen and click on it.  
![AddButton](../../../static/img/ninja-one-custom-fields-common-screenshots/addbutton.png)  

### Step 3

After clicking the `Add` button, select the `Field` button that appears.  
![FieldButton](../../../static/img/ninja-one-custom-fields-common-screenshots/fieldbutton.png)

The following Pop-up screen will appear:  
![InitialCustomFieldPopup](../../../static/img/ninja-one-custom-fields-common-screenshots/initialcustomfieldpopup.png)

### Step 4

**Custom Field Type:** `Text`

Select `Text` for the `Custom field type` and click `Continue` to proceed.  
![Text](../../../static/img/ninja-one-custom-fields-common-screenshots/text.png)

The following Pop-up screen will appear:  
![Overview](../../../static/img/ninja-one-custom-fields-common-screenshots/overview.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL Huntress Org Key`  
**Name:** `cpvalHuntressOrgKey`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-huntress-org-key/image1.png)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/ninja-one-custom-fields-common-screenshots/permissions.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/ninja-one-custom-fields-common-screenshots/genericpermissions.png)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/ninja-one-custom-fields-common-screenshots/details.png)

### Step 7

Fill in the following information in the `Details` section and click the `Create` button to create the `Custom Field`.

**Description:** `By default, the Huntress Organization key is the name of the Organization. Set this custom field if it's different for the Organization.`  
**Tooltip Text:** `Leave it blank if the Organization name is the same in both Ninja and Huntress portals.`  
**Footer Text:** `Huntress Organization Name`

![Image2](../../../static/img/ninja-one-custom-field-cpval-huntress-org-key/image2.png)

## Completed Custom Field

![Image3](../../../static/img/ninja-one-custom-field-cpval-huntress-org-key/image3.png)

## Example

![Image4](../../../static/img/ninja-one-custom-field-cpval-huntress-org-key/image4.png)
