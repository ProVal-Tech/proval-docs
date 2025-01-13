---
id: 'vsa-custom-field-compatibility'
title: 'Custom Field for Compatibility Status'
title_meta: 'Custom Field for Compatibility Status'
keywords: ['custom', 'field', 'compatibility', 'endpoint', 'status']
description: 'This document outlines the creation of a custom field that indicates whether an endpoint is compatible or provides reasons for incompatibility, including various conditions such as outdated operating systems or PowerShell versions.'
tags: ['configuration', 'windows', 'macos', 'software', 'update']
draft: false
unlisted: false
---
## Summary

Custom Field containing either 'Compatible' or the reason for incompatibility

## Dependencies

All content listed in [EPM - Data Collection - Solution - VSA Proval Script Compliancy](https://proval.itglue.com/DOC-5078775-11409315)

## Details

| Field Name                               | Type of Field (Machine or Organization) | Description / Syntax:                                                                                                   |
|------------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| xPVAL ProVal Compatible Endpoint         | Machine                                 | 'Compatible' OR  <br>'Windows OS Out of Date.' OR <br>'Powershell Version Out of Date.' OR <br>'MacOS Out of Date.' OR <br>'Unable to get Data from the endpoint' <br> |


