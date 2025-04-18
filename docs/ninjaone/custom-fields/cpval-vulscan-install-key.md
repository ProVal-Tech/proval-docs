---
id: 'ea08b033-7c1f-48e4-a58d-1851ea84932e'
slug: /ea08b033-7c1f-48e4-a58d-1851ea84932e
title: 'cPVAL Vulscan Install Key'
title_meta: 'cPVAL Vulscan Install Key'
keywords: ['rapid-fire', 'vulscan', 'discovery-agent', 'security', 'auto-deploy']
description: 'Specifies the install key for the VulScan Discovery Agent. The Install Key allows agents to be associated with the organization during the agent installation.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

Specifies the install key for the VulScan Discovery Agent. The Install Key allows agents to be associated with the organization during the agent installation.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Vulscan Install Key | cpvalVulscanInstallKey | Organization | Text | False | Editable | Read/Write | Read/Write | Specifies the install key for the VulScan Discovery Agent. The Install Key allows agents to be associated with the organization during the agent installation. | Specifies the install key for the VulScan Discovery Agent. | Vulscan Install Key |

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

**Label:** `cPVAL Vulscan Install Key`  
**Name:** `cpvalVulscanInstallKey`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/ninja-one-custom-field-cpval-vulscan-install-key/image1.png)

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

**Description:** `Specifies the install key for the VulScan Discovery Agent. The Install Key allows agents to be associated with the organization during the agent installation.`  
**Tooltip Text:** `Specifies the install key for the VulScan Discovery Agent.`  
**Footer Text:** `Vulscan Install Key`

![Image2](../../../static/img/ninja-one-custom-field-cpval-vulscan-install-key/image2.png)

## Completed Custom Field

![Image3](../../../static/img/ninja-one-custom-field-cpval-vulscan-install-key/image4.png)

## Example

![Image4](../../../static/img/ninja-one-custom-field-cpval-vulscan-install-key/image3.png)
