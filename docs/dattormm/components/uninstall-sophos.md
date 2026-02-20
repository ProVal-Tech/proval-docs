---
id: 'd048e977-ae3b-4f25-a396-abe32c87bba6'
slug: /d048e977-ae3b-4f25-a396-abe32c87bba6
title: 'Uninstall Sophos'
title_meta: 'Uninstall Sophos'
keywords: ['sophos', 'endpoint', 'uninstall', 'zap', 'agent']
description: 'Removes Sophos Endpoint Agent and all related modules from the system. If standard uninstall fails, it attempts removal of individual modules and cleans up remaining files from standard installation paths.'
tags: ['cleanup', 'security', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Overview
Removes Sophos Endpoint Agent and all related modules from the system. If standard uninstall fails, it attempts removal of individual modules and cleans up remaining files from standard installation paths.

<I><U><b>Note:</b></U> Ensure to disable Tamper protection for smooth uninstallation.</I>

## Implementation  

1. Download the component [Uninstall Sophos](../../../static/attachments/uninstall-sophos.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Uninstall Sophos` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Click on `Run`  
![Sample Run](../../../static/img/docs/d048e977-ae3b-4f25-a396-abe32c87bba6/image1.webp)



## Output

- stdOut  
- stdError  

## Attachments

[Uninstall Sophos](../../../static/attachments/uninstall-sophos.cpt)