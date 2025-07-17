---
id: 'ea940639-c217-4f4d-ac31-b5767417691a'
slug: /ea940639-c217-4f4d-ac31-b5767417691a
title: 'cPVAL DNSFilter Key'
title_meta: 'cPVAL DNSFilter Key'
keywords: ['DNS', 'Filter', 'Agent']
description: 'This key is required for deploying the DNSFilter Agent.'
tags: ['installation', 'dns']
draft: false
unlisted: false
---

## Summary
This key is required for deploying the DNSFilter Agent.

## Details

| Label | Field Name | Definition Scope | Type | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL DNSFilter Key | cpvaldnsfilterkey | Device, Location, Organization | Text | False | Editable | Read/Write | Read/Write | This key is required for deploying the DNSFilter Agent. |  |  |

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

**Label:** `cPVAL DNSFilter Key`  
**Name:** `cpvaldnsfilterkey`  
**Definition Scope:** `Device`,`Location`,`Organization`  
**Custom field is required:** `<Leave it unchecked>`

![CS1](../../../static/img/docs/38b311e5-eaf3-4d76-a61b-e097b0262ad0/cs1.webp)

Inheritance:
![CS2](../../../static/img/docs/38b311e5-eaf3-4d76-a61b-e097b0262ad0/cs2.webp)


Clicking the `Permission` section.  
![Permission](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/permissions.webp)

### Step 6

Set the following details in the `Permission` section and then move to the `Details` tab

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![CS3](../../../static/img/docs/38b311e5-eaf3-4d76-a61b-e097b0262ad0/cs3.webp)


Clicking the details tab.  
![Details](../../../static/img/docs/3ce9e690-2bf1-4e78-9e66-04960f3f1b25/details.webp)

### Step 7

Fill in the following information in the `Details` section and click the `Submit` button to create the `Custom Field`.

**Description:** `This key is required for deploying the DNSFilter Agent.`  
**Tooltip Text:** `<Leave it blank>`  
**Footer Text:** `<Leave it blank>`

![CS4](../../../static/img/docs/38b311e5-eaf3-4d76-a61b-e097b0262ad0/cs4.webp)

## Completed Custom Field

![CustomField](../../../static/img/docs/38b311e5-eaf3-4d76-a61b-e097b0262ad0/c5.webp)

