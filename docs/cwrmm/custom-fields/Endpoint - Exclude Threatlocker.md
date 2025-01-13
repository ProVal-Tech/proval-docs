---
id: 'rmm-threatlocker-exclusion'
title: 'Exclude Machine from Threatlocker Deployment'
title_meta: 'Exclude Machine from Threatlocker Deployment'
keywords: ['threatlocker', 'deployment', 'exclude', 'custom', 'field']
description: 'This document outlines how to exclude a machine from Threatlocker Deployment by setting a custom field to "Yes". It includes details on dependencies, field specifications, and a screenshot for reference.'
tags: ['endpoint', 'flag', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

Turning this Custom Field "Yes" will exclude the machine from Threatlocker Deployment.

## Dependencies

[CW RMM - Solution - Threatlocker Deployment](https://proval.itglue.com/DOC-5078775-17730657)

## Details

| Field Name              | Level    | Type | Default Value | Description                                                                                         | Editable |
|-------------------------|----------|------|---------------|-----------------------------------------------------------------------------------------------------|----------|
| Exclude Threatlocker    | Endpoint | Flag | No            | Turning this Custom Field "Yes" will exclude all the machine from Threatlocker Deployment.        | Yes      |

## ScreenShot

![ScreenShot](../../../static/img/Endpoint---Exclude-Threatlocker/image_1.png)



