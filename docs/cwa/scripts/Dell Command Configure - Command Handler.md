---
id: '1f61b913-a45c-41e9-afa4-6cf105cdff86'
title: 'Dell Command Configure Script'
title_meta: 'Dell Command Configure Script for Automation'
keywords: ['dell', 'command', 'configure', 'script', 'automation']
description: 'This document provides an overview of a script designed to execute commands using the Dell Command Configure application. It outlines the installation requirements, sample runs, dependencies, user parameters, and the process involved in utilizing the script effectively.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script executes commands using the Dell Command Configure application. The application must be installed before this script will function properly. This can be accomplished via manual installation or with the ProVal Script - [Dell Command Configure - Installation](<./Dell Command Configure - Installation.md>).

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Dell-Command-Configure---Command-Handler/image_1.png)

The script provides the syntax `CCTK.exe --`. See the example in the screenshot.

For a list of available commands, please review this article from Dell: [Reference List for Updated Names of Attributes and Possible Values for Dell Command Configure](https://www.dell.com/support/article/en-us/sln312074/reference-list-for-updated-names-of-attributes-and-possible-values-for-dell-command-configure?lang=en)

For clear syntax, please review this article from Dell: [Command Line Option Delimiter](https://www.dell.com/support/manuals/en-us/command-configure-v4.2/dcc_cli_4.2/command-line-option-delimiter?guid=guid-a46d5033-22cc-4369-8951-d1b30e51008f)

## Dependencies

[Dell Command Configure - Installation](<./Dell Command Configure - Installation.md>) (Alternatively, the software may be installed manually.)

Please note: This script will ONLY run on Dell machines with Dell Command Configure installed properly.

## Variables

`@Command@` - The command parameters that will be passed to the Dell Command Configure application.

### User Parameters

| Name     | Example                     | Required | Description                                                                                                                                     |
|----------|-----------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| Command  | WakeOnLan=WlanOnly         | True     | The parameter is the "payload" that will be issued to the Dell Command Configure application on the target endpoint. Ideally, this is what will be changed on the endpoint based on the technician's needs. |

## Process

The script will first require a user parameter. If the user parameter is not filled out, the script will not work as intended. The script will then verify that the Dell Command Configure application is installed. If it is not, it will exit with an error. With the application present, the script will issue a command-line command to the Dell application and attempt to update the setting on the target machine.

## Output

Script log messages.

Dell Command Configure may also output information into its own log files if the command issued includes output to the log file.
