---
id: ps-import-lmcertificate
title: 'Import-LMCertificate'
title_meta: 'Import-LMCertificate Command'
keywords: ['import', 'certificate', 'localmachine', 'security']
description: 'Documentation for the Import-LMCertificate command to import a certificate to one or more local machine stores.'
tags: ['security', 'configuration', 'windows']
draft: false
unlisted: false
---
## Description
Import a certificate to one or more local machine stores.
The target certificate can be a .CER file, a .CRT file, or a self-signed cert that will be created.

## Requirements
Powershell v5

## Usage
1. Determine the origin of the desired certificate (file or self-signed).
2. If it is a file verify the file exists, and verify that the file is a .cer or .crt file.
3. If it is a self-signed certificate, set up the certificate based on the parameters passed.
4. Import or create the desired certificate to the `CurrentUser\My` store.
5. Loop through each target store.
   1. Check for any certificates in the store with the same subject name.
      - If an existing certificate is found, check the expiration date of that certificate. If the new certificate has a later expiration date than the existing one, remove the old cert. Otherwise, skip the import into the current store.
   2. Add the new cert to the current store.


Takes the certificate file 'ThisStrangeCert.cer' and applies it to the LocalMachine\My, LocalMachine\Root, and LocalMachine\Trusted stores.

```powershell
.\Import-LMCertificate.ps1 -CertStore My,Root,Trusted -CertLocation c:\Users\MyUser\Downloads\ThisStrangeCert.cer
```

Creates a self-signed certificate with the subject name 'ThisNewCert' that is of a code-signing type, the cert has a 4096 key lenght with the provider 'Microsoft Enhanced RSA and AES Cryptographic Provider', it is exportable with a certsign usage and a RSA algorithm. 
The Certificate will be placed in the LocalMachine\My, LocalMachine\Root, and LocalMachine\CA.

```powershell
.\Import-LMCertificate.ps1 -CertStore My,Root,CA -SubjectName 'ThisNewCert' -Type 'CodeSigningCert' -KeyLength 4096 -Provider 'Microsoft Enhanced RSA and AES Cryptographic Provider' -KeyExportPolicy 'Exportable' -KeyUsage 'CertSign' -KeyAlgorithm 'RSA'
```

## Parameters
| Parameter         | Alias              | Required | Default                                               | Type   | Description                                                        |
| ----------------- | ------------------ | -------- | ----------------------------------------------------- | ------ | ------------------------------------------------------------------ |
| `Path`            | `CertLocation`     | True     |                                                       | String | The path to a certificate file to import.                       |
| `SubjectName`     | `CertName`, `Name` | True     |                                                       | String | The subject name for the created certificate.                      |
| `Type`            |                    | True     |                                                       | String | The type of certificate to create.                                 |
| `CertStore`       |                    | False    | My                                                    | String | The set of LocalMachine stores to store the target certificate in. |
| `KeyLength`       |                    | False    | 2048                                                  | Int    | The length of the key for the created certificate.                 |
| `Provider`        |                    | False    | Microsoft Enhanced RSA and AES Cryptographic Provider | String | The provider for the created certificate.                          |
| `KeyExportPolicy` |                    | False    | ExportableEncrypted                                   | String | The desired export policy for the created certificate.             |
| `KeyUsage`        |                    | False    | None                                                  | String | The Key Usage for a created certificate                            |
| `KeyAlgorithm`    |                    | False    | RSA                                                   | String | The Key Algorithm for the created certificate.                     |


## Output
    System.Security.Cryptography.X509Certificates.X509Certificate2

Log Files

    .\Import-LMCertificate-log.txt
    .\Import-LMCertificate-error.txt