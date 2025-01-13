---
id: 'cwa-shadowcontrol-client-installation'
title: 'ShadowControl Client Installation'
title_meta: 'ShadowControl Client Installation'
keywords: ['shadowcontrol', 'client', 'installation', 'subscribe', 'proval']
description: 'This document outlines the process for downloading and installing the ShadowControl client on a target machine. It includes automatic subscription to the ProVal ShadowControl server and ensures the downloaded installer is deleted after completion. Note that this script is specifically designed for ProVal Shadow Control instances.'
tags: ['installation', 'software', 'backup', 'security']
draft: false
unlisted: false
---
## Summary

Downloads and installs the ShadowControl client to the target machine. Automatically subscribes the installed client to the **ProVal ShadowControl** server. Deletes the downloaded installer upon completion.

Note: this script is hardcoded to subscribe to the ProVal Shadow Control server. Please do not use this script if you are attempting to subscribe a machine to a different instance.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/ShadowControl-Subscribe/image_1.png)

## Dependencies

The agent will need the appropriate Storage Craft applications installed so the agent can subscribe to the ProVal Shadow Control instance.

## Variables

`%ShellResult%` - The result from the attempted Shadow Control signup

## Process

The script will run a command-line argument against the stccmd application on the endpoint that will have the target endpoint subscribe to the ProVal Shadow Control portal.

## Output

Script log messages only



