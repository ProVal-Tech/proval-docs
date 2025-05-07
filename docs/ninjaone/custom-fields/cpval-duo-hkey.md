---
id: 'b8a5b5bd-a7fe-4cd5-aae4-81a25a0be7fa'
slug: /b8a5b5bd-a7fe-4cd5-aae4-81a25a0be7fa
title: 'cPVAL DUO HKEY'
title_meta: 'cPVAL DUO HKEY'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'The Host Key or API Hostname, which is the endpoint in Duo’s service that your application communicates with. This hostname is also found in the Duo Admin Panel and is necessary for setting up the integration.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

The Host Key or API Hostname, which is the endpoint in Duo’s service that your application communicates with. This hostname is also found in the Duo Admin Panel and is necessary for setting up the integration.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DUO HKEY | cpvalDuoHkey | Organization | Text | False | Editable | Read/Write | Read/Write | The Host Key or API Hostname, which is the endpoint in Duo’s service that your application communicates with. This hostname is also found in the Duo Admin Panel and is necessary for setting up the integration. | Provide the API hostname from the Duo Admin Panel. | DUO HKEY |

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

**Custom Field Type:** `Text`

Select `Text` for the `Custom field type` and click `Continue` to proceed.  
![Text](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/text.png)

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/overview.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

**Label:** `cPVAL DUO HKEY`  
**Name:** `cpvalDuoHkey`  
**Definition Scope:** `Organization`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/b8a5b5bd-a7fe-4cd5-aae4-81a25a0be7fa/image1.png)

Clicking the `Next` button will take you to the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/permissions.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/genericpermissions.png)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/details.png)

### Step 7

Fill in the following information in the `Details` section and click the `Create` button to create the `Custom Field`.

**Description:** `The Host Key or API Hostname, which is the endpoint in Duo’s service that your application communicates with. This hostname is also found in the Duo Admin Panel and is necessary for setting up the integration.`  
**Tooltip Text:** `Provide the API hostname from the Duo Admin Panel.`  
**Footer Text:** `DUO HKEY`

![Image2](../../../static/img/docs/b8a5b5bd-a7fe-4cd5-aae4-81a25a0be7fa/image2.png)

## Completed Custom Field

![Image3](../../../static/img/docs/b8a5b5bd-a7fe-4cd5-aae4-81a25a0be7fa/image4.png)

## Example

![Image4](../../../static/img/docs/b8a5b5bd-a7fe-4cd5-aae4-81a25a0be7fa/image3.png)