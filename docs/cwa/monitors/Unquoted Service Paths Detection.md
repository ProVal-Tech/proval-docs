---
id: 'cwa-unquoted-service-paths-detection'
title: 'Unquoted Service Paths Detection'
title_meta: 'Unquoted Service Paths Detection'
keywords: ['service', 'path', 'windows', 'monitor', 'autofix']
description: 'This document outlines a monitor set designed to identify services with unquoted paths on Windows machines. It checks for spaces in the service path and ensures proper quoting to enhance security. An Autofix script is provided to automatically correct these paths.'
tags: ['windows', 'security', 'monitoring', 'setup', 'configuration']
draft: false
unlisted: false
---
## Summary

The monitor set will identify any service that has a space in the path but is not enclosed in quotes. Basically, it's checking for a space between “c:/” up to the first “.exe” path of the service and there can be a space in arguments. The monitor set will call an Autofix script [Unquoted Service Paths Detection [Autofix]](https://proval.itglue.com/DOC-5078775-9031676) to add the proper quotes to the detected service.

## Target

Windows Machines: The SQL used in the monitor set is limiting it to the Windows Machines only.




