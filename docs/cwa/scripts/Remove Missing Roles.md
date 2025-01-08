---
id: 'cwa-remove-roles-not-detected'
title: 'Remove Roles Not Detected on Machines'
title_meta: 'Remove Roles Not Detected on Machines - ConnectWise Automate'
keywords: ['roles', 'machines', 'sql', 'database', 'automation']
description: 'This document describes a process for removing roles that are still listed on machines but are no longer detected. The automation saves approximately 5 minutes of manual effort by running a SQL query to delete these outdated roles from the database.'
tags: ['database', 'configuration', 'automation', 'security']
draft: false
unlisted: false
---
## Summary

Removes roles that are still listed on machines, but no longer detected on them.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8092777/images/11262416)

## Process

- The script runs SQL query against the database to delete the roles from the machines that are still listed but no longer detected on them.

