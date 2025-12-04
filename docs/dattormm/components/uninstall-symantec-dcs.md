---
id: '400a5a83-4e3f-4af1-bfaa-1d3a2ae8f70a'
slug: /400a5a83-4e3f-4af1-bfaa-1d3a2ae8f70a
title: 'Uninstall Symantec DCS Antivirus'
title_meta: 'Uninstall Symantec DCS Antivirus'
keywords: ['symantec', 'antivirus', 'data center security']
description: 'Symantec Data Center Security (DCS) Agent Removal Script. This script stops and deletes Symantec DCS-related services, uninstalls the agent via registry uninstall entries, removes associated folders, and cleans up registry keys.'
tags: ['antivirus','security']
draft: false
unlisted: false
---

## Overview
This is Symantec Data Center Security (DCS) Agent Removal Script. This script stops and deletes Symantec DCS-related services, uninstalls the agent via registry uninstall entries, removes associated folders, and cleans up registry keys.

## Implementation  

1. Download the component [Uninstall Symantec DCS Antivirus](../../../static/attachments/Uninstall-Symantec-DCS-Antivirus.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component [Uninstall Symantec DCS Antivirus](../../../static/attachments/Uninstall-Symantec-DCS-Antivirus.cpt) and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. ![Sample Run](../../../static/img/docs/9df733ac-5c74-4d25-8504-c8294fd39fec/image.webp)

## Output

- stdOut  
- stdError  
- C:\DCS_Uninstall_Log.txt

## Attachments

[Uninstall Symantec DCS Antivirus](../../../static/attachments/Uninstall-Symantec-DCS-Antivirus.cpt)