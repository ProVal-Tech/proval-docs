---
id: '25f75989-92a9-49f9-b99b-a241b9f7d6ef'
slug: /25f75989-92a9-49f9-b99b-a241b9f7d6ef
title: 'BitLocker Initialize C Volume'
title_meta: 'BitLocker Initialize C Volume'
keywords: ['bitlocker', 'custom', 'fields', 'encryption', 'monitoring']
description: 'This document provides detailed information about the custom fields associated with the Bitlocker Initialize Volume solution, including their types, levels, default values, and descriptions.'
tags: ['encryption']
draft: false
unlisted: false
---

## Summary

This document contains the custom field details linked to the Bitlocker Initialize Volume solution.

## Dependencies

## Details

| Name                        | Type | Level    | Default Value | Editable | Description                                                                                                                                                    |
|-----------------------------|------|----------|---------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bitlocker Exclude Monitoring | Flag | Endpoint | No            | Yes      | This custom field provides the option to exclude the endpoint from the Bitlocker Initialize Volume solution.                                                  |
| Bitlocker Monitoring         | Flag | Company  | No            | Yes      | This custom field sets the Bitlocker initialization of the system volume of the agent with the encryption method 'AES256'.                                   |
| Bitlocker XTSAES 256        | Flag | Company  | No            | Yes      | This custom field requires the 'Bitlocker Monitoring' company custom field to be checked first. If this is also checked, then the BitLocker setting will be applied to the system volume with the encryption method 'XtsAes256'. |
| ACP BitLocker Init Result    | Text | Endpoint |               | No       | This custom field stores the output of the Bitlocker script. It records 'Failure' when the script generates an error log file or fails to generate a log file; otherwise, it records 'Success'. |