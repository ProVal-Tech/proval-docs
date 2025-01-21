---
id: 'b0c17ff1-73a8-41ae-af16-901eade975b2'
title: 'Processor Architecture Info'
title_meta: 'Processor Architecture Info'
keywords: ['architecture', 'processor', 'windows', 'cim', 'system']
description: 'This document provides information on processor architecture, detailing the numeric values corresponding to various architectures such as x86, MIPS, Alpha, PowerPC, ARM, Itanium, AMD64, and ARM64. It also includes detection settings and a sample image for reference.'
tags: ['cim', 'windows']
draft: true
unlisted: false
---

## Summary

This role provides information about the processor architecture.

The role results in a numeric value whose meaning is written in curly braces:

```
0 { x86 }
1 { MIPS }
2 { Alpha }
3 { PowerPC }
5 { ARM }
6 { Itanium-based systems (ia64) }
9 { AMD64 }
12 { ARM64 }
default { Unknown architecture }
```

## Settings

| Detection String                                                                                                                                                               | Comparator | Result      | Applicable OS |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|-------------|----------------|
| \{@%C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Architecture"@%} | Exists     | 0, 9, 12, etc. | Windows        |

## Sample

![Sample Image](../../static/img/Dynamic-Processor-Architecture-Role/image_1.png)
