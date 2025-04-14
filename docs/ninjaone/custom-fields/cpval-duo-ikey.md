---
id: '868d35d1-fe4e-4e65-b7a5-7661d0d33405'
slug: /868d35d1-fe4e-4e65-b7a5-7661d0d33405
title: 'cPVAL DUO IKEY'
title_meta: 'cPVAL DUO IKEY'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'This is a unique identifier for your integration with Duo’s service. It’s used to link the authentication requests from your application to the correct Duo account.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

This is a unique identifier for your integration with Duo’s service. It’s used to link the authentication requests from your application to the correct Duo account.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO IKEY | cpvalDuoIkey | Organization | Text | False | Editable | Read/Write | Read/Write | This is a unique identifier for your integration with Duo’s service. It’s used to link the authentication requests from your application to the correct Duo account. | Provide the integration key from the Duo Admin Panel. | DUO IKEY |

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

**Label:** `cPVAL DUO IKEY`  
**Name:** `cpvalDuoIkey`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-duo-ikey/image1.png)

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

**Description:** `This is a unique identifier for your integration with Duo’s service. It’s used to link the authentication requests from your application to the correct Duo account.`  
**Tooltip Text:** `Provide the integration key from the Duo Admin Panel.`  
**Footer Text:** `DUO IKEY`

![Image2](../../../static/img/ninja-one-custom-field-cpval-duo-ikey/image2.png)

## Completed Custom Field

![Image3](../../../static/img/ninja-one-custom-field-cpval-duo-ikey/image4.png)

## Example

![Image4](../../../static/img/ninja-one-custom-field-cpval-duo-ikey/image3.png)
