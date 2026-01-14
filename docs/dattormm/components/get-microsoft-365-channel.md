---
id: '03760c3d-ed64-44f5-a67b-2cbd39478fca'
slug: /03760c3d-ed64-44f5-a67b-2cbd39478fca
title: 'Microsoft 365 - C2R - Get Channel'
title_meta: 'Microsoft 365 - C2R - Get Channel'
keywords: ['channel', 'microsoft-office', 'c2r', 'click-to-run', 'office365']
description: 'This agent procedure is used to check the update channel for Microsoft Office and update to a UDF.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Overview

This agent procedure is used to check the update channel for Microsoft Office and update to a UDF.

## Implementation  

1. Download the component [Microsoft 365 - C2R - Get Channel](../../../static/attachments/Microsoft365-C2R-Get-Channel.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

1. Search the component `Microsoft 365 - C2R - Set Update Channel` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)
![Image 4](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image4.webp)
![Image 5](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image3.webp)



## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| UpdateM365ChannelUDF | String | custom18 | This will update the user default field with the update channel information. |

## Output

- stdout
- stderr
  
## Attachments

[Microsoft 365 - C2R - Get Channel](../../../static/attachments/Microsoft365-C2R-Get-Channel.cpt)