---
id: '8cca4422-d71b-4696-b5d8-8cbc51158b3d'
slug: /8cca4422-d71b-4696-b5d8-8cbc51158b3d
title: 'SSL Certificate Audit'
title_meta: 'SSL Certificate Audit'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This document provides a detailed overview of all certificates present on machines, indicating their status regarding expiration and detection issues. It includes information on various attributes of each certificate, such as issuer, thumbprint, and whether they have a private key assigned.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This report is designed to present a complete list of all certificates found on machines and indicate if they are expired, expiring soon, or not detected due to either no certificate found or a PowerShell version issue.

## Dependencies

- [EPM - Network - Script - Certificate - Windows - Certificates (My) - Local Machine - Audit](/docs/7d13a122-8d62-4c50-b19f-922e6bb37a13)
- [EPM - Network - Custom Table - plugin_proval_certs](/docs/44048760-bd04-451d-82ea-b6eee6a03552)

## Columns

| Column                | Description                                                                                       |
|----------------------|---------------------------------------------------------------------------------------------------|
| Client               | Displays the Client Name on which the Certificate was found.                                     |
| Computer             | Displays the Computer Name on which the Certificate was found.                                   |
| FriendlyName         | Outputs the Friendly Name (if set) of the Certificate.                                          |
| Subject              | The reported Subject of the Certificate.                                                          |
| Issuer               | The reported Issuer of the Certificate.                                                          |
| Thumbprint           | The physical thumbprint of the Certificate (this will always be unique).                         |
| Expiration           | The Expiration Date/Time of the Certificate.                                                     |
| Status               | This will be one of the following: Expired, Expiring < 180 Days, Expiring < 90 Days, Expiring Soon, and Active. |
| Archived             | The reported value indicating whether this certificate has been archived.                        |
| HasPrivateKey        | The reported value indicating whether this certificate has a private key assigned to it.        |
| SerialNumber         | The Serial Number of the Certificate.                                                             |
| Version              | The version of the certificate.                                                                   |
| CertAdded            | When the certificate was added/installed to the machine.                                         |
| Data Collection Date  | When the last certification scan was performed.                                                  |
| Status               | The certificate's current status in text.                                                        |


