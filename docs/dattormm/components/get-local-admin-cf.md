---
id: '383db450-2294-4cc0-947a-fd262d39d772'
slug: /383db450-2294-4cc0-947a-fd262d39d772
title: 'Get Local Admin [CF]'
title_meta: 'Get Local Admin [CF]'
keywords: ['local', 'admin', 'cf']
description: 'This script is used to get the local admin data from each machine and output it over a UDF'
tags: ['custom-fields', 'data-collection']
draft: false
unlisted: false
---

## Overview  
This script is used to get the local admin data from each machine and output it over a UDF


## Implementation  

1. Download the component [Get Local Admin [CF]](../../../static/attachments/Get%20Local%20Admin%20CF.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Get Local Admin [CF]` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. After selecting the component, you will notice a below popup window to specify the UDF number over which the data will get populated.  
![Image 4](../../../static/img/docs/383db450-2294-4cc0-947a-fd262d39d772/Snapshot1.webp)

5. After inputting the UDF number, click on `Run` to execute the component.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
|usrUDF| String||Enter the UDF ID to store the Secure Boot Check Status|  

## Output  
- stdOut  
- stdError  


## Attachments  
[Get Local Admin [CF]](../../../static/attachments/Get%20Local%20Admin%20CF.cpt)