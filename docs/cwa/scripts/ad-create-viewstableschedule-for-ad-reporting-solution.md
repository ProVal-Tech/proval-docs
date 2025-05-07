---
id: 'f0b2fe2b-8bd8-4d9a-9428-2123b332aa49'
slug: /f0b2fe2b-8bd8-4d9a-9428-2123b332aa49
title: 'AD - Create ViewsTableSchedule for AD Reporting Solution'
title_meta: 'AD - Create ViewsTableSchedule for AD Reporting Solution'
keywords: ['active', 'directory', 'reporting', 'solution', 'setup', 'database']
description: 'This document details the process of setting up the Active Directory Reporting Solution by creating necessary database items, including tables and views, along with scheduling an essential script for compliance and security checks.'
tags: ['active-directory', 'database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This document outlines the creation of all necessary items in the database to ensure the [Active Directory Reporting Solution](/docs/ca5427f7-0efe-499d-9e80-c06698efa5d0) functions correctly. This script will create the following items:

1. Table: `plugin_proval_ad_pwd_audit`
2. View: `plugin_proval_ad`
3. View: `plugin_proval_ad_compliance`
4. View: `plugin_proval_ad_groups`
5. View: `plugin_proval_ad_pcinv`
6. Schedules the script [RSM - Active Directory - Script - Weak Passwords - AD Test](/docs/cf22292d-e874-47ee-9bd1-5ec79c5f3724) on the Domain Controllers group, limited by the Infrastructure Masters search.

## Sample Run

![Sample Run](../../../static/img/docs/f0b2fe2b-8bd8-4d9a-9428-2123b332aa49/image_1.png)

## Dependencies

There are two prerequisites that need to be installed for this script to function correctly:

1. Script Added to Environment: [AD - Test for Weak Passwords](/docs/cf22292d-e874-47ee-9bd1-5ec79c5f3724)
2. The Active Directory Plugin needs to be installed and configured.

Other items depend on this script being executed to function, which are listed below:

1. [Report - Active Directory User Assessment](/docs/71ade073-cc5c-4833-bf2c-2d8b13472078)
2. [Report - Active Directory User Groups - Detail](/docs/e76e5bf4-d80e-4a53-ab39-a116c157e008)
3. Report - Computers in Active Directory - No Agent

## Output

This is a one-time use script, used to install/create a table, four views, and schedule a script. After running it once, this script can be removed from the environment.


