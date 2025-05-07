---
id: '6dc3dd3b-a90b-4841-9923-f458ee8fc65c'
slug: /6dc3dd3b-a90b-4841-9923-f458ee8fc65c
title: 'Active Directory - AD Active Users (30 days)'
title_meta: 'Active Directory - AD Active Users (30 days)'
keywords: ['active', 'directory', 'report', 'users', 'logon', 'password', 'expiration', 'status']
description: 'This document provides a comprehensive report on all active users within the last 30 days using the Active Directory plugin. It includes details such as account status, last logon time, and password information, ensuring administrators have valuable insights into user activity and security.'
tags: ['active-directory', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document shows all the active users within the last 30 days using the Active Directory plugin.

## Dependencies

- Active Directory Plugin installed, enabled, and set up.

## Columns

| Column                        | Description                                                |
|-------------------------------|------------------------------------------------------------|
| Client                        | Client name                                               |
| Location                      | Location name                                             |
| Domain Controller             | The domain controller the AD plugin is syncing to         |
| Account Name                  | End user account name                                     |
| Name                          | Friendly name                                            |
| Email                         | Email of the AD user                                     |
| Domain Admin                  | Yes / No if the user is a domain admin                   |
| Account Enabled               | Enabled / Disabled depending on the user's status         |
| Last Logon                   | The last time the user logged into the domain             |
| Days Since Last Logon        | Total number of days since the last logon date            |
| Password Expiration Date      | Shows the date of the next password expiration for the user|
| Password Last Set             | Shows the last time the password was set for this user    |
| Days Since Last Password Change| Total number of days since the last password set date.    |

