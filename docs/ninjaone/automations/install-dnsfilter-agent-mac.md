---
id: '70aeb191-3689-4199-a612-41753e7ccfd5'
slug: /70aeb191-3689-4199-a612-41753e7ccfd5
title: 'Install DNSFilter Agent - MAC'
title_meta: 'Install DNSFilter Agent - MAC'
keywords: ['DNS', 'Filter', 'Agent']
description: 'This script automates the installation of the DNS Filter Agent for MAC machines.'
tags: ['installation']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Overview

DNSFilter Installation Script for macOS via NinjaRMM with dynamic NinjaRMM CLI path detection.

## Requirements

- macOS
- Run As: `System`

## Sample Run

![Image1](../../../static/img/docs/70aeb191-3689-4199-a612-41753e7ccfd5/image1.webp)

## Parameters

| Name | Required | Accepted Values | Default | Type | Description |
| ---- | -------- | --------------- | ------- | ---- | ----------- |
| DNS Filter Key | True | | | Text | DNSFilter Network Key used to register the device with the DNSFilter organization. |

## Custom Fields

| Custom Field | Scope | Type | Description |
| ------------ | ----- | ---- | ----------- |
| [cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a)  | Device | Text | Custom Fields to enter the DNSFilter Network Key required to register the device with the appropriate DNSFilter organization. |

## Dependencies

* [Custom Field - cPVAL DNSFilter Key](/docs/ea940639-c217-4f4d-ac31-b5767417691a)
* [Solution - DNSFilter Deployment](/docs/1c257867-5a6f-4887-a383-7c5af4cf1c98)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/install-dnsfilter-agent-mac.sh)

## Output

- Activity Details

## Changelog

### 2026-10-29

- Updated the documents as per Proval's new Standard

### 2025-07-17

- Initial version of the document