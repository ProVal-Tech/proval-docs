---
id: 'cwa-monitor-patching-status'
title: 'Monitor Patching Status in ConnectWise Automate'
title_meta: 'Monitor Patching Status in ConnectWise Automate'
keywords: ['patching', 'monitor', 'connectwise', 'automate', 'status']
description: 'This document outlines a monitor designed to identify machines that are patching via ConnectWise Automate but lack patch job information in the system. It emphasizes the importance of reviewing these devices to ensure proper patching and maintenance.'
tags: ['connectwise', 'monitoring', 'patching', 'status', 'review']
draft: false
unlisted: false
---
## Summary

The goal of this monitor is to look for machines that are patching via CW Automate but do not have any patch job information in the system. This may indicate that the target device is not patching properly in CW Automate and should be reviewed by either a CW Admin or a technician.

## Dependencies

Automate must be upgraded to the "new" patch manager.

## Target

Global - Should be run without explicitly defined targets. The SQL will automatically filter out devices that do not have their Windows patching controlled by CW Automate.



