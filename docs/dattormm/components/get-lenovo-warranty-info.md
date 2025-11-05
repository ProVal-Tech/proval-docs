---
id: '4321433d-6a4a-4b85-9f9d-3325b75aafa3'
slug: /4321433d-6a4a-4b85-9f9d-3325b75aafa3
title: 'Get Lenovo Warranty Info'
title_meta: 'Get Lenovo Warranty Info'
keywords: ['lenovo', 'warranty', 'lenovo-warranty']
description: 'This component is used to update the UDF with the leneovo warranty information.'
tags: ['auditing', 'licensing', 'lenovo']
draft: false
unlisted: false
---

## Overview

This Component is used to update the UDF with the leneovo warranty information.

## Implementation  

1. Download the component [Get Lenovo Warranty Info](../../../static/attachments/Get%20Lenovo%20Warranty%20Info.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
![Image 1](../../../static/img/docs/4321433d-6a4a-4b85-9f9d-3325b75aafa3/import-lenovo-warranty.webp)  

3. Select the component just downloaded and add it to the Datto RMM interface.  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/4321433d-6a4a-4b85-9f9d-3325b75aafa3/quick%20job.webp)  

3. Search the component `Get Lenovo Warranty Info` and click on `Select`
 ![Image 3](../../../static/img/docs/4321433d-6a4a-4b85-9f9d-3325b75aafa3/find-component.webp)

4. `<Screenshot of Sample run with variable details and example>`
![image 4](../../../static/img/docs/4321433d-6a4a-4b85-9f9d-3325b75aafa3/run%20the%20component.webp)

Note: The UDF variable number may vary depending on the organization. In our VSA instance, the UDF number is 16; however, this number may differ in other RMM environments.
Please also rename that UDF With `Warranty Expiration`

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
|usrUDF| String||  | Enter the UDF number where the warranty information will be stored.|  

## Output

- UDFs Update [warranty Expiration]
![image](../../../static/img/docs/4321433d-6a4a-4b85-9f9d-3325b75aafa3/udf%20data.webp)
- stdOut
![image](../../../static/img/docs/4321433d-6a4a-4b85-9f9d-3325b75aafa3/stdout.webp)

- stdError

## Attachments

[Get Lenovo Warranty Info](../../../static/attachments/Get%20Lenovo%20Warranty%20Info.cpt)