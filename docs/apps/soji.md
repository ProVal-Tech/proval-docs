---
id: 'c762e174-5262-44b9-a3e9-97ca9ff94afc'
slug: /c762e174-5262-44b9-a3e9-97ca9ff94afc
title: 'Soji'
title_meta: 'Soji'
keywords: ['soji', 'cleanmgr', 'disk-cleanup']
description: 'Soji is an intelligent yet simple disk cleanup utility that uses both native `System.IO` file and directory management and `COM` references to the deprecated cleanmgr tool to tidy up one or more volumes on a Windows system.'
tags: ['disk', 'disk-cleanup']
draft: false
unlisted: false
last_update:
  date: 2026-07-14
---

<br />
<div align="center">
    <a href="https://content.provaltech.com/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc">
        <img src="https://raw.githubusercontent.com/ProVal-Tech/proval-docs/refs/heads/main/static/img/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc/soji.webp" alt="Logo" width="150" height="150" />
    </a>
    <h3 align="center">掃除 (Sōji)</h3>
    <p align="center">A Windows drive cleaner.</p>
</div>

## About

Soji is an intelligent yet simple disk cleanup utility that uses both native `System.IO` file and directory management and `COM` references to the deprecated [cleanmgr](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cleanmgr) tool to tidy up one or more volumes on a Windows system.

### Built With

* [.NET 8.0](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) (Configured to automatically roll forward to newer major versions)

### Important Note

Soji is a destructive application by nature in that it deletes files and folders. **Take great care when using the `--days`, `--systempaths`, and `--userpaths` arguments.**

## Getting Started

Install a supported .NET Desktop Runtime (8.0, 9.0, 10.0, or newer) and then simply download and run Soji.exe to get started.

> **Note on Compatibility:** While Soji is compiled against .NET 8, it is configured using the `<RollForward>Major</RollForward>` property. This ensures that the application will automatically and seamlessly run on .NET 9, .NET 10, or future major desktop runtimes if .NET 8 is not installed on the host machine. This was implemented to guarantee continued functionality and security as older runtimes reach their End of Life.

### Prerequisites

* .NET 8.0 Desktop Runtime (or a newer major version, such as .NET 9 or 10)

  ```shell
  winget install Microsoft.DotNet.DesktopRuntime.10
  ```

  or

  ```powershell
  try { & ([scriptblock]::Create((Invoke-RestMethod -Uri 'https://contentrepo.net/repo/script/optimize-dotnetruntime.ps1'))) -Action Install -Type desktopRuntime -Version 10 -ErrorAction Stop; return 'Success: .Net 10 Desktop Runtime installation completed successfully.' } catch { throw ('Error: Failed to install .Net 10 Desktop Runtime. Reason: {0}' -f $Error[0].Exception.Message) }
  ```

## Usage

Soji will run just fine without any command-line options passed, but you may want to read up on the options below to see if you have a use-case for them.

### Arguments

| Long Name            | Short Name | Example                                                  | Description                                                                                                                  |
| -------------------- | ---------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `--drives`           | `-d`       | C,D                                                      | (Default: All fixed drives) A comma-separated list of volume letters to process.                                             |
| `--days`             | `-y`       | 10.1                                                     | (Default: 7.0) The maximum number of days between now and the last write time of files to keep.                              |
| `--json`             | `-j`       |                                                          | (Default: false) Include JSON file output.                                                                                   |
| `--csv`              | `-c`       |                                                          | (Default: false) Include CSV file output.                                                                                    |
| `--systempaths`      | `-p`       | "Temp\|\\.txt$","system32\Temp"                          | (Default: null) An optional comma separated list of additional paths to scan for files to clean with regex file filtering.   |
| `--userpaths`        | `-u`       | "AppData\Local\Adobe\|\\.log$","AppData\Local\Microsoft" | (Default: null) An optional comma separated list of additional user paths to scan with regex file filtering.                 |
| `--purge-downloads`  |            |                                                          | (Default: false) Purge all user Downloads folders.                                                                           |
| `--clean-winsxs`     |            |                                                          | (Default: false) Enable WinSxS component cleanup.                                                                            |
| `--run-cleanmgr`     |            |                                                          | (Default: false) Enable legacy cleanmgr execution.                                                                           |
| `--empty-recyclebin` |            |                                                          | (Default: false) Empty the recycle bin. May still occur when running the legacy cleanmgr.                                    |
| `--winsxs-seconds`   |            |                                                          | (Default: 300) The number of seconds to wait for WinSxS processing when --clean-winsxs or --all is passed.                   |
| `--all`              |            |                                                          | (Default: false) Enable all possible cleaning tools (--purge-downloads, --clean-winsxs, --run-cleanmgr, --empty-recyclebin). |
| `--debug`            |            |                                                          | (Default: false) Set this flag to enable debug output in the console.                                                        |

