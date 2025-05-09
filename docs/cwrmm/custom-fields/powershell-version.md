---
id: '945d88e0-81a9-4253-8406-63fa7430d45a'
slug: /945d88e0-81a9-4253-8406-63fa7430d45a
title: 'PowerShell Version'
title_meta: 'PowerShell Version'
keywords: ['custom', 'field', 'powershell', 'version', 'information']
description: 'This document outlines the steps to create a custom field in ConnectWise RMM to store Windows PowerShell version information about endpoints. The details are collected using a specific task designed for this purpose.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This custom field is used to store Windows PowerShell version information about the endpoint. These details are gathered by the [CW RMM - PowerShell Version Information](/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b) task.

# Create the Custom Field

![Image 1](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_1.webp)

![Image 2](../../../static/img/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d/image_2.webp)

- **Name:** PowerShell Version
- **Type:** Text Box
- **Default Value:** NULL / LEAVE EMPTY
- **Level:** Endpoint
- **Description:** Will provide the PS version on the machine
- **Editable:** No
