---
id: '101362d2-15fb-4f85-b344-08986e7e12f3'
slug: /101362d2-15fb-4f85-b344-08986e7e12f3
title: 'Check Developer Mode Status - CF'
title_meta: 'Check Developer Mode Status - CF'
keywords: ['developer', 'mode', 'enable', 'procedure', 'cf']
description: 'This script used to check the status of developer mode on the machine and update the result into the custom field on the windows machine.'
tags: ['auditing', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-05-01
---

## Summary

This script used to check the status of developer mode on the windows machine and update the result into the custom field [cPVAL_Developer_Mode_Status](/docs/7eca9a7b-d09d-416d-8c04-3dab7776ba1b).

## Dependencies

- PowerShell 5.0+
- [Custom Field: cPVAL_Developer_Mode_Status](/docs/7eca9a7b-d09d-416d-8c04-3dab7776ba1b)
- [Solution: Enable/Disable Developer Mode](/docs/b4452b00-9dfd-4ad8-b4fd-3ba7769ff674)

## Variable

`Developer Mode`: description  
Accepted Values: 
  - Enable: description
  - Disable: Descripton

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** `Check Developer Mode Status - CF`   
   ![Image 1](../../../static/img/docs/101362d2-15fb-4f85-b344-08986e7e12f3/1.webp)  
   The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.
![Image 2](../../../static/img/docs/101362d2-15fb-4f85-b344-08986e7e12f3/2.webp)

## Sample Run

Now, You can execute the script on the machine in which you need to check status of the developer mode and it will update the result into the custom filed.

![Image 3](../../../static/img/docs/101362d2-15fb-4f85-b344-08986e7e12f3/3.webp)

## Output

- Agent Procedure log
- Custom Field: `cPVAL_Developer_Mode_Status`

## Changelog

### 2026-05-01

  - Initial version of the document
