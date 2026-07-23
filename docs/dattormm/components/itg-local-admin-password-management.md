---
id: '270a46af-eea5-4adb-84d1-7d00e2dbecde'
slug: /270a46af-eea5-4adb-84d1-7d00e2dbecde
title: 'ITG - Local Admin Password Management'
title_meta: 'ITG - Local Admin Password Management'
keywords: ['IT Glue', 'Local Admin', 'Password']
description: 'This automated script rotates or creates a specified Local Administrator account password on the target Windows endpoint, enforces security compliance, and securely documents the credentials directly into IT Glue.'
tags: ['itglue', 'datto', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Overview  

This automated script rotates or creates a specified Local Administrator account password on the target Windows endpoint, enforces security compliance, and securely documents the credentials directly into IT Glue.

## Implementation  

1. Download the component `ITG - Local Admin Password Management` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  
4. After Importing the component to the Datto RMM, make sure to add the component to the `Proval` Group always.  
    - Steps to Add the component under `Proval` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  
    ![Image 4](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image1.webp)  
    iii. Select the group as `Proval`  
    ![Image 5](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image2.webp)


## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `ITG - Local Admin Password Management` and click on `Select`  
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Sample Run:  
![Image 6](../../../static/img/docs/270a46af-eea5-4adb-84d1-7d00e2dbecde/Image1.webp)   
![Image 7](../../../static/img/docs/270a46af-eea5-4adb-84d1-7d00e2dbecde/Image2.webp)    
`NOTE` - Please add all the respective details from the CW portal.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
|orgID|String||Organisation ID of client.|
|NewAdminUsername|String||Enter the new admin name (Used if ChangeAdminUsername is true).|
|ITGlueAPIKey|String||IT-Glue API key|
|ITGlueURL|String|https://api.itglue.com|API URL IT-Glue|
|ChangeAdminUsername|Boolean|False|Change the current administrators username(Disable "Administrator" and creates new account)|

## Output

- stdOut  
- stdError  
 
## Attachments  

[ITG - Local Admin Password Management](../../../static/attachments/ITG%20-%20Local%20Admin%20Password%20Management.cpt)
## Changelog
 
### 2026-07-23
 
- Initial version of the document
