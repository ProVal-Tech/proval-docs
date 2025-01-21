---
id: 'b6a7c804-693c-4cf5-a60e-61dcb10ddcae'
title: 'Is Primary Domain Controller'
title_meta: 'Is Primary Domain Controller'
keywords: ['validate', 'primary', 'domain', 'controller', 'machine', 'group']
description: 'This document outlines the process to validate whether a computer is a primary domain controller. It details the dependencies and provides sample values for the custom field used in the ConnectWise RMM platform.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to validate whether a computer is a primary domain controller. The check is performed by the [CW RMM - Task - Validate Primary Domain Controller](<../tasks/Validate Primary Domain Controller.md>) task.

The custom field is then used to create the [CW RMM - Machine Group - Infrastructure Master](<../groups/Infrastructure Master.md>) group.

## Dependencies

- [CW RMM - Machine Group - Domain Controllers](<../groups/Domain Controllers.md>)
- [CW RMM - Task - Validate Primary Domain Controller](<../tasks/Validate Primary Domain Controller.md>)

## Details

| Field Name                   | Type of Field (Machine or Organization) | Description                                           |
|------------------------------|-----------------------------------------|-------------------------------------------------------|
| Is Primary Domain Controller   | Machine                                 | To validate whether the computer is a primary domain controller or not |

## Screenshot

![Screenshot 1](../../../static/img/Is-Primary-Domain-Controller/image_1.png)  
![Screenshot 2](../../../static/img/Is-Primary-Domain-Controller/image_2.png)  
**Name:** Is Primary Domain Controller  
**Description:** To validate whether the computer is a primary domain controller or not.

## Sample Value

![Sample Value](../../../static/img/Is-Primary-Domain-Controller/image_3.png)



