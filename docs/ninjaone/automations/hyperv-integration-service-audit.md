---
id: '1c8cf2c3-d470-4616-bc27-35e69f274202'
slug: /1c8cf2c3-d470-4616-bc27-35e69f274202
title: 'Hyper-V Integration Service Audit'
title_meta: 'Hyper-V Integration Service Audit'
keywords: ['hyper-v', 'backup', 'integration', 'replication']
description: 'This script queries all Hyper-V virtual machines and looks for any VM where the IntegrationServicesState is `Update required`. If any such VM is found, the script stores the VM details in the NinjaOne custom field `cpvalHyperVIntegrationServiceStatus` and exits with code 1. If no VMs require Integration Services updates, the script stores `UpToDate` and exits successfully with code 0.'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-05-11
---

## Overview

This script queries all Hyper-V virtual machines and looks for any VM where the IntegrationServicesState is `Update required`. 
If any such VM is found, the script stores the VM details in the NinjaOne custom field `cpvalHyperVIntegrationServiceStatus` and exits with code 1. 
If no VMs require Integration Services updates, the script stores `UpToDate` and exits successfully with code 0.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Type Hyper-V Integration in the search box and select the `Hyper-V Integration Service Audit` script
![SampleRun2](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image2.webp)

Click Run
![SampleRun3](../../../static/img/docs/577db7ae-37bc-42f7-84e3-5346a6089972/image3.webp)

## Dependencies

- [Script - Hyper-V Integration Service Audit](/docs/1c8cf2c3-d470-4616-bc27-35e69f274202)
- [Solution - HyperV Replication Integration Alert](/docs/4deaf362-a762-4a05-9118-326edc7ff523)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/hyperv-integration-service-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-05-11

- Initial version of the document