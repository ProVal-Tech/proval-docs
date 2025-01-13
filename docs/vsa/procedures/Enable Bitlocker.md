---
id: 'vsa-enable-bitlocker'
title: 'Enable Bitlocker'
title_meta: 'Enable Bitlocker'
keywords: ['bitlocker', 'encryption', 'windows', 'tpm', 'gpo']
description: 'This document provides instructions for enabling Bitlocker on Windows endpoints that meet specific requirements such as running Pro or Premium versions of Windows OS, having hardware TPM, and adhering to group policy settings. It also outlines the email notification process for failures and informs about the script location in ProVal VSA.'
tags: ['encryption', 'windows', 'security', 'setup', 'notification']
draft: false
unlisted: false
---
Enables Bitlocker. Requires the following endpoint properties:

- Pro / Premium Windows OS
- Hardware TPM
- Group Policy must not force encryption other than AES 256

Client will receive an email if the process fails on an endpoint. Email address must be manually configured in Line 11.

Script no longer requires restart to complete successfully.

Script located in ProVal VSA at Shared > PVAL Content Source > BitLocker > Enable Bitlocker

![Image](..\..\..\static\img\Enable-Bitlocker\image_1.png)


