---
id: 'f0c8a089-0c1b-4056-8375-c3601acc968d'
slug: /f0c8a089-0c1b-4056-8375-c3601acc968d
title: 'cPVAL DUO SMARTCARD'
title_meta: 'cPVAL DUO SMARTCARD'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO SMARTCARD | cpvalDuoSmartcard | Organization | drop-down | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | `Disabled` | False | Editable | Read/Write | Read/Write | If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval. | Select the platform to enable DUO SmartCard | DUO SMARTCARD |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Global Custom Fields`.  
![Step1](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/step1.png)

### Step 2

Locate the `Add` button on the right-hand side of the screen and click on it.  
![AddButton](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/addbutton.png)  

### Step 3

After clicking the `Add` button, select the `Field` button that appears.  
![FieldButton](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/fieldbutton.png)

The following Pop-up screen will appear:  
![InitialCustomFieldPopup](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/initialcustomfieldpopup.png)

### Step 4

**Custom Field Type:** `Drop-down`

Select `Drop-down` for the `Custom field type` and click `Continue` to proceed.  
![DropDown](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/dropdown.png)

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedoverview.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL DUO SMARTCARD`  
**Name:** `cpvalDuoSmartcard`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/f0c8a089-0c1b-4056-8375-c3601acc968d/image1.png)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedpermissions.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedgenericpermissions.png)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advanceddetails.png)

### Step 7

Fill in the following information in the `Details` section and click the `Next` button.

**Description:** `If enabled, it allows smart card login as an alternative to Duo authentication. If not, it disables the Windows smart card provider. The default is blank, which does not allow smart card login without Duo approval.`  
**Tooltip Text:** `Select the platform to enable DUO SmartCard`  
**Footer Text:** `DUO SMARTCARD`

![Image2](../../../static/img/docs/f0c8a089-0c1b-4056-8375-c3601acc968d/image2.png)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/advancedsettings.png)

### Step 8

Configure the following options in the specified order. To add an option, paste it and click the `Add` button:

- All
- Windows  
- Windows Workstations
- Windows Servers
- Macintosh
- Disabled

Click the `Create` button to create the `Custom Field`.  
![Image3](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/image3.png)

## Completed Custom Field

![Image4](../../../static/img/docs/f0c8a089-0c1b-4056-8375-c3601acc968d/image4.png)

## Example

![Image5](../../../static/img/docs/f0c8a089-0c1b-4056-8375-c3601acc968d/image5.png)