---
id: '0d8c8069-8883-4135-b322-da61e1a932e0'
slug: /0d8c8069-8883-4135-b322-da61e1a932e0
title: 'cPVAL Soji Result'
title_meta: 'cPVAL Soji Result'
keywords: ['custom-fields','disk','cleanup']
description: 'This custom field stores the most recent results of the Soji automation'
tags: ['custom-fields']
draft: false
unlisted: false
---

## Summary
This custom field stores the most recent results of the Soji automation.

## Details

| Label | Field Name | Definition Scope | Type | Required | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | -------- |  -------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL Soji Result | cpvalSojiResult | Device | Text | No | Read Only | Read/Write | Read/Write | This custom field stores the most recent results of the Soji automation | Result of the latest disk cleanup | Disk cleanup result |

## Dependencies

[Soji Disk Cleanup](/docs/ef289b50-fe18-4114-93d0-680437f7c480)

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

Select the `Text` custom field type from the dropdown menu.

![Image](../../../static/img/docs/cpval-soji-result/image.png)

Click the `Continue` button to continue with the custom field creation.

![Image](../../../static/img/docs/cpval-soji-result/image-1.png)

The following Pop-up screen will appear:

![Image](../../../static/img/docs/cpval-soji-result/image-2.png)

### Step 5

Set the following details in the `Overview` section and click the `Next` button.

- Label: `cPVAL Soji Results`
- Name: `cpvalSojiResults`
- Definition Scope: `Device`  
- Custom field is required: `<Leave it unchecked>`

![Image](../../../static/img/docs/cpval-soji-result/image-3.png)

The following Pop-up screen will appear:

![Image](../../../static/img/docs/cpval-soji-result/image-4.png)

### Step 6

Set the following details in the `Permission` section and click the `Next` button.

- Technician: `Read Only`
- Automation: `Read/Write`
- API: `Read/Write`

![Image](../../../static/img/docs/cpval-soji-result/image-5.png)

The following Pop-up screen will appear:

![Image](../../../static/img/docs/cpval-soji-result/image-6.png)

### Step 7

Set the following details in the `Details` section and click the `Create` button to complete the creation of custom field.

- Description: `This custom field stores the most recent results of the Soji automation.`
- Tooltip text: `Result of the latest disk cleanup.`
- Footer text: `Disk cleanup result`

![Image](../../../static/img/docs/cpval-soji-result/image-7.png)

### Example

![Image](../../../static/img/docs/cpval-soji-result/image-8.png)