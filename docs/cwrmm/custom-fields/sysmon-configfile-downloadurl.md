---
id: '03a3c0c1-4c8c-42a9-9aa6-18c5fd745b8d'
slug: /03a3c0c1-4c8c-42a9-9aa6-18c5fd745b8d
title: 'Sysmon ConfigFile DownloadURL'
title_meta: 'Sysmon ConfigFile DownloadURL'
keywords: ['sysmon', 'windows','configuration', 'installation', 'endpoint']
description: 'Specify the file path of the Sysmon configuration file that will be used for applying the Sysmon settings.'
tags: ['installation','windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-26
---

## Summary
Specify the file path of the Sysmon configuration file that will be used for applying the Sysmon settings. If its not filled, script will use the default configuration file:  
https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml

## Dependencies

- [Solution - Sysmon Solution ](/docs/2db51f41-1313-46c4-81f1-8c67ed578b73) 

## Details

| Name                 | Level                | Type                | Default       |  Editable | Description                              |
|----------------------|----------------------|---------------------|------------------|----------|------------------------------------------|
| Sysmon ConfigFile DownloadURL | Company | Text Box |  | Yes  | Specify the file path of the Sysmon configuration file that will be used for applying the Sysmon settings. If its not filled, script will use the default configuration file 'https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml' |

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

![Completed Custom Field](../../../static/img/docs/03a3c0c1-4c8c-42a9-9aa6-18c5fd745b8d/image1.webp)

## Changelog

### 2026-03-26

- Initial version of the document