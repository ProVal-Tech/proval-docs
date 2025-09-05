---
id: 'adbaa9f6-7fed-4461-803e-06acbea623fd'
slug: /adbaa9f6-7fed-4461-803e-06acbea623fd
title: 'Teams Temp Data Cleanup'
title_meta: 'Teams Temp Data Cleanup'
keywords: ['datto', 'teams', 'cleanup', 'temp']
description: 'Cleans up temporary files and cache for the new Microsoft Teams client only'
tags: ['cleanup', 'datto']
draft: false
unlisted: false
---

## Overview  
Cleans up temporary files and cache for the new Microsoft Teams client only  

## Implementation  

1. Download the component [Teams Temp Data Cleanup](../../../static/attachments/Teams%20Temp%20Data%20Cleanup.cpt) from the attachment.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Teams Temp Data Cleanup` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. After clicking on `Select`, a below pop up window will open up and then click on `Run` to execute the component.
![Image 4](../../../static/img/docs/adbaa9f6-7fed-4461-803e-06acbea623fd/snapshot1.webp)  

5. To view the results check the activity logs of the machine.

## Output  
- stdOut  
- stdError  


## Attachments  
[Teams Temp Data Cleanup](../../../static/attachments/Teams%20Temp%20Data%20Cleanup.cpt)