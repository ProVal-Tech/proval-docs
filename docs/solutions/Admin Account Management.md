---
id: '8ee53115-192b-478e-873b-bb1b4c2907e9'
title: 'Managing Local and Domain Admins'
title_meta: 'Managing Local and Domain Admins'
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
| [Windows Local Admin Process](<./Windows Local Admin Process.md>)                               | Solution       | This solution aims to establish a centralized local admin user for each client or computer                 |
| [Windows Local Admin Account Process](<../cwa/monitors/Windows Local Admin Account Process.md>) | Internal Monitor| Detects the machine with missing or outdated credentials.                                                  |
| [Windows - Admin Account - Create/Update](<../cwa/scripts/Windows - Admin Account - CreateUpdate.md>) | Script         | Create/Update the user.                                                                                    |
| △ CUSTOM - Execute Script - Windows - Admin Account - Create/Update                              | Alert Template | Execute the script against the machines detected by the internal monitor.                                  |
| [Windows - Admin Account Password Rotation Notification](<../cwa/scripts/Windows - Admin Account Password Rotation Notification.md>) | Client Script  | This script sets the Ticket Creation or email sent for the password update made by the script 'Windows - Admin Account - Create/Update' |

#### Windows Domain Admin Process

| Content                                                                                           | Type           | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------|
| [Windows Domain Admin Process](<./Windows Domain Admin Process.md>)                             | Solution       | This solution aims to establish a centralized domain admin for each domain.                               |
| [Windows Domain Admin Account Process](<../cwa/monitors/Windows Domain Admin Account Process.md>) | Internal Monitor| Detects the domain controller with missing or outdated credentials.                                        |
| [Windows - Admin Account - Create/Update](<../cwa/scripts/Windows - Admin Account - CreateUpdate.md>) | Script         | Create/Update the user.                                                                                    |
| △ CUSTOM - Execute Script - Windows - Admin Account - Create/Update                              | Alert Template | Execute the script against the machines detected by the internal monitor.                                  |

#### Local Admin Group Cleanup

| Content                                                                                           | Type           | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------|
| [Local Admin Group Cleanup](https://proval.itglue.com/DOC-5078775-16783557)                     | Solution       | The purpose of the solution is to manage the members in the local admin group for the Windows machines.    |
| [Local Admin Group Cleanup - Add/Remove](<../cwa/scripts/Local Admin Group Cleanup - AddRemove.md>) | Script         | Manage the addition and removal of members from the local admin group.                                     |
| [Local Admin Group Cleanup](https://proval.itglue.com/DOC-5078775-16783515)                     | Internal Monitor| Detects Windows computers where the local admin group cleanup process is enabled, but the script has not been executed in the past 7 days. |
| △ Custom - Local Admin Group Cleanup                                                              | Alert Template | Run the script against the computers detected by the internal monitor.                                     |

#### New Local Admin Monitor

| Content                                                                                           | Type   | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|--------|-------------------------------------------------------------------------------------------------------------|
| [New Local Admin Monitor - Create](<../cwa/scripts/New Local Admin Monitor - Create.md>)          | Script | The script generates remote monitors that trigger an alert when a user or group of users are promoted as local administrators on the endpoint machine. |

#### New Domain Admin Monitor

| Content                                                                                           | Type   | Function                                                                                                    |
|---------------------------------------------------------------------------------------------------|--------|-------------------------------------------------------------------------------------------------------------|
| [New Domain Admin Monitor - Create](<../cwa/scripts/New Domain Admin Monitor - Create.md>)        | Script | The script generates remote monitors that trigger an alert when a user or group of users are promoted as domain administrators on a Windows domain controller. |

## Implementation

1. Please carefully review the solution documents for importation before implementation.

