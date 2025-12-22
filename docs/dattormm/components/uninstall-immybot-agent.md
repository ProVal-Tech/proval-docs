---
id: '34886052-b751-41a8-90ca-8c330d986c99'
slug: /34886052-b751-41a8-90ca-8c330d986c99
title: 'Uninstall ImmyBot Agent'
title_meta: 'Uninstall ImmyBot Agent'
keywords: ['remove','immybot','agent']
description: 'This script detects and silently uninstalls the ImmyBot Agent from Windows systems. It searches the Windows registry (both 32-bit and 64-bit uninstall locations) to identify the MSI Product ID associated with the application.'
tags: ['uninstallation','application','datto']
draft: false
unlisted: false
---

## Overview

This script detects and silently uninstalls the ImmyBot Agent from Windows systems. It searches the Windows registry (both 32-bit and 64-bit uninstall locations) to identify the MSI Product ID associated with the application. If found, the script executes a silent MSI uninstall using msiexec with no user interaction or forced reboot. After execution, the script verifies whether the application was successfully removed and reports the result. If the ImmyBot Agent is not installed, the script exits gracefully without error.

## Implementation  

1. Download the component `[Uninstall ImmyBot Agent](../../../static/attachments/Uninstall%20ImmyBot%20Agent.cpt)` from the attachments.

2. After downloading the attached file, click on the `Import` button

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/34886052-b751-41a8-90ca-8c330d986c99/import.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/34886052-b751-41a8-90ca-8c330d986c99/quickjob.webp)  

3. Search the component `Uninstall ImmyBot Agent` and click on `Select`.
![Image 3](../../../static/img/docs/34886052-b751-41a8-90ca-8c330d986c99/select.webp)

## Output

- stdOut  
- stdError
- ![Image 4](../../../static/img/docs/34886052-b751-41a8-90ca-8c330d986c99/output.webp)

## Attachments

[Uninstall ImmyBot Agent](../../../static/attachments/Uninstall%20ImmyBot%20Agent.cpt)
