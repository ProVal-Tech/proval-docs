---
id: 'cwa-disable-sql-spy-for-all-users'
title: 'Disable SQL Spy for All Users'
title_meta: 'Disable SQL Spy for All Users - ConnectWise Automate'
keywords: ['sql', 'spy', 'users', 'disable', 'automate']
description: 'This document outlines a script that disables SQL Spy for all users in a ConnectWise Automate environment. It executes a query against the Automate server to modify user settings, ensuring that the change takes effect upon the next user login.'
tags: ['database', 'configuration', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

The script will disable SQL Spy for all users in the environment

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Disable-SQL-Spy-for-All-Users\image_1.png)

## Process

The script will execute a query against the Automate server to disable SQL Spy for all users in the environment. The change will go into effect next time the user logs in. The script will take whatever the "windows" value is in the users_extend table and remove the binary value of 524288 from it. This is the switch used to display SQL Spy.


