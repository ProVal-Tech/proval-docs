---
id: '0f400020-d1ec-40a1-8581-b7f20aacef5d'
slug: /0f400020-d1ec-40a1-8581-b7f20aacef5d
title: 'Import LMCertificate'
title_meta: 'Import LMCertificate'
keywords: ['certificate', 'import', 'local', 'machine', 'self-signed']
description: 'This document provides a comprehensive guide on importing a certificate to one or more local machine stores, including creating a self-signed certificate and importing existing certificates from local paths. It covers user parameters, task creation, and script execution for the process.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

Import a certificate to one or more local machine stores. The target certificate can be a .CER file, a .CRT file, or a self-signed certificate that will be created.

CW RMM implementation of [Import-LMCertificate](<../../powershell/Import-LMCertificate.md>) agnostic script.

## Sample Run

![Sample Run](../../../static/img/Import-LMCertificate/image_1.png)

To create and import a self-signed certificate:  
![Self Signed Certificate](../../../static/img/Import-LMCertificate/image_2.png)

To import a certificate placed in a local folder:  
![Import Certificate](../../../static/img/Import-LMCertificate/image_3.png)  
![Another Import](../../../static/img/Import-LMCertificate/image_4.png)

## Dependencies

[EPM - Windows Configuration - Import-LMCertificate](<../../powershell/Import-LMCertificate.md>)

## User Parameters

### For Certificate Stored on Local Machine:

| Name      | Example                                   | Accepted Values                                                                                                                                                                                                                                 | Required | Default | Type        | Description                                             |
|-----------|-------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|-------------|---------------------------------------------------------|
| Path      | C:/Users/MyUser/Downloads/ThisStrangeCert.cer |                                                                                                                                                                                                                                              | True     |         | Text String | The path to a certificate file to import.              |
| CertStore | My                                        | - My - ROOT - trust - CA - TrustedPublisher - Disallowed - AuthRoot - TrustedPeople - REQUEST - SmartCardRoot - AddressBook - UserdDS                                                                                                     | True     | My      | Text String | The set of LocalMachine stores to store the target certificate in. |

### To Create and Import a Self-Signed Certificate:

