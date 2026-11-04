---
id: '22a99cac-7acf-4251-a790-41a3b651f183'
slug: /22a99cac-7acf-4251-a790-41a3b651f183
title: 'BlackPoint SnapAgent Installer - MacOS'
title_meta: 'BlackPoint SnapAgent Installer - MacOS'
keywords: ['agent','mac','deployment','blackpoint']
description: 'This script is used to the install the BlackPoint AnapAgent on the MacOS machines. The script used run time variable or Ninja custom fields to retrieve the necessary authentication information.'
tags:  ['macos', 'security','installation']
draft: false
unlisted: false
last_update:
  date: 2026-11-04
---

## Overview

This script is used to the install the BlackPoint SnapAgent on the MacOS machines. The script uses run time variable or Ninja custom fields to retrieve the necessary authentication information.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/22a99cac-7acf-4251-a790-41a3b651f183/scriptrun.webp)

## Parameters

`Note: If the value is present under the custom field then variables do not need to be put during the script execution. As the script get the data from either Custom field or variables.`

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| Authentication_Token | -- | -- | NO | "" | `String/Text` |Unique BlackPoint Authentication Code required to authenticate and install the BlackPoint Agent on endpoints |
| Customer_ID |--  | -- | NO| "" | `String/Text` | Stores the unique Blackpoint Account UID used to identify and link endpoints to the correct Blackpoint account. |

## Dependencies

- [Custom Field - cPVAL BP CustomerID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Authentication Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)
- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Automation Setup/Import

- [Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/black-point-deployment-mac.sh)

## Output

- Activity Details

## Changelog

### 2026-11-04

- Updated the script with the following changes:
  - Renamed the `BP_Mac_Auth_Token` and `BP_Mac_Customer_ID` variables to `Authentication_Token` and `Customer_ID`.
  - The script now reads the `cpvalBpAuthenticationToken` and `cpvalBpCustomerid` custom fields instead of `cpvalBpMacAuthToken` and `cpvalbpaccountuid`.
- Updated the Dependencies to use the renamed `cPVAL BP CustomerID` and `cPVAL BP Authentication Token` custom fields.

### 2025-11-28

- Initial version of the document
