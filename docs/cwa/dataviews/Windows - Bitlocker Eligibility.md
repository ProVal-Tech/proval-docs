---
id: 'adcd54bb-9909-42c5-8da9-913718f2650f'
title: 'Windows - Bitlocker Eligibility'
title_meta: 'Windows - Bitlocker Eligibility'
keywords: ['bitlocker', 'eligibility', 'status', 'tpm', 'encryption']
description: 'This document outlines a dataview that displays the eligibility status of machines for implementing Bitlocker, including whether it is enabled and the necessary dependencies for proper functionality.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays information about the eligibility status of a machine for implementing Bitlocker and whether it is enabled.

## Dependencies

- [Bitlocker Enabled - System Drive](<../roles/Bitlocker Enabled - System Drive.md>) -- Role
- @Bitlocker TPM Present -- Role
- @Bitlocker TPM Ready -- Role

## Columns

| Column                          | Description                                                                                                                                     |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| Client Name                     | Client Name                                                                                                                                    |
| Location Name                   | Location Name                                                                                                                                  |
| Computer Name                   | Computer Name                                                                                                                                    |
| BIOS Support UEFI               | 1 - UEFI Supported, 0 - UEFI Not Supported                                                                                                     |
| Bitlocker Enabled - System Drive | 1 - Bitlocker Enabled on System Drive, 0 - Bitlocker Not Enabled                                                                              |
| TPM Ready                       | 1 - Bitlocker TPM Ready, 0 - Bitlocker TPM Ready Not Set                                                                                      |
| TPM Present                     | 1 - Bitlocker TPM Present, 0 - Bitlocker TPM Present Not Set                                                                                  |
| Support Device Encryption        | If the system has Bitlocker TPM Ready, Bitlocker TPM Present, and UEFI Supported, then it is set to 1 as Support Device Encryption; otherwise, it is set to 0, meaning it does not support device encryption. |



