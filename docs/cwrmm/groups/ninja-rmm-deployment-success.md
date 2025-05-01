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
![Step1](../../../static/img/cw-rmm-groups-common-screenshots/step1.png)

### Step 2

Create a new dynamic group by clicking the `Dynamic Group` button.  
![Step2](../../../static/img/cw-rmm-groups-common-screenshots/step2.png)

This page will appear after clicking on the `Dynamic Group` button:  
![Step3](../../../static/img/cw-rmm-groups-common-screenshots/step3.png)

### Step 3

**Group Name:** `Ninja Deployment Success`  
**Description:** `This group contains the endpoint where the Ninja Deployment succeeded.`

![Summary](../../../static/img/docs/ninja-rmm-deployment-success/image-1.png)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

This search box will appear:  
![Step5](../../../static/img/cw-rmm-groups-common-screenshots/step5.png)

### Step 5

Search for `Ninja Deployment Enable` and select it and set it `Equal` to `True`

![Ninja Deployment Enable](../../../static/img/docs/ninja-rmm-deployment/image-1.png)

![Add 1](../../../static/img/docs/ninja-rmm-deployment-success/image-2.png)

### Step 6

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`

![Exclude Site](../../../static/img/docs/ninja-rmm-deployment/image-2.png)

![Add 2](../../../static/img/docs/ninja-rmm-deployment-success/image-3.png)

### Step 7

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`

![Exclude Endpoint](../../../static/img/docs/ninja-rmm-deployment/image-3.png)

![Add 3](../../../static/img/docs/ninja-rmm-deployment-success/image-4.png)

### Step 8

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Ninja Deployment Result` and select it and set it `Contains any of` to `Success`

![Result](../../../static/img/docs/ninja-rmm-deployment/image-5.png)

![Add 4](../../../static/img/docs/ninja-rmm-deployment-success/image-5.png)


## Completed Group

![Complete](../../../static/img/docs/ninja-rmm-deployment-success/image-6.png)

![Complete 1](../../../static/img/docs/ninja-rmm-deployment-success/image.png)