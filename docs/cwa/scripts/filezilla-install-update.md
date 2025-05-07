---
id: '154e2b72-d73f-4693-a316-7a296e4793ec'
slug: /154e2b72-d73f-4693-a316-7a296e4793ec
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
**File Hash (Sha256):** `052FCB4A5726EE426AA825ACE364D225D350C8A65829F6693E1527E974D8F168`  
**File Hash (MD5):** `C3C3A88EBC04B3D4E821187ABFEDBF7B`

## Sample Run

![Image1](../../../static/img/docs/154e2b72-d73f-4693-a316-7a296e4793ec/image1.png)

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

**Note:** The script does not create tickets by default. Tickets are generated only when the script is executed as an Autofix from an internal monitor with a configured ticket category. It is used as an Autofix for the [Update FileZilla](/docs/ea7ef637-8620-499a-a982-a805a11e14c7) monitor set. To enable ticketing, assign a ticket category to this monitor set.  
![Image2](../../../static/img/docs/154e2b72-d73f-4693-a316-7a296e4793ec/image2.png)