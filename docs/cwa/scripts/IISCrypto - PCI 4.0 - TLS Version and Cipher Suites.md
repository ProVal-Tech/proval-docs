---
id: 'bd4671b7-d40d-452a-a41e-0e5451e2bddf'
title: 'IISCrypto - PCI 4.0 - TLS Version and Cipher Suites'
title_meta: 'IISCrypto - PCI 4.0 - TLS Version and Cipher Suites'
---

## Summary

The script downloads and runs IISCryptoCLI, applying the `pci4.0` template. The PCI 4.0 template was created and placed in the partner's LTShare.

## Requirements

Place the attached `Pci4.0_Template.ictpl` file under the "LTShare/Transfer/configs" directory as `Pci4.0_Template.ictpl` on the Automate Server. This path can be found at the WebDAV login for the hosted partners.

## Sample Run

![Sample Run](../../../static/img/IISCrypto---PCI-4.0---TLS-Version-and-Cipher-Suites/image_1.png)

## Dependencies

[Download IISCrypto CLI](https://www.nartac.com/Downloads/IISCrypto/IISCryptoCli.exe)

## Variables

| Name               | Description                                   |
|--------------------|-----------------------------------------------|
| ProjectName        | IISCrypto_PCI_4_0                            |
| WorkingDirectory    | C:/ProgramData/_automation/script/IISCrypto_PCI_4_0 |
| ShellResult        | Output of the command applying the template    |

## Output

### Script Logs

**Expected Output:**

```
IIS Crypto CLI 3.3

Created by Nartac Software Inc.  www.nartac.com
Copyright (c) 2011-2022 Nartac Software Inc.

Registry exported to file: C:/ProgramData/_automation/script/IISCrypto_PCI_4_0/IISCrypto_PCI_4_0Backup.reg
Template applied: PCI 4.0
```
## Attachments
[Pci4.0_Template.ictpl](<..\..\..\static\attachments\itg\12486318\Pci4.0_Template.ictpl>)
