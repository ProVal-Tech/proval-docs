---
id: '4185cf9b-b76e-42b9-8559-08940c343e7d'
slug: /4185cf9b-b76e-42b9-8559-08940c343e7d
title: 'Ninja Deployment Success'
title_meta: 'Ninja Deployment Success'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Windows', 'Agent', 'Install']
description: 'This group contains the endpoint where the Ninja Deployment succeeded.'
tags: ['macos', 'windows', 'installation', 'deployment', 'application', 'connectwise']
draft: false
unlisted: false
---

## Summary
This group contains the endpoint where the Ninja Deployment succeeded.

## Dependencies
[CW RMM - Ninja Migration Custom fields](/docs/1b41da88-5b9a-436f-997b-39c8f72615ae)

[Script - Ninja RMM Deployment - [Windows]](/docs/905f38b9-492e-43d8-b687-7b4df48c3b97)

[Script - Ninja RMM Deployment - [MAC]](/docs/2893ba48-9686-424e-ba32-0c799c38f9fd)

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

**Group Name:** `Ninja Deployment Success`  
**Description:** `This group contains the endpoint where the Ninja Deployment succeeded.`

![Summary](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image-1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

### Step 5

Search for `Ninja Deployment Enable` and select it and set it `Equal` to `True`

![Ninja Deployment Enable](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-1.webp)

![Add 1](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image-2.webp)

### Step 6

Click `Add Criteria`

![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`.
Make sure to select the `Ninja Deployment Exclude` site level custom field.

![Exclude Site](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-2.webp)

![Add 2](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image-3.webp)

### Step 7

Click `Add Criteria`

![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`.
Make sure to select the `Ninja Deployment Exclude` endpoint level custom field.

![Exclude Endpoint](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-3.webp)

![Add 3](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image-4.webp)

### Step 8

Click `Add Criteria`

![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

Search for `Ninja Deployment Result` and select it and set it `Contains any of` to `Success`

![Result](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/image-5.webp)

![Add 4](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image-5.webp)


## Completed Group

![Complete](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image-6.webp)

![Complete 1](../../../static/img/docs/4185cf9b-b76e-42b9-8559-08940c343e7d/image.webp)