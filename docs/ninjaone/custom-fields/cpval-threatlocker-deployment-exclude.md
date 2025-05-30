---
id: 'c3329dd9-bdf8-42f6-aacc-bcfde0fa94da'
slug: /c3329dd9-bdf8-42f6-aacc-bcfde0fa94da
title: 'cPVAL Threatlocker Deployment - Exclude'
title_meta: 'cPVAL Threatlocker Deployment - Exclude'
keywords: ['Threatlocker','windows','Mac','Deployment']
description: 'Enable this custom field to exclude the location or device from Threatlocker Deployment.'
tags:  ['security','setup','windows','macos']
draft: False
unlisted: false
---

## Summary
Enable this custom field to exclude the location or device from Threatlocker Deployment.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Threatlocker Deployment - Exclude | cpvalThreatlockerDeploymentExclude| `Device`, `Location` | drop-down | `Yes`, `No` | `No` | False | Editable | Read/Write | Read/Write | Enable this custom field to exclude the location or device from Threatlocker Deployment. | Default is `No` | cPVAL Huntress Install - Exclude |


## Dependencies
- [Solution - Threatlocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)  
- [Threatlocker Deployment](/docs/1196b011-bfba-486a-8653-92066f19e527)  
- [Threatlocker Deployment [MAC]](/docs/11444307-4a3f-4388-b5c5-096a50725b4e)  
- [Compound Conditions - Threatlocker Depoyment - Windows](/docs/d7ba7616-f11d-4961-90fb-9e7cf9ed6f28)  
- [Compound Conditions - Threatlocker Deployment - MAC](/docs/73470264-63c3-43d1-a727-1e813cfe768d)

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

**Label:** `cPVAL Threatlocker Deployment - Exclude`  
**Name:** `cpvalThreatlockerDeploymentExclude`  
**Definition Scope:** `Device`, `Location`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da/image1.webp)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedpermissions.webp)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedgenericpermissions.webp)

Clicking the `Next` button will take you to the `Details` tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advanceddetails.webp)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

**Description:** `Enable this custom field to exclude the location or device from Threatlocker Deployment.`  
**Tooltip Text:** `<Leave it Blank>`  
**Footer Text:** `Default is "No"`

![Image2](../../../static/img/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da/image2.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.webp)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- Yes  
- No

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/bdb92684-f093-49f8-9568-09874f9f79d5/image3.webp)

## Completed Custom Field

![Image3](../../../static/img/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da/image3.webp)

## Example

![Image4](../../../static/img/docs/c3329dd9-bdf8-42f6-aacc-bcfde0fa94da/image4.webp)