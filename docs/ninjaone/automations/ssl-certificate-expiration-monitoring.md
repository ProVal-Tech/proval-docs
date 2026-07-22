---
id: '4b6c5595-4336-4e14-a119-c6c7e2c31443'
slug: /4b6c5595-4336-4e14-a119-c6c7e2c31443
title: 'SSL Certificate Expiration Monitoring'
title_meta: 'SSL Certificate Expiration Monitoring'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'Monitors the local machine certificate store for SSL certificates that are expiring soon or have already expired, and reports any that havent already been alerted on.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-22
---

## Overview

Monitors the local machine certificate store for SSL certificates that are expiring soon or have already expired, and reports any that haven't already been alerted on.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)
![SampleRun2](../../../static/img/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443/image1.webp)

## Dependencies

- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| SSL Cert Expiry Threshold | 15 | Numeric Values | False | - | Text | Set the number of days before SSL certificate expiration to detect and report certificates requiring attention. | 


## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/ssl-certificate-expiration-monitoring.ps1)

## Output

- Activity Details 

## Changelog

### 2026-07-22

- Initial version of the document