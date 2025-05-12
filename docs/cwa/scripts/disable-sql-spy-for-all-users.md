---
id: '112e8169-fca1-4295-bbb4-94ea6e190a4e'
slug: /112e8169-fca1-4295-bbb4-94ea6e190a4e
title: 'Disable SQL Spy for All Users'
title_meta: 'Disable SQL Spy for All Users'
keywords: ['sql', 'spy', 'users', 'disable', 'automate']
description: 'This document outlines a script that disables SQL Spy for all users in a ConnectWise Automate environment. It executes a query against the Automate server to modify user settings, ensuring that the change takes effect upon the next user login.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The script will disable SQL Spy for all users in the environment.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/112e8169-fca1-4295-bbb4-94ea6e190a4e/image_1.webp)

## Process

The script will execute a query against the Automate server to disable SQL Spy for all users in the environment. The change will take effect the next time the user logs in. The script will take the current value of the "windows" field in the `users_extend` table and remove the binary value of `524288` from it. This binary value is the switch used to display SQL Spy.