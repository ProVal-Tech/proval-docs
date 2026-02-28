---
id: '0b216db3-7775-4754-b9bb-bfad7f9757ad'
slug: /0b216db3-7775-4754-b9bb-bfad7f9757ad
title: 'Install Datto RMM Agent [MAC]'
title_meta: 'Install Datto RMM Agent [MAC]'
keywords: ['datto-rmm', 'migration', 'datto']
description: 'Executes the installation script against MAC machines where the Datto RMM Agent is not installed.'
tags: ['application', 'installation']
draft: false
unlisted: false
---

## Summary

Executes the [installation script](/docs/7920577d-9a4a-48d0-9102-b01c27c2e00f) against MAC machines where the Datto RMM Agent is not installed.

## Dependencies

- [Dynamic Group: Datto RMM Agent Installation [MAC]](/docs/b8948dfb-8c54-4872-9ae2-41d9ce4c5a15)
- [Task: Install Datto RMM Agent](/docs/7920577d-9a4a-48d0-9102-b01c27c2e00f)
- [Solution : Deploy Datto RMM Agent](/docs/b646e989-5515-4bda-9728-107ac03cdc07)

## Monitor Setup Location

**Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  

## Monitor Summary

- **Name:** `Install Datto RMM Agent [MAC]`  
- **Description:** `Executes the installation script against MAC machines where the Datto RMM Agent is not installed.`  
- **Type:** `File System`  
- **Severity:** `Others`  
- **Family:** `RMM Agent`

![Image1](../../../static/img/docs/0b216db3-7775-4754-b9bb-bfad7f9757ad/image1.webp)

## Targeted Resources

- **Target Type:**  `Device Groups`  
- **Group Name:** `Datto RMM Agent Installation [MAC]`

![Image2](../../../static/img/docs/0b216db3-7775-4754-b9bb-bfad7f9757ad/image2.webp)

## Conditions

- **File or Directory:** `File`  
- **File Path:** `/Applications/AEM Agent.app`  
- **Condition:** `Exists`  
- **Add Automation:**  `Install Datto RMM Agent`

![Image3](../../../static/img/docs/0b216db3-7775-4754-b9bb-bfad7f9757ad/image3.webp)

## Ticket Resolution

**Automatically resolve:** `False`

![Image4](../../../static/img/docs/0b216db3-7775-4754-b9bb-bfad7f9757ad/image4.webp)

## Monitor Output

**Output:** `Do not Generate Ticket`

![Image5](../../../static/img/docs/0b216db3-7775-4754-b9bb-bfad7f9757ad/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/0b216db3-7775-4754-b9bb-bfad7f9757ad/image6.webp)
