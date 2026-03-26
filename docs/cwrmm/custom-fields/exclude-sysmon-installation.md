---
id: '8552abe9-3bbe-46c4-84f6-2c03fb73948b'
slug: /8552abe9-3bbe-46c4-84f6-2c03fb73948b
title: 'Exclude Sysmon Installation'
title_meta: 'Exclude Sysmon Installation'
keywords: ['sysmon', 'windows','configuration', 'installation', 'endpoint']
description: 'Enabling this will exclude this site/endpoint from deploying the Sysmon installation.'
tags: ['installation','windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-26
---

## Summary
Enabling this will exclude this site/endpoint from deploying the Sysmon installation.

## Dependencies

- [Solution - Sysmon Solution ](/docs/2db51f41-1313-46c4-81f1-8c67ed578b73) 

## Details

| Name                 | Level                | Type                | Default?         | Required | Editable | Description                              |
|----------------------|----------------------|---------------------|------------------|----------|----------|------------------------------------------|
|Exclude Sysmon Installation | Site | Checkbox | No | False | Yes   | Enabling this will exclude this site from deploying the Sysmon installation on their Windows machines. |
|Exclude Sysmon Installation | Endpoint | Checkbox | No | False | Yes   | Enabling this will exclude this Endpoint from deploying the Sysmon installation. |

## Creation Process

### Step 1

Navigate to `Settings` ➞ `Custom Fields`  
![Step1](../../../static/img/docs/1b41da88-5b9a-436f-997b-39c8f72615ae/step1.webp)

### Step 2

Locate the `Add Field` button on the right-hand side of the screen and click on it.  
![Step2](../../../static/img/docs/1b41da88-5b9a-436f-997b-39c8f72615ae/step2.webp)

## Step 3

The `Add new custom field` dialog box will occur

![Step3](../../../static/img/docs/1b41da88-5b9a-436f-997b-39c8f72615ae/step3.webp)

## Completed Custom Field

![Completed Custom Field](../../../static/img/docs/8552abe9-3bbe-46c4-84f6-2c03fb73948b/image1.webp)

![Completed Custom Field](../../../static/img/docs/8552abe9-3bbe-46c4-84f6-2c03fb73948b/image2.webp)

## Changelog

### 2026-03-26

- Initial version of the document