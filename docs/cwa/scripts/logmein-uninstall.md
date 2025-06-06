---
id: 'f7074631-615e-4b66-80ab-10b9c3a0f8fa'
slug: /f7074631-615e-4b66-80ab-10b9c3a0f8fa
title: 'LogMeIn Uninstall'
title_meta: 'LogMeIn Uninstall'
keywords: ['uninstall', 'logmein', 'script', 'automation', 'client']
description: 'This document provides a detailed overview of a script designed to fetch the uninstall string from the database and execute the uninstallation of LogMeIn clients from a target machine. The process is automated to save time and streamline the uninstallation procedure.'
tags: ['database', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script will fetch the uninstall string from the database and attempt to uninstall LogMeIn from the target machine.  
**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/f7074631-615e-4b66-80ab-10b9c3a0f8fa/image_1.webp)

## Process

- Runs SQL query to fetch the uninstall string for all the LogMeIn clients found in the database.
- Sequentially runs shell commands to uninstall all the LogMeIn clients using their respective uninstallation strings.

## Output

- Script log