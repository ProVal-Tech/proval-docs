---
id: 'cwa-windows-update-report-monitor'
title: 'Windows Update Report Monitor Set'
title_meta: 'Windows Update Report Monitor Set'
keywords: ['monitor', 'windows', 'update', 'report', 'patching']
description: 'This document outlines the setup of a monitor set designed to execute the Windows Update Report script weekly across machines with the Managed Patching Policy, optimizing performance by limiting the execution to 200 machines at a time every 15 minutes.'
tags: ['monitoring', 'windows', 'patching', 'report', 'configuration']
draft: false
unlisted: false
---
## Summary

The purpose of this monitor set is to execute the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script once per week against all the machines with the Managed Patching Policy. It will execute the script against 200 online machines at a time, and will execute this action every 15 minutes. The purpose of this is to reduce load on the script engine in larger environments.

Alert Template: ~Fetch Windows Update Report

## Dependencies

- [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682)
- [CWM - Automate - Solution - Windows Update Report](https://proval.itglue.com/DOC-5078775-10861707)

## Target

Limited to the Windows Machines with Managed Patch Policy via SQL query.



