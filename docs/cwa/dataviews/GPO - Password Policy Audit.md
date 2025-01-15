---
id: '28ff3938-c093-47c6-8495-498f407740a7'
title: 'Default Password Policy Audit'
title_meta: 'Default Password Policy Audit in Domain'
keywords: ['password', 'policy', 'audit', 'domain', 'security']
description: 'This document provides a detailed overview of the default password policy in a domain, including its key components and dependencies. It outlines the various settings that govern password complexity, length, history, and account lockout procedures, ensuring a comprehensive understanding of security measures in place.'
tags: ['security', 'windows', 'configuration', 'audit']
draft: false
unlisted: false
---
## Summary

This dataview will display information about the default password policy in a domain.

## Dependencies

Script: @GPO - Audit Default Password Policy to Custom Table  
Table: @custom_proval_gp_audit

## Columns

| Column                              | Description                                                                                                     |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| DC Name                             | The name of the Domain Controller where the audit was performed                                               |
| Complexity Enabled                  | Yes|No - Will display if the Password Complexity requirements are enabled or not                                 |
| Min Length                          | The minimum number of characters allowed for passwords in the domain                                          |
| Password History #                  | The number of times a password must be changed before it can be used again                                    |
| Attempts before Account lockout     | The number of failed login attempts for a user account in the domain before the account is locked out          |
| Lockout Duration (min)             | The length of time, in minutes, that the account will remain locked out                                       |
| Min Age (hr)                       | The minimum amount of time that a password must be used before the user can change it                         |
| Max Age (day)                      | The number of days a password may remain unchanged before the user is forced to change it                     |
| Observation Lockout (min)          | The time window for the count of failed login attempts before a user account is locked out (EG: 5 failed log on attempts in a 15 minute window) |
| Interactive Logon Message Enabled   | If the Domain displays any dialog when users login to the domain                                               |
| Turn Off Autoplay                   | If autoplay has been disabled for the domain                                                                    |
| Reverse Encryption Enabled           | Yes|No - Will display if reverse encryption is enabled on the domain                                           |

(Reference documentation: [Password Policy](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/password-policy))







