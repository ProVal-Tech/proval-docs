---
id: 'd4d89a22-e41b-4ad6-b0ba-ba78f4968adb'
title: 'AV - Disabled'
title_meta: 'AV - Disabled'
keywords: ['monitor', 'antivirus', 'disabled', 'autofix', 'service', 'status']
description: 'This document details a monitor that identifies devices with disabled Antivirus. It includes information about an Autofix for Windows machines that can restart the Antivirus service and is applicable to all operating systems, though the Autofix feature is specifically for Windows.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor looks for devices that have their Antivirus disabled. This is a copy of the original AV - Disabled monitor provided by ConnectWise.

There is an available Autofix for Windows-based machines that will attempt to restart the service for the Antivirus detected on the device. The script is named `@Autofix - Monitor AV Service Status [Global]`.

## Dependencies

None.

## Target

All machines with Antivirus installed and/or the managed service plans. 

This monitor will work for all operating systems, but the available Autofix will only run on Windows devices!



