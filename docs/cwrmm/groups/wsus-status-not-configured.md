---
id: 'ec043f37-93f6-49c1-82cf-d4535c4332bf'
slug: /ec043f37-93f6-49c1-82cf-d4535c4332bf
title: 'WSUS Status Not Configured'
title_meta: 'WSUS Status Not Configured'
keywords: ['WSUS','Windows Update','Update']
description: 'This group contains the agents where the WSUS status is detected as not configured.'
tags: ['update','windows','auditing']
draft: false
unlisted: false
---

## Summary
This group contains the agents where the WSUS status is detected as not configured.

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

**Group Name:** `WSUS Status Not Configured`  
**Description:** `This group contains the agent where the WSUS status is detected as not configured.`

![Summary](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image22.webp)

### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

Search for `WSUS_Status` and check for `Contains any of` and put the value as `WSUS Status: Disabled`

![Criteria](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image23.webp)

## Completed Group

![Complete](../../../static/img/docs/a211d2b4-0244-41e1-8233-181eb875478f/image21.webp)