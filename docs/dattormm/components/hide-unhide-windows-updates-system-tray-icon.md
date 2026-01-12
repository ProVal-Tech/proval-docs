---
id: 'd615ac1e-c12b-409a-966d-53c6100817ce'
slug: /d615ac1e-c12b-409a-966d-53c6100817ce
title: 'Hide-Unhide Windows Update System Tray Icon'
title_meta: 'Hide-Unhide Windows Update System Tray Icon'
keywords: ['datto', 'windows', 'windows update', 'hide', 'unhide', 'icon', 'system', 'tray']
description: 'This script provides features to hide or unhide the Windows update icon from the system tray.'
tags:  ['datto', 'update', 'patching']
draft: false
unlisted: false
---

## Overview

This script provides features to hide or unhide the Windows update icon from the system tray.
Enable the variable `HIDE_WinUpdateSystray` to hide the Windows Update icon from the system tray and disable it to unhide it. By default this component will hide the Windows Update icon.

## Dependencies


## Implementation  

1. Download the `component` [Hide-Unhide Windows Update Systray Icon](../../../static/attachments/hide-unhide-windows-update-systray-icon.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `hide-unhide windows update systray icon` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)
![Image4](../../../static/img/docs/09920e46-e8eb-4d62-88e5-048b17623359/image.webp)

4. After selecting the `component`, you will notice a below pop-up with a checkbox option.

5. By default, the `component` is set to `Hide` Windows Update.  
 ![Image5](../../../static/img/docs/09920e46-e8eb-4d62-88e5-048b17623359/image1.webp)


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| HIDE_WinUpdateSystray | Boolean | True | Set it to false to unhide the Windows Update icon display from the system tray. |

## Output

- stdOut
- stdError
- 
## Attachments

[Hide-Unhide Windows Update Systray Icon](../../../static/attachments/hide-unhide-windows-update-systray-icon.cpt)