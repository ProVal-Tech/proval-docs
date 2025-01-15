---
id: '2936aa3a-b372-4681-8957-e23d5a2631db'
title: 'Cisco Secure Client - Package Installation Monitor'
title_meta: 'Cisco Secure Client - Package Installation Monitor'
keywords: ['cisco', 'client', 'installation', 'monitor', 'modules']
description: 'This document outlines the functionality of the internal monitor that executes the Cisco Secure Client - Package Installation [Wrapper] script on online machines. It checks for installed modules against selected modules and initiates installation for any missing components on both Windows and MAC systems.'
tags: ['cisco', 'monitor', 'installation', 'windows', 'mac']
draft: false
unlisted: false
---
## Summary

The internal monitor executes the `“Cisco Secure Client - Package Installation [Wrapper]”` script hourly on online machines where Cisco Secure Client's EDFs (For Module Installation) are selected, but selected modules are not installed for Windows and MAC machines. It verifies if the installed modules are less than the chosen modules for the machines. If yes, it will run the wrapper script on the machine to install the pending modules.

Note: For more information on these EDF's, visit [Script - Cisco Secure Client - Package Installation [Windows]](https://proval.itglue.com/DOC-5078775-13366604) and [Script - Cisco Secure Client - Package Installation [Macintosh]](https://proval.itglue.com/DOC-5078775-13393960).

## Dependencies

[Script - Cisco Secure Client - Package Installation [Wrapper]](https://proval.itglue.com/DOC-5078775-15949769)

## Target

It's a Global monitor targeting both Windows and MAC machines.

## Alert Template

`△ Custom - Execute Script - Cisco Secure Client - Package Installation [Wrapper]`