| Name            | Example          | Accepted Values                                                                 | Required | Default | Type        | Description                                             |
|-----------------|------------------|--------------------------------------------------------------------------------|----------|---------|-------------|---------------------------------------------------------|
| SubjectName     | ThisNewCert      |                                                                                | True     |         | Text String | The subject name for the created certificate.          |
| Type            | Custom           | - CodeSigningCert - Custom - DocumentEncryptionCert - DocumentEncryptionCertLegacyCsp - SSLServerAuthentication | True     |         | Text String | The type of certificate to create.                     |
| CertStore       | My               | - My - ROOT - trust - CA - TrustedPublisher - Disallowed - AuthRoot - TrustedPeople - REQUEST - SmartCardRoot - AddressBook - UserdDS | True     | My      | Text String | The set of LocalMachine stores to store the target certificate in. |
| KeyLength       | 2048             | KeyLength % 1024 = 0 Examples: 1024, 2048, 3072, 4096, 5120, 6144, 7168, 8192 | True     | 2048    | Number Value | The length of the key for the created certificate.      |
| Provider        | Microsoft Enhanced RSA and AES Cryptographic Provider | - Microsoft Base Cryptographic Provider v1.0 - Microsoft Base DSS and Diffie-Hellman Cryptographic Provider - Microsoft Base DSS Cryptographic Provider - Microsoft Base Smart Card Crypto Provider - Microsoft DH SChannel Cryptographic Provider - Microsoft Enhanced Cryptographic Provider v1.0 - Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider - Microsoft Enhanced RSA and AES Cryptographic Provider - Microsoft RSA SChannel Cryptographic Provider - Microsoft Strong Cryptographic Provider | True     | Microsoft Enhanced RSA and AES Cryptographic Provider | Text String | The provider for the created certificate.              |
| KeyExportPolicy  | ExportableEncrypted | - Exportable - ExportableEncrypted - NonExportable                       | True     | ExportableEncrypted | Text String | The export policy for the created certificate.         |
| KeyUsage        | None             | - CertSign - CRLSign - DataEncipherment - DecipherOnly - DigitalSignature - EncipherOnly - KeyAgreement - KeyEncipherment - None - NonRepudiation | True     | None    | Text String | The Key Usage for a created certificate.               |
| KeyAlgorithm    | RSA              | - RSA - ECDSA_nistP256 - ECDSA_nistP384 - ECDSA_brainpoolP256r1 - ECDSA_brainpoolP384r1 - ECDSA_brainpoolP512r1 - ECDSA_nistP192 - ECDSA_nistP224 - ECDSA_nistP521 - ECDSA_secP160k1 - ECDSA_secP160r1 - ECDSA_secP160r2 - ECDSA_secP192k1 - ECDSA_secP192r1 - ECDSA_secP224k1 - ECDSA_secP224r1 - ECDSA_secP256k1 - ECDSA_secP256r1 - ECDSA_secP384r1 - ECDSA_secP521r1 - ECDSA_brainpoolP160r1 - ECDSA_brainpoolP160t1 - ECDSA_brainpoolP192r1 - ECDSA_brainpoolP192t1 - ECDSA_brainpoolP224r1 - ECDSA_brainpoolP224t1 - ECDSA_brainpoolP256r1 - ECDSA_brainpoolP256t1 - ECDSA_brainpoolP320r1 - ECDSA_brainpoolP320t1 - ECDSA_brainpoolP384r1 - ECDSA_brainpoolP384t1 - ECDSA_brainpoolP512r1 - ECDSA_brainpoolP512t1 - ECDSA_ec192wapi - ECDSA_nistP192 - ECDSA_nistP224 - ECDSA_nistP256 - ECDSA_nistP384 - ECDSA_nistP521 - ECDSA_secP160k1 - ECDSA_secP160r1 - ECDSA_secP160r2 - ECDSA_secP192k1 - ECDSA_secP192r1 - ECDSA_secP224k1 - ECDSA_secP224r1 - ECDSA_secP256k1 - ECDSA_secP256r1 - ECDSA_secP384r1 - ECDSA_secP521r1 - ECDSA_wtls7 - ECDSA_wtls9 - ECDSA_wtls12 - ECDSA_x962P192v1 - ECDSA_x962P192v2 - ECDSA_x962P192v3 - ECDSA_x962P239v1 - ECDSA_x962P239v2 - ECDSA_x962P239v3 - ECDSA_x962P256v1 | True     | RSA     | Text String | The Key Algorithm for the created certificate.        |

![Image](../../../static/img/Import-LMCertificate/image_5.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation](../../../static/img/Import-LMCertificate/image_6.png)  
![Another Task Creation](../../../static/img/Import-LMCertificate/image_7.png)

**Name:** `Import LMCertificate`  
**Description:** `Import a certificate to one or more local machine stores. The target certificate can be a .CER file, a .CRT file, or a self-signed certificate that will be created.`  
**Category:** `Custom`  
![Task Category](../../../static/img/Import-LMCertificate/image_8.png)

## Parameters

### Path:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Import-LMCertificate/image_9.png)

This screen will appear.  
![Parameter Screen](../../../static/img/Import-LMCertificate/image_10.png)

- Set `Path` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](../../../static/img/Import-LMCertificate/image_11.png)

### SubjectName:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Import-LMCertificate/image_9.png)

This screen will appear.  
![Parameter Screen](../../../static/img/Import-LMCertificate/image_10.png)

- Set `SubjectName` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](../../../static/img/Import-LMCertificate/image_12.png)

### Type:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Import-LMCertificate/image_9.png)

This screen will appear.  
![Parameter Screen](../../../static/img/Import-LMCertificate/image_10.png)

- Set `Type` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](../../../static/img/Import-LMCertificate/image_13.png)

### CertStore:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Import-LMCertificate/image_9.png)

This screen will appear.  
![Parameter Screen](../../../static/img/Import-LMCertificate/image_10.png)

- Set `CertStore` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `My` in the `Value` field.
- Click the `Save` button.

![Save Parameter](../../../static/img/Import-LMCertificate/image_14.png)

### KeyLength:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Import-LMCertificate/image_9.png)

This screen will appear.  
![Parameter Screen](../../../static/img/Import-LMCertificate/image_10.png)

- Set `KeyLength` in the `Parameter Name` field.
- Select `Number Value` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `2048` in the `Value` field.
- Click the `Save` button.

![Save Parameter](../../../static/img/Import-LMCertificate/image_15.png)

### Provider:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Import-LMCertificate/image_9.png)

This


