---
id: 'cwa-uninstall-logmein'
title: 'Uninstall LogMeIn from Target Machine'
title_meta: 'Uninstall LogMeIn from Target Machine - Step-by-Step Guide'
keywords: ['uninstall', 'logmein', 'script', 'automation', 'client']
description: 'This document provides a detailed overview of a script designed to fetch the uninstall string from the database and execute the uninstallation of LogMeIn clients from a target machine. The process is automated to save time and streamline the uninstallation procedure.'
tags: ['database', 'uninstallation', 'software', 'automation']
draft: false
unlisted: false
---
## Summary

This script will fetch the uninstall string from the DB and attempt to uninstall LogMeIn from the target machine.  
Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/LogMeIn-Uninstall/image_1.png)

## Process

- Runs SQL query to fetch uninstall string for all the LogMeIn clients found in the database.
- Sequentially runs shell command to uninstall all the LogMeIn clients using their respective uninstallation string.

## Output

- Script log



