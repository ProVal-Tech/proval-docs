---
id: 'cwa-active-users-report'
title: 'Active Users Report in Active Directory'
title_meta: 'Active Users Report in Active Directory'
keywords: ['active', 'directory', 'report', 'users', 'logon', 'password', 'expiration', 'status']
description: 'This document provides a comprehensive report on all active users within the last 30 days using the Active Directory plugin. It includes details such as account status, last logon time, and password information, ensuring administrators have valuable insights into user activity and security.'
tags: ['active-directory', 'report', 'security', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

Shows all the active users within the last 30 days using the Active directory plugin.

## Dependencies

- Active Directory Plugin Installed, Enabled and Setup

## Columns

| Column                        | Description                                               |
|-------------------------------|-----------------------------------------------------------|
| Client                        | Client Name                                              |
| Location                      | Location Name                                            |
| Domain Controller             | The Domain controller the AD plugin is syncing to        |
| Account Name                  | End User Account Name                                    |
| Name                          | Friendly Name                                           |
| Email                         | Email of the AD user                                    |
| Domain Admin                  | Yes | No if the user is a Domain Admin                   |
| AccountEnabled                | Enabled | Disabled depending on the User's status         |
| Last Logon                   | The last time the user has logged into the Domain       |
| Days Since Last Logon        | Total number of days since the last logon date          |
| Password Expiration Date      | Shows the date of the next password expiration for the user |
| Password Last Set             | Shows the last time the password was setup for this user |
| Days Since Last Password Change| Total number of days since the last password set date.  |



