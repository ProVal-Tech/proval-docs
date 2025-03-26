---
id: '8ee53115-192b-478e-873b-bb1b4c2907e9'
slug: /8ee53115-192b-478e-873b-bb1b4c2907e9
title: 'Admin Account Management'
title_meta: 'Admin Account Management'
keywords: ['local', 'domain', 'admins', 'management', 'windows']
description: 'This document outlines various solutions for managing local and domain administrators effectively, including processes for creating, updating, and monitoring admin accounts on Windows machines.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Purpose

This document outlines multiple solutions that can be used to manage local and domain admins.

## Associated Content

#### Windows Local Admin Process

| Content                                                                                           | Type           | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------|
| [Windows Local Admin Process](/docs/f8c0fb81-16ab-4ba2-85ce-d84792a49f6b)                               | Solution       | This solution aims to establish a centralized local admin user for each client or computer                 |
| [Windows Local Admin Account Process](/docs/3ff4b4be-2bca-4ef2-80d6-8761cebaeb15) | Internal Monitor| Detects the machine with missing or outdated credentials.                                                  |
| [Windows - Admin Account - Create/Update](/docs/a3038ecc-f851-4327-b1ca-a4ca485f6f9c) | Script         | Create/Update the user.                                                                                    |
| △ CUSTOM - Execute Script - Windows - Admin Account - Create/Update                              | Alert Template | Execute the script against the machines detected by the internal monitor.                                  |
| [Windows - Admin Account Password Rotation Notification](/docs/1adeca30-5b12-4218-98c2-ff2806eae27e) | Client Script  | This script sets the Ticket Creation or email sent for the password update made by the script 'Windows - Admin Account - Create/Update' |

#### Windows Domain Admin Process

| Content                                                                                           | Type           | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------|
| [Windows Domain Admin Process](/docs/47f6e5ab-064e-4f15-86e6-226a274b73dc)                             | Solution       | This solution aims to establish a centralized domain admin for each domain.                               |
| [Windows Domain Admin Account Process](/docs/6270f7b1-3cf6-433f-b6e9-b1300b545896) | Internal Monitor| Detects the domain controller with missing or outdated credentials.                                        |
| [Windows - Admin Account - Create/Update](/docs/a3038ecc-f851-4327-b1ca-a4ca485f6f9c) | Script         | Create/Update the user.                                                                                    |
| △ CUSTOM - Execute Script - Windows - Admin Account - Create/Update                              | Alert Template | Execute the script against the machines detected by the internal monitor.                                  |

#### Local Admin Group Cleanup

| Content                                                                                           | Type           | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------|
| [Local Admin Group Cleanup](/docs/f65e32ea-dd71-436e-bb50-5607d23b8adb)                     | Solution       | The purpose of the solution is to manage the members in the local admin group for the Windows machines.    |
| [Local Admin Group Cleanup - Add/Remove](/docs/e228540f-e4f4-4e67-801f-cdff876f955f) | Script         | Manage the addition and removal of members from the local admin group.                                     |
| [Local Admin Group Cleanup](/docs/d49db584-9380-486d-a179-c014352f8be1)                     | Internal Monitor| Detects Windows computers where the local admin group cleanup process is enabled, but the script has not been executed in the past 7 days. |
| △ Custom - Local Admin Group Cleanup                                                              | Alert Template | Run the script against the computers detected by the internal monitor.                                     |

#### New Local Admin Monitor

| Content                                                                                           | Type   | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|--------|-------------------------------------------------------------------------------------------------------------|
| [New Local Admin Monitor - Create](/docs/c3e994ea-ed6d-4ae8-a4dc-0200d87208d5)          | Script | The script generates remote monitors that trigger an alert when a user or group of users are promoted as local administrators on the endpoint machine. |

#### New Domain Admin Monitor

| Content                                                                                           | Type   | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|--------|-------------------------------------------------------------------------------------------------------------|
| [New Domain Admin Monitor - Create](/docs/73adabc6-03cb-4979-9c62-97acc98308da)        | Script | The script generates remote monitors that trigger an alert when a user or group of users are promoted as domain administrators on a Windows domain controller. |

## Implementation

1. Please carefully review the solution documents for importation before implementation.



