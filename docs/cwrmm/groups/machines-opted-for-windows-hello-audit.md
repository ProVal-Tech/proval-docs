---
id: '76e7fddd-b77c-4aac-ab3d-95aef75a7b04'
slug: /76e7fddd-b77c-4aac-ab3d-95aef75a7b04
title: 'Machines Opted For Windows Hello Audit'
title_meta: 'Machines Opted For Windows Hello Audit'
keywords: ['windows','hello','status','audit']
description: 'This group includes machines where the Windows Hello audit is enabled.'
tags: ['windows','auditing']
draft: False
unlisted: false
---

## Summary
This group includes machines where the Windows Hello audit is enabled.

## Dependencies

- [Solution - Windows Hello Audit](/docs/1ec129b5-f607-41ab-b451-b54a2078950c)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`  
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Machines Opted For Windows Hello Audit`  
- **Category:** `Auditing`  
- **Description:** `This group includes machines where the Windows Hello audit is enabled.`

![Image1](../../../static/img/docs/76e7fddd-b77c-4aac-ab3d-95aef75a7b04/image1.webp)

## Group Criteria

The group is defined by the following **criteria**

| Criteria Name          | Operator        | Value(s)                                 |
|-----------------------|-----------------|-------------------------------------------|
| Enable Windows Hello Audit    | Equal               | `True` |
| Exclude Windows Hello Audit      | Equal     | `False` |
| Exclude DNSFilter deployment      | Equal     | `False` |
| Available   | Equal    | `True` |
| OS Type  | Equal    | `Windows` |
| Endpoint Type  | Not Equal    | `Laptop` |


## Completed Group

![Image4](../../../static/img/docs/76e7fddd-b77c-4aac-ab3d-95aef75a7b04/image2.webp)
