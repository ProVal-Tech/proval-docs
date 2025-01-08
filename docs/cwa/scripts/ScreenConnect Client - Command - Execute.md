---
id: 'cwa-execute-command-via-control'
title: 'Execute Command via Control'
title_meta: 'Execute Command via Control'
keywords: ['command', 'automation', 'control', 'rmm', 'script']
description: 'This document outlines a script that executes a command through the default command-line parser on the target agent via Control, detailing user parameters, system properties, and expected output.'
tags: ['configuration', 'script', 'rmm', 'networking', 'windows']
draft: false
unlisted: false
---
## Summary

This script will execute a command via the default command-line parser on the target agent through Control.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8141008/images/19084642)

## Dependencies

[CW RMM+ Plugin Configuration](https://proval.itglue.com/5078775/docs/9770217)

#### User Parameters

| Name     | Example     | Required | Description                                             |
|----------|-------------|----------|---------------------------------------------------------|
| command  | net user    | False    | This is the command that will run through Control.     |

#### System Properties

| Name                  | Example                           | Required | Description                                                                                                      |
|-----------------------|-----------------------------------|----------|------------------------------------------------------------------------------------------------------------------|
| RMMPlus_AccessKey     | dd22rtbm!sde8ye                  | True     | This is the key setup in the CW Control RMM+ Plugin so Automate can reach out to gain access to the API.       |
| RMMPlus_Headers       | origin: [yours.control.com](http://yours.control.com) | True     | This is the URL (without http/https) for the CW Control server. This value needs to match the value in the RMM+ Plugin configuration in CW Control. |
| RMMPlus_Timeout       | 1000                              | True     | The default timeout for commands runs via RMM+ through Automate. 1000 is the default.                          |

## Output

- Script log


