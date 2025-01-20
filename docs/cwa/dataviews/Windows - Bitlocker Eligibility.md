---
id: 'adcd54bb-9909-42c5-8da9-913718f2650f'
title: 'Bitlocker Eligibility Status Dataview'
title_meta: 'Bitlocker Eligibility Status Dataview'
keywords: ['bitlocker', 'eligibility', 'status', 'tpm', 'encryption']
description: 'This document outlines a dataview that displays the eligibility status of machines for implementing Bitlocker, including whether it is enabled and the necessary dependencies for proper functionality.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview displays information about the eligibility status of a machine for implementing Bitlocker and if it is enabled or not.

## Dependencies

- [Bitlocker Enabled - System Drive](<../roles/Bitlocker Enabled - System Drive.md>) -- Role
- @Bitlocker TPM Present -- Role
- @Bitlocker TPM Ready -- Role

## Columns

| Column                          | Description                                                                                                                                    |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Client Name                     | Client Name                                                                                                                                   |
| Location Name                   | Location Name                                                                                                                                 |
| Computer Name                   | Computer Name                                                                                                                                 |
| BIOS Support UEFI               | 1 - UEFI Supported0 - UEFI Not-Supported                                                                                                  |
| Bitlocker Enabled - System Drive | 1 - Bitlocker Enabled on System Drive0 - Bitlocker not enabled                                                                           |
| TPM Ready                       | 1 - Bitlocker TPM Ready0 - Bitlocker TPM Ready Not Set                                                                                   |
| TPM Present                     | 1 - Bitlocker TPM Present0 - Bitlocker TPM Present Not Set                                                                               |
| Support Device Encryption        | If system has Bitlocker TPM Ready, Bitlocker TPM Present and UEFI Supported then it is set to 1 as Support Device Encryption else 0 means do not support device encryption. |













