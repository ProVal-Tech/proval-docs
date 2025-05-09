---
id: '918c1a66-54b8-4468-9e4b-5b7db918b77c'
slug: /918c1a66-54b8-4468-9e4b-5b7db918b77c
title: 'Get DHCP Server Scope Information'
title_meta: 'Get DHCP Server Scope Information'
keywords: ['dhcp', 'server', 'database', 'report', 'information']
description: 'This document outlines a script that gathers DHCP information from a specified target server and stores it in a database for reporting and data view purposes. The automation process is designed to save time and streamline data management.'
tags: ['database', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script gathers DHCP information from a target server and saves it to the database for use in a data view or report.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/918c1a66-54b8-4468-9e4b-5b7db918b77c/image_1.webp)

## Process

- Runs a PowerShell command to gather DHCP information from a target server.
- Creates the [plugin_proval_dhcp_statistics](/docs/489fe175-9ac6-420c-be2e-e5faceb956fd) table if it does not exist.

## Output

- Table: `plugin_proval_dhcp_statistics`