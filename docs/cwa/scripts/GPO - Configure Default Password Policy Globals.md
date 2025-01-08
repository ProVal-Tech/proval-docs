---
id: 'cwa-modify-default-password-policy'
title: 'Modify Default Password Policy for Domain'
title_meta: 'Modify Default Password Policy for Domain'
keywords: ['password', 'policy', 'domain', 'security', 'configuration']
description: 'This document provides a PowerShell script that modifies the properties of the default password policy for a domain. It includes parameters for lockout duration, threshold, observation window, password complexity, encryption, and age settings. The script aims to enhance security by enforcing stricter password policies and is designed to save time by automating the process.'
tags: ['security', 'configuration', 'windows', 'update']
draft: false
unlisted: false
---
## Summary

The script modifies the properties of the default password policy for a domain. You can modify property values by using the cmdlet parameters and can adjust the value in the Global variable.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](5078775/docs/8181459/images/11386747)

#### Global Parameters

| Name                        | Example       | Required | Description                                                                                     |
|-----------------------------|---------------|----------|-------------------------------------------------------------------------------------------------|
| LockoutDurration            | 00:30:00      | True     | This helps to lock the machine to provided time window after multiple failed attempts.         |
| LockoutThreshold            | 5             | True     | This helps to lock the machine after provided failed attempt count.                            |
| LockoutObservationWindow    | 00:20:00      | True     | This helps to show info after how much time again try to login.                               |
| ComplexityEnabled           | 1             | True     | This shows info about the password complexity of a combination of numbers, characters, and special conditions as per requirement. |
| ReversibleEncryptionEnabled  | 0             | True     | This is required for encryption enabled or not.                                               |
| MinPasswordLength          | 10            | True     | This shows the min password length.                                                            |
| PasswordHistoryCount       | 10            | True     | This shows the last password strength and password set to avoid setting duplicate password again and again. |
| MaxPasswordAge             | 90.00:00:00   | True     | This ensures the password expiration day after a certain threshold set.                        |
| MinPasswordAge             | 01:00:00      | True     | This ensures the minimum password age.                                                          |

## Process

- This script will get the domain name first.
- The script will run the PowerShell to modify the properties of the default password policy for a domain. You can modify property values by adjusting the value in the Global variable.

## Output

- Script log


