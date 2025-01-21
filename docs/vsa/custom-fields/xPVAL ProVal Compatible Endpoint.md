---
id: '2606c04a-819a-476f-b91d-c45a92613212'
title: 'Custom Field for Compatibility Status'
title_meta: 'Custom Field for Compatibility Status'
keywords: ['custom', 'field', 'compatibility', 'endpoint', 'status']
description: 'This document outlines the creation of a custom field that indicates whether an endpoint is compatible or provides reasons for incompatibility, including various conditions such as outdated operating systems or PowerShell versions.'
tags: ['macos', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Custom field containing either 'Compatible' or the reason for incompatibility.

## Dependencies

All content listed in [EPM - Data Collection - Solution - VSA Proval Script Compliancy](<../../solutions/VSA Proval Script Compliancy.md>).

## Details

| Field Name                               | Type of Field (Machine or Organization) | Description / Syntax:                                                                                                   |
|------------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| xPVAL ProVal Compatible Endpoint         | Machine                                 | 'Compatible' OR 'Windows OS Out of Date.' OR 'PowerShell Version Out of Date.' OR 'MacOS Out of Date.' OR 'Unable to get Data from the endpoint'  |
