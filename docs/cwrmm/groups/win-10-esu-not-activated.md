---
id: '4673c9d2-881d-43a1-b455-5d3b3cf0ae4d'
slug: /4673c9d2-881d-43a1-b455-5d3b3cf0ae4d
title: 'Win10 ESU Not Activated'
title_meta: 'Win10 ESU Not Activated'
keywords: ['ESU','extended security','windows']
description: 'This contains the list of machines where the script detects that the ESU license was not activated.'
tags:  ['auditing','windows']
draft: False
unlisted: false
---

## Summary
This contains the list of machines where the script detects that the ESU license was not activated.

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

**Group Name:** `Win10 ESU Not Activated`   
**Category:** `Auditing`  
**Description:** `This contains the list of machines where the script detects that the ESU license was not activated.`

![Summary](../../../static/img/docs/4673c9d2-881d-43a1-b455-5d3b3cf0ae4d/image1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

- `ESU Status` Contains any of `ESU Not Activated`

![Criteria](../../../static/img/docs/4673c9d2-881d-43a1-b455-5d3b3cf0ae4d/image2.webp)

## Completed Group

![Completed Group](../../../static/img/docs/4673c9d2-881d-43a1-b455-5d3b3cf0ae4d/image3.webp)