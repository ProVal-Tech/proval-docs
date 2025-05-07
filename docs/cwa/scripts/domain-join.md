---
id: '3c802520-f292-46e2-bd0e-0dbca86ed0ed'
slug: /3c802520-f292-46e2-bd0e-0dbca86ed0ed
title: 'Domain - Join'
title_meta: 'Domain - Join'
keywords: ['domain', 'machine', 'join', 'ou', 'restart', 'client', 'location', 'sql', 'credentials']
description: 'This document provides a detailed overview of a script that automates the process of joining a target machine to a domain. It includes user parameters, process explanation, and expected outputs, highlighting the time saved by automation.'
tags: ['networking', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script joins the target machine to a domain.  
**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/3c802520-f292-46e2-bd0e-0dbca86ed0ed/image_1.webp)

#### User Parameters

| Name              | Example     | Required | Description                                                                                                                                         |
|-------------------|-------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| OUPath            | OU=servers  | False    | The distinguished name of the OU to place the computer into. If left blank, the default OU for computers will be used.                           |
| RestartAfterJoin  | True        | False    | Set to True to reboot the machine automatically after successfully joining the domain. Any other input (including no input) will not automatically reboot the machine. |

## Process

This script joins the target machine to a domain based on its current client and location affiliation. It does this by retrieving a comma-separated list of domains from the client via SQL and the local admin credentials from the target computer's location, then executes the script utilizing the variables.

## Output

- Script log
