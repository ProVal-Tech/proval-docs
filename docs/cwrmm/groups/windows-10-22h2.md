---
id: '558a6a3d-b543-4267-96fc-76f0c9a13e68'
slug: /558a6a3d-b543-4267-96fc-76f0c9a13e68
title: 'Windows 10 22H2'
title_meta: 'Windows 10 22H2'
keywords: ['esu','extended security','windows']
description: 'Group of Windows 10 22H2 machines.'
tags:  ['auditing','windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-06
---

## Summary
This group contains Windows 10 22H2 machines. The [ESU License Activation Detection](/docs/fad37673-34ab-46e9-8797-b87058f79faa) script is executed on this group for auditing.

## Dependencies

- [Solution - Windows 10 ESU Licensing and Auditing](/docs/a7e4073e-1f09-4772-aa5e-ee44cf9bf9e7)

## Group Creation

### Step 1

Navigate to `ENDPOINTS` ➞ `Groups`  
![Step1](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step1.webp)

### Step 2

Create a new dynamic group by clicking the `Dynamic Group` button.  
![Step2](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step2.webp)

This page will appear after clicking on the `Dynamic Group` button:  
![Step3](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step3.webp)

### Step 3

- **Group Name:** `Windows 10 22H2` 
- **Category:** `Auditing`  
- **Description:** `Group of Windows 10 22H2 machines. The "ESU License Activation Detection" script is executed on this group for auditing.`

![Summary](../../../static/img/docs/558a6a3d-b543-4267-96fc-76f0c9a13e68/image1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

- `OS Build Number` Contains any of `19045`

![Criteria](../../../static/img/docs/558a6a3d-b543-4267-96fc-76f0c9a13e68/image2.webp)

## Completed Group

![Completed Group](../../../static/img/docs/558a6a3d-b543-4267-96fc-76f0c9a13e68/image3.webp)

## Changelog

### 2026-02-04

- Initial version of the document
