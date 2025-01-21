---
id: '6427c251-f3e5-422a-9d40-7b6254d7d8ae'
title: 'ShadowControl Subscribe'
title_meta: 'ShadowControl Subscribe'
keywords: ['shadowcontrol', 'client', 'installation', 'subscribe', 'proval']
description: 'This document outlines the process for downloading and installing the ShadowControl client on a target machine. It includes automatic subscription to the ProVal ShadowControl server and ensures the downloaded installer is deleted after completion. Note that this script is specifically designed for ProVal Shadow Control instances.'
tags: ['backup', 'installation', 'security', 'software']
draft: false
unlisted: false
---

## Summary

This document describes how to download and install the ShadowControl client on the target machine. It automatically subscribes the installed client to the **ProVal ShadowControl** server and deletes the downloaded installer upon completion.

**Note:** This script is hardcoded to subscribe to the ProVal Shadow Control server. Please do not use this script if you are attempting to subscribe a machine to a different instance.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/ShadowControl-Subscribe/image_1.png)

## Dependencies

The agent will need the appropriate Storage Craft applications installed so that it can subscribe to the ProVal Shadow Control instance.

## Variables

- `%ShellResult%` - The result from the attempted Shadow Control signup.

## Process

The script will run a command-line argument against the `stccmd` application on the endpoint, which will have the target endpoint subscribe to the ProVal Shadow Control portal.

## Output

Script log messages only.



