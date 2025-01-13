---
id: 'cwa-sec-encryption-agnostic-enable-tpm'
title: 'SEC - Encryption - Agnostic - Enable-TPM Implementation'
title_meta: 'SEC - Encryption - Agnostic - Enable-TPM Implementation'
keywords: ['tpm', 'encryption', 'provisioning', 'script', 'implementation']
description: 'This document details the implementation of the agnostic script SEC - Encryption - Agnostic - Enable-TPM within Automate. It covers the initialization of the Trusted Platform Module (TPM) as part of the provisioning process, including necessary parameters and expected outputs.'
tags: ['encryption', 'provisioning', 'setup', 'script', 'logging']
draft: false
unlisted: false
---
## Summary

An Automate implementation of the agnostic script [SEC - Encryption - Agnostic - Enable-TPM](https://proval.itglue.com/DOC-5078775-11409203). Initializes Tpm as a part of the provisioning process for a Trusted Platform Module (TPM). Provisioning is the process of preparing a TPM to be used. A restart may be required to initialize TPM.

## Sample Run

![Sample Run](..\..\..\static\img\Bitlocker---Enable-TPM\image_1.png)

## Dependencies

- [SEC - Encryption - Agnostic - Enable-TPM](https://proval.itglue.com/DOC-5078775-11409203)

#### Global Parameters

| Name                     | Example          | Required | Description                                                                                                                                                       |
|--------------------------|------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AllowClear               | True or False     | True     | True to pass the switch to the agnostic script, False to suppress. Default value is True.                                                                        |
| AllowPhysicalPresence     | True or False     | True     | True to pass the switch to the agnostic script, False to suppress. Default value is False.                                                                        |
| AllowRestart             | True or False     | True     | True to pass the switch to the agnostic script, False to suppress. Default value is False. Setting this parameter as True will reboot the computer if it's necessary to initialize TPM. |

## Process

- Executes the Agnostic script and writes the Informational Logs in Automate.

## Output

- Script Logs


