---
id: '2d9af9b7-6208-43d2-82e5-23c3ab547410'
slug: /2d9af9b7-6208-43d2-82e5-23c3ab547410
title: 'WSUS Status Disabled'
title_meta: 'WSUS Status Disabled'
keywords: ['WSUS','Windows Update','Update']
description: 'This group contains the agents where the WSUS status is detected as disabled.'
tags: ['update','windows','auditing']
draft: false
unlisted: false
---

## Summary
This group contains the agents where the WSUS status is detected as disabled.

## Dependencies
[CustomField - WSUS_Status](/docs/2ca7feb0-b811-4486-8ff1-fd93d08056c8)
[Solution - Patching - Check for WSUS Settings](/docs/f68df531-09b3-4b82-b183-3769c7183a8d)

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

**Group Name:** `WSUS Status Disabled`  
**Description:** `This group contains the agent where the WSUS status is detected as disabled.`

![Summary](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image16.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

Search for `WSUS_Status` and check for `Contains any of` and put the value as `WSUS Status: Disabled`

![Criteria](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image15.webp)

## Completed Group

![Complete](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image17.webp)