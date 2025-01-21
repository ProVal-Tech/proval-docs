---
id: ps-update-veeamvulnerabilitiespatch
title: 'Update-VeeamVulnerabilitiesPatch'
title_meta: 'Update-VeeamVulnerabilitiesPatch Command'
keywords: ['veeam', 'patch', 'vulnerabilities', 'update']
description: 'Documentation for the Update-VeeamVulnerabilitiesPatch command to patch Veeam vulnerabilities in Versions 11 and 11a.'
tags: ['backup', 'security', 'software', 'update']
draft: false
unlisted: false
---

## Description
Patches Veeam vulnerabilities in Versions 11 and 11a.

## Requirements
- Requires Veeam 11 or 11a. All previous versions require manual installation from ISO.
- Requires a manual restart after the process is complete before Veeam can be reopened.

## Usage
Follows guidelines from [Veeam Help Center](https://helpcenter.veeam.com/docs/backup/vsphere/update_unattended.html?ver=110).  
Uses the `Veeam.Backup.Powershell` module to check jobs and restores before, and recover their state after, the installation.

```powershell
C:\> .\Update-VeeamVulnerabilitiesPatch.ps1
```

## Output
Location of output for log, result, and error files:

- `$env:Windir\temp\veeam\Update-VeeamVulnerabilitiesPatch-log.txt`
- `$env:Windir\temp\veeam\Update-VeeamVulnerabilitiesPatch-error.txt`
- `$env:Windir\temp\veeam\Update-VeeamVulnerabilitiesPatch-patchlog.txt`

