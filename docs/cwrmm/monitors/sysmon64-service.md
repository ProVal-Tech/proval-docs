---
id: '8e2bc974-4a4e-4d7b-847d-505ff0cf0836'
slug: /8e2bc974-4a4e-4d7b-847d-505ff0cf0836
title: 'Sysmon64 Service'
title_meta: 'Sysmon64 Service'
keywords: ['sysmon', 'windows','configuration', 'installation', 'endpoint']
description: 'Monitors Sysmon64 Service on 64-bit Windows machines.'
tags: ['installation','windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-26
---

## Summary
Monitors Sysmon64 Service on 64-bit Windows machines.

## Dependencies

- [Solution - Sysmon Solution ](/docs/2db51f41-1313-46c4-81f1-8c67ed578b73) 


## Target

This monitor should target the group `Machines with Sysmon` as shown below:  
![Image](../../../static/img/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836/image1.webp)

## Monitor Creation

### Step 1

Navigate to `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  
![Step1](../../../static/img/docs/23e2c753-e68a-4bcc-83df-1f62826025a5/step1.webp)

### Step 2

Locate the `Create Monitor` button on the right-hand side of the screen and click on it.  
![Step2](../../../static/img/docs/23e2c753-e68a-4bcc-83df-1f62826025a5/step2.webp)

This page will appear after clicking on the `Create Monitor` button:  
![Step3](../../../static/img/docs/23e2c753-e68a-4bcc-83df-1f62826025a5/step3.webp)

### Step 3

Fill in the mandatory columns on the left side  
Name: `Sysmon64 Service`  
Description: `Monitors Sysmon64 Service on 64-bit Windows machines.`  
Type: `Service`  
Severity: `Critical Non-Impact Alerts`  
Family: `Windows Services` 

![Image](../../../static/img/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836/image2.webp)

### Step 4

Click the `Select Target` button to choose the endpoints for running the monitor set.  
![Step4](../../../static/img/docs/23e2c753-e68a-4bcc-83df-1f62826025a5/step4.webp)


Search and Select `Machines with Sysmon` device group.
![Image](../../../static/img/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836/image1.webp)

### Step 5

#### Condtions :

Select `Sysmon64` from the Service dropdown.  
Deselect `Ignore services in disabled state`

### Ticket Resolution :

Ensure both the `Automatically start Sysmon64 when stopped` toggle and the `Automatically resolve when Sysmon64 is running` toggle are enabled.  

### Monitor Output :

Select `Generate Ticket` from the Output Drop-down Menu


![Image](../../../static/img/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836/image3.webp)


## Completed Monitor

![Image](../../../static/img/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836/image4.webp)

## Changelog

### 2026-03-26

- Initial version of the document
