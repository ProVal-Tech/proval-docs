---
id: 'cwa-monitor-set-domain-controllers'
title: 'Monitor Set for Domain Controllers'
title_meta: 'Monitor Set for Domain Controllers'
keywords: ['domain', 'controllers', 'admin', 'account', 'password', 'monitor']
description: 'This document outlines a monitor set designed to identify Domain Controllers missing the designated Domain admin account and those with outdated passwords. It provides customization options through system properties and client-level Extra Data Fields (EDFs), enhancing adaptability to various requirements.'
tags: ['active-directory', 'security', 'configuration', 'notification']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to identify Domain Controllers that do not have the designated Domain admin account and DCs where the password for the account has not been updated within the specified password age limit. The UserName and Password age parameters are configured in the system properties and client-level Extra Data Fields (EDFs), allowing for customization and adaptability to specific requirements.

Check [Script's](https://proval.itglue.com/DOC-5078775-8223774) document for more information on EDFs, Script State, and System Properties used in the monitor set.

## Dependencies

[EPM - Windows Configuration - Script - Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774)

## Target

Domain Controllers belonging to clients that have the `1a. Enable Domain Admin Process` EDF marked.

![Image](../../../static/img/Windows-Domain-Admin-Account-Process/image_1.png)

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Windows - Admin Account - Create/Update`

The alert template should run the [EPM - Windows Configuration - Script - Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) script on the machines detected by the monitor set.



