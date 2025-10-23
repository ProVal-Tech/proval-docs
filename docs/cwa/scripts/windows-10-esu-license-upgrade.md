---
id: '765670f5-5120-4066-89d8-2cda873e8212'
slug: /765670f5-5120-4066-89d8-2cda873e8212
title: 'Windows 10 ESU License Upgrade'
title_meta: 'Windows 10 ESU License Upgrade'
keywords: ['esu', 'license', 'extended', 'windows-10', '22h2']
description: 'Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems. The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date. It is intended for systems that cannot be upgraded immediately due to hardware, software compatibility, or organizational constraints.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Summary

Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems. The Windows 10 Extended Security Updates program provides critical security patches for up to three years beyond the official end of support date. It is intended for systems that cannot be upgraded immediately due to hardware, software compatibility, or organizational constraints.

**References:**

- [Enable Extended Security Updates](https://learn.microsoft.com/en-us/windows/whats-new/enable-extended-security-updates)
- [Deploy Windows 10 Security Updates with Intune or SCCM](https://www.systemcenterdudes.com/deploy-windows-10-extended-security-update-key-with-intune-or-sccm/)

## File Hash

- **File Path:** `C:\ProgramData\_automation\Script\Apply-Windows10ESULicense\Apply-Windows10ESULicense.ps1`  
- **File Hash (Sha256):** `3F6FB049BF64094BAEFE94B6216CAD60D769E7140DA6E42A021457923B78559B`  
- **File Hash (MD5):** `24CCB18FF0448B9BED43D7BC1D6F9B5E`  

## Sample Run

![Sample Run](../../../static/img/docs/2731179e-384e-4fda-907a-365368ebf742/image.webp)

## Dependencies

- [Script - ESU License Activation Detection](/docs/634db1b5-58a2-4571-8873-74040c203d56)
- [Solution - Windows 10 ESU Licensing and Auditing](/docs/7fe6a52b-79fd-487b-8009-523996e74d11)

## User Parameters

| Name      | Example                  | Required | Accepted Values | Description                                                                                       |
|-----------|--------------------------|----------|-----------------|----------------------------------------------------------------------------------|
| ESUKey    | xxxx-xxxx-xxxx-xxxx-xxxx | True     |                 | Provide the ESU license key for the Windows 10 extended support     |
| ESUYear   | 1                        | True     | 1, 2, 3         | Set this to the number of years for which the ESU license being issued. The max number is 3 as Microsoft has only allowed for maximum three years extension |

## Output

- Script log
