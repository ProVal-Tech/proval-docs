---
id: 'cwa-tpm-configuration-info'
title: 'TPM Configuration Information'
title_meta: 'TPM Configuration Information'
keywords: ['tpm', 'configuration', 'endpoints', 'security', 'client', 'location', 'computer', 'operating', 'system', 'lastcontact', 'managedauthlevel', 'ownerauth', 'autoprovisioning', 'lockedout', 'version']
description: 'This document provides detailed information about the TPM configuration on endpoints, including the status of TPM readiness, presence, and various security levels associated with the TPM on each client machine.'
tags: ['security', 'configuration', 'windows', 'client', 'networking']
draft: false
unlisted: false
---
## Summary

Displays information about the TPM configuration on endpoints.

## Dependencies

[TPM Detail Auditing](https://proval.itglue.com/DOC-5078775-8304569)

## Columns

| Column              | Description                                                   |
|---------------------|---------------------------------------------------------------|
| Client Name         | The name of the client.                                      |
| Location Name       | The name of the location.                                    |
| Computer Name       | The name of the endpoint.                                    |
| Operating System     | Operating system information of the agent                    |
| LastContact         | Last contact of agent with the CW Automate                   |
| TPMReady            | Displays whether TPMReady is Enabled or disabled             |
| TPMPresent          | Displays whether TPMReady is Enabled or disabled             |
| ManagedAuthLevel    | Displays the ManagedAuthLevel information                    |
| OwnerAuth           | Displays the OwnerAuth Info                                   |
| OwnerClearDisabled   | Displays the OwnerClearDisabled status. (True or false)      |
| AutoProvisioning     | Displays whether auto-provisioning is enabled or not         |
| LockedOut           | Displays whether TPM locked or not                            |
| TPMVersion          | Displays the TPM version on the endpoint                     |



