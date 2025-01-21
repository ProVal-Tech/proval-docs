---
id: '2ae05c30-5cef-42be-8c8a-c39928d85321'
title: 'Command Test Script in ConnectWise Automate'
title_meta: 'Command Test Script in ConnectWise Automate'
keywords: ['connectwise', 'script', 'command', 'endpoint', 'test']
description: 'This document outlines a function script in ConnectWise Automate designed to test a specified command on an endpoint. If the command is not recognized, the script will fail, ensuring that only valid commands are executed. The document includes a summary, sample run, variable documentation, user parameters, and output details.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

This is a function script in ConnectWise Automate that takes a `@command@` variable set to a desired command, tests that command on the endpoint, and the script will fail if that command is not recognized.

## Sample Run

Function script only.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name  | Description                               |
|-------|-------------------------------------------|
| psout | The output of the PowerShell command.    |

#### User Parameters

| Name    | Example                 | Required | Description                             |
|---------|-------------------------|----------|-----------------------------------------|
| Command | Get-BitLockerVolume     | True     | The command to test on the endpoint.    |

## Output

- `failstatus` will be false if this script fails.
