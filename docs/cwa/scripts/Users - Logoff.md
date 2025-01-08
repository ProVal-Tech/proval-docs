---
id: 'cwa-logoff-users'
title: 'Log Off User Script'
title_meta: 'Log Off User Script'
keywords: ['logoff', 'users', 'script', 'automation', 'windows']
description: 'This script allows you to log off a specific user, multiple users, or all users from a Windows machine. It provides flexibility in managing user sessions and can be executed with different parameters to target individual users or the entire user base.'
tags: ['windows', 'user', 'session', 'management']
draft: false
unlisted: false
---
## Summary

This script will log off a user, users, or all users.

## Sample Run

![Sample Run 1](5078775/docs/11275682/images/16137459)

Setting the User parameter to this will log off the user named 'calve' and the user named 'test'.

![Sample Run 2](5078775/docs/11275682/images/16137489)

Setting the user parameter to All will log off all users.

#### User Parameters

| Name   | Example                       | Required | Description                                          |
|--------|-------------------------------|----------|------------------------------------------------------|
| User   | 'someone', 'someoneelse' <br> All | True     | The target user, users, or all users to log off the machine. |

## Process

Determine the scope  
Log off the desired user or users.


