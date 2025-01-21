---
id: ps-install-gcpw
title: 'Install-GCPW'
title_meta: 'Install-GCPW Command'
keywords: ['install', 'gcpw', 'google', 'credential', 'provider']
description: 'Documentation for the Install-GCPW command to automate the installation and configuration of Google Credential Provider for Windows (GCPW).'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Description
Automates the installation and configuration of Google Credential Provider for Windows (GCPW).

## Requirements
- Run as Administrator
- Version 5

## Usage
1. Checks if Google Chrome is installed. If not, it installs Google Chrome.
2. Checks if GCPW is installed. If not, it installs GCPW.
3. Sets the allowed domains for GCPW login by updating the registry.
4. Optionally sets the enrollment token for GCPW by updating the registry.
5. Performs verification steps to ensure the registry keys for domains and the enrollment token (if provided) are correctly set.
6. Cleans up installation files and logs the installation process.

## Examples
```powershell
.\Install-GCPW.ps1 -DomainsAllowed "solarmora.com","altostrat.com"
```
Installs Google Chrome (if missing), GCPW (if missing), and configures it for the specified domains.

```powershell
.\Install-GCPW.ps1 -DomainsAllowed "solarmora.com" -enrollmentToken "your_enrollment_token"
```
Installs Google Chrome (if missing), GCPW (if missing), and configures it for the specified domain, applying the enrollment token.

## Parameters
|     Parameter      | Alias | Required | Default | Type   | Description                                        |
| ------------------ | ----- | -------- | ------- | ------ | -------------------------------------------------- |
| `DomainsAllowed`   |       | True     |         | String | Domain(s) users are allowed to sign in from.      |
| `enrollmentToken`  |       | False    |         | String | Set token to manage GCPW from the Admin console.   |

## Output
- `.\Install-GCPW-log.txt`
- `.\Install-GCPW-error.txt`
