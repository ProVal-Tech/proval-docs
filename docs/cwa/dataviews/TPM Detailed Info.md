---
id: '3210ea64-6a5d-416d-aea8-8e5399c0e62c'
title: 'TPM Configuration Information'
title_meta: 'TPM Configuration Information'
keywords: ['tpm', 'configuration', 'endpoints', 'security', 'client', 'location', 'computer', 'operating', 'system', 'lastcontact', 'managedauthlevel', 'ownerauth', 'autoprovisioning', 'lockedout', 'version']
description: 'This document provides detailed information about the TPM configuration on endpoints, including the status of TPM readiness, presence, and various security levels associated with the TPM on each client machine.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays information about the TPM configuration on endpoints.

## Dependencies

[TPM Detail Auditing](<../scripts/TPM Detail Auditing.md>)

## Columns

| Column              | Description                                                   |
|---------------------|---------------------------------------------------------------|
| Client Name         | The name of the client.                                      |
| Location Name       | The name of the location.                                    |
| Computer Name       | The name of the endpoint.                                    |
| Operating System     | Operating system information of the agent                    |
| Last Contact        | Last contact of the agent with CW Automate                   |
| TPM Ready           | Displays whether TPM Ready is enabled or disabled            |
| TPM Present         | Displays whether TPM is present or not                       |
| Managed Auth Level   | Displays the Managed Auth Level information                  |
| Owner Auth          | Displays the Owner Auth information                           |
| Owner Clear Disabled | Displays the Owner Clear Disabled status (True or False)     |
| Auto Provisioning    | Displays whether auto-provisioning is enabled or not         |
| Locked Out          | Displays whether TPM is locked or not                        |
| TPM Version         | Displays the TPM version on the endpoint                     |

