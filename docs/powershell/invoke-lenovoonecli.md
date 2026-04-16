---
id: 'b689dc40-1f6d-4a1b-aca8-d5d5e3ccbb6b'
slug: /b689dc40-1f6d-4a1b-aca8-d5d5e3ccbb6b
title: 'Invoke-LenovoOneCLI'
title_meta: 'Invoke-LenovoOneCLI'
keywords: ['lenovo', 'update', 'firmware', 'driver']
description: 'This is a PowerShell wrapper that automates the deployment of Lenovo OneCLI by packaging it from a provided ZIP URL, caching it locally, and orchestrating its execution on supported Lenovo systems.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Description
Lenovo OneCLI is a comprehensive management utility that enables centralized discovery, inventory, and lifecycle management of firmware and driver updates for supported Lenovo servers and systems. It provides capabilities for scanning systems, downloading updates, and deploying firmware and driver patches across ThinkEdge, ThinkSystem, ThinkServer, and Wentian platforms.

`Invoke-LenovoOneCLI.ps1` is a PowerShell wrapper that automates the deployment of Lenovo OneCLI by packaging it from a provided ZIP URL, caching it locally, and orchestrating its execution on supported Lenovo systems.

# Requirements
- Windows PowerShell session with administrative privileges to install/import modules and write to `C:\ProgramData`.
- Internet connectivity to download the OneCLI ZIP package and PowerShell modules from PSGallery.
- Supported Lenovo system:
  - Manufacturer must be Lenovo
  - System model must be one of: ThinkEdge, ThinkSystem, ThinkServer, or Wentian


# Process
1. **Bootstraps environment**:
    - Sets TLS/security settings
    - Ensures `NuGet` provider exists
    - Installs or updates `Strapper` and imports it
2. **Validates device eligibility:**
    - Exits if manufacturer is not Lenovo
    - Exits if BIOS/product details do not match supported patterns
3. **Prepares working path:**
    - `C:\ProgramData\_Automation\App\Install-LXCE-OneCLI`
4. **Tracks URL state:**
    - Reads previous URL from persistent store table `LXCE-OneCLI-URL`
    - Re-downloads if URL changed, URL is missing, or `-Force` is used
5. **Downloads and extracts payload:**
    - Saves ZIP as `Onecli.zip`
    - Extracts to working directory
    - Verifies `Onecli.exe` exists
6. **Executes OneCLI:**
    - If `-Argument` is provided, runs custom argument string
    - Otherwise runs default command:
      - `Onecli.exe update scan --output <workingDirectory>`


# Payload Usage
This script downloads a payload URL containing the OneCLI executable. The payload must be a ZIP file containing `Onecli.exe` at the root or within a predictable directory structure after extraction. 

Basic payload execution:

```powershell
.\Invoke-LenovoOneCLI.ps1 -URL 'https://example.com/Onecli.zip'
```

Force refresh payload even when URL is unchanged:

```powershell
.\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Force
```

Run with custom OneCLI arguments:

- Download all latest updates:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update acquire --mt 7Z73 --ostype win2022 --scope latest --dir C:\updates'
```

- Download only firmware updates:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update acquire --mt 7Z73 --ostype win2022 --scope latest --dir C:\updates --type fw'
```

- Download only Driver updates:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update acquire --mt 7Z73 --ostype win2022 --scope latest --dir C:\updates --type dd'
```

- Apply all downloaded updates:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update flash --dir C:\updates'
```

- Apply firmware only:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update flash --dir C:\updates --type fw'
```

- Apply Driver only:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update flash --dir C:\updates --type dd'
```

- Download and immediately apply all updates:
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update --mt 7Z73 --ostype win2022 --scope latest --dir C:\updates'
```

- With no reboot prompt (useful for scripting):
``` powershell
    .\Invoke-LenovoOneCLI.ps1 -URL 'https://download.lenovo.com/servers/mig/2025/11/10/63602/lnvgy_utl_lxce_onecli01s-5.4.0_windows_indiv.zip' -Argument 'update --mt 7Z73 --ostype win2022 --scope latest --dir C:\updates --noreboot'
```

**Notes:**

- If no `-Argument` is specified, the script performs a default scan and lists available updates, storing results in the working directory.
- If `-Argument` is provided, the script executes `Onecli.exe` with the specified arguments.
- The OneCLI download URL is version-specific and changes when new releases are published. To obtain the latest URL, visit https://support.lenovo.com/solutions/lnvo-tcli, locate the OneCLI Windows Utility package in the downloads section, and copy the download link from the Payload Files section.


# Parameters
| Parameter | Alias | Required | Default | Type | Description |
| --- | --- | --- | --- | --- | --- |
| `URL` | None | Yes | None | String | URL for the OneCLI ZIP to download. Available from the Lenovo support website (https://support.lenovo.com/solutions/lnvo-tcli).|
| `Force` | None | No | `False` | Switch | Forces download/extract even when the stored URL matches current URL. |
| `Argument` | None | No | None | String | Custom argument string passed to `Onecli.exe`. If omitted, the script uses the default scan command. |

# Output
- Script log output is written through `Write-Log` (Strapper logging pipeline).
- Primary working/output directory:
  - `C:\ProgramData\_Automation\App\Install-LXCE-OneCLI`
- Files generated/used in working directory include:
  - `Onecli.zip` (downloaded payload)
  - `Onecli.exe` (extracted executable)
  - OneCLI scan/output files when default or custom `--output` path targets this directory


## Changelog

### 2026-04-14

- Initial version of the document
