---
id: '198ac207-0426-4c7f-afeb-7fa84b599b6c'
slug: /198ac207-0426-4c7f-afeb-7fa84b599b6c
title: 'Win 10 ESU Activated'
title_meta: 'Win 10 ESU Activated'
keywords: ['esu','extended security','windows']
description: 'This contains the list of Windows 10 devices where the ESU is activated.'
tags:  ['auditing','windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-09
---

## Summary
This contains the list of Windows 10 devices where the ESU is activated.

## Dependencies

- [Task - ESU License Activation Detection](/docs/fad37673-34ab-46e9-8797-b87058f79faa) 
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

- **Group Name:** `Win10 ESU Activated`   
- **Category:** `Auditing`  
- **Description:** `This contains the list of Windows 10 devices where the ESU is activated.`

![Summary](../../../static/img/docs/198ac207-0426-4c7f-afeb-7fa84b599b6c/image1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

- `ESU Status` Contains any of `ESU Activated`

![Criteria](../../../static/img/docs/198ac207-0426-4c7f-afeb-7fa84b599b6c/image2.webp)

## Completed Group

![Completed Group](../../../static/img/docs/198ac207-0426-4c7f-afeb-7fa84b599b6c/image3.webp)

## Changelog

### 2026-02-04

- Initial version of the document
