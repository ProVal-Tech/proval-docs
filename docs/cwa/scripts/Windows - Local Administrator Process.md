---
id: '1346f6e0-a1cc-42fd-85f2-a43785eee53e'
title: 'Create and Set Local Administrator Password'
title_meta: 'Create and Set Local Administrator Password'
keywords: ['local', 'administrator', 'password', 'script', 'client']
description: 'This document outlines a script used to create and set a local Administrator password for a client, detailing the variables, parameters, and process involved. It highlights time savings achieved through automation and provides a sample run for reference.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

Feb 2023 - See Updated Script - [https://proval.itglue.com/5078775/docs/7742920#version=published&documentMode=view](https://proval.itglue.com/5078775/docs/7742920#version=published&documentMode=view)

Used to create and set a local Administrator password for a client.

Time Saved by Automation: 10 minutes

## Sample Run

![Sample Run](../../../static/img/Windows---Local-Administrator-Process/image_1.png)

## Variables

| Variable        | Description                                                                                       |
|------------------|---------------------------------------------------------------------------------------------------|
| passwordID       | It stores the password id from the password table of the password title provided in global parameter. |
| PreceedingInstance| It stores running thread id to ensure whether script running or not.                              |

#### Global Parameters

| Name             | Example                       | Required | Description                                                                                     |
|------------------|-------------------------------|----------|-------------------------------------------------------------------------------------------------|
| PasswordTitle     | Local Administrator Account    | True     | This stores the title name from the password tab whose password required to reset.             |

#### User Parameters

| Name             | Example     | Required | Description                                                       |
|------------------|-------------|----------|-------------------------------------------------------------------|
| NewPassword       | *********   | True     | Required to reset the password of password title account.        |

## Process

The script will start by checking if the password entry already exists for the client and if so, will proceed to set the local Administrator password to the existing password. If the password does not exist, then the script will create a password with the passed "NewPassword" parameter. If a parameter is not passed, the script will error out.

## Output

- Script log












