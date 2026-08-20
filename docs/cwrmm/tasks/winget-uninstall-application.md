---
id: '70ce6b79-5bfe-4160-95d9-77622b7fce89'
slug: /70ce6b79-5bfe-4160-95d9-77622b7fce89
title: 'Winget Uninstall Application'
title_meta: 'Winget Uninstall Application'
keywords: ['winget', 'uninstall', 'application', 'windows', 'script']
description: 'This document provides a detailed guide on how to uninstall an application using Winget on Windows devices. It includes parameters, dependencies, and a complete PowerShell script for implementation.'
tags: ['setup', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This document outlines the process to uninstall an application via Winget.

## Parameters

**ID** = Winget application ID (Example: Google.Chrome)  
To obtain the ID, you can search in the command prompt using `winget search appname` or by browsing to winget.run.

## Dependencies

None. This script can be executed on any Windows device.

## Create Script

To implement this script, please create a new PowerShell-style script on the system.

![Winget Uninstall Application](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_1.webp)  
![Winget Uninstall Application](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_2.webp)  

**Name:** `Winget Uninstall Application`  
**Description:** 

[Bash Script 1](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/winget-uninstall-application/script1.sh)



**Category:** `Custom`  

![Parameter](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_3.webp)  

### Parameter

![Parameter](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_4.webp)  
**Parameter Name:** id  
**Required Field:** Selected  
**Parameter Type:** Text String  

### Script

#### Row 1 Function: Script Log

![Script Log](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_5.webp)  

Input the following:  

[Bash Script 2](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/winget-uninstall-application/script2.sh)



![Input](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_6.webp)  

#### Row 2 Function: PowerShell Script

![PowerShell Script](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_7.webp)  

Paste the following PowerShell script and set the expected time of script execution to 600 seconds.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/winget-uninstall-application/script.ps1)



![Script Log](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_8.webp)  

#### Row 3 Function: Script Log

![Script Log](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_5.webp)  

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Output](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_9.webp)  

The final task should look like the screenshot below.  
![Final Task](../../../static/img/docs/70ce6b79-5bfe-4160-95d9-77622b7fce89/image_10.webp)  

## Script Deployment

The script is intended to run manually at this time.

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

