---
id: 'ca662111-e0a5-4318-8615-a00341257a1c'
slug: /ca662111-e0a5-4318-8615-a00341257a1c
title: 'cPVAL DUO USERNAMEFORMAT'
title_meta: 'cPVAL DUO USERNAMEFORMAT'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'The username format sent to Duo. One of: 0 for sAMAccountName (narroway), 1 for the NTLM domain and username (ACME\narroway), or 2 for the userPrincipalName (narroway@acme.corp)'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

The username format sent to Duo. One of: 0 for sAMAccountName (narroway), 1 for the NTLM domain and username (ACME\narroway), or 2 for the userPrincipalName (narroway@acme.corp)

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO USERNAMEFORMAT | cpvalDuoUsernameformat | Organization | drop-down | `0`, `1`, `2` | `1` | False | Editable | Read/Write | Read/Write | The username format sent to Duo. One of: 0 for sAMAccountName (narroway), 1 for the NTLM domain and username (ACME\narroway), or 2 for the userPrincipalName (narroway@acme.corp) | Select the username format to send to DUO. Default is 1 | DUO USERNAMEFORMAT |

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

**Custom Field Type:** `Drop-down`

Select `Drop-down` for the `Custom field type` and click `Continue` to proceed.  
![DropDown](../../../static/img/ninja-one-custom-fields-common-screenshots/dropdown.png)

The following Pop-up screen will appear:  
![Overview](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedoverview.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL DUO USERNAMEFORMAT`  
**Name:** `cpvalDuoUsernameformat`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-duo-usernameformat/image1.png)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedpermissions.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedgenericpermissions.png)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/ninja-one-custom-fields-common-screenshots/advanceddetails.png)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

**Description:** `The username format sent to Duo. One of: 0 for sAMAccountName (narroway), 1 for the NTLM domain and username (ACME\narroway), or 2 for the userPrincipalName (narroway@acme.corp)`  
**Tooltip Text:** `Select the username format to send to DUO. Default is 1`  
**Footer Text:** `DUO USERNAMEFORMAT`

![Image2](../../../static/img/ninja-one-custom-field-cpval-duo-usernameformat/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/ninja-one-custom-fields-common-screenshots/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- 0  
- 1
- 2

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/ninja-one-custom-field-cpval-duo-usernameformat/image3.png)

## Completed Custom Field

![Image4](../../../static/img/ninja-one-custom-field-cpval-duo-usernameformat/image4.png)

## Example

![Image5](../../../static/img/ninja-one-custom-field-cpval-duo-usernameformat/image5.png)
