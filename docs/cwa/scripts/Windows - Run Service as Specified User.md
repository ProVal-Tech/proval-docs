---
id: '566fcde7-b6ad-48d5-9909-dbb9cd4da1be'
title: 'Windows - Run Service as Specified User'
title_meta: 'Windows - Run Service as Specified User'
keywords: ['service', 'user', 'account', 'start', 'domain', 'local', 'authentication']
description: 'This document describes a script that starts a specified service using a specific user account, applicable for both domain and local user accounts. It includes user parameters, process details, and output logs for effective service management.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script will start a specified service with a specific user account. It works for both domain and local user accounts.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Windows---Run-Service-as-Specified-User/image_1.png)

#### User Parameters

| Name        | Example   | Required | Description                                                             |
|-------------|-----------|----------|-------------------------------------------------------------------------|
| username    | pronoc    | True     | The username whose authentication is required to run the service        |
| password    | ********* | True     | The password to authenticate to run the service                          |
| servicename | wuauserv  | True     | The service that is required to run with the provided user credentials   |

## Process

This script will start a specified service with a specific user account. It works for both domain and local user accounts. The script will also attempt to restart the service after the logon account change and verify the result accordingly.

## Output

- Script log



