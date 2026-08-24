---
id: '3dc73d01-df51-40a8-a843-2f5f8d66a848'
slug: /3dc73d01-df51-40a8-a843-2f5f8d66a848
title: 'Deploy BlackPoint SnapAgent'
title_meta: 'Deploy BlackPoint SnapAgent'
keywords: ['deployment','snapagent','blackpoint']
description: 'This group contains machines that are opted for BlackPoint SnapAgent deployment but currently do not have the BlackPoint SnapAgent installed.'
tags: ['windows','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-08-24
---
---

## Summary
This group contains machines that are opted for BlackPoint SnapAgent deployment but currently do not have the BlackPoint SnapAgent installed.

## Dependencies

- [Solution - BlackPoint SnapAgent Deployment](/docs/b99808e9-5148-47f6-9da4-bc4eeb590f2a) 

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Deploy BlackPoint SnapAgent`  
- **Category:** `Custom`  
- **Description:** `This group contains machines that are opted for BlackPoint SnapAgent deployment but currently do not have the BlackPoint SnapAgent installed.`  

![Image](../../../static/img/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848/image1.webp)

## Criteria

The group is defined by the following **criteria blocks**, joined by an **OR**. Each block uses **AND** logic between its conditions.

| Block | Criteria Name            | Operator             | Value(s)   |
|-------|--------------------------|----------------------|------------|
| 1     | BP_Enable_Deployment           | Contains any of         | `All`,`Windows`,`Win Workstations`,`Win Workstations and Macintosh`   |
| 1     | Exclude_BP_Deployment_Site     | Does Not Contain any of | `False`       |
| 1     | Exclude_BP_Deployment_Endpoint | Does Not Contain any of | `False`       |
| 1     | OS Type                        | Contains any of         | `Windows`       |
| 1     | Endpoint Type                  | Not Equal               | `Server`        |
| 1     | Available                      | Equal                   | `True`          |
| 1     | Installed Software Name             | Does Not Contain any of | `snapagent`  |
| 2     | BP_Enable_Deployment           | Contains any of         | `All`,`Windows` |
| 2     | Exclude_BP_Deployment_Site     | Does Not Contain any of | `False`       |
| 2     | Exclude_BP_Deployment_Endpoint | Does Not Contain any of | `False`       |
| 2     | OS Type                        | Contains any of         | `Windows`       |
| 2     | Endpoint Type                  | Equal                   | `Server`        |
| 2     | Available                      | Equal                   | `True`          |
| 2     | Installed Software Name            | Does Not Contain any of | `snapagent`  |
| 3     | BP_Enable_Deployment           | Contains any of         | `All`,`Macintosh`,`Win Workstations and Macintosh`  |
| 3     | Exclude_BP_Deployment_Site     | Does Not Contain any of | `False`       |
| 3     | Exclude_BP_Deployment_Endpoint | Does Not Contain any of | `False`       |
| 3     | OS Type                        | Does Not Contains any of         | `Windows`       |
| 3     | Available                      | Equal                   | `True`          |
| 3     | Service Display Name           | Does Not Contain any of | `snap-agent`  |

- **Block 1:** Targets workstation devices where the primary setting (**BP_Enable_Deployment**) is enabled, provided that the deployment has not been explicitly disabled at the site level (**Exclude_BP_Deployment_Site**) or the individual endpoint level (**Exclude_BP_Deployment_Endpoint**).  
- **Block 2:** Targets server devices where the primary setting (**BP_Enable_Deployment**) is enabled, provided that the deployment has not been explicitly disabled at the site level (**Exclude_BP_Deployment_Site**) or the individual endpoint level (**Exclude_BP_Deployment_Endpointt**).  
- **Block 3:** Targets Mac machines where the primary setting (**BP_Enable_Deployment**) is enabled, provided that the deployment has not been explicitly disabled at the site level (**Exclude_BP_Deployment_Site**) or the individual endpoint level (**Exclude_BP_Deployment_Endpoint**).  

**Logic:**  
A machine matches the group if it meets **ALL** criteria in **Block 1**, **OR** **ALL** criteria in **Block 2**, **OR** **ALL** criteria in **Block 3**.

**Block 1**
![Image](../../../static/img/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848/image2.webp)

**Block 2**
![Image](../../../static/img/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848/image3.webp)

**Block 3**
![Image](../../../static/img/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848/image4.webp)

## Completed Group

![Image](../../../static/img/docs/3dc73d01-df51-40a8-a843-2f5f8d66a848/image5.webp)

## Changelog

### 2026-08-24

- Initial version of the document