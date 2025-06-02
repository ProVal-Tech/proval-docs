---
id: 'a5c66276-edef-44b8-82a0-09d1dd49a531'
slug: /a5c66276-edef-44b8-82a0-09d1dd49a531
title: 'Secure Boot Check'
title_meta: 'Secure Boot Check'
keywords: ['secure', 'secure-boot', 'datto']
description: 'This Component checks if secure boot is enabled or not.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Overview

This Component checks if secure boot is enabled or not.

## Implementation

Import the [attached component](/Attachments/secure-boot-check.cpt) into Datto RMM.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| usrUDF | String | 0 | Enter the UDF ID to store the Secure Boot Check Status |

## Output

- stdOut  
- stdError  

## Attachments

[Secure Boot Check](../../../static/attachments/secure-boot-check.cpt)