### Examples

*Clean all fixed drives with all available cleaners:*

```shell
Soji.exe --all
```

*Clean the C and F drives:*

```shell
Soji.exe --drives C,F
```

*Clean the C drive including all user Download directories in PowerShell:*

```powershell
Start-Process -FilePath "Soji.exe" `
              -ArgumentList "--drives C", "--purge-downloads" `
              -Wait
```

*Clean all fixed drives and read back the file JSON report in PowerShell:*

```powershell
Start-Process -FilePath "$pwd\Soji.exe" `
              -ArgumentList "--json" `
              -Wait
$sojiFileReport = (ConvertFrom-Json -InputObject (Get-Content -Path "$pwd\SojiLogs\Soji-files.json")).Files
```

*Clean all fixed drives with all available cleaners including the following:*

*1. All `.txt` files that start with "Arigatou" under `?:\MyFolder\MySubfolder`*

*2. All `.log` files under the user paths `?:\Users\<Username>\AppData\MyAppPath\Logs`*

*Any target files must have a last write time greater than 21.5 days.*

*Read back the file CSV report in PowerShell.*

```powershell
Start-Process -FilePath "$pwd\Soji.exe" `
              -ArgumentList `
                '--csv', `
                '-p "MyFolder\MySubfolder|^Arigatou.*\.txt$"', `
                '-u "AppData\MyAppPath\Logs|\.log$"', `
                '--days 21.5' `
                '--all' `
              -Wait
$sojiFileReport = Import-CSV -Path "$pwd\SojiLogs\Soji-files.csv"
```

## Outputs

Soji outputs logs in a folder under the current working directory called `SojiLogs`. If `--csv` and/or `--json` are passed, the requested types of reports will be generated in the same `SojiLogs` folder. Historical logs and reports will be prepended with their last write time in the format `_yyyyMMdd_hhmmss`.

Log and Report Files:

```plainText
.\SojiLogs\soji.log                 # General purpose log file

.\SojiLogs\soji-files.csv           # CSV report of files that were processed
.\SojiLogs\soji-directories.csv     # CSV report of directories that were processed
.\SojiLogs\soji-volumecaches.csv    # CSV report of volume caches that were processed
.\SojiLogs\soji-summary.csv         # CSV summary report of drives that were processed

.\SojiLogs\soji-files.json          # JSON report of files that were processed
.\SojiLogs\soji-directories.json    # JSON report of directories that were processed
.\SojiLogs\soji-volumecaches.json   # JSON report of volume caches that were processed
.\SojiLogs\soji-summary.json        # JSON summary report of drives that were processed
```

## Acknowledgments

- [Serilog](https://github.com/serilog/serilog) - General logging and JSON report output
- [CommandlineParser](https://github.com/commandlineparser/commandline) - Parsing arguments
- [CSVHelper](https://github.com/JoshClose/CsvHelper) - CSV Report output
- [BurnBytes](https://github.com/builtbybel/burnbytes) - Base logic for cleanmgr hooks

## Changelog

### 2026-07-14

- Added automatic compatibility for future .NET runtimes (9.0, 10.0+) to prevent end-of-life disruptions.
- Added `SizeBefore`, `SizeAfter`, and `AmountCleaned` columns to the directory cleanup reports.

### 2026-03-23

- Document modification

### 2025-05-06

- Initial version of the document
