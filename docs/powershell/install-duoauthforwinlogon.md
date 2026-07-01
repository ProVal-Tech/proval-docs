---
id: '810212d7-3608-4484-80fa-85dd23bc32ad'
slug: /810212d7-3608-4484-80fa-85dd23bc32ad
title: 'Install-DuoAuthForWinLogon'
title_meta: 'Install-DuoAuthForWinLogon'
keywords: ['duo', 'mfa', 'security', 'auto-deploy']
description: 'This script automates the installation and upgrade of Duo Authentication for Windows Logon.'
tags: ['security', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-07-01
---

## Overview

This script automates the installation and upgrade of Duo Authentication for Windows Logon. It downloads the latest installer directly from Duo, verifies its cryptographic signature via SHA‑256 hash, and performs a silent installation with the supplied integration key, secret key, and API hostname. All optional configuration parameters are passed through to the installer only when explicitly provided, allowing you to tailor the deployment without altering the installer’s own defaults. Temporary files are cleaned up automatically after validation.

## Requirements

- PowerShell 5.1 or later
- Administrative privileges (runs as SYSTEM or elevated user)
- Active internet connection (to download the installer and retrieve the authentic hash)
- Duo RDP application credentials: integration key (`IKEY`), secret key (`SKEY`), and API hostname (`HOST`)

## Process

1. **Environment preparation**  
   - TLS 1.2 (or 1.3, when available) is enforced for all web requests.  
   - The `Strapper` module is installed or updated to provide structured logging.

2. **Argument assembly**  
   - Mandatory parameters `IKEY`, `SKEY`, and `HOST` are always included.  
   - Optional parameters (e.g., `AUTOPUSH`, `FAILOPEN`, proxy settings) are appended only when explicitly passed to the script, preserving the installer’s defaults for everything else.

3. **Working directory**  
   - A folder is created under `%ProgramData%\_Automation\App\Duo_Authentication_for_Windows_Logon` to stage the installer.

4. **Version comparison**  
   - The script queries the installed version from the registry and determines the latest available version by inspecting the download URL’s `Content-Disposition` header.  
   - If the installed version is up‑to‑date, the script exits gracefully without re‑installation.

5. **Download and hash verification**  
   - The installer is downloaded from `https://dl.duosecurity.com/duo-win-login-latest.exe`.  
   - The SHA‑256 hash of the downloaded file is compared against the authentic checksum published at `https://duo.com/docs/checksums#duo-windows-logon`. The script will abort if the hash does not match.

6. **Installation**  
   - Any pending MSI operations are terminated to avoid conflicts.  
   - The installer is launched silently with the assembled arguments.

7. **Post‑installation validation**  
   - The script re‑checks the registry to confirm the installed version matches the expected latest version.

8. **Cleanup**  
   - The working directory and all staged files are removed.

## Payload Usage

**Minimal installation with mandatory parameters only:**

```powershell
.\Install-DuoAuthForWinLogon.ps1 -IKEY "DIABCDEFGHIJKLMNOP" -SKEY "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6" -HOST "api-XXXXXXXX.duosecurity.com"
```

**Disable automatic push, enable fail‑open, and require Duo for RDP only:**

```powershell
.\Install-DuoAuthForWinLogon.ps1 -IKEY "DIABCDEFGHIJKLMNOP" -SKEY "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6" -HOST "api-XXXXXXXX.duosecurity.com" -AUTOPUSH 0 -FAILOPEN 1 -RDPONLY 1
```

**Configure an upstream HTTP proxy:**

```powershell
.\Install-DuoAuthForWinLogon.ps1 -IKEY "DIABCDEFGHIJKLMNOP" -SKEY "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6" -HOST "api-XXXXXXXX.duosecurity.com" -PROXYHOST "proxy.corp.local" -PROXYPORT 8080
```

**Enforce Duo at logon and UAC elevation, with offline access enabled for elevation prompts:**

```powershell
.\Install-DuoAuthForWinLogon.ps1 -IKEY "DIABCDEFGHIJKLMNOP" -SKEY "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6" -HOST "api-XXXXXXXX.duosecurity.com" -UAC_PROTECTMODE 2 -UAC_OFFLINE 1
```

**Use custom log file rotation settings:**

```powershell
.\Install-DuoAuthForWinLogon.ps1 -IKEY "DIABCDEFGHIJKLMNOP" -SKEY "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6" -HOST "api-XXXXXXXX.duosecurity.com" -LOGFILE_MAXCOUNT 10 -LOGFILE_MAXSIZEMB 50
```

## Parameters

| Parameter | Required | Default | Type | Description |
| --- | --- | --- | --- | --- |
| `IKEY` | **True** | *(none)* | String | Duo RDP application integration key. |
| `SKEY` | **True** | *(none)* | String | Duo RDP application secret key. |
| `HOST` | **True** | *(none)* | String | Duo API hostname (e.g. `api-XXXXXXXX.duosecurity.com`). |
| `AUTOPUSH` | False | `1` | Int (0/1) | Automatically send a push request (`1`) or disable automatic push (`0`). |
| `FAILOPEN` | False | `0` | Int (0/1) | Allow access if Duo is unreachable (`1`) or block without MFA (`0`). |
| `RDPONLY` | False | `0` | Int (0/1) | Require Duo only for remote logons (`1`) or for console and RDP (`0`). |
| `SMARTCARD` | False | `0` | Int (0/1) | Enable smart card login as an alternative to Duo (`1`) or disable it (`0`). |
| `WRAPSMARTCARD` | False | `0` | Int (0/1) | After smart card primary logon, require Duo (`1`) or allow without Duo (`0`). |
| `ENABLEOFFLINE` | False | `1` | Int (0/1) | Enable offline access (`1`) or disable it completely (`0`). |
| `USERNAMEFORMAT` | False | `1` | Int (0‑2) | Username format: `0`=sAMAccountName, `1`=NTLM domain\username, `2`=userPrincipalName. |
| `PROXYHOST` | False | *(not set)* | String | Hostname or IP of an upstream HTTP proxy for Duo communications. |
| `PROXYPORT` | False | *(not set)* | Int | Port number for the HTTP proxy. |
| `LOGFILE_MAXCOUNT` | False | *(not set)* | Int | Number of rotated log files to retain. |
| `LOGFILE_MAXSIZEMB` | False | *(not set)* | Int | Maximum size (MB) of a rotated log file. |
| `UAC_PROTECTMODE` | False | `0` | Int (0‑2) | UAC behavior: `0`=respect existing Duo logon control, `1`=disable Duo at logon (only UAC elevation), `2`=enforce Duo at both logon and UAC elevation. |
| `UAC_OFFLINE` | False | `1` | Int (0/1) | Enable offline access for UAC elevation (`1`) or disable it (`0`). |
| `UAC_OFFLINE_ENROLL` | False | `1` | Int (0/1) | Allow offline enrollment during UAC elevation (`1`) or prevent it (`0`). |
| `ENABLECERTPINNING` | False | `1` | Int (0/1) | Enable certificate pinning (`1`) or disable it (`0`). |

## Notes

- The script **must** be run from an elevated PowerShell console (Administrator).
- Internet connectivity is required to download the installer and retrieve the authentic SHA‑256 hash. If a proxy is needed for the *script’s own downloads*, ensure the system proxy is configured or pass the `-Proxy` parameter to `Invoke-WebRequest` if you modify the script. (Currently `PROXYHOST` and `PROXYPORT` are forwarded only to the Duo installer.)
- The integrity of the downloaded installer is always verified against the official Duo checksum. If the check fails, the script throws a terminating error.
- If the latest version is already installed, no installation is performed and the script exits with a success message.
- Only parameters that you explicitly supply are appended to the installer command line. For all other settings, the Duo installer uses its own documented defaults.
- Logging is handled by the **Strapper** module. The log files are written directly to the folder from which the script is executed (e.g., `.\Install-DuoAuthForWinLogon-log.txt` and `.\Install-DuoAuthForWinLogon-error.txt`).
- The working directory `%ProgramData%\_Automation\App\Duo_Authentication_for_Windows_Logon` is removed entirely after a successful (or failed) run.

## Output

- **Logs** (created in the same directory as the script):  
  - `.\Install-DuoAuthForWinLogon-log.txt`  
  - `.\Install-DuoAuthForWinLogon-error.txt`

- **Installed product**: Appears as “Duo Authentication for Windows Logon” in Programs and Features.

- **Temporary files**: All files under `%ProgramData%\_Automation\App\Duo_Authentication_for_Windows_Logon` are deleted at the end of the script.

## References

- [Duo Windows Logon latest installer](https://dl.duosecurity.com/duo-win-login-latest.exe)
- [Duo Windows Logon checksum verification](https://duo.com/docs/checksums#duo-windows-logon)
- [Duo Authentication for Windows Logon documentation (knowledge base article)](https://help.duo.com/s/article/1090?language=en_US)

## Changelog

### 2025-07-01

- Initial version of the document
