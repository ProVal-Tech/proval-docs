---
id: 'ab811d99-365c-4ad7-84dd-3ff8575d5b15'
title: 'Unquoted Service Paths Detection'
title_meta: 'Unquoted Service Paths Detection'
keywords: ['service', 'path', 'windows', 'monitor', 'autofix']
description: 'This document outlines a monitor set designed to identify services with unquoted paths on Windows machines. It checks for spaces in the service path and ensures proper quoting to enhance security. An Autofix script is provided to automatically correct these paths.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The monitor set will identify any service that has a space in the path but is not enclosed in quotes. Essentially, it checks for a space between “C:/” and the first “.exe” path of the service, and there can be a space in the arguments. The monitor set will call an Autofix script [Unquoted Service Paths Detection [Autofix]](<../scripts/Unquoted Service Paths Detection.md>) to add the proper quotes to the detected service.

## Target

**Windows Machines:** The SQL used in the monitor set is limited to Windows machines only.