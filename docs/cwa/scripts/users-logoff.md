---
id: '35c948fc-300e-437b-8338-69175b6a4afa'
slug: /35c948fc-300e-437b-8338-69175b6a4afa
title: 'Users - Logoff'
title_meta: 'Users - Logoff'
keywords: ['logoff', 'users', 'script', 'automation', 'windows']
description: 'This script allows you to log off a specific user, multiple users, or all users from a Windows machine. It provides flexibility in managing user sessions and can be executed with different parameters to target individual users or the entire user base.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script will log off a user, multiple users, or all users.

## Sample Run

![Sample Run 1](../../../static/img/Users---Logoff/image_1.png)

Setting the User parameter to this will log off the user named 'calve' and the user named 'test'.

![Sample Run 2](../../../static/img/Users---Logoff/image_2.png)

Setting the User parameter to "All" will log off all users.

#### User Parameters

| Name   | Example                       | Required | Description                                          |
|--------|-------------------------------|----------|------------------------------------------------------|
| User   | 'someone', 'someoneelse', 'All' | True     | The target user, multiple users, or all users to log off the machine. |

## Process

1. Determine the scope.
2. Log off the desired user or users.


