---
id: 'cwa-user-profile-audit'
title: 'User Profile Audit Information'
title_meta: 'User Profile Audit Information for Computer Accounts'
keywords: ['user', 'profile', 'audit', 'computer', 'accounts']
description: 'This document provides detailed information about user profiles on computers, including data storage, dependencies, and the structure of the custom_proval_computer_accounts table. It is designed to assist with the management and auditing of user profiles within an organization.'
tags: ['user', 'profile', 'database', 'security', 'report']
draft: false
unlisted: false
---
## Purpose

Stores information about existing user profiles on computers. Data filled by @User Management - Profile Audit

## Dependencies

@User Management - Profile Audit (Script)

## Table

#### custom_proval_computer_accounts

| Column       | Type     | Explanation                                         |
|--------------|----------|-----------------------------------------------------|
| computerid   | INT      | The ComputerID of the machine with this user profile. |
| username     | VARCHAR  | The username for the profile.                       |
| localuser    | TINYINT  | Determines if the user is a local user or not.     |
| localadmin   | TINYINT  | Determines if the user is a local admin or not.    |
| password     | TINYINT  | Determines if the user has a password set.         |
| profilesize  | INT      | The size in Megabytes of the target profile.       |
| usersid      | VARCHAR  | The SID of the target profile.                      |
| LastLogon    | DATETIME | The last time the profile was logged into.         |
| TimeStamp    | DATETIME | The last time this profile information was gathered.|
| UserProfile   | VARCHAR  | The path to the user folder for the target profile. |



