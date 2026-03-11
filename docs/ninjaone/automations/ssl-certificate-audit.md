---
id: '3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5'
slug: /3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5
title: 'SSL Certificate Audit'
title_meta: 'SSL Certificate Audit'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-16
---

## Overview
This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on. It then updates the custom field [cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) with the SSL details.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

![SampleRun2](../../../static/img/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5/image1.webp)

## Dependencies
- [Solution - SSL Certificate Audit](/docs/cf5acc69-183c-4838-9484-2f3d9a247877)
- [Custom field - cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) 

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/ssl-certificate-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-02-13

- Initial version of the document
