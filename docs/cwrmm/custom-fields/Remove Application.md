---
id: 'rmm-remove-application-result'
title: 'Remove Application Result Custom Field'
title_meta: 'Remove Application Result Custom Field'
keywords: ['customfield', 'application', 'result', 'status']
description: 'This document provides a detailed overview of the custom field used in the "Remove Application" script to track the success or failure status of application removal. It includes steps for creating the custom field and its specific attributes.'
tags: ['endpoint', 'configuration', 'software']
draft: false
unlisted: false
---
## Summary

The below custom field is used in the "Remove Application" script to gather the success or failure status.

## Dependencies

## Details

| Name                        | Level    | Type  | Default | Editable | Description                                                                                   |
|-----------------------------|----------|-------|---------|----------|-----------------------------------------------------------------------------------------------|
| Remove Application Result    | Endpoint | Text  |         | No       | It stores either 'Success' or 'Failure'.<br>Success: It means the application removed successfully.<br>Failure: It means the application provided failed to remove. |

## Steps to Create Custom Fields

1. Go to Settings > Custom Fields  
   ![Custom Fields](../../../static/img/Remove-Application/image_9.png)

2. Click Add option  
   ![Add Option](../../../static/img/Remove-Application/image_10.png)

3. Create Custom Field  
   Provide Name: Remove Application Result  
   Select Level: Endpoint  
   ![Create Custom Field](../../../static/img/Remove-Application/image_11.png)  
   
   Then check the Type option:  
   Type: Text Box  
   ![Text Box](../../../static/img/Remove-Application/image_12.png)  
   
   Then Provide Default Value and Description:  
   Default:   
   Description: This stores the Success and Failure results for applications removed and failed to remove respectively.  
   Editable: No  
   ![Default Value and Description](../../../static/img/Remove-Application/image_13.png)  

   Note: Description is mandatory to be filled and it doesn't accept **'NEW LINE'.**  
   Write everything in one phrase to describe the detail of the custom field.




