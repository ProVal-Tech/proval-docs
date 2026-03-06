---
id: '0ed0fdc8-7813-47b7-bc5a-3e089dda7560'
slug: /0ed0fdc8-7813-47b7-bc5a-3e089dda7560
title: 'Microsoft Office - C2R - Repair'
title_meta: 'Microsoft Office - C2R - Repair'
keywords: ['channel', 'microsoft-office', 'c2r', 'click-to-run', 'office365']
description: 'This checks the office bit version (32 / 64), then runs a shell command for quick repair. If you want to run a full repair, then set the variable FullRepair = 1.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-01-30
---

## Overview

This checks the office bit version (32 / 64), then runs a shell command for a quick repair. If you want to run a full repair, then set the variable FullRepair = 1.

## Implementation  

1. Download the component [Microsoft Office - C2R - Repair](../../../static/attachments/Microsoft-Office-C2R-Repair.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Microsoft Office - C2R - Repair` and click on `Select`
    ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

    ![Image 4](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image11.webp)

    ![Image 5](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image9.webp)

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| FullRepair | Boolean | False | If it is set to `True` or checked, the full repair of Click-to-Run will run. Otherwise, the quick repair will execute. |

## Output

- stdout
- stderr
  
## Attachments

[Microsoft Office - C2R - Repair](../../../static/attachments/Microsoft-Office-C2R-Repair.cpt)

## Changelog

### 2026-01-30

- Initial version of the document
