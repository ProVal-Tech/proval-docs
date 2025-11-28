---
id: '7537a07a-9dda-4302-8ef4-b66ae94df2b8'
slug: /7537a07a-9dda-4302-8ef4-b66ae94df2b8
title: 'cPVAL_BP_Mac_Auth_Token'
title_meta: 'cPVAL_BP_Mac_Auth_Token'
keywords: ['token', 'mac', 'security']
description: 'This is used to hold the black point mac auth token value.'
tags: ['security', 'custom-fields']
draft: false
unlisted: false
---

## Summary

This custom filed is used to hold the Black point Mac Auth Token data.

## Details

| Label | Field Name | Definition Scope | Type | Option Value | Default Value | Required  | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |
| ----- | ---------- | ---------------- | ---- | ------------ | ------------- | --------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |
| cPVAL_BP_Mac_Auth_Token | cpvalbpmacauthtoken | `Device`, `organization`, `Location` | Text | `All`, `Windows`, `Windows Workstations`, `Windows Servers`, `Macintosh`, `Disabled` | Dynamic | True | Editable | Read/Write | Read/Write | This is used to hold the Black point Mac Auth Token data. |cPVAL_BP_Mac_Auth_Token | cPVAL_BP_Mac_Auth_Token |

## Custom Field Creation

### Step 1

Navigate to the `Administration` menu, then proceed to `Devices` and select `Device Custom Fields`. Locate the `Add Custom Field` button on the right-hand side of the screen and click on it.  
![Step1](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf1.webp)


### Step 2

After clicking the `Add` button, select the `Field` button that appears. Choose the Custom filed type ans select `Continue`

**Custom Field Type:** `Text`

![FieldButton](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf2.webp)


### Step 3

The following Pop-up screen will appear:  
![Overview](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf3.webp)

### Step 4

Set the following details in the `Overview` section and click the `Next` button.

**Custom Filed Type:** `Multi-Line`
**Label:** `cPVAL_BP_Mac_Auth_Token`  
**Name:** `cpvalbpmacauthtoken`  
**Custom field is required:** `<Leave it unchecked>`

![Image1](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf4.webp)

### Step 5

Clicking the `Next` button will take you to the `Inheritance` section.  
![Inheritance](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf5.webp)

Set the following details  `Inheritance` section and click the `Next` button.  

**Deive:** `Already checked`
**End User:** `<Leave it unchecked>`
**Location:** `check`  
**Organization:** `check`

![Inheritance](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/inheritance.webp)

### Step 5

in the `Permission` section and click the `Next` button.  

**Technician:** `Editable`  
**Automation:** `Read/Write`  
**API:** `Read/Write`

![Permission](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf6.webp)

Clicking the `Next` button will take you to the details tab.  
![Details](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf7.webp)

### Step 6

Fill in the following information in the `Details` section and click the `Submit` button.

**Description:** `This is used to hold the cPVAL_BP_Mac_Auth_Token data.`  
**Tooltip Text:** `cPVAL_BP_Mac_Auth_Token`  
**Footer Text:** `cPVAL_BP_Mac_Auth_Token`

![Image2](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf8.webp)

Clicking the `Next` button will take you to the `Advanced Settings` tab.  
![AdvancedSettings](../../../static/img/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8/cf9.webp)