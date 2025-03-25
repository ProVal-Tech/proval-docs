---
id: 'd96342ec-c42e-424b-85b6-d7009a3163d0'
slug: /d96342ec-c42e-424b-85b6-d7009a3163d0
title: 'Create MySQL User'
title_meta: 'Create MySQL User'
keywords: ['mysql', 'user', 'permissions', 'read-only', 'database']
description: 'This document provides a detailed guide on creating a new MySQL user with Read-only permissions using ConnectWise Automate. It includes user parameters, sample run output, and process details necessary for executing the script effectively.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This script will create a new MySQL user with Read-only permissions.

**Requirement:** CW Automate Version 22 Patch 10 +

## Sample Run

![Sample Run](../../../static/img/Create-MySQL-User/image_1.png)

#### User Parameters

| Name     | Example                  | Required | Description                  |
|----------|--------------------------|----------|------------------------------|
| Username | User1                    | True     | New MySQL username.          |
| Password | 11!v-U6uoVmHJr8tcPd     | True     | New MySQL user password.     |

## Process

This script runs a SQL query and creates a new MySQL user with Full permissions for the `Labtech` database.


