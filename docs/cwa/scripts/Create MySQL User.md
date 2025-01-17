---
id: 'd96342ec-c42e-424b-85b6-d7009a3163d0'
title: 'Create New MYSQL User with Read-only Permissions'
title_meta: 'Create New MYSQL User with Read-only Permissions'
keywords: ['mysql', 'user', 'permissions', 'read-only', 'database']
description: 'This document provides a detailed guide on creating a new MYSQL user with Read-only permissions using ConnectWise Automate. It includes user parameters, sample run output, and process details necessary for executing the script effectively.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This script will create a new MYSQL user with Read-only permissions.

Requirement: CW Automate Version 22 Patch 10 +

## Sample Run

![Sample Run](../../../static/img/Create-MySQL-User/image_1.png)

#### User Parameters

| Name     | Example                  | Required | Description                  |
|----------|--------------------------|----------|------------------------------|
| Username | User1                    | True     | New MYSQL username.          |
| Password | 11!v-U6uoVmHJr8tcPd     | True     | New MYSQL user password.     |

## Process

This script runs a SQL query and creates a new MYSQL user with Full permissions for `Labtech` database.











