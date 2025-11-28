---
id: '83df96df-47eb-43f4-860a-af3f686641c4'
slug: /83df96df-47eb-43f4-860a-af3f686641c4
title: 'cPVAL_BP_AccountUID'
title_meta: 'cPVAL_BP_AccountUID'
keywords: ['accountid', 'mac', 'windows', 'security']
description: 'This is used to hold the blackpoint accountuid data.'
tags: ['security', 'custom-fields']
draft: false
unlisted: false
---

## Summary

This custom filed is used to hold the cPVAL_BP_AccountUID data.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL_BP_AccountUID| cpvalbpaccountuid | `Device`, `organization`, `Location` | Text | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | Dynamic | True | Editable | Read/Write | Read/Write | This is used to hold the cPVAL_BP_AccountUID data. |cPVAL_BP_AccountUID | cPVAL_BP_AccountUID |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Device Custom Fields`. Locate the `Add Custom Field` button on the right-hand side of the screen and click on it.  
![Step1](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf1.webp)


### Step 2

After clicking the `Add` button, select the `Field` button that appears. Choose the Custom filed type ans select `Continue`

**Custom Field Type:** `Text`

![FieldButton](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf2.webp)


### Step 3

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf3.webp)

### Step 4

Set the following details in the `Overview` section and click the `Next` button.

**Custom Filed Type:** `Text`
**Label:** `cPVAL_BP_AccountUID`  
**Name:** `cpvalbpaccountuid`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf4.webp)

### Step 5

Clicking the `Next` button will take you to the `Inheritance` section.  
![Inheritance](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf5.webp)

Set the following details  `Inheritance` section and click the `Next` button.  

**Deive:** `Already checked`
**End User:** `Uncheck`
**Location:** `check`  
**Organization:** `check`

![Inheritance](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/inheritance.webp)

### Step 5

in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf6.webp)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf7.webp)

### Step 6

Fill in the following information in the `Details` section and click the `Submit` button.

**Description:** `This is used to hold the cPVAL_BP_AccountUID data.`  
**Tooltip Text:** `cPVAL_BP_AccountUID`  
**Footer Text:** `cPVAL_BP_AccountUID`

![Image2](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf8.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/83df96df-47eb-43f4-860a-af3f686641c4/cf9.webp)