---
id: 'ac9bd64b-0327-4879-931d-128936bc43a6'
slug: /ac9bd64b-0327-4879-931d-128936bc43a6
title: 'cPVAL Huntress Tags'
title_meta: 'cPVAL Huntress Tags'
keywords: ['huntress', 'antivirus', 'auto-deploy']
description: 'Tags to assign to the agents.'
tags: ['antivirus', 'software']
draft: false
unlisted: false
---

## Summary

Tags to assign to the agents.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Huntress Tags | cpvalHuntressTags | Organization | Text | False | Editable | Read/Write | Read/Write | Tags to assign to the agents. | one or more tags, separated by commas (this field is optional!) | Huntress Tags |

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

**Label:** `cPVAL Huntress Tags`  
**Name:** `cpvalHuntressTags`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-huntress-tags/image1.png)

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

**Description:** `Tags to assign to the agents.`  
**Tooltip Text:** `one or more tags, separated by commas (this field is optional!)`  
**Footer Text:** `Huntress Tags`

![Image2](../../../static/img/ninja-one-custom-field-cpval-huntress-tags/image2.png)

## Completed Custom Field

![Image3](../../../static/img/ninja-one-custom-field-cpval-huntress-tags/image3.png)

## Example

![Image4](../../../static/img/ninja-one-custom-field-cpval-huntress-tags/image4.png)
