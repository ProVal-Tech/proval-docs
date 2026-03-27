---
id: 'b6a7c804-693c-4cf5-a60e-61dcb10ddcae'
slug: /b6a7c804-693c-4cf5-a60e-61dcb10ddcae
title: 'Is Primary Domain Controller'
title_meta: 'Is Primary Domain Controller'
keywords: ['validate', 'primary', 'domain', 'controller', 'machine', 'group']
description: 'This document outlines the process to validate whether a computer is a primary domain controller. It details the dependencies and provides sample values for the custom field used in the ConnectWise RMM platform.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This document describes how to validate whether a computer is a primary domain controller. The check is performed by the [Task - Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168) task.

The custom field is then used to create the [Machine Group - Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) group.

## Dependencies

- [Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
- [Task - Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168)
- [Solution - New Domain Admins](/docs/35a03717-5ade-46fb-b396-10a277043788)

## Details

| Field Name                   | Type of Field (Machine or Organization) | Description                                           |
|------------------------------|-----------------------------------------|-------------------------------------------------------|
| Is Primary Domain Controller   | Machine                                 | To validate whether the computer is a primary domain controller or not |

## Screenshot

![Screenshot 1](../../../static/img/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae/image_1.webp)  
![Screenshot 2](../../../static/img/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae/image_2.webp)  
**Name:** Is Primary Domain Controller  
**Description:** To validate whether the computer is a primary domain controller or not.

## Sample Value

![Sample Value](../../../static/img/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae/image_3.webp)

## Changelog

### 2025-04-10

- Initial version of the document
