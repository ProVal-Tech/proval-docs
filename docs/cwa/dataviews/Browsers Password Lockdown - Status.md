---
id: '6f3ffa7f-a21e-416d-ba2f-7450a95f3ad7'
slug: /6f3ffa7f-a21e-416d-ba2f-7450a95f3ad7
title: 'Browsers Password Lockdown - Status'
title_meta: 'Browsers Password Lockdown - Status'
keywords: ['lockdown', 'browsers', 'password', 'manager', 'remote', 'monitor', 'status']
description: 'This document provides an overview of the Password Manager Lockdown Status for computers monitored by the Lockdown Browsers Password Manager. It details whether the password manager has been successfully deactivated for installed browsers and identifies any failures in the process.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

The dataview exhibits the `Password Manager Lockdown Status` for the computer obtained from the [Lockdown Browsers Password Manager](<../monitors/Lockdown Browsers Password Manager.md>) remote monitor. Essentially, it indicates whether the remote monitor has effectively deactivated the password manager for the installed browsers. If not, it provides the names of the specific browsers where the disabling process failed.

## Dependencies

**Search:** `Lockdown Browsers Password Manager`  
**Search:** `Lockdown Browsers Autofill`  
**Group:** `△ Lockdown Browsers Autofill`  
**Remote Monitor:** [EPM - Software Configuration - Remote Monitor - Lockdown Browsers Password Manager](<../monitors/Lockdown Browsers Password Manager.md>)

## Columns

| Column                       | Description                                                                                                                   |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Clientid                     | Client ID (Hidden)                                                                                                           |
| Locationid                   | Location ID (Hidden)                                                                                                         |
| Computerid                   | Computer ID (Hidden)                                                                                                         |
| Client                       | Client Name                                                                                                                 |
| Location                     | Location Name                                                                                                               |
| Computer                     | Computer Name                                                                                                               |
| Operating System             | Operating System                                                                                                           |
| Last Contact                 | Last Contact with RMM                                                                                                       |
| Last Logged In User          | Last Logged In User                                                                                                         |
| Password Manager Lockdown Status | Indicates whether the remote monitor has effectively deactivated the password manager for the installed browsers. If not, it provides the names of the specific browsers where the disabling process failed. |


