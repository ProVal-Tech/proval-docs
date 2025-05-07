---
id: '1b41da88-5b9a-436f-997b-39c8f72615ae'
slug: /1b41da88-5b9a-436f-997b-39c8f72615ae
title: 'CW RMM - Ninja Migration Custom fields'
title_meta: 'CW RMM - Ninja Migration Custom fields'
keywords: ['RMM', 'Ninja', 'Migration', 'MAC', 'Macintosh', 'Windows', 'Agent', 'Install']
description: 'This document contains the custom fields that are used in the CW RMM to Ninja migration'
tags: ['macos', 'windows', 'installation', 'deployment', 'application', 'connectwise']
draft: false
unlisted: false
---

## Summary

This document contains the custom fields that are used in the CW RMM to Ninja migration

## Details

| Name                     | Level   | Type  | Default? | Required | Editable | Description                                                                 |
|--------------------------|---------|-------|----------|----------|----------|-----------------------------------------------------------------------------|
| Ninja Deployment Enable  | Company | Flag  | No       | True     | Yes      | Checking this flag will enable the Ninja Deployment on the company agents.  |
| Ninja Deployment Exclude | Site    | Flag  | No       | False    | Yes      | Checking this flag will exclude the site endpoints from the Ninja Deployment. |
| Ninja Deployment Exclude | Endpoint| Flag  | No       | False    | Yes      | Checking this flag will exclude the endpoint from the Ninja Deployment.     |
| Ninja_Org_ID             | Company | Text  |          | False    | Yes      | This will install the NinjaRMM at the organization level based on the token provided. |
| Ninja_Site_ID            | Site    | Text  |          | False    | Yes      | This will install the NinjaRMM at the site level based on the token provided. |
| Ninja Deployment Result  | Endpoint| Text  |          | False    | No       | This stores the success or failure result of the Ninja Deployment script.   |


## Creation Process

### Step 1

Navigate to `Settings` ➞ `Custom Fields`  
![Step1](../../../static/img/docs/1b41da88-5b9a-436f-997b-39c8f72615ae/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen and click on it.  
![Step2](../../../static/img/docs/1b41da88-5b9a-436f-997b-39c8f72615ae/step2.webp)

Provide the values as provided in the details section to the custom fields requirement and add them one by one.

## Completed Custom Field

![Complete](../../../static/img/docs/1b41da88-5b9a-436f-997b-39c8f72615ae/image.webp)