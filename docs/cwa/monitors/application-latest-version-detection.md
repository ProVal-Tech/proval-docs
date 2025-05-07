---
id: 'f5315643-b01b-48e6-ae4c-b89e5c0f20d6'
slug: /f5315643-b01b-48e6-ae4c-b89e5c0f20d6
title: 'Application - Latest Version Detection'
title_meta: 'Application - Latest Version Detection'
keywords: ['monitor', 'winget', 'application', 'upgrade', 'version']
description: 'This document provides a guide on creating a monitor to fetch the latest version of an application using Winget. It includes implementation steps, dependencies, and target specifications for effective use.'
tags: ['application']
draft: false
unlisted: false
---

## Summary

This monitor is designed to fetch the latest version of the application for which you want Winget to control the upgrade. Please duplicate the monitor name and replace `<Application>` with the actual application name.

## Dependencies

[Application - Latest Version Detection [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde)

## Target

Global - Should be run without explicitly defined targets.

This script is only targeted to one machine to fetch the application's latest version.

## Implementation

1. Import the monitor.  
   Create a duplicate of the monitor and remove the imported monitor to avoid confusion.
