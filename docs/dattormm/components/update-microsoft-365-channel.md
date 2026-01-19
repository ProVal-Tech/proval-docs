---
id: '743a7427-2c38-471a-b1ca-899fc34bbd99'
slug: /743a7427-2c38-471a-b1ca-899fc34bbd99
title: 'Microsoft 365 - C2R - Set Update Channel'
title_meta: 'Microsoft 365 - C2R - Set Update Channel'
keywords: ['channel', 'microsoft-office', 'c2r', 'click-to-run', 'office365']
description: 'This script will modify the registry to set the update channel for Microsoft 365 products to the value specified in the variable and update the Update Channel UDF accordingly.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Overview

This script will modify the registry to set the *Update Channel* for Microsoft 365 products to the value specified in the variable and update the UDF accordingly.

**NOTE:** By default, the script will update the UDF ID 18. In case this UDF is already in use, please update the default value of Variable `UpdateM365ChannelUDF` by editing the script. 


## Dependencies

- [Microsoft 365 - C2R - Get Channel](/docs/03760c3d-ed64-44f5-a67b-2cbd39478fca)

## Implementation  

1. Download the component [Microsoft 365 - C2R - Set Update Channel](../../../static/attachments/Microsoft365-C2R-Set-Update-Channel.cpt) from the attachments.

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

    ![Image 4](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image.webp)
 
    ![Image 5](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image1.webp)

- Click dropdown and select the required channel settings and then click run
![Image 6](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image2.webp)


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| ChannelUpdate | Selection (Values: Current Channel~Monthly Enterprise Channel~Semi-Annual Enterprise Channel~Beta Channel~None) ![Image 7](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image5.webp) | None | Select the *Update Channel* from the drop-down menu to set the Microsoft 365 application's `Update Channel`. |
| UpdateM365ChannelUDF | String | custom18 | This will update the UDF with the `Update Channel` information. |

## Output

- stdout
- stderr
  
## Attachments

[Microsoft 365 - C2R - Set Update Channel](../../../static/attachments/Microsoft365-C2R-Set-Update-Channel.cpt)

## FAQ

**Q. How to set the `UDF` name?**
  
**A.** To set the User Defined Field (UDF) name, please set it under the `Setup` > `Global Settings` > `User-defined field 18` and set the value as `Update M365 Channel` so that it can reflect the same name under the devices UDFs.

  ![Image 8](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image6.webp)

  ![Image 9](../../../static/img/docs/37fffa7b-0b74-4d14-93ff-704d25e78bdc/image7.webp)

**Q. What happen if we didn't set the user defined field name as `Update M365 Channel` under global settings?**
  
**A.** The `User-Defined Field X` will still get updated with the `Update channel` value, where X is the UDF number, but the name of the UDFs will show as `User-Defined Field X` and not as `Update M365 Channel`.
  
  `Note`: The script will not break with the Global UDF settings not updated.