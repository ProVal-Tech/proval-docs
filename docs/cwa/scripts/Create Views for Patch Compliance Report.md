---
id: '7174f88a-38fc-4e5a-83cc-1f48a6c29526'
title: 'Create Views for Patch Compliance Report'
title_meta: 'Create Views for Patch Compliance Report'
keywords: ['patch', 'compliance', 'reporting', 'database', 'views']
description: 'This document outlines the setup process for the Patch Compliance Reporting Solution, detailing the creation of necessary database views for effective patch compliance reporting. It includes dependencies, a sample run, and information on the one-time use of the script.'
tags: ['database', 'installation', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

This document creates all the necessary items in the database to ensure the [Patch Compliance Reporting Solution](https://proval.itglue.com/5078775/docs/17889366) functions correctly. This script will create the following items:

1. View: `plugin_proval_clientpatchstatsserver`
2. View: `plugin_proval_clientpatchstatsworkstation`
3. View: `plugin_proval_computerpatchcompliance`

## Sample Run

![Sample Run](../../../static/img/Create-Views-for-Patch-Compliance-Report/image_1.png)

## Dependencies

There are two prerequisites that need to be installed for this script to function correctly:

1. The Report Center Plugin must be installed and configured.

Other items depend on this script being run to function, which are listed below:

1. Report - Patch Compliance - CU Audit - All Machines
2. Report - Patch Compliance - CU Audit - Servers
3. Report - Patch Compliance - CU Audit - Workstations

## Output

This is a one-time use script, used to install/create three views. After running it once, this script can be removed from the environment.



