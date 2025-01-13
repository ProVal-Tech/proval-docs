---
id: 'vsa-update-veeam-vulnerabilities-patch'
title: 'Update Veeam Vulnerabilities Patch'
title_meta: 'Update Veeam Vulnerabilities Patch'
keywords: ['veeam', 'patch', 'vulnerabilities', 'update', 'install']
description: 'This document provides an overview of the Update Veeam Vulnerabilities Patch, detailing the requirements, process, payload usage, and output locations for effectively patching vulnerabilities in Veeam versions 11 and 11a.'
tags: ['update', 'software', 'security', 'installation', 'windows']
draft: false
unlisted: false
---
## Overview

Patches Veeam vulnerabilities in Versions 11 and 11a: [https://www.veeam.com/kb4288](https://www.veeam.com/kb4288)

## Requirements

- Requires Veeam 11 or 11a. All previous versions require manual installation from ISO.
- Requires a manual restart after the process is complete, before Veeam can be reopened.

## Process

- Checks for running restore operations and breaks if found.
- Stops jobs from running during the installation.
- Downloads, unpacks, and installs the appropriate patch file for the currently installed version of Veeam.

## Payload Usage

Example:

```
PS C:\> .\Update-VeeamVulnerabilitiesPatch.ps1
```

## Output

Does the content write to the RMM log, a data file, or the console? If so, what is the syntax?

- `$env:Windir\temp\veeam\Update-VeeamVulnerabilitiesPatch-log.txt`
- `$env:Windir\temp\veeam\Update-VeeamVulnerabilitiesPatch-error.txt`
- `$env:Windir\temp\veeam\Update-VeeamVulnerabilitiesPatch-patchlog.txt`

## Locations

| Payload                | Github Scripts Repo |
|-----------------------|---------------------|
| ConnectWise Automate   |                     |
| ConnectWise RMM        |                     |
| Kaseya VSA            |                     |
| Datto RMM             |                     |


