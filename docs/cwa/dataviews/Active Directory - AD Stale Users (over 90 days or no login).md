---
id: 'f29999e0-121c-4037-92f5-1cce798daa2e'
slug: /f29999e0-121c-4037-92f5-1cce798daa2e
title: 'Active Directory - AD Stale Users (over 90 days or no login)'
title_meta: 'Active Directory - AD Stale Users (over 90 days or no login)'
keywords: ['active-directory', 'users', 'report', 'login', 'expiration']
description: 'This document provides a detailed overview of a dataview that displays stale users in Active Directory, defined as those who have not logged in for over 90 days. It includes information on dependencies, columns displayed, and their descriptions.'
tags: ['active-directory', 'report', 'security']
draft: false
unlisted: false
---

## Summary

This dataview displays all the stale users in the domain who have not logged in for over 90 days.

## Dependencies

- The AD Plugin needs to be installed and configured.

## Columns

| Column                           | Description                                                                                                                                                                                                 |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client                           | Displays the name of the client associated with the user account                                                                                                                                          |
| Location                         | Displays the name of the location associated with the user account                                                                                                                                       |
| Domain Controller                | Shows the name of the domain controller where the user account was detected                                                                                                                              |
| Account Name                     | The name of the user account detected in Active Directory                                                                                                                                                 |
| Name                             | If the account name is associated with a name, it will be shown here                                                                                                                                     |
| Email                            | The email address associated with the user account                                                                                                                                                       |
| Domain Admin                     | Indicates if the user account has domain admin access to the environment                                                                                                                                 |
| Account Enabled                  | Shows whether the account is enabled or disabled in Active Directory                                                                                                                                     |
| Last Logon                       | Displays the last time Active Directory detected that the user account logged in. Unknown values may indicate that the user account has never logged in                                                      |
| Days Since Last Logon            | Calculates the days since the last logon date. This is mainly used to filter the data more easily and can be hidden if it doesn't provide value                                                           |
| Password Expiration Date         | This column shows the day the password is set to expire for a user account. It will also display "No Expiration" if the account does not have a password that expires                                   |
| Password Last Set                | Displays the date when the password was set for the user account                                                                                                                                         |
| Days Since Last Password Change   | Calculates the days since the password was last changed. This is mainly used to filter the data more easily and can be hidden if it doesn't provide value                                                |
| Domain                           | Shows the domain set up on the domain controller                                                                                                                                                          |
| Password Expires                 | Similar to the Password Expiration Date column; however, it does not list the date. It simply indicates whether or not the password expires without providing a date                                      |
| Account Expiration               | Indicates whether the account is set to expire in Active Directory                                                                                                                                      |



