---
id: '98fbfa80-d18a-4073-98cf-ef75e145d0c1'
slug: /98fbfa80-d18a-4073-98cf-ef75e145d0c1
title: 'ESET Product - Uninstall [Param]'
title_meta: 'ESET Product - Uninstall [Param]'
keywords: ['ESET', 'Uninstall', 'Security', 'Antivirus', 'AV']
description: ''
tags: ['security', 'antivirus', 'uninstallation']
draft: false
unlisted: false
---

## Summary
Uninstalls ESET products from the system, with optional password protection.

## Sample Run

![Sample Run](../../../static/img/docs/uninstall-esetproduct/image.png)
![Sample Run 1](../../../static/img/docs/uninstall-esetproduct/image-1.png)

#### User Parameters

| Name                | Example                                 | Required | Description                                                                                                                                                   |
|---------------------|-----------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| passwordprotected                | 0 or 1 | False      | Set to "1" if ESET uninstallation requires a password. Default is "0".                           |
| password    | testing                                       | False     | The password for ESET uninstallation. Required only if passwordprotected is "1". |

## Process

Uninstalls ESET products from the system, with optional password protection.

.EXAMPLE
    
    .\Uninstall-ESET.ps1

    Uninstalls ESET products without password protection.

    .\Uninstall-ESET.ps1 -passwordprotected 1 -password "YourPassword"
    
    Uninstalls ESET products with password protection.


## Output

- Script Logs
- Create log file at working directory