---
id: 'afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e'
slug: /afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e
title: 'Win 10 ESU Audit Not Performed'
title_meta: 'Win 10 ESU Audit Not Performed'
keywords: ['esu','extended security','windows']
description: 'This contains the list of Windows 10 22H2 machines where the auditing script has not yet executed.'
tags:  ['auditing','windows']
draft: false
unlisted: false
---

## Summary
This contains the list of Windows 10 22H2 machines where the auditing script hasn't yet executed.

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

- **Group Name:** `Win 10 ESU Audit Not Performed`   
- **Category:** `Auditing`  
- **Description:** `This contains the list of Windows 10 22H2 machines where the auditing script hasn't yet executed.`

![Summary](../../../static/img/docs/afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e/image1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

- `ESU Status` Contains any of `Not Detected`
- `OS Build Number` Contains any of `19045`

![Criteria](../../../static/img/docs/afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e/image2.webp)

## Completed Group

![Completed Group](../../../static/img/docs/afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e/image3.webp)