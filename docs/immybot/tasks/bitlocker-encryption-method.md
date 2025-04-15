---
id: ed5d6083-cdc8-42dd-8d05-2410be6a614b
slug: /ed5d6083-cdc8-42dd-8d05-2410be6a614b
title: 'Enforce Bitlocker Encryption Method'
title_meta: 'Enforce Bitlocker Encryption Method'
keywords: ['ImmyBot', 'Bitlocker']
description: 'Enforces Bitlocker encryption method. If a machine is found to be out of compliance, this task will decrypt the drive and re-encrypt it with the target method using a recovery password as the key protector. If a previous recovery password is detected, it will be used for the new encryption.'
tags: ['security', 'encryption']
draft: false
unlisted: false
---

## Description
Enforces Bitlocker encryption method. If a machine is found to be out of compliance, this task will decrypt the drive and re-encrypt it with the target method using a recovery password as the key protector. If a previous recovery password is detected, it will be used for the new encryption.

[Task Configuration](https://github.com/ProVal-Tech/immybot/blob/main/tasks/bitlocker-encryption-method.toml)