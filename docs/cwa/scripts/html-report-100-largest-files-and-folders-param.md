---
id: '06840ba0-a4ed-402c-a759-dbb25efa0182'
slug: /06840ba0-a4ed-402c-a759-dbb25efa0182
title: 'HTML Report - 100 Largest Files and Folders Param'
title_meta: 'HTML Report - 100 Largest Files and Folders Param'
keywords: ['report', 'files', 'folders', 'email', 'html', 'disk', 'storage']
description: 'This document outlines a script that generates an HTML report of the top 100 files and folders on a specified drive. If no email address is provided, it automatically sends the report to the user running the script. The report includes details such as the drive letter and output path for the generated report.'
tags: ['disk', 'email', 'report', 'storage', 'windows']
draft: false
unlisted: false
---

## Summary

The script sends an HTML report of the top 100 files and folders to the user executing the script if the email address(es) is not filled in the user parameter `@Email@`.

## Sample Run

![Sample Run](../../../static/img/docs/06840ba0-a4ed-402c-a759-dbb25efa0182/image_1.webp)

## Variables

| Name          | Description                                   |
|---------------|-----------------------------------------------|
| Email         | Email address to send the report to          |
| Drive_Letter  | Drive to generate the report for              |

#### Global Parameters

| Name        | Example                                | Required | Description                                     |
|-------------|----------------------------------------|----------|-------------------------------------------------|
| OutputPath  | C:/Temp/DiskSpaceConsumptionReport     | True     | Path to store the HTML report locally            |

#### User Parameters

| Name        | Example                          | Required | Description                                                                                      |
|-------------|----------------------------------|----------|--------------------------------------------------------------------------------------------------|
| Email       | [someone@somewhere.com](mailto:someone@somewhere.com) | False    | If the email address is not provided, then the script will by default send the report to the user running the script. |
| Drive_Letter| C                                | False    | If the drive letter is not specified, then the script will by default generate the report for the C Drive. |

## Output

- Email

## Sample Email

![Sample Email](../../../static/img/docs/06840ba0-a4ed-402c-a759-dbb25efa0182/image_2.webp)

## Sample Report

![Sample Report](../../../static/img/docs/06840ba0-a4ed-402c-a759-dbb25efa0182/image_3.webp)