---
id: '6d42adc8-2e3d-4642-9471-327ef96bae1f'
title: 'Patching - No Patch Jobs Run'
title_meta: 'Patching - No Patch Jobs Run'
keywords: ['patching', 'monitor', 'connectwise', 'automate', 'status']
description: 'This document outlines a monitor designed to identify machines that are patching via ConnectWise Automate but lack patch job information in the system. It emphasizes the importance of reviewing these devices to ensure proper patching and maintenance.'
tags: ['connectwise', 'patching']
draft: false
unlisted: false
---

## Summary

The goal of this monitor is to identify machines that are patching via ConnectWise Automate but do not have any patch job information in the system. This may indicate that the target device is not patching properly in ConnectWise Automate and should be reviewed by either a ConnectWise Administrator or a technician.

## Dependencies

Automate must be upgraded to the "new" patch manager.

## Target

Global - This monitor should be run without explicitly defined targets. The SQL will automatically filter out devices that do not have their Windows patching controlled by ConnectWise Automate.



