---
id: 'cwa-custom-rawsql-password-expiration-monitor'
title: 'Custom RAWSQL Monitor for Password Expiration Notification'
title_meta: 'Custom RAWSQL Monitor for Password Expiration Notification'
keywords: ['custom', 'rawsql', 'monitor', 'password', 'expiration', 'notification', 'active', 'directory']
description: 'This document describes a Custom RAWSQL monitor that detects users whose passwords are set to expire within a week. It includes details on the alert template and necessary dependencies for proper configuration.'
tags: ['active-directory', 'notification', 'security', 'alert']
draft: false
unlisted: false
---
## Summary

This Custom RAWSQL monitor detects the users whose password is going to expire within a week.

Alert Template: △ Custom - Password Expiration Notification

## Dependencies

- The Active Directory plugin should be configured correctly to get the monitor working properly.
- [CWM - Automate - Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-6075716-11713518)

## Target

Global


