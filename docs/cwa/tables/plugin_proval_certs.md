---
id: '44048760-bd04-451d-82ea-b6eee6a03552'
title: 'SSL Certificate Audit Solution'
title_meta: 'SSL Certificate Audit Solution for Monitoring and Auditing SSL Certificates'
keywords: ['ssl', 'certificate', 'audit', 'monitoring', 'data']
description: 'This document outlines the SSL Certificate Audit Solution, detailing the structure of the database table used to gather information on SSL Certificates for auditing and monitoring purposes. It provides an overview of the dependencies, table structure, and the specific columns included in the plugin_proval_certs table.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This table is used in the [SSL Certificate Audit Solution](<../../solutions/Certificate Audit Solution.md>) to gather data on SSL Certificates for general auditing or active monitoring.

## Dependencies

[Link to EPM - Network - Script - Certificate - Windows - Certificates (My) - Local Machine - Audit](<../scripts/Windows - Certificates (My) - Local Machine - Audit.md>)

## Tables

#### plugin_proval_certs

| Column         | Type                                      | Explanation                                                        |
|----------------|-------------------------------------------|--------------------------------------------------------------------|
| ComputerID     | INT - Not Null [Primary Key]             | This is the computer ID that the SSL certificate was found on.     |
| FriendlyName   | VARCHAR                                   | Friendly name of the SSL certificate [If set]                     |
| Subject        | VARCHAR                                   | Subject of the SSL certificate                                     |
| Issuer         | VARCHAR                                   | Issuer of the SSL certificate                                      |
| Thumbprint     | VARCHAR - Not Null [Primary Key]         | Thumbprint of the SSL certificate                                   |
| Archived       | VARCHAR                                   | (1,0) Indicates if this certificate is 'Archived'                 |
| HasPrivateKey   | VARCHAR                                   | (1,0) Indicates if this certificate has a private key             |
| SerialNumber   | VARCHAR                                   | Serial number of the SSL certificate                                |
| Version        | VARCHAR                                   | What version is the SSL certificate (normally 3)                   |
| CertAdded      | DATETIME                                  | When was the certificate added to the system                       |
| Expiration     | DATETIME                                  | What is the expiration date of the SSL certificate                 |
| DateUpdated    | DATETIME                                  | When did the script actually add the information into the database  |

