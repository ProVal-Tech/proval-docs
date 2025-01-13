---
id: 'cwa-monitor-set-local-admin-check'
title: 'Monitor Set for Local Admin Account Verification'
title_meta: 'Monitor Set for Local Admin Account Verification'
keywords: ['monitor', 'local', 'admin', 'account', 'verification', 'password', 'age', 'parameters']
description: 'This document outlines the purpose and functionality of a monitor set designed to identify Windows machines that lack a designated local admin account or have outdated passwords. It details the customizable UserName and Password age parameters, dependencies, and the alert template for executing necessary scripts.'
tags: ['windows', 'security', 'configuration', 'notification']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to identify machines that do not have the designated local admin account and machines where the password for the account has not been updated within the specified password age limit. The UserName and Password age parameters are configured in the system properties and client-level Extra Data Fields (EDFs), allowing for customization and adaptability to specific requirements.

Check [Script's](https://proval.itglue.com/DOC-5078775-8223774) document for more information on EDFs, Script State, and System Properties used in the monitor set.

## Dependencies

[EPM - Windows Configuration - Script - Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774)

## Target

With the exception of Domain Controllers, only Windows machines belonging to clients that have the `Enabled for Servers and Workstations` selected for the `1a. Local Admin Process` EDF. Selecting the `Enabled for Workstations Only` option will limit the local admin creation to the workstations only.

![Image](../../../static/img/Windows-Local-Admin-Account-Process/image_1.png)

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Windows - Admin Account - Create/Update`

The alert template should run the [EPM - Windows Configuration - Script - Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) script on the machines detected by the monitor set.



