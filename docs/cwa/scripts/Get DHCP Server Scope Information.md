---
id: '918c1a66-54b8-4468-9e4b-5b7db918b77c'
title: 'Gather DHCP Information from Target Server'
title_meta: 'Gather DHCP Information from Target Server'
keywords: ['dhcp', 'server', 'database', 'report', 'information']
description: 'This document outlines a script that gathers DHCP information from a specified target server and stores it in a database for reporting and data view purposes. The automation process is designed to save time and streamline data management.'
tags: ['database', 'report', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script gathers DHCP information from a target server and saves it to the database for use in a data view or report.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Get-DHCP-Server-Scope-Information/image_1.png)

## Process

- Runs PowerShell command to gather DHCP information from a target server
- Creates the [plugin_proval_dhcp_statistics](https://proval.itglue.com/DOC-5078775-8038845) table if it does not exist.

## Output

- Table plugin_proval_dhcp_statistics







