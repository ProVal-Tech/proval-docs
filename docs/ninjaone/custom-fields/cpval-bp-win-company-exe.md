---
id: 'dd410db2-6305-425c-93e7-378efbf145c3'
slug: /dd410db2-6305-425c-93e7-378efbf145c3
title: 'cPVAL_BP_Win_CompanyEXE'
title_meta: 'cPVAL_BP_Win_CompanyEXE'
keywords: ['exe', 'windows', 'security']
description: 'This is used to hold the black point win companyexe data.'
tags: ['security', 'custom-fields']
draft: false
unlisted: false
---

## Summary

This custom filed is used to hold the Black point Win_CompanyEXE data.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL_BP_Win_CompanyEXE| cpvalbpwincompanyexe | `Device`, `organization`, `Location` | Text | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | Dynamic | True | Editable | Read/Write | Read/Write | This is used to hold the Black point Win_CompanyEXE data. |cPVAL_BP_Win_CompanyEXE | cPVAL_BP_Win_CompanyEXE |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Device Custom Fields`. Locate the `Add Custom Field` button on the right-hand side of the screen and click on it.  
![Step1](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/exe1.webp)


### Step 2

After clicking the `Add` button, select the `Field` button that appears. Choose the Custom filed type ans select `Continue`

**Custom Field Type:** `Text`

![FieldButton](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/cf2.webp)


### Step 3

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/cf3.webp)

Set the following details in the `Overview` section and click the `Next` button.

**Custom Filed Type:** `Text`
**Label:** `cPVAL_BP_Win_CompanyEXE`  
**Name:** `cpvalbpwincompanyexe`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/editexe.webp)

### Step 4

Clicking the `Next` button will take you to the `Inheritance` section.  
![Inheritance](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/cf5.webp)

Set the following details  `Inheritance` section and click the `Next` button.  

**Deive:** `Already checked`
**End User:** `<Leave it unchecked>`
**Location:** `check`  
**Organization:** `check`

![Inheritance](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/inheritance.webp)

### Step 5

in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/cf6.webp)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/cf7.webp)

### Step 6

Fill in the following information in the `Details` section and click the `Submit` button.

**Description:** `This is used to hold the cPVAL_BP_AccountUID data.`  
**Tooltip Text:** `cPVAL_BP_Win_CompanyEXE`  
**Footer Text:** `cPVAL_BP_Win_CompanyEXE`

![Image2](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/cf8.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/dd410db2-6305-425c-93e7-378efbf145c3/detailsexe.webp)