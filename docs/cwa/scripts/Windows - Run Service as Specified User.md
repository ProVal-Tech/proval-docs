---
id: 'cwa-start-service-with-user-account'
title: 'Start Service with User Account'
title_meta: 'Start Service with User Account'
keywords: ['service', 'user', 'account', 'start', 'domain', 'local', 'authentication']
description: 'This document describes a script that starts a specified service using a specific user account, applicable for both domain and local user accounts. It includes user parameters, process details, and output logs for effective service management.'
tags: ['service', 'username', 'password', 'authentication', 'windows']
draft: false
unlisted: false
---
## Summary

This script will start a specified Service with a specific user account. This will work for both Domain and local user accounts.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8156779/images/11377634)

#### User Parameters

| Name        | Example   | Required | Description                                                             |
|-------------|-----------|----------|-------------------------------------------------------------------------|
| username    | pronoc    | True     | The username whose authentication is required to run the service        |
| password    | ********* | True     | The password to authenticate to run the service                          |
| servicename | wuauserv  | True     | The service which is required to run with provided user credential      |

## Process

This script will start a specified Service with a specific user account. This will work for both Domain and local user accounts. Script will also try to restart the service after log on account change and verify the result accordingly.

## Output

- Script log


