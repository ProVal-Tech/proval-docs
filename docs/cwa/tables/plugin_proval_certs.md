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

This table is used in the [SSL Certificate Audit Solution](<../../solutions/Certificate Audit Solution.md>) to gather data on SSL Certificates to be used for general Audit or active monitoring.

## Dependencies

[Link to EPM - Network - Script - Certificate - Windows - Certificates (My) - Local Machine - Audit](<../scripts/Windows - Certificates (My) - Local Machine - Audit.md>)

## Tables

#### plugin_proval_certs

| Column        | Type                                      | Explanation                                                        |
|---------------|-------------------------------------------|--------------------------------------------------------------------|
| ComputerID    | INT - Not Null [Primary Key]             | This is the computer ID that the SSL Cert was found on.            |
| FriendlyName  | VARCHAR                                   | Friendly name of the SSL Certificate [If Set]                      |
| Subject       | VARCHAR                                   | Subject of the SSL Certificate                                      |
| Issuer        | VARCHAR                                   | Issuer of the SSL Certificate                                       |
| Thumbprint    | VARCHAR - Not Null [Primary Key]         | Thumbprint of the SSL Certificate                                   |
| Archived      | VARCHAR                                   | (1,0) is this certificate 'Archived'                               |
| HasPrivateKey  | VARCHAR                                   | (1,0) Does this certificate have a private key                     |
| SerialNumber  | VARCHAR                                   | Serial Number of the SSL Certificate                                |
| Version       | VARCHAR                                   | What version is the SSL Certificate (Normally 3)                   |
| CertAdded     | DATETIME                                  | When was the certificate added to the system                        |
| Expiration    | DATETIME                                  | What is the expiration date of the SSL certificate                  |
| DateUpdated   | DATETIME                                  | When did the script actually add the information into the DB       |












