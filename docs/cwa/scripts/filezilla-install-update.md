---
id: '154e2b72-d73f-4693-a316-7a296e4793ec'
title: 'FileZilla - Install/Update'
title_meta: 'FileZilla - Install/Update'
keywords: ['filezilla', 'latest-version', 'install-update', 'useragent']
description: 'The script installs the latest version of FileZilla on a Windows computer.'
tags: ['application', 'update']
draft: false
unlisted: false
---

## Summary

The script installs the latest version of FileZilla on a Windows computer. If the application is missing, it will install it, and if outdated, it will update it to the latest version. When executed as an Autofix from an internal monitor with a configured ticket category, the script can generate a ticket in case of failure.

## File Hash

**File Path:** `C:\ProgramData\_automation\Script\Update-FileZilla\Update-FileZilla.ps1`  
**File Hash (Sha256):** `376517CB05FF7FF8C5221E7BC1A71A9AA41A68D52637FDFBA822711BF9FFE63A`  
**File Hash (MD5):** `C266CC972F27F56435C30B09518A563C`

## Sample Run

![Image1](../../../static/img/cwa-script-filezilla-install-update/image1.png)

## Output

- Script logs
- Ticket (if enabled)

## Ticketing

**Subject:** `FileZilla Latest Version Installation Failed`

**Ticket Body:**

```plaintext
The script encounter an error when running the process. 

Output: 
<Output of the PowerShell script>
```

**Note:** The script does not create tickets by default. Tickets are generated only when the script is executed as an Autofix from an internal monitor with a configured ticket category. It is used as an Autofix for the [Update FileZilla](../monitors/update-filezilla.md) monitor set. To enable ticketing, assign a ticket category to this monitor set.  
![Image2](../../../static/img/cwa-script-filezilla-install-update/image2.png)
