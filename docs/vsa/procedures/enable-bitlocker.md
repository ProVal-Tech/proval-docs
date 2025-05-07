---
id: 'afd016fa-315e-4822-8278-0f33863e3fc0'
slug: /afd016fa-315e-4822-8278-0f33863e3fc0
title: 'Enable Bitlocker'
title_meta: 'Enable Bitlocker'
keywords: ['bitlocker', 'encryption', 'windows', 'tpm', 'gpo']
description: 'This document provides instructions for enabling Bitlocker on Windows endpoints that meet specific requirements such as running Pro or Premium versions of the Windows OS, having hardware TPM, and adhering to group policy settings. It also outlines the email notification process for failures and informs about the script location in ProVal VSA.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Enable Bitlocker

This document enables Bitlocker and requires the following endpoint properties:

- Pro / Premium Windows OS
- Hardware TPM
- Group Policy must not force encryption other than AES 256

Clients will receive an email if the process fails on an endpoint. The email address must be manually configured in Line 11.

The script no longer requires a restart to complete successfully.

The script is located in ProVal VSA at:  
`Shared > PVAL Content Source > BitLocker > Enable Bitlocker`

![Image](../../../static/img/docs/1a32292b-df11-46ef-997f-7ad70f59061f/image_1.png)

