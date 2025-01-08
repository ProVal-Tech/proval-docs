---
id: 'cwa-iiscrypto-pci-template'
title: 'IIS Crypto PCI 4.0 Template Application'
title_meta: 'IIS Crypto PCI 4.0 Template Application'
keywords: ['iis',
## Summary

The script downloads and runs IISCryptoCLI, applying the `pci4.0` template. PCI4.0 template was created and placed in the partner's LTShare.

## Requirements

Place the attached `Pci4.0_Template.ictpl` file under the "LTShare\Transfer\configs" directory as `Pci4.0_Template.ictpl` on Automate Server. This path can be found at the WebDAV login for the hosted partners.

## Sample Run

![Sample Run](5078775/docs/12486318/images/17665852)

## Dependencies

[https://www.nartac.com/Downloads/IISCrypto/IISCryptoCli.exe](https://www.nartac.com/Downloads/IISCrypto/IISCryptoCli.exe)

## Variables

| Name              | Description                                   |
|-------------------|-----------------------------------------------|
| ProjectName       | IISCrypto_PCI_4_0                            |
| WorkingDirectory   | C:\ProgramData\_automation\script\IISCrypto_PCI_4_0 |
| ShellResult       | Output of the command applying the template    |

## Output

Script Logs

Expected Output: 

```
IIS Crypto CLI 3.3

Created by Nartac Software Inc.  www.nartac.com
Copyright (c) 2011-2022 Nartac Software Inc.

Registry exported to file: C:\ProgramData\_automation\script\IISCrypto_PCI_4_0\IISCrypto_PCI_4_0Backup.reg
Template applied: PCI 4.0
```

