---
id: 'cwa-monitor-update-application'
title: 'Monitor to Update Application Based on PackageID'
title_meta: 'Monitor to Update Application Based on PackageID'
keywords: ['monitor', 'update', 'application', 'packageid', 'source', 'dependencies']
description: 'This document outlines a monitor designed to update applications based on the provided PackageID, Source, and Application Name. It includes setup instructions, dependencies, and target specifications for effective implementation.'
tags: ['configuration', 'setup', 'software', 'dependencies']
draft: false
unlisted: false
---
## Summary

This monitor is designed to update the application based on the PackageID, Source, and Application Name provided inside the monitor. Please duplicate the monitor name and replace the <Application> with the actual application name.

## Dependencies

[Winget - Install/Update [Autofix,Param]](https://proval.itglue.com/DOC-5078775-14466238)

## Target

Global - Should be run without explicitly defined targets.

This monitor is dependent on the properties with the name of PackageID to be created. So, before enabling it you need to implement the monitor "ProVal - Production - <Application> - Latest Version Detection" with an alert template "△ Custom - Execute Script - Application Latest Version".

