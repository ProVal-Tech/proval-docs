---
id: 'a3f30225-91ac-46f7-b616-cb42aedb49d8'
slug: /a3f30225-91ac-46f7-b616-cb42aedb49d8
title: 'Win 10 ESU Auditing Failed'
title_meta: 'Win 10 ESU Auditing Failed'
keywords: ['ESU','extended security','windows']
description: 'This contains the list of machines where the ESU license detection script failed.'
tags:  ['auditing','windows']
draft: False
unlisted: false
---

## Summary
This contains the list of machines where the ESU license detection script failed.

## Dependencies

- [Task : ESU License Activation Detection](/docs/fad37673-34ab-46e9-8797-b87058f79faa) 
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

**Group Name:** `Win 10 ESU Auditing Failed`   
**Category:** `Auditing`  
**Description:** `This contains the list of machines where the ESU license detection script failed.`

![Summary](../../../static/img/docs/a3f30225-91ac-46f7-b616-cb42aedb49d8/image1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

- `ESU Status` Contains any of `Powershell Failure`

![Criteria](../../../static/img/docs/a3f30225-91ac-46f7-b616-cb42aedb49d8/image2.webp)

## Completed Group

![Completed Group](../../../static/img/docs/a3f30225-91ac-46f7-b616-cb42aedb49d8/image3.webp)