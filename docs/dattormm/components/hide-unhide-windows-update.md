---
id: 'd805907c-00ad-435e-b614-0f2e5092dd17'
slug: /d805907c-00ad-435e-b614-0f2e5092dd17
title: 'Hide/Unhide Windows Update'
title_meta: 'Hide/Unhide Windows Update'
keywords: ['datto', 'windows', 'windows update', 'hide', 'unhide']
description: 'This script manages the visibility of the Windows Update page in the Settings app at the machine level.'
tags: ['datto', 'update', 'patching']
draft: true
unlisted: false
---

## Overview  
This script manages the visibility of the Windows Update page in the Settings app at the machine level.

## Implementation  

1. Download the `component` [Hide-Unhide Windows Update](../../../static/attachments/Hide-Unhide%20Windows%20Update.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Hide-Unhide Windows Update` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. After selecting the `component`, you will notice a below pop-up with a checkbox option.

5. By default, the `component` is set to `Hide` Windows Update.  
 ![Image4](../../../static/img/docs/d805907c-00ad-435e-b614-0f2e5092dd17/snapshot1.webp)


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| HIDE_WINDOWSUPDATE | Boolean | True | by default, set to True to hide. |  

## Output  
- stdOut  
- stdError  

## Attachments  
[Hide-Unhide Windows Update](../../../static/attachments/Hide-Unhide%20Windows%20Update.cpt)