---
id: 'cwa-active-directory-reporting-solution-setup'
title: 'Active Directory Reporting Solution Setup'
title_meta: 'Active Directory Reporting Solution Setup'
keywords: ['active', 'directory', 'reporting', 'solution', 'setup', 'database']
description: 'This document details the process of setting up the Active Directory Reporting Solution by creating necessary database items including tables and views, along with scheduling an essential script for compliance and security checks.'
tags: ['active-directory', 'database', 'report', 'setup', 'security']
draft: false
unlisted: false
---
## Summary

This creates all of the needed items in the Database to ensure the [Active Directory Reporting Solution](https://proval.itglue.com/DOC-5078775-9331097) functions correctly. This script will create the following items:

1. Table: `plugin_proval_ad_pwd_audit`
2. View: `plugin_proval_ad`
3. View: `plugin_proval_ad_compliance`
4. View: `plugin_proval_ad_groups`
5. View: `plugin_proval_ad_pcinv`
6. Schedules the script [RSM - Active Directory - Script - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-9590761) on the Domain Controllers group limited by the Infrastructure Masters search.

## Sample Run

![Sample Run](5078775/docs/9492882/images/13148150)

## Dependencies

There are two things that need to be installed for this script to function correctly:

1. Script Added to Environment: [AD - Test for Weak Passwords](https://proval.itglue.com/DOC-5078775-9492875)
2. The Active Directory Plugin needs to be installed and configured

Other items depend on this script being run to function, which I have listed below:

1. [Report - Active Directory User Assessment](https://proval.itglue.com/DOC-5078775-9493611)
2. [Report - Active Directory User Groups - Detail](https://proval.itglue.com/DOC-5078775-9493130)
3. Report - Computers in Active Directory - No Agent

## Output

This is a one-time use script, used to install/create a table, 4 views, and schedule a script. After running once, this script can be removed from the environment.

