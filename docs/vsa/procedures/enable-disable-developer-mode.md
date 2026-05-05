---
id: 'aa52a152-4cf2-4ed2-816b-88201816d69a'
slug: /aa52a152-4cf2-4ed2-816b-88201816d69a
title: 'Enable/Disable Developer Mode'
title_meta: 'Enable/Disable Developer Mode'
keywords: ['developer', 'mode', 'enable', 'procedure']
description: 'This script is used to disable or enable the developer mode on the Windows machine as per the parameter, and before making any changes it will check the current status of developer mode.'
tags: ['auditing', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-05-01
---

## Summary

This script is used to disable or enable the developer mode on the Windows machine as per the parameter, and before making any changes it will check the current status of developer mode.

## Dependencies

- PowerShell 5.0+
- [Solution: Enable/Disable Developer Mode](/docs/b4452b00-9dfd-4ad8-b4fd-3ba7769ff674)

## Variable

`Developer Mode`: As per the accepted value, it will enable or disable the developer mode on the machine.

Accepted Values: 
  - Enable: It will used to enable the developer mode on the machine
  - Disable: It will used to disable the developer mode on the machine.


## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** `Enable/Disable Developer Mode`   
   ![Image 1](../../../static/img/docs/aa52a152-4cf2-4ed2-816b-88201816d69a/1.webp)  
   The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.
![Image 2](../../../static/img/docs/aa52a152-4cf2-4ed2-816b-88201816d69a/2.webp)

## Sample Run

Now, You can execute the script on the machine in which you want to enable the developer mode on the machine.

![Image 3](../../../static/img/docs/aa52a152-4cf2-4ed2-816b-88201816d69a/3.webp)
![Image 4](../../../static/img/docs/aa52a152-4cf2-4ed2-816b-88201816d69a/4.webp)

## Output

- Agent Procedure log

## Changelog

### 2026-05-01

  - Initial version of the document