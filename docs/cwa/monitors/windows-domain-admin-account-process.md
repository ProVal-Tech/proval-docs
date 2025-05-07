---
id: '6270f7b1-3cf6-433f-b6e9-b1300b545896'
slug: /6270f7b1-3cf6-433f-b6e9-b1300b545896
title: 'Windows Domain Admin Account Process'
title_meta: 'Windows Domain Admin Account Process'
keywords: ['domain', 'controllers', 'admin', 'account', 'password', 'monitor']
description: 'This document outlines a monitor set designed to identify Domain Controllers missing the designated Domain admin account and those with outdated passwords. It provides customization options through system properties and client-level Extra Data Fields (EDFs), enhancing adaptability to various requirements.'
tags: ['active-directory', 'security']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to identify Domain Controllers that do not have the designated Domain admin account and those where the password for the account has not been updated within the specified password age limit. The UserName and Password age parameters are configured in the system properties and client-level Extra Data Fields (EDFs), allowing for customization and adaptability to specific requirements.

Check the [Script's](/docs/a3038ecc-f851-4327-b1ca-a4ca485f6f9c) document for more information on EDFs, Script State, and System Properties used in the monitor set.

## Dependencies

[EPM - Windows Configuration - Script - Windows - Admin Account - Create/Update](/docs/a3038ecc-f851-4327-b1ca-a4ca485f6f9c)

## Target

Domain Controllers belonging to clients that have the `1a. Enable Domain Admin Process` EDF marked.

![Image](../../../static/img/docs/6270f7b1-3cf6-433f-b6e9-b1300b545896/image_1.png)

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Windows - Admin Account - Create/Update`

The alert template should run the [EPM - Windows Configuration - Script - Windows - Admin Account - Create/Update](/docs/a3038ecc-f851-4327-b1ca-a4ca485f6f9c) script on the machines detected by the monitor set.