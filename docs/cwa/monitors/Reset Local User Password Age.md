---
id: '68a9870d-25d1-4a65-a917-e48bd941a782'
title: 'Reset Local User Password Age Monitor'
title_meta: 'Reset Local User Password Age Monitor'
keywords: ['monitor', 'password', 'age', 'local', 'user', 'expire', 'windows', 'policy']
description: 'This document outlines a remote monitor designed to check the login password age of local users on Windows machines. If the password age is set to unlimited, the monitor will change it to expire and adjust the default user policy password age to 90 days. It provides output on users whose password age is set to Never Expire and details any failures in changing the password age.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

This remote monitor checks the Local user's login password age to see if the age is set to unlimited, and if so it will change the user password from never Expire to expire and will also change the Default user policy password age to 90 days. It outputs the users whose password age is set to Never Expire and the monitor fails to change the password age.

## Details

**Suggested "Limit to"**: Windows Computers excluding Infrastructure Master  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator    | Interval | Result |
|--------------|----------------|------------|---------------|----------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Regex Match    | 86400    | ![Result Image](../../../static/img/Reset-Local-User-Password-Age/image_1.png) |

## Target

Windows Machines

## Ticketing

**Subject:** `Failed to Reset Local Users Password Age on %Computername% at %Clientname%`  

**Success Body**: `No users found with Password Age set to Not Expire.`  

**Failure Body:** `Failed to Reset Local Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:%RESULT%`  

## How to Import

[Import - Remote Monitor - Reset Local User Password Age](<./Import - Remote Monitor - Reset Local User Password Age.md>)












