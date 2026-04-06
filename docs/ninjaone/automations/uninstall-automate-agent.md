---
id: '9d83a408-aeea-4efc-9786-59a6192542e3'
slug: /9d83a408-aeea-4efc-9786-59a6192542e3
title: 'Uninstall Automate Agent'
title_meta: 'Uninstall Automate Agent'
keywords: ['automate','uninstall','agent']
description: 'This script automates the removal of the ConnectWise Automate agent from a Windows machine using Labtech PowerShell Module.'
tags: ['uninstallation','connectwise']
draft: false
unlisted: false
last_update:
  date: 2026-04-01
---

## Overview

This script automates the removal of the ConnectWise Automate agent from a Windows machine using Labtech PowerShell Module. 
- It downloads and imports the LabTech PowerShell module to perform a silent uninstall of the Automate agent. 
- The script ensures that the required module is available locally before execution and handles secure communication using modern TLS protocols.
- After initiating the uninstall process, the script validates the removal by checking for any remaining LabTech services and installation directories. 
- If any components are still present, the script reports the failure to ensure visibility and proper remediation.
  
## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/9d83a408-aeea-4efc-9786-59a6192542e3/automate.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/uninstall-automate-agent.ps1)

## Output

- Activity Details  

## Changelog

### 2026-04-01

- Initial version of the document
