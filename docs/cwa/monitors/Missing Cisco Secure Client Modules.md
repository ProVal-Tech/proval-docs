---
id: '2936aa3a-b372-4681-8957-e23d5a2631db'
title: 'Missing Cisco Secure Client Modules'
title_meta: 'Missing Cisco Secure Client Modules'
keywords: ['cisco', 'client', 'installation', 'monitor', 'modules']
description: 'This document outlines the functionality of the internal monitor that executes the Cisco Secure Client script on online machines. It checks for installed modules against selected modules and initiates installation for any missing components on both Windows and MAC systems.'
tags: ['cisco', 'installation', 'windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the **Cisco Secure Client - Package Installation** script hourly on online machines where Cisco Secure Client's EDFs (For Module Installation) are selected, but the selected modules are not installed for Windows and MAC machines. It verifies if the installed modules are fewer than the chosen modules for the machines. If so, it will run the script on the machine to install the pending modules.

> Note: For more information on these EDFs, visit: [SWM - Software Install - Script - Cisco Secure Client - Package Installation](<../scripts/Cisco%20Secure%20Client.md>)

## Dependencies

[SWM - Software Install - Script - Cisco Secure Client - Package Installation](<../scripts/Cisco%20Secure%20Client.md>)

## Target

It is a global monitor targeting both Windows and MAC machines.

## Alert Template

`△ Custom - Execute Script - Cisco Secure Client - Package Installation`



