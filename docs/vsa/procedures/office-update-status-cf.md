---
id: 'e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19'
slug: /e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19
title: 'Office Enable Update Status - CF'
title_meta: 'Office Enable Update Status - CF'
keywords: ['office', 'update', 'enable', 'procedure', 'cf']
description: 'This script is used to check the office update status on the machine and update the result into the Custom field on the machine.'
tags: ['office', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

This script is used to check the office update status on the machine, wherther its enabled or not and update the result into the Custom field on the machine.

## Dependencies

- PowerShell 5.0+
- [Custom Field: cPVAL Office Update](/docs/1be983dd-ef42-4873-a299-a5cd6e44c2ea)
- [Solution: Office Update Status](/docs/1626c96c-80e1-45b9-93f3-d1b8237f911f)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** `Office Enable Update Status - CF`   
   ![Image 1](../../../static/img/docs/e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19/3.webp)  
   The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.
![Image 2](../../../static/img/docs/e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19/2.webp)

## Sample Run

Now, You can execute the script on the machine in which you need to check for the office enable status and it will update the result into the custom filed.

![Image 3](../../../static/img/docs/e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19/1.webp)

## Output

- Agent Procedure log
- Custom Field - cPVAL Office Update

## Changelog

### 2026-04-14

  - Initial version of the document