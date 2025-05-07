---
id: '4c93e57c-0959-4f9e-9557-6f5974866782'
slug: /4c93e57c-0959-4f9e-9557-6f5974866782
title: 'Remove-McAfeeSoftware'
title_meta: 'Remove-McAfeeSoftware'
keywords: ['remove', 'mcafee', 'uninstall', 'cleanup']
description: 'Documentation for the Remove-McAfeeSoftware command to remove all McAfee products from an endpoint.'
tags: ['security', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Description
Removes all McAfee products from an endpoint.

## Requirements
MCPR extracted files located at [https://file.provaltech.com/repo/tools/mcafeeremoval.zip](https://file.provaltech.com/repo/tools/mcafeeremoval.zip).  
The license code needed for the uninstaller to run changes dynamically each time the tool is updated. Thus, a copy of the tool is being downloaded from the ProVal repository.

## Usage
Runs McAfee's publicly available Removal Tool with parameters to remove all products.

**Note:** The removal parameters are not currently documented, so it is not feasible to pick and choose which products to remove.

```powershell
.\Remove-McAfeeSoftware.ps1
```

## Output
- .\mccleanup.log
- .\Remove-McAfeeSoftware-log.txt
- .\Remove-McAfeeSoftware-error.txt

