---
id: '74fed1e5-d84f-4435-adc5-661cff43129c'
slug: /74fed1e5-d84f-4435-adc5-661cff43129c
title: 'Uninstall Threatlocker'
title_meta: 'Uninstall Threatlocker'
keywords: ['threatlocker','windows','groupKey','deployment']
description: 'This script will check for ThreatLocker and attempt to install if not present on Windows Machines. It matches the organization to the client name. If no match is found, it will create the company in the ThreatLocker Portal. By default, servers will be installed into the Servers group, and workstations will be installed into the Workstations group'
tags: ['security','setup','windows']
draft: false
unlisted: false
last_update:
  date:  2026-05-29
---

## Overview

Uninstalls ThreatLocker from a Windows machine. Tamper Protection must be disabled before running this script, otherwise the uninstall may fail.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

![SampleRun1](../../../static/img/docs/74fed1e5-d84f-4435-adc5-661cff43129c/image1.webp)

## Dependencies

- [Solution - ThreatLocker Deployment [NinjaOne]](/docs/a1efd808-41ad-4dee-9ea1-ff0c2a36e019)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/uninstall-threatlocker-windows.ps1)

## Output

- Activity Details  

## Changelog

### 2026-05-29

- Initial version of the document