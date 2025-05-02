---
id: 'c893b839-b951-4b0c-b1d0-879361818839'
slug: /c893b839-b951-4b0c-b1d0-879361818839
title: 'Remove Application Result'
title_meta: 'Remove Application Result'
keywords: ['customfield', 'application', 'result', 'status']
description: 'This document provides a detailed overview of the custom field used in the "Remove Application" script to track the success or failure status of application removal. It includes steps for creating the custom field and its specific attributes.'
tags: ['software']
draft: false
unlisted: false
---

## Summary

The custom field described below is used in the "Remove Application" script to gather the success or failure status.

## Dependencies

## Details

| Name                        | Level    | Type  | Default | Editable | Description                                                                                   |
|-----------------------------|----------|-------|---------|----------|-----------------------------------------------------------------------------------------------|
| Remove Application Result    | Endpoint | Text  |         | No       | It stores either 'Success' or 'Failure'.<br/>**Success**: It means the application was removed successfully.<br/>**Failure**: It means the application failed to remove. |

## Steps to Create Custom Fields

1. Go to **Settings > Custom Fields**  
   ![Custom Fields](../../../static/img/Remove-Application/image_9.png)

2. Click the **Add** option  
   ![Add Option](../../../static/img/Remove-Application/image_10.png)

3. Create Custom Field  
   Provide **Name**: Remove Application Result  
   Select **Level**: Endpoint  
   ![Create Custom Field](../../../static/img/Remove-Application/image_11.png)  

   Then check the **Type** option:  
   **Type**: Text Box  
   ![Text Box](../../../static/img/Remove-Application/image_12.png)  

   Then provide **Default Value** and **Description**:  
   **Default**:  
   **Description**: This stores the Success and Failure results for applications that were removed and those that failed to remove, respectively.  
   **Editable**: No  
   ![Default Value and Description](../../../static/img/Remove-Application/image_13.png)  

   **Note**: The description is mandatory to fill out and does not accept **'NEW LINE'**. Write everything in one phrase to describe the details of the custom field.


