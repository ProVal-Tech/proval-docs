---
id: ps-remove-mcafeesoftware
title: 'Remove-McAfeeSoftware'
title_meta: 'Remove-McAfeeSoftware Command'
keywords: ['remove', 'mcafee', 'uninstall', 'cleanup']
description: 'Documentation for the Remove-McAfeeSoftware command to remove all McAfee products from an endpoint.'
tags: ['uninstallation', 'security', 'software']
draft: false
unlisted: false
---
## Description
Removes all McAfee products from an endpoint.

## Requirements
MCPR extracted files located at https://file.provaltech.com/repo/tools/mcafeeremoval.zip
The license code needed for the uninstaller to run changes dynamically each time the tool is updated. Thus, a copy of the tool is being downloaded from the ProVal repo.

## Usage
Runs McAfee's publicly available Removal Tool with parameters to remove all products.

Note: The removal parameters are not currently documented, so it is currently unfeasible to pick and choose which products to remove.



```powershell
.\Remove-McAfeeSoftware.ps1
```

## Output
    .\mccleanup.log
    .\Remove-McAfeeSoftware-log.txt
    .\Remove-McAfeeSoftware-error.txt




