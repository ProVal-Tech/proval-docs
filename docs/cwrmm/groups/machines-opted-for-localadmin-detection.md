---
id: 'e1cb7e20-f09c-4350-a496-db920efa6530'
slug: /e1cb7e20-f09c-4350-a496-db920efa6530
title: 'Machines Opted for Local Admin Detection'
title_meta: 'Machines Opted for Local Admin Detection'
keywords: ['local','administators','localgroup','admins','windows']
description: 'This Group includes windows machines which are opted for Local Administrator Detection Solution.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-03
---

## Summary
This group includes Windows machines which are opted for Local Administrator Detection Solution.

## Dependencies
- [Custom Field - Enable Local Admins Detection  ](/docs/219923f8-62e6-401a-9693-678b44325708) 
- [Custom Field - Exclude Local Admin Detection ](/docs/e988aefc-1f5d-4d10-a66b-cf22e084ae72)  
- [Custom Field - Exclude Local Admin Detection ](/docs/18aa25e5-61cd-429d-ab09-44b7cf6eb10e) 
- [Solution - Local Administrator Detection](/docs/7e3f8472-2908-4491-b495-b87bd7ad0fe6)

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

- **Group Name:** `Machines Opted for Local Admin Detection`  
- **Description:** `This Group includes Windows machines which are opted for Local Administrator Detection Solution.`

![Summary](../../../static/img/docs/e1cb7e20-f09c-4350-a496-db920efa6530/image1.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

- `Enable Local Admins Detection` equals `True`
- `Exclude Local Admin Detection` equals `False` (For site Custom Field)
- `Exclude Local Admin Detection` equals `False` (For Endpoint Custom Field)
- `OS Product` contains `Windows`
- `Available` should be `True`.

![Criteria](../../../static/img/docs/e1cb7e20-f09c-4350-a496-db920efa6530/image2.webp)

## Completed Group

![Completed Group](../../../static/img/docs/e1cb7e20-f09c-4350-a496-db920efa6530/image3.webp)

## Changelog

### 2026-01-30

- Initial version of the document
