---
id: '3a02f066-c967-40f9-8e3f-4e05012064da'
slug: /3a02f066-c967-40f9-8e3f-4e05012064da
title: 'Set M365 Shortcuts'
title_meta: Set M365 Shortcuts'
keywords: ['m365','microsoft','shortcut','datto']
description: 'Places shortcuts for the installed Microsoft 365 applications into a folder on the Public Desktop.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false 
last_update:
  date: 2026-08-20
---

## Overview

Places shortcuts for the installed Microsoft 365 applications into a folder on the Public Desktop.

## Implementation  

1. Import the [attached component](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/set-m365shortcuts.cpt)

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the [Set M365 Shortcuts](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/set-m365shortcuts.cpt) on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Set M365 Shortcuts` and click on `Select`

 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

![Image](../../../static/img/docs/3a02f066-c967-40f9-8e3f-4e05012064da/image.webp)

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| Application | String | Word, Excel, PowerPoint, Outlook, OneNote, Access, Publisher, Project, Visio | Limits the shortcuts to the named applications. When omitted, every supported application that is installed receives a shortcut.  The validate set are ('Word', 'Excel', 'PowerPoint', 'Outlook', 'OneNote', 'Access', 'Publisher', 'Project', 'Visio').|
| FolderName | String | Microsoft 365 | The name of the folder created on the Public Desktop. Defaults to 'Microsoft 365'. |
| TimeoutMinutes | String | 45 | How long to wait for a Microsoft 365 install to appear and finish before giving up. Default to 45 minutes. |
## Output

Activity Log

- stdOut
- stdError  

## Attachments  

[Set M365 Shortcuts](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/set-m365shortcuts.cpt)

## Changelog
 
### 2026-08-20
 
- Initial version of the document
