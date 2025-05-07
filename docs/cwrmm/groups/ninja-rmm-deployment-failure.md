---
id: '9718a5fd-535b-4faf-abe9-86d55f37e620'
slug: /9718a5fd-535b-4faf-abe9-86d55f37e620
title: 'Ninja Deployment Failure'
title_meta: 'Ninja Deployment Failure'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Windows', 'Agent', 'Install']
description: 'This group contains the endpoint where the Ninja deployment failed.'
tags: ['macos', 'windows', 'installation', 'deployment', 'application', 'connectwise']
draft: false
unlisted: false
---

## Summary
This group contains the endpoint where the Ninja deployment failed.

## Dependencies
[CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae)

[Script - Ninja RMM Deployment - [Windows]](/docs/905f38b9-492e-43d8-b687-7b4df48c3b97)

[Script - Ninja RMM Deployment - [MAC]](/docs/2893ba48-9686-424e-ba32-0c799c38f9fd)

## Group Creation

### Step 1

Navigate to `ENDPOINTS` ➞ `Groups`  
![Step1](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step1.png)

### Step 2

Create a new dynamic group by clicking the `Dynamic Group` button.  
![Step2](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step2.png)

This page will appear after clicking on the `Dynamic Group` button:  
![Step3](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step3.png)

### Step 3

**Group Name:** `Ninja Deployment Failure`  
**Description:** `This group contains the endpoint where the Ninja deployment failed.`

![Summary](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-1_1.png)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.png)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.png)

### Step 5

Search for `Ninja Deployment Enable` and select it and set it `Equal` to `True`

![Ninja Deployment Enable](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-1.png)

![Add 1](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-2_1.png)

### Step 6

Click `Add Criteria`

![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.png)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`.
Make sure to select the `Ninja Deployment Exclude` site level custom field.

![Exclude Site](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-2.png)

![Add 2](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-3_1.png)

### Step 7

Click `Add Criteria`

![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.png)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`.
Make sure to select the `Ninja Deployment Exclude` endpoint level custom field.

![Exclude Endpoint](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-3.png)

![Add 3](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-4_1.png)

### Step 8

Click `Add Criteria`

![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.png)

Search for `Ninja Deployment Result` and select it and set it `Contains any of` to `Failed`

![Result](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-5.png)

![Add 4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-5_1.png)


## Completed Group

![Complete](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-6_1.png)

![Complete 1](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image_1.png)