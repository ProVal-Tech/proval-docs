---
id: '9b40d1cd-7886-416f-b56e-11ab3a44befb'
slug: /9b40d1cd-7886-416f-b56e-11ab3a44befb
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

[Winget - Install/Update [Autofix, Param]](/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25)

## Target

Global - Should be run without explicitly defined targets.

This monitor depends on the property named PackageID being created. Therefore, before enabling it, you need to implement the monitor "ProVal - Production - `<Application>` - Latest Version Detection" with the alert template "△ Custom - Execute Script - Application Latest Version."

## FAQ

Does this monitor can perform installation as well?

By default, it only performs the update.
Yes, for the install enable please change the null value to 1 as shown below:
![Change to 1 to enable install](../../../static/img/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb/image.webp)


