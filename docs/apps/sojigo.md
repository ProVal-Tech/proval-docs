---
id: '6b7cbccd-c62f-457a-a97e-0b861b27b9df'
slug: /6b7cbccd-c62f-457a-a97e-0b861b27b9df
title: 'SojiGo'
title_meta: 'SojiGo'
keywords: ['sojigo', 'soji', 'disk-cleanup', 'cleanmgr', 'winsxs', 'temp-files', 'free-disk-space']
description: 'SojiGo is a Windows drive cleaner that frees disk space by removing old temporary files, logs and caches. It is a Go-based rebuild of Soji that runs as a single executable with no .NET runtime required.'
tags: ['disk', 'disk-cleanup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-22
---

<br />
<div align="center">

<img src={require('../../static/img/docs/6b7cbccd-c62f-457a-a97e-0b861b27b9df/sojigo.webp').default} alt="Logo" width="200" height="200" />

<h3 align="center">掃除 (Sōji) Go</h3>
<p align="center">A Windows drive cleaner. One executable, no runtime to install.</p>

</div>

## About

**SojiGo** frees disk space on Windows by removing old temporary files, logs and caches. It also runs the built-in Windows Disk Cleanup tasks, and can optionally clean the Windows component store, empty recycle bins and run the legacy Disk Cleanup tool.

**SojiGo** is a Go-based rebuild of [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc). Every Soji argument keeps the same name and meaning, so existing commands can switch over by pointing at the new executable.

### Built With

* [Go](https://go.dev/)

SojiGo compiles to a single executable. There is no .NET or other runtime to install or keep updated.

### Important Note

:::warning

SojiGo deletes files and folders. Take great care with `--days`, `--systempaths`, `--userpaths` and `--purge-downloads`. Preview every new command with `--dry-run` before running it for real.

:::

## Getting Started

### Requirements

* Windows 10, Windows Server 2016, or newer.
* A 64-bit operating system. Use `SojiGo.exe` on x64 machines and `SojiGo-arm64.exe` on ARM64 machines.
* An elevated session, such as an administrator or SYSTEM. RMM agents run as SYSTEM by default.

### Download and Run

Download `SojiGo.exe`, place it in a folder, and run it from an elevated PowerShell or Command Prompt window. Logs and reports are written to a `SojiGoLogs` folder next to the executable.

```powershell
.\SojiGo.exe --dry-run
```

### Moving from Soji

SojiGo accepts the same arguments as [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc). These differences are worth knowing:

* No .NET runtime is required.
* Logs and reports go to `SojiGoLogs` next to `SojiGo.exe`, not the current folder. File names start with `SojiGo-`.
* Reports from earlier runs are archived and deleted after a retention period.
* Regular expressions are case-insensitive. Lookahead and lookbehind are not supported.
* `--userpaths` accepts a comma-separated list, like `--systempaths`.
* Invalid arguments now return exit code `1`. Soji returned `0`.
* New options: exclusions, dry run, free space thresholds, config files and log settings.

## Usage

SojiGo runs with safe defaults and no arguments. It cleans files older than 7 days from the default locations on every fixed drive, and runs the Windows Disk Cleanup tasks. Optional cleaners only run when you turn them on.

### Arguments

| Long Name               | Short Name | Example                                        | Description |
| ----------------------- | ---------- | ---------------------------------------------- | ----------- |
| `--drives`              | `-d`       | `C,D`                                          | (Default: all fixed drives) Drive letters to clean. |
| `--days`                | `-y`       | `21`                                           | (Default: 7) Files changed within this many days are kept. Decimals such as `10.5` are allowed. |
| `--json`                | `-j`       |                                                | (Default: off) Write JSON reports. |
| `--csv`                 | `-c`       |                                                | (Default: off) Write CSV reports. |
| `--systempaths`         | `-p`       | `MyApp\Logs\|\.log$\|30`                       | (Default: none) Extra folders to clean on each drive. See [Path format](#path-format). |
| `--userpaths`           | `-u`       | `AppData\Local\Adobe\|\.log$`                  | (Default: none) Extra folders to clean in every user profile. See [Path format](#path-format). |
| `--purge-downloads`     |            |                                                | (Default: off) Clean every user's Downloads folder. |
| `--clean-winsxs`        |            |                                                | (Default: off) Clean up the Windows component store (WinSxS). |
| `--run-cleanmgr`        |            |                                                | (Default: off) Run the legacy Windows Disk Cleanup tool (cleanmgr). |
| `--empty-recyclebin`    |            |                                                | (Default: off) Empty the recycle bin on each cleaned drive. |
| `--all`                 |            |                                                | (Default: off) Turn on `--purge-downloads`, `--clean-winsxs`, `--run-cleanmgr` and `--empty-recyclebin`. |
| `--winsxs-seconds`      |            | `900`                                          | (Default: 300) Seconds to wait for the WinSxS check before giving up. |
| `--exclude-path`        |            | `C:\Windows\SoftwareDistribution\Download`     | (Default: none) Full paths that are never touched, including everything inside them. |
| `--exclude-regex`       |            | `\.iso$`                                       | (Default: none) Patterns matched against full paths. Matching files and folders are never touched. |
| `--skip-volumecaches`   |            |                                                | (Default: off) Skip the Windows Disk Cleanup tasks. |
| `--exclude-volumecache` |            | `Recycle Bin,Update Cleanup`                   | (Default: none) Windows Disk Cleanup tasks to leave out. |
| `--dry-run`             |            |                                                | (Default: off) Preview only. Nothing is deleted and no settings are changed. |
| `--min-free-percent`    |            | `15`                                           | (Default: off) Only clean drives with less free space than this percentage. |
| `--min-free-gb`         |            | `20`                                           | (Default: off) Only clean drives with less free space than this many GB. |
| `--no-default-paths`    |            |                                                | (Default: off) Clean only the folders passed with `--systempaths` and `--userpaths`. |
| `--list-defaults`       |            |                                                | Show the default folders, protected folders and Disk Cleanup task names, then exit. |
| `--log-dir`             |            | `D:\Logs\SojiGo`                               | (Default: `SojiGoLogs` next to `SojiGo.exe`) Folder for logs and reports. |
| `--log-max-mb`          |            | `10`                                           | (Default: 2) The log file is cleared at the start of a run once it is larger than this. |
| `--log-retention-days`  |            | `60`                                           | (Default: 30) Days to keep reports from earlier runs. `0` keeps none. |
| `--config`              |            | `C:\ProgramData\SojiGo\sojigo.json`            | (Default: none) Load options from a JSON file. See [Config file](#config-file). |
| `--debug`               |            |                                                | (Default: off) Show extra detail in the console. |

Switches take no value. Use `--dry-run`, not `--dry-run true`. SojiGo stops with exit code `1` if it finds an unexpected value, so a typo never runs a different cleanup than intended.

### Path Format

`--systempaths` and `--userpaths` take one or more entries in the format `path|pattern|days`:

* **path**: a folder relative to each drive (`--systempaths`) or to each user profile (`--userpaths`).
* **pattern**: optional. Only files whose names match this regular expression are cleaned. Matching ignores upper and lower case.
* **days**: optional. Overrides `--days` for this folder only.

| Entry              | What gets cleaned |
| ------------------ | ----------------- |
| `Temp`             | All files in `Temp` older than `--days`. |
| `Temp\|\.log$`     | `.log` files in `Temp` older than `--days`. |
| `Temp\|\|3`        | All files in `Temp` older than 3 days. |
| `Temp\|\.log$\|30` | `.log` files in `Temp` older than 30 days. |

A folder is only removed when everything inside it is being cleaned. Folder settings files (`desktop.ini`) and OneDrive online-only files are always kept.

### Quoting Arguments

* **PowerShell:** wrap values in single quotes. Put comma-separated lists inside one quoted string, for example `--drives 'C,D'`. Without quotes, PowerShell splits the list and SojiGo rejects it.
* **Command Prompt:** wrap values that contain spaces or `|` in double quotes, for example `--systempaths "Temp|\.log$"`.
* **Patterns that contain commas**, such as `\d{1,3}`, are split as a list. Put them in a [config file](#config-file) instead.

### What SojiGo Cleans by Default

These folders are cleaned on every processed drive. Run `.\SojiGo.exe --list-defaults` to see the current list.

| Folder | What it holds | Notes |
| ------ | ------------- | ----- |
| `Temp`, `Windows\Temp` | Temporary files from Windows and installers | Safe to clean. |
| `Windows\Prefetch` | App launch data | Rebuilt automatically. Apps may open slightly slower the first time. |
| `Windows\Logs` | Windows logs, including update logs | See [Locations to handle with care](#locations-to-handle-with-care). |
| `Windows\System32\LogFiles` | Windows service logs | Safe to clean. |
| `Windows\SoftwareDistribution\Download` | Windows Update download cache | See [Locations to handle with care](#locations-to-handle-with-care). |
| `Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization` (`Logs`, `Cache`, `State`) | Update sharing cache and logs | Updates are downloaded again if needed. |
| `Windows\LiveKernelReports` | System hang and crash reports | See [Locations to handle with care](#locations-to-handle-with-care). |
| `ProgramData\Microsoft\Windows\WER` (`ReportArchive`, `ReportQueue`) | App crash reports | See [Locations to handle with care](#locations-to-handle-with-care). |
| `inetpub\logs\LogFiles` | IIS web server logs | See [Locations to handle with care](#locations-to-handle-with-care). |
| `ProgramData\Microsoft\Windows Defender` (`LocalCopy`, `Support`) | Microsoft Defender working files and support logs | Safe to clean. |
| `Windows\Downloaded Program Files`, `Windows\Offline Web Pages` | Legacy browser add-ons and pages | Safe to clean. |
| `ProgramData\Microsoft\Windows\RetailDemo` | Store demo content | Safe to clean. |
| `Windows\LTSvc\packages\MP\Ninite\NiniteDownloads\files` | ConnectWise Automate Ninite downloads | Safe to clean. |

These folders are cleaned in every user profile:

| Folder | What it holds | Notes |
| ------ | ------------- | ----- |
| `AppData\Local\Temp`, `AppData\LocalLow\Temp`, `AppData\Roaming\Temp` | Temporary files from apps | Safe to clean. Files in use are skipped. |
| `AppData\Local\Microsoft\Windows\INetCache\IE` | Legacy browser cache | Safe to clean. |
| `AppData\Local\D3DSCache` | Graphics cache | Rebuilt automatically. Games and 3D apps may load slower once. |
| `AppData\Local\Microsoft\Windows\Explorer` | Thumbnail and icon cache | Rebuilt automatically. Thumbnails reload the next time a folder opens. |
| `Downloads` | The user's downloaded files | Only with `--purge-downloads`. See [Locations to handle with care](#locations-to-handle-with-care). |

SojiGo also runs the **Windows Disk Cleanup tasks** by default, the same tasks the Windows Disk Cleanup tool offers. Each task decides for itself which files to remove. These ones are worth knowing about:

| Task name | What it removes | Notes |
| --------- | --------------- | ----- |
| `Temporary Files` | Temporary files | Uses its own age rule, typically 7 days, and ignores `--days`. |
| `Recycle Bin` | Everything in the recycle bins | Runs even without `--empty-recyclebin`. |
| `Update Cleanup` | Old copies of Windows components replaced by updates | Removes the ability to uninstall installed updates. Can take several minutes. |
| `Delivery Optimization Files` | Update sharing cache | Safe to clean. |
| `Windows Error Reporting Files` | Crash reports | Remove only when no crash investigation is open. |

Leave any task out with `--exclude-volumecache`, or skip all of them with `--skip-volumecaches`. The task that empties Downloads folders never runs, since `--purge-downloads` covers Downloads with your `--days` setting instead.

### Locations to Handle with Care

:::warning[Windows Update download cache]

`C:\Windows\SoftwareDistribution\Download` holds patches that are downloaded but not yet installed. RMM patching uses it to stage updates before the install window. Cleaning it can force patches to download again, and cleaning it while an update installs can make that install fail. **Exclude it on any machine that is patched by an RMM:** `--exclude-path 'C:\Windows\SoftwareDistribution\Download'`.

:::

:::danger[WinSxS cleanup and Update Cleanup]

`--clean-winsxs` and the `Update Cleanup` task both remove old copies of Windows components that updates replaced. After this, installed updates generally **cannot be uninstalled**, so a problem update cannot be rolled back. The cleanup can also run for a long time with high disk and CPU use. Avoid both during patch windows and business hours on servers. Windows already does this cleanup on its own schedule, with a grace period of about 30 days.

:::

:::danger[User Downloads folders]

`--purge-downloads` deletes files from every user's Downloads folder that are older than `--days`. Many people keep important files there. Get the user's or client's agreement first, and use a generous `--days` value.

:::

:::danger[Recycle bins]

`--empty-recyclebin` and the `Recycle Bin` task delete recycled files permanently, whatever their age. Users cannot restore them afterwards. To keep recycle bins untouched, add `--exclude-volumecache 'Recycle Bin'` and do not pass `--empty-recyclebin` or `--all`.

:::

:::info[Logs and crash reports]

`Windows\Logs`, `Windows\LiveKernelReports` and the `WER` folders hold the evidence used to troubleshoot failed updates, system crashes and app crashes. Exclude them while an investigation is open. `inetpub\logs\LogFiles` may be needed for audits or compliance. Exclude it on web servers with a log retention requirement.

:::

:::info[Legacy Disk Cleanup tool]

`--run-cleanmgr` starts the legacy Disk Cleanup tool in the background with every task turned on, including `Recycle Bin` and `Update Cleanup`. It keeps running after SojiGo finishes and can take a long time. Use it only when the Disk Cleanup tasks SojiGo already runs are not enough. It is not available on Server Core.

:::

:::warning[Low `--days` values]

`--days 0` or `--days 1` removes files that running installers and apps may still need. Keep `--days` at 7 or more for scheduled cleanups.

:::

### Exclusions

Excluded files and folders are never deleted and never scanned. A folder that holds an excluded item is kept. Only the other matching files inside it are cleaned.

* `--exclude-path` takes full paths and covers everything inside them.
* `--exclude-regex` takes patterns matched against full paths, ignoring upper and lower case.

:::note

Exclusions apply to SojiGo's own file cleanup and to `--empty-recyclebin`. The Windows Disk Cleanup tasks, `--clean-winsxs` and `--run-cleanmgr` cannot be limited by path. Use `--exclude-volumecache` or `--skip-volumecaches` to control them.

:::

### Protected Folders

SojiGo refuses to clean critical folders, even when they are passed with `--systempaths` or `--userpaths`. It stops with exit code `1` instead. Protected folders include the drive root, `Windows`, `Windows\System32`, `Windows\WinSxS`, `Windows\Installer`, `Program Files`, `ProgramData` and `Users`. In user profiles, `Desktop`, `Documents`, `Pictures`, `AppData` and similar folders are protected.

Only the exact folder is protected, so subfolders such as `Windows\Temp` can still be cleaned. Run `--list-defaults` to see the full lists.

### Config File

`--config` loads options from a JSON file. Use it to keep long commands short, or for patterns that contain commas.

* Keys are the option names without the leading dashes.
* Lists can be written as JSON arrays.
* Options passed on the command line override the file.

### Running from an RMM

* Run SojiGo as SYSTEM, the default for most RMM scripts. This gives the same access and results on every machine.
* Only one copy of SojiGo can run at a time. A second copy exits with code `1`.
* If access to a folder is denied, SojiGo gives its own account full control of that folder and tries again. Under SYSTEM this is rarely needed.
* Files that are open in other programs are skipped and listed as warnings. They are cleaned on a later run.

### Exit Codes

| Code | Meaning |
| ---- | ------- |
| `0`  | Finished successfully, or there was nothing to clean. |
| `1`  | Did not run: invalid arguments, not elevated, another copy is running, or no valid drives. |
| `2`  | Finished, but a cleanup component failed: a Disk Cleanup task, the recycle bin, WinSxS cleanup or cleanmgr. |

Skipped files that are in use do not change the exit code.

## Outputs

SojiGo writes to `SojiGoLogs` next to `SojiGo.exe`, or to the folder set with `--log-dir`.

```plainText
.\SojiGoLogs\SojiGo.log                   # Log of every run

.\SojiGoLogs\SojiGo-files.csv             # Every file processed, with its size and whether it was cleaned
.\SojiGoLogs\SojiGo-directories.csv       # Every folder removed as a whole
.\SojiGoLogs\SojiGo-volumecaches.csv      # Each Windows Disk Cleanup task and the space it freed
.\SojiGoLogs\SojiGo-summary.csv           # One line per drive with the totals

.\SojiGoLogs\SojiGo-files.json            # The same reports in JSON format
.\SojiGoLogs\SojiGo-directories.json
.\SojiGoLogs\SojiGo-volumecaches.json
.\SojiGoLogs\SojiGo-summary.json

.\SojiGoLogs\Archive\                     # Reports from earlier runs
```

* **Log file:** `SojiGo.log` is never deleted by the retention period. It is cleared at the start of a run once it grows past `--log-max-mb`.
* **Reports:** only written when `--csv` or `--json` is passed.
* **Archive:** each run moves the previous reports into `Archive`, named with the time they were written, for example `SojiGo-summary_20261020_075344.csv`.
* **Retention:** archived reports older than `--log-retention-days` are deleted at the start of each run.
* **Console:** every log line is also shown in the console. The run ends with one summary line per drive.

## Examples

All examples run from an elevated PowerShell window in the folder that holds `SojiGo.exe`.

### Example 1 — Default cleanup

Clean files older than 7 days from the default folders on every fixed drive, and run the Windows Disk Cleanup tasks.

```powershell
.\SojiGo.exe
```

Optional cleaners such as WinSxS cleanup and Downloads stay off. The run ends with a summary line for each drive:

```plainText
2026-10-20 07:54:00.623 -04:00 [INF] Summary C:\ freed 14.44 GB (56103 files and 1192 directories removed, 98 files and 2 directories could not be removed).
2026-10-20 07:54:00.624 -04:00 [INF] SojiGo has completed. Freed space: 14.44 GB
```

### Example 2 — Preview a cleanup without deleting anything

`--dry-run` shows what would be cleaned. Nothing is deleted, and no permissions or settings are changed.

```powershell
.\SojiGo.exe --dry-run
```

Each Disk Cleanup task shows as `Dry run: would purge ...`. The summary shows how much space would be freed.

:::note

A dry run can show a higher total than the real run. The `Temporary Files` task and SojiGo's own cleanup both look at temporary folders, so a preview can count the same files twice. In a real run, each file is only counted once.

:::

### Example 3 — Clean specific drives

`--drives` limits the cleanup to the drives you list. Other drives are not touched.

```powershell
.\SojiGo.exe --drives 'C,D'
```

### Example 4 — Keep files from the last 21 days

`--days` sets the age limit. Files changed within the last 21 days are kept. Older files in the cleanup folders are removed.

```powershell
.\SojiGo.exe --days 21
```

Use a decimal for part days. `--days 0.5` keeps files from the last 12 hours.

### Example 5 — Use short option names

The common options have one-letter names. This command is the same as `--drives C --days 14 --csv --json`.

```powershell
.\SojiGo.exe -d 'C' -y 14 -c -j
```

### Example 6 — Save reports and read them back

`--csv` and `--json` save reports of everything that was processed.

```powershell
.\SojiGo.exe --drives 'C' --csv --json
$fileReport = Import-Csv -Path '.\SojiGoLogs\SojiGo-files.csv' -Encoding UTF8
$fileReport | Where-Object -FilterScript { $_.Cleaned -eq 'False' } | Select-Object -Property 'FullName', 'Length'
$summary = (Get-Content -Path '.\SojiGoLogs\SojiGo-summary.json' -Raw -Encoding UTF8 | ConvertFrom-Json).DriveResults
$summary | Select-Object -Property 'Name', 'FreedSpace', 'PostrunFreeSpace'
```

The first query lists the files that could not be removed, usually because they were in use. The second shows the freed space and the free space left on each drive, in bytes.

### Example 7 — Clean extra folders on each drive

`--systempaths` adds folders to clean, relative to each drive. This command cleans:

* `.log` files older than 30 days in `?:\MyApp\Logs`.
* `.txt` files starting with "Arigatou" in `?:\MyFolder\MySubfolder`, using the default `--days`.

```powershell
.\SojiGo.exe --systempaths 'MyApp\Logs|\.log$|30,MyFolder\MySubfolder|^Arigatou.*\.txt$'
```

The default folders are still cleaned as well. Separate multiple entries with commas inside one quoted string.

### Example 8 — Clean extra folders in every user profile

`--userpaths` adds folders inside every profile under `?:\Users`. This command cleans `.log` files in each user's `AppData\Local\Adobe`, plus all files older than 14 days in `AppData\Local\MyApp\Cache`.

```powershell
.\SojiGo.exe --userpaths 'AppData\Local\Adobe|\.log$,AppData\Local\MyApp\Cache||14'
```

### Example 9 — Clean only your own folders

`--no-default-paths` turns off the built-in folder list. Only the folders you pass are cleaned. Add `--skip-volumecaches` to also skip the Windows Disk Cleanup tasks.

```powershell
.\SojiGo.exe --no-default-paths --skip-volumecaches --systempaths 'MyApp\Logs|\.log$|30'
```

Only `.log` files older than 30 days in `?:\MyApp\Logs` are removed. Nothing else on the machine is touched.

### Example 10 — Clean users' Downloads folders

`--purge-downloads` adds every user's Downloads folder to the cleanup. Only files older than `--days` are removed.

```powershell
.\SojiGo.exe --purge-downloads --days 90
```

:::danger

This deletes user files. Get agreement before using it, and keep `--days` generous. See [Locations to handle with care](#locations-to-handle-with-care).

:::

### Example 11 — Empty the recycle bins

`--empty-recyclebin` empties the recycle bin of every user on each cleaned drive, whatever the age of the files.

```powershell
.\SojiGo.exe --drives 'C' --empty-recyclebin
```

The log shows `Flushed recycle bin on drive C:\` when it finishes.

### Example 12 — Clean up the Windows component store

`--clean-winsxs` first checks whether Windows recommends a component store cleanup. If it does, SojiGo starts the cleanup in the background and finishes without waiting. `--winsxs-seconds` sets how long to wait for the check. Slow servers may need more than the 300-second default.

```powershell
.\SojiGo.exe --clean-winsxs --winsxs-seconds 900
```

This only runs when the system drive is being cleaned.

:::danger

After this cleanup, installed updates generally cannot be uninstalled. Avoid running it during patch windows. See [Locations to handle with care](#locations-to-handle-with-care).

:::

:::note

On Windows in a language other than English, SojiGo cannot read the recommendation, so it always starts the cleanup.

:::

### Example 13 — Run the legacy Disk Cleanup tool

`--run-cleanmgr` starts the legacy Windows Disk Cleanup tool with every task turned on, except tasks you exclude. It keeps running in the background after SojiGo finishes.

```powershell
.\SojiGo.exe --run-cleanmgr --exclude-volumecache 'Recycle Bin,Update Cleanup'
```

Here the recycle bins and installed updates are left alone, even though cleanmgr runs.

### Example 14 — Run every cleaner

`--all` turns on `--purge-downloads`, `--clean-winsxs`, `--run-cleanmgr` and `--empty-recyclebin` together. This is the most thorough cleanup SojiGo can do.

```powershell
.\SojiGo.exe --all --days 30
```

:::danger

`--all` deletes user Downloads files, empties recycle bins and removes the ability to uninstall updates. Use it only when the machine is critically low on space and everyone involved agrees.

:::

### Example 15 — Exclude a folder by its full path

`--exclude-path` keeps a folder and everything inside it untouched. This command protects the Windows Update download cache and a backup folder.

```powershell
.\SojiGo.exe --exclude-path 'C:\Windows\SoftwareDistribution\Download,D:\Backups'
```

The log confirms each excluded cleanup folder:

```plainText
2026-10-20 08:10:12.256 -04:00 [INF] 'C:\Windows\SoftwareDistribution\Download' is excluded and will be skipped.
```

### Example 16 — Exclude files and folders by pattern

`--exclude-regex` protects anything whose full path matches a pattern. This command keeps every `.iso` file, and a `KeepMe` folder inside every user's temporary folder.

```powershell
.\SojiGo.exe --exclude-regex '\.iso$,\\Users\\[^\\]+\\AppData\\Local\\Temp\\KeepMe'
```

In a pattern, `\\` matches one backslash.

### Example 17 — Skip the Windows Disk Cleanup tasks

`--skip-volumecaches` runs only SojiGo's own file cleanup. Recycle bins and the Windows component store are not touched.

```powershell
.\SojiGo.exe --skip-volumecaches
```

### Example 18 — Leave out specific Disk Cleanup tasks

`--exclude-volumecache` leaves the named tasks out and runs the rest. Use the names from `--list-defaults`.

```powershell
.\SojiGo.exe --exclude-volumecache 'Temporary Files,Recycle Bin,Update Cleanup'
```

* `Temporary Files` is left out so your `--days` setting is the only age rule for temporary folders.
* `Recycle Bin` is left out so recycle bins stay untouched.
* `Update Cleanup` is left out so updates can still be uninstalled.

SojiGo's own cleanup still covers the temporary folders, so they still appear in the log.

### Example 19 — Only clean drives that are low on space

`--min-free-percent` and `--min-free-gb` skip drives with enough free space. A drive is cleaned when it is below either threshold.

```powershell
.\SojiGo.exe --min-free-percent 15 --min-free-gb 20
```

Drives with less than 15% or less than 20 GB free are cleaned. Other drives are skipped:

```plainText
2026-10-20 08:12:40.110 -04:00 [INF] Summary D:\ skipped, 412.37 GB free (82.4%) is above the threshold.
```

This is useful as a daily scheduled task that only acts when a drive fills up.

### Example 20 — Change where logs go and how large the log grows

`--log-dir` writes logs and reports to another folder. A relative path is placed next to `SojiGo.exe`. `--log-max-mb` sets the size at which `SojiGo.log` is cleared at the start of a run.

```powershell
.\SojiGo.exe --log-dir 'D:\Logs\SojiGo' --log-max-mb 10
```

### Example 21 — Keep CSV reports for 60 days

`--log-retention-days` deletes reports from earlier runs once they are older than this many days. `SojiGo.log` is never deleted by this setting.

```powershell
.\SojiGo.exe --csv --log-retention-days 60
```

Each run moves the previous reports into `SojiGoLogs\Archive`, then deletes archived reports older than 60 days:

```plainText
2026-10-20 08:14:02.318 -04:00 [INF] Removed 4 archived report(s) older than the 60 day retention period.
```

Use `--log-retention-days 0` to keep only the latest reports, with no archive.

### Example 22 — Load options from a config file

`--config` reads options from a JSON file. This file includes a pattern with a comma, `\d{1,3}`, which cannot be passed on the command line.

```json
{
  "drives": ["C"],
  "days": 21,
  "csv": true,
  "log-retention-days": 60,
  "systempaths": ["MyApp\\Logs|\\.log\\d{1,3}$|30"],
  "exclude-path": ["C:\\Windows\\SoftwareDistribution\\Download"],
  "exclude-volumecache": ["Temporary Files", "Recycle Bin", "Update Cleanup"]
}
```

```powershell
.\SojiGo.exe --config 'C:\ProgramData\SojiGo\sojigo.json' --dry-run
```

Backslashes are doubled in JSON. Options on the command line, such as `--dry-run` here, are added to the file's settings and override them where both are set.

### Example 23 — See the default folders and Disk Cleanup task names

`--list-defaults` prints the default folders, the protected folders and the Disk Cleanup task names on this machine, then exits without cleaning anything.

```powershell
.\SojiGo.exe --list-defaults
```

Use the task names it shows with `--exclude-volumecache`.

### Example 24 — Show extra detail for troubleshooting

`--debug` adds detail to the console, such as each excluded item, folders that could not be read and details of each Disk Cleanup task. The extra lines are not written to `SojiGo.log`.

```powershell
.\SojiGo.exe --dry-run --debug
```

### Example 25 — Recommended low-impact cleanup with 60-day reports

This command gives a light, patch-safe cleanup with a 60-day report history:

* Cleans the C drive only.
* Keeps files from the last 21 days.
* Saves a CSV report and keeps 60 days of earlier reports. `SojiGo.log` is kept as is.
* Leaves the Windows Update download cache untouched, so RMM patching is not affected.
* Leaves out the `Temporary Files`, `Recycle Bin` and `Update Cleanup` tasks. Temporary folders follow the 21-day rule, recycle bins stay untouched, and updates can still be uninstalled.
* Does not run any optional cleaner.

```powershell
.\SojiGo.exe --drives 'C' --days 21 --csv --log-retention-days 60 --exclude-path 'C:\Windows\SoftwareDistribution\Download' --exclude-volumecache 'Temporary Files,Recycle Bin,Update Cleanup'
```

Run it with `--dry-run` first. Read the one-line drive summary from the report afterwards:

```powershell
Import-Csv -Path '.\SojiGoLogs\SojiGo-summary.csv' -Encoding UTF8 | Select-Object -Property 'Name', 'FreedSpace', 'CleanedFileCount', 'RemainingFileCount', 'PostrunFreeSpace'
```

### Example 26 — Find out what is using the space before cleaning

Combine `--dry-run` and `--csv` to get a list of every file that would be removed. Then group the list by folder to see where the space comes from.

```powershell
.\SojiGo.exe --drives 'C' --days 21 --dry-run --csv
$files = Import-Csv -Path '.\SojiGoLogs\SojiGo-files.csv' -Encoding UTF8
$files | Group-Object -Property { ($_.Directory -split '\\')[0..5] -join '\' } | Select-Object -Property 'Name', 'Count', @{ Name = 'SizeGB'; Expression = { [math]::Round(($_.Group | Measure-Object -Property 'Length' -Sum).Sum / 1GB, 2) } } | Sort-Object -Property 'SizeGB' -Descending | Select-Object -First 20 | Format-Table -AutoSize
Import-Csv -Path '.\SojiGoLogs\SojiGo-volumecaches.csv' -Encoding UTF8 | Select-Object -Property 'DefaultName', @{ Name = 'SizeGB'; Expression = { [math]::Round([double]$_.BytesUsed / 1GB, 2) } } | Format-Table -AutoSize
```

The first table shows the 20 folders with the most space to free. The second shows the space each Disk Cleanup task would free. Windows does not list the individual files those tasks remove.

### Example 27 — Check the result in a script

Use the exit code to decide what to do next in an RMM script.

```powershell
.\SojiGo.exe --drives 'C' --days 21 --exclude-path 'C:\Windows\SoftwareDistribution\Download'
if (0 -eq $LASTEXITCODE) {
    Write-Output -InputObject 'Cleanup completed successfully.'
} elseif (2 -eq $LASTEXITCODE) {
    Write-Output -InputObject 'Cleanup completed, but a cleanup component failed. Review SojiGo.log.'
} else {
    Write-Output -InputObject 'Cleanup did not run. Review the output above.'
}
```

See [Exit codes](#exit-codes) for what each code means.

## Troubleshooting

| Problem | Cause | Solution |
| ------- | ----- | -------- |
| A dry run shows more space than the real run frees. | The `Temporary Files` task and SojiGo's own cleanup count the same temporary files in a preview. | Expected. Exclude `Temporary Files` for a closer estimate. |
| Temporary folders still appear after excluding `Temporary Files`. | The exclusion only turns off the Windows task. SojiGo's own cleanup still covers temporary folders with your `--days` rule. | Expected. Use `--exclude-path` to leave a folder fully untouched. |
| Warnings say a file is in use or access is denied. | Another program has the file open. | Expected. The file is cleaned on a later run, once it is closed. |
| A dry run warns that access was denied. | A preview never changes folder permissions. | Expected. A real run grants access and rescans. |
| `Update Cleanup` takes several minutes. | Windows is removing old update components. | Expected. Exclude `Update Cleanup` to skip it. |
| SojiGo exits with code `1` at once. | An argument is invalid or protected, the window is not elevated, or another copy is running. | Read the first line of the output for the exact reason. |
| The Downloads Disk Cleanup task never runs. | SojiGo always leaves it out. | Use `--purge-downloads`, which follows your `--days` setting. |

## Acknowledgments

* [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) — the original .NET tool SojiGo is rebuilt from
* [pflag](https://github.com/spf13/pflag) — command-line argument parsing
* [golang.org/x/sys](https://pkg.go.dev/golang.org/x/sys/windows) — Windows system access
* [go-winres](https://github.com/tc-hib/go-winres) — embedding the icon and version information
* [BurnBytes](https://github.com/builtbybel/burnbytes) — base logic for the Disk Cleanup hooks

## Changelog

### 2026-10-22

- Rebuilt with Go 1.27.3, which includes Go's fix for the compromised eMudhra certificates (CVE-2026-111943).

### 2026-10-20

- Initial version of the document
