---
id: '587dab37-7b57-467f-bcde-b112783f5cf1'
slug: /587dab37-7b57-467f-bcde-b112783f5cf1
title: 'Manual Script Schedule - Status Email'
title_meta: 'Manual Script Schedule - Status Email'
keywords: ['monitor', 'execution', 'alert', 'email', 'status']
description: 'This document provides an overview of a monitor designed to detect manual script execution by the LT User, along with its dependencies, target, and alert template for email notifications.'
tags: ['email']
draft: false
unlisted: false
---

## Summary

This monitor detects manual script execution by the LT User.

It has a couple of restrictions:

- It will not provide reliable data if someone executes the script frequently in intervals of less than 2 or 3 minutes.
- It will also not trigger if the script is scheduled only once on a group; it can only trigger if the script is scheduled on individual machines or multiple machines.

## Dependencies

[Email Creation - Computer - LTRunByUser](/docs/aff3413b-574f-4399-8f4b-85e04d388c5a)

## Target

Global

## Alert Template

`△ Custom - Autofix - Email Send LTRunByUser`

## Emailing

**Subject**

Manual Script Execution Status on %CLIENTNAME%/%COMPUTERNAME%

**Body**

Manual Script Execution Status of %RESULT% on %CLIENTNAME%/%COMPUTERNAME%

Here, %RESULT% contains the script name: "Scriptname" ran on computer "Computername" by user/email "LTUserName/Email address of the LT user" with a result "Script Result" during "When script executed" on %CLIENTNAME%/%COMPUTERNAME%.

**Email Example:**

![Email Example](../../../static/img/Manual-Script-Schedule---Status-Email/image_1.png)


