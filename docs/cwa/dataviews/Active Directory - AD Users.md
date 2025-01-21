---
id: 'be838d2c-2633-4df6-94b0-0dc5d4aef7dd'
title: 'Active Directory User Report'
title_meta: 'Active Directory User Report'
keywords: ['active-directory', 'user', 'report', 'account', 'email', 'security']
description: 'This document provides a comprehensive overview of a dataview that displays all users associated with a domain, including their general information, account status, and security details. It outlines the columns available in the report, such as client, location, account name, email, and password expiration details, along with their significance.'
tags: ['active-directory', 'email', 'report', 'security']
draft: false
unlisted: false
---

## Summary

This dataview displays all users associated with a domain and general information about all the users.

## Dependencies

- AD Plugin

## Columns

| Column                            | Description                                                                                                                                           |
|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client                            | Displays the name of the client associated with the user account                                                                                     |
| Location                          | Displays the name of the location associated with the user account                                                                                    |
| Domain Controller                 | Shows the name of the domain controller where the user account was detected                                                                          |
| Account Name                      | The name of the user account detected in Active Directory                                                                                            |
| Name                              | If the account name is a name associated with the account, it will show here                                                                         |
| Email                             | The email address associated with the user account                                                                                                   |
| Domain Admin                      | Indicates if the user account has domain admin access to the end environment                                                                         |
| Account Enabled                   | Indicates whether the account is enabled or disabled in Active Directory                                                                             |
| Last Logon                        | Shows the last time Active Directory detected that the user account logged in. Unknown values may indicate that the user account has never logged in |
| Days since Last Logon             | Calculates the days since the last logon date. This is mainly used to filter the data more easily and can be hidden if it doesn't provide value      |
| Password Expiration Date          | This column shows the day the password is set to expire for a user account. It will also display "No Expiration" if the account does not have a password that expires |
| Password Last Set                 | Shows the date when the password was set for the user account                                                                                       |
| Days Since Last Password Change    | Calculates the days since the password was last changed. This is mainly used to filter the data more easily and can be hidden if it doesn't provide value |
| Domain                            | Displays the domain set up on the domain controller                                                                                                   |
| Distinguished Name                | Shows the distinguished name                                                                                                                          |
| Password Expires                  | Similar to the Password Expiration Date column; however, it doesn't list the date. It just displays whether or not the password expires without a date |
| Account Expiration                | Indicates whether the account is set to expire in Active Directory                                                                                   |

