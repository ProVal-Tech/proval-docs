---
id: '57e5aedd-bea6-4301-88a8-d7c6ce8da88d'
slug: /57e5aedd-bea6-4301-88a8-d7c6ce8da88d
title: 'Enforce TLS SSL Hardening'
title_meta: 'Enforce TLS SSL Hardening'
keywords: ['tls','ssl','disable','enable','security-hardening','tls-1.2']
description: 'Enforces Windows TLS/SSL security hardening by disabling legacy protocols, enabling supported modern TLS versions, configuring .NET strong cryptography settings, disabling specified TLS cipher suites, and optionally initiating or prompting for a required system reboot.'
tags: ['azure', 'windows']
draft: false
unlisted: false 
last_update:
  date: 2026-10-02
---

## Overview

Enforces Windows TLS/SSL security hardening by disabling legacy protocols, enabling supported modern TLS versions, configuring .NET strong cryptography settings, disabling specified TLS cipher suites, and optionally initiating or prompting for a required system reboot.

## Implementation  

1. Download the component from the [`datto-rmm` repository](https://github.com/ProVal-Tech/datto-rmm):

   [Enforce TLS SSL Hardening](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/enforce-tls-ssl-hardening.cpt)

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

4. After Importing the component to the Datto RMM, make sure to add the component to the `PVAL` Group always.  
    - Steps to Add the component under `PVAL` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  
    ![Image 4](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image1.webp)  
    iii. Select the group as `PVAL`  
    ![Image 5](../../../static/img/docs/57e5aedd-bea6-4301-88a8-d7c6ce8da88d/group.webp)


## Sample Run

To execute the `Enforce TLS SSL Hardening` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Enforce TLS SSL Hardening` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Enforce TLS SSL Hardening` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Click on `Run` to execute the script:  
![Image](../../../static/img/docs/57e5aedd-bea6-4301-88a8-d7c6ce8da88d/script-run.webp)

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| `DisableLegacyProtocols` | `Boolean` | `False` | Set to true to disable SSL 3.0, TLS 1.0, TLS 1.1 |
| `EnableModernTls` | `Boolean` | `False` | Set to true to enable TLS 1.2 and TLS 1.3 |
| `ConfigureDotNet` | `Boolean` | `False` | Set to true to configure .NET strong crypto |
| `DisableWeakCiphers` | `Boolean` | `False` | Set to true to disable weak cipher suites |
| `ForceReboot` | `Boolean` | `False` | Select this option to reboot the machine and apply the changes immediately |

## Output

- stdOut  
- stdError

## Attachments  

- [Enforce TLS SSL Hardening](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/enforce-tls-ssl-hardening.cpt)

## Changelog

### 2026-10-02

- Added environment variables to independently control protocol, TLS, .NET, cipher, and reboot settings, along with improved OS detection and execution output.
 
### 2026-09-16
 
- Initial version of the document

