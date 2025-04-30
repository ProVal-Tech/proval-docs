---
id: 'b2d8d0e7-2310-43ae-b623-4e9fc8d295b0'
slug: /b2d8d0e7-2310-43ae-b623-4e9fc8d295b0
title: 'Ninja RMM Deployment'
title_meta: 'Ninja RMM Deployment'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Windows', 'Agent', 'Install']
description: 'This group contains the endpoints where the Ninja RMM deployment is enabled, the software "NinjaRMMAgent" is missing, and the custom field "Ninja Deployment Result" is blank.'
tags: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Windows', 'Agent', 'Install']
draft: false
unlisted: false
---

## Summary
This group contains the endpoints where the Ninja RMM deployment is enabled, the software "NinjaRMMAgent" is missing, and the custom field "Ninja Deployment Result" is blank.

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

**Group Name:** `Ninja RMM Deployment`  
**Description:** `This group contains the endpoints where the Ninja RMM deployment is enabled, the software "NinjaRMMAgent" is missing, and the custom field "Ninja Deployment Result" is blank.`

![Summary](../../../static/img/docs/ninja-rmm-deployment/image.png)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

This search box will appear:  
![Step5](../../../static/img/cw-rmm-groups-common-screenshots/step5.png)

### Step 5

Search for `Ninja Deployment Enable` and select it and set it `Equal` to `True`

![Ninja Deployment Enable](../../../static/img/docs/ninja-rmm-deployment/image-1.png)

![Add 1](../../../static/img/docs/ninja-rmm-deployment/{D52026EA-DE53-423B-95BE-0CBD968E30A7}.png)

### Step 6

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`

![Exclude Site](../../../static/img/docs/ninja-rmm-deployment/image-2.png)

![Add 2](../../../static/img/docs/ninja-rmm-deployment/{B52F2A31-8E1E-4E53-8465-0A03FE494417}.png)

### Step 7

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Ninja Deployment Exclude` and select it and set it `Equal` to `False`

![Exclude Endpoint](../../../static/img/docs/ninja-rmm-deployment/image-3.png)

![Add 2](../../../static/img/docs/ninja-rmm-deployment/{B52F2A31-8E1E-4E53-8465-0A03FE494417}.png)

### Step 8

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Installed Software Name` and select it and set it `Does Not Contains Any of` to `NinjaRMMAgent`

![Software Check](../../../static/img/docs/ninja-rmm-deployment/image-4.png)

![Add 3](../../../static/img/docs/ninja-rmm-deployment/{EC5199C2-AE20-4464-92E3-0BA091AEDA36}.png)

### Step 9

Click `Add Criteria`

![Step4](../../../static/img/cw-rmm-groups-common-screenshots/step4.png)

Search for `Ninja Deployment Result` and select it and set it `Is Blank` to `True`

![Result](../../../static/img/docs/ninja-rmm-deployment/image-5.png)

![Add 4](../../../static/img/docs/ninja-rmm-deployment/{6920FA30-B083-4E7A-894C-19675BB3CC40}.png)


## Completed Group

![Complete](../../../static/img/docs/ninja-rmm-deployment/{B38F4862-9713-455B-91C4-C08179B2D497}.png)

![Complete 1](../../../static/img/docs/ninja-rmm-deployment/image-6.png)