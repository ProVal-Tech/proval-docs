---
id: '9b40d1cd-7886-416f-b56e-11ab3a44befb'
title: 'Application - InstallUpdate Winget'
title_meta: 'Application - InstallUpdate Winget'
keywords: ['winget', 'monitor', 'update', 'application', 'packageid', 'source', 'dependencies']
description: 'This document outlines a monitor designed to update applications based on the provided PackageID, Source, and Application Name. It includes setup instructions, dependencies, and target specifications for effective implementation.'
tags: ['setup', 'software']
draft: false
unlisted: false
---

## Summary

This monitor is designed to update the application based on the PackageID, Source, and Application Name provided within the monitor. Please duplicate the monitor name and replace `<Application>` with the actual application name.

## Dependencies

[Winget - Install/Update [Autofix, Param]](<../scripts/Script - Winget - InstallUpdate Autofix,Param.md>)

## Target

Global - Should be run without explicitly defined targets.

This monitor depends on the property named PackageID being created. Therefore, before enabling it, you need to implement the monitor "ProVal - Production - `<Application>` - Latest Version Detection" with the alert template "△ Custom - Execute Script - Application Latest Version."



