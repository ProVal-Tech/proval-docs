---
id: 'bf4b616c-fbd0-4f76-848b-a9d5e9a4af6a'
slug: /bf4b616c-fbd0-4f76-848b-a9d5e9a4af6a
title: 'Get-DiskUsage'
title_meta: 'Get-DiskUsage'
keywords: ['disk', 'usage', 'treesize', 'folder-size', 'largest-folders', 'disk-space', 'storage-report']
description: 'Reports disk usage per folder and file in the style of TreeSize, returning the result as an object and writing a human readable report to Get-DiskUsage-result.txt.'
tags: ['disk', 'diskspace', 'usage', 'report', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-03
---

## Overview

Reports disk usage per folder and file, in the style of TreeSize. Returns the result as an object and writes a human readable report to `Get-DiskUsage-result.txt`, beside the log.

The point of the script is to answer "what is filling this disk up?" without remoting into the machine. It rolls the size of every file up into a total for each folder, so each folder reports the size of everything beneath it rather than just the files it directly contains, then reports the biggest offenders. It also emits a single pre-formatted line, sized to fit a custom field, containing the largest folders and their sizes.

Because it names the exact folders consuming the space, it is well suited to spotting a runaway process, for example Dell SupportAssist repeatedly writing backups, or a log directory that has grown without limit.

Everything is self-contained: the script runs its own logic in the session it is launched in, and writes nothing to the endpoint except its report and log. Every value that shapes the report is a parameter with a default, so the same script covers whole-machine triage and a narrow drill-down into one folder.

## Requirements

- PowerShell v5.1
- Administrative rights are **not** required, but are strongly recommended. Without them, folders that deny read access cannot be measured. The report states how many folders were inaccessible and how much space it could not account for, so an unprivileged run is obvious rather than silently short.

## Process

1. Resolves the target paths. With no `Path` supplied, the root of every local fixed volume is used. Paths that cannot be resolved, or that are not folders, are skipped with a warning.
2. Walks each target with an embedded Win32 enumerator, accumulating the size of every file into a rolled up total for each folder.
3. Builds a report for each target containing:
    - A volume summary comparing the space actually consumed on the volume against the amount the scan could account for.
    - The largest folders, after collapsing pass-through folders.
    - The largest individual files.
    - An indented folder tree.
4. Appends a single line holding the largest folders across every target, trimmed to fit `CustomFieldLength` characters.
5. Writes that report to `Get-DiskUsage-result.txt` and returns the same information as an object.

### Why the report is not written to the log

The report goes to a file of its own, `Get-DiskUsage-result.txt`, in the same folder as the log. The log stays a record of what the run did - what was scanned, what was skipped, what failed - and the result file holds nothing but the report, so it can be read or attached to a ticket without a timestamp on every line.

The result file is overwritten on each run and so always holds the latest result. The log appends, and keeps the history.

### Encoding

A folder name can hold any character the filesystem allows, including plenty the console's default code page cannot represent, and those become question marks on the way out. Since the whole point of the report is to name the folder somebody has to go and look at, the same encoding handling [Get-WingetReport.ps1](/docs/a344216a-5ff8-426d-a7d7-a688500990b4) uses is applied here:

- The console output encoding is set to UTF-8, so a path is rendered as it actually is. The assignment is wrapped in a `try`, because a host without a real console - which is how an RMM usually runs this - throws rather than ignoring it.
- `Get-DiskUsage-result.txt` is written with `[System.IO.File]::WriteAllText` and a `System.Text.UTF8Encoding` constructed with `$false`, giving UTF-8 without a byte order mark. `Set-Content -Encoding UTF8` would leave three bytes of preamble on PowerShell 5.1 for every reader to step over.
- Line endings are pinned to CRLF rather than left to the platform, so the report reads correctly in Notepad and in an RMM's output viewer. A lone line feed arriving from a folder name containing one is normalised too.

Verified against folders named `Zürich-Ordner`, `日本語フォルダ`, `Отчёт`, and `café–dash`: all four survive into the object, the custom field line, and the result file.

Note that the log itself is written by Strapper's `Write-Log`, whose encoding this script does not control. Folder names belong to the report, which is why the report is the file that gets the explicit treatment.

### Choosing the report shape

The defaults are tuned for whole-machine triage: three levels of tree, the five largest folders, the ten largest files, and a 100MB floor on both, which keeps the report short enough to read at a glance and the scan short enough for an RMM timeout. Two patterns cover most other uses:

- **Drill into a hotspot** an earlier run named. Narrow `Path`, raise `Depth` and `Top`, and drop `MinimumFolderSize` so the detail appears: `-Path 'C:\ProgramData' -Depth 5 -Top 10 -MinimumFolderSize 10MB`.
- **Feed a different field.** `CustomFieldLength` defaults to the 255 characters a Datto custom field holds; set it to match whatever is receiving the line.

`Depth` limits only how much detail is *reported*. Sizes are always totalled to the full depth of the tree, so a shallow run reports the same volume total as a deep one - it just says less about where inside each branch the space sits.

### Why the folder tree walk is not Get-ChildItem

The walk is performed by an embedded Win32 enumerator calling `FindFirstFileEx` rather than `Get-ChildItem`. This matters for three reasons:

- **Speed.** Measured on a warm cache against `C:\Program Files` (98,140 files), the enumerator completed in 0.92s against 4.67s for a `System.IO.DirectoryInfo` recursion and 6.84s for `Get-ChildItem -Recurse`, a 5x and 7x improvement respectively. A full 580,000 file `C:\` scan completes in roughly 5 to 20 seconds depending on cache state, which keeps the script well inside a normal RMM timeout.
- **Long paths.** `Get-ChildItem` and `DirectoryInfo` throw on paths over 260 characters unless the machine has `LongPathsEnabled` set, which most do not. The enumerator uses extended length paths and is not subject to that limit, so deeply nested folders are still measured. This matters precisely because runaway folders tend to be deeply nested.
- **Accuracy.** File sizes are read straight from the directory entry rather than by opening each file, and each folder that denies access is counted rather than silently skipped.

The enumerator's totals were verified byte for byte against both `Get-ChildItem -Recurse` and a `DirectoryInfo` recursion over `C:\Program Files`.

### Collapsing pass-through folders

Reporting the largest folders by raw size is not very useful, because every ancestor of a large folder is also large. A raw list tends to look like this:

```text
1  7.93 GB  C:\Program Files\Microsoft Visual Studio
2  7.93 GB  C:\Program Files\Microsoft Visual Studio\18
3  4.84 GB  C:\Program Files\dotnet
```

By default, when a single subfolder accounts for at least `CollapseThreshold` percent of its parent, the parent is omitted because the subfolder is the more precise answer. The same scan then reports:

```text
1  7.93 GB  C:\Program Files\Microsoft Visual Studio\18
2  4.57 GB  C:\Program Files\Microsoft Office\root
3  3.99 GB  C:\Program Files\dotnet\packs
```

Set `CollapseThreshold` to `100` to disable this and report raw totals.

### Space the scan does not account for

The report deliberately shows the gap between the volume's used space and what the scan measured, because that gap is what tells you whether to trust the numbers. It has several legitimate causes:

- Folders that denied read access, which is the usual cause and is reported as a count.
- Junctions, symbolic links, and cloud placeholder files, which are skipped by default and reported separately. This means OneDrive content that is not actually resident on the disk is not counted as consuming local space.
- Sizes are logical file sizes, matching the `Size` column in Explorer. NTFS compression, sparse regions, cluster slack, volume shadow copies, and filesystem metadata are not represented.

The accounted total can also legitimately *exceed* the volume's used space, because hard linked files, most notably throughout `C:\Windows\WinSxS`, are counted once per link. The report says so explicitly when that happens rather than showing a negative figure.

## Payload Usage

Scans every local fixed volume, writes the report to `Get-DiskUsage-result.txt`, and returns the result object.

```powershell
.\Get-DiskUsage.ps1
```

Scans only the C: volume.

```powershell
.\Get-DiskUsage.ps1 -Path 'C:\'
```

Scans `C:\ProgramData` five levels deep, reports the ten largest folders, and includes folders down to 10MB in the tree. This is the usual way to drill into a hotspot found by an earlier run.

```powershell
.\Get-DiskUsage.ps1 -Path 'C:\ProgramData' -Depth 5 -Top 10 -MinimumFolderSize 10MB
```

Scans every fixed volume but skips any path containing either fragment.

```powershell
.\Get-DiskUsage.ps1 -ExcludePath 'C:\Windows\WinSxS', '\AppData\Local\Temp'
```

Reports raw folder totals with no pass-through collapsing, and omits the largest file section.

```powershell
.\Get-DiskUsage.ps1 -CollapseThreshold 100 -TopFile 0
```

Sizes the custom field line for a field that holds 100 characters.

```powershell
.\Get-DiskUsage.ps1 -CustomFieldLength 100
```

Inspects the largest folders found on the first target scanned.

```powershell
$usage = .\Get-DiskUsage.ps1
$usage.Targets[0].LargestFolders
```

## Parameters

| Parameter             | Alias | Required | Default   | Type     | Description                               |
| --------------------- | ----- | -------- | --------- | -------- | ----------------------------------------- |
| `Path`                | `p`   | False    | Every local fixed volume | String[] | One or more paths to scan. |
| `Depth`               | `d`   | False    | `3`       | Int      | How many levels below each target to record and to show in the folder tree. Sizes are always totalled to the full depth of the tree regardless of this value; it only limits how much detail is reported. Range 0-32. |
| `Top`                 | `t`   | False    | `5`       | Int      | The number of largest folders to report per target, and the number considered for the custom field line. Range 1-100. |
| `TopFile`             | `tf`  | False    | `10`      | Int      | The number of largest individual files to report per target. Set to `0` to omit the section. Range 0-100. |
| `MinimumFolderSize`   | `mf`  | False    | `100MB`   | Int64    | Folders smaller than this are neither recorded nor reported. |
| `MinimumFileSize`     | `ms`  | False    | `100MB`   | Int64    | Files smaller than this are never considered for the largest file list. |
| `CollapseThreshold`   | `ct`  | False    | `80`      | Int      | Percentage used to suppress pass-through folders. When a single subfolder accounts for at least this percentage of a folder's total size, the parent is omitted in favour of the subfolder. Set to `100` to disable collapsing. Range 1-100. |
| `CustomFieldLength`   | `cl`  | False    | `255`     | Int      | The maximum length of the custom field line. Entries are added whole, so the line is trimmed to those that fit. Defaults to the 255 characters a Datto custom field holds. Range 1-10000. |
| `ExcludePath`         | `e`   | False    |           | String[] | One or more case-insensitive path fragments. Any file or folder whose full path contains a fragment is skipped entirely and does not contribute to any total. |
| `FollowLink`          | `f`   | False    | `False`   | Switch   | Follow junctions, symbolic links, and cloud placeholder files. Off by default, because following links double counts data that lives elsewhere and can loop indefinitely. |
| `Quiet`               | `q`   | False    | `False`   | Switch   | Suppress progress and diagnostic console output. The log is still written in full. |

## Output

`System.Management.Automation.PSCustomObject`. A single object describing the scan:

| Name             | Type               | Description                                                                    |
| ---------------- | ------------------ | ------------------------------------------------------------------------------ |
| `ComputerName`   | string             | The machine that was scanned.                                                   |
| `ScanTime`       | datetime           | When the scan started.                                                          |
| `Elevated`       | bool               | Whether the scan ran with administrative rights.                                |
| `TotalSize`      | long               | Size accounted for across every target.                                         |
| `CustomField`    | string             | The largest folders across every target on one line, `CustomFieldLength` characters or fewer. |
| `ResultPath`     | string             | Full path of the report file. `$null` if it could not be written.                 |
| `LargestFolders` | PSCustomObject[]   | The largest folders across every target, as folder objects.                      |
| `Targets`        | PSCustomObject[]   | One object per scanned target, as below.                                         |

Each object in `Targets`:

| Name                  | Type               | Description                                                                    |
| --------------------- | ------------------ | ------------------------------------------------------------------------------ |
| `Path`                | string             | The path that was scanned.                                                      |
| `Volume`              | string             | Drive letter of the volume the target sits on.                                  |
| `VolumeName`          | string             | Volume label, if it has one.                                                    |
| `Capacity`            | long               | Size of the volume. `$null` when volume information is unavailable.              |
| `Used`                | long               | Space consumed on the volume. `$null` when volume information is unavailable.    |
| `Free`                | long               | Space free on the volume. `$null` when volume information is unavailable.        |
| `UsedPercent`         | double             | Share of the volume that is consumed. `$null` when volume information is unavailable. |
| `ScannedSize`         | long               | Size the scan was able to account for.                                          |
| `AccountedPercent`    | double             | `ScannedSize` as a share of `Used`. `$null` unless the whole volume was scanned. |
| `UnaccountedSize`     | long               | `Used` less `ScannedSize`. Negative when hard links are counted more than once. `$null` unless the whole volume was scanned. |
| `TotalFiles`          | long               | Files counted beneath the target.                                               |
| `TotalFolders`        | long               | Folders counted beneath the target.                                             |
| `ScanSeconds`         | double             | How long the target took to scan.                                               |
| `InaccessibleFolders` | long               | Folders that denied read access and were not counted.                           |
| `InaccessibleSample`  | string[]           | Up to 25 example paths that denied read access.                                 |
| `SkippedLinks`        | long               | Junctions, symbolic links, and cloud placeholders skipped.                      |
| `SkippedLinkSize`     | long               | File content behind those links, which lives elsewhere.                         |
| `LargestFolders`      | PSCustomObject[]   | The largest folders on this target, as folder objects.                          |
| `LargestFiles`        | PSCustomObject[]   | The largest files on this target. `Path` (string) and `Size` (long).             |
| `Folders`             | PSCustomObject[]   | Every recorded folder on this target, as folder objects.                        |

Each folder object:

| Name            | Type     | Description                                              |
| --------------- | -------- | -------------------------------------------------------- |
| `Path`          | string   | Full path of the folder.                                 |
| `Name`          | string   | Leaf name of the folder.                                 |
| `Depth`         | int      | Levels below the scanned target.                         |
| `TotalSize`     | long     | Size of this folder and everything beneath it.            |
| `OwnSize`       | long     | Size of the files directly inside this folder.            |
| `TotalFiles`    | long     | File count for this folder and everything beneath it.     |
| `OwnFiles`      | long     | File count for the files directly inside this folder.     |
| `TotalFolders`  | long     | Subfolder count beneath this folder.                      |
| `PercentOfRoot` | double   | Share of the scanned target's total size.                 |

The same information is written to `Get-DiskUsage-result.txt` as a report. Sample, abbreviated:

```text
=====================================================================================
 Disk Usage Report - WORKSTATION01 - 2026-07-29 10:15:40
=====================================================================================

-------------------------------------------------------------------------------------
 Target: C:\
-------------------------------------------------------------------------------------
 Volume C:
   Capacity 476.01 GB   Used 321.24 GB (67.5%)   Free 154.77 GB
   Accounted for by this scan 306.97 GB (95.6% of used)
   Not accounted for 14.27 GB
   Scanned 306.97 GB across 581,013 files and 125,655 folders in 4.8s
   Inaccessible folders 247 (contents not counted, run elevated for a complete result)
   Junctions and symbolic links skipped 206

 Largest Folders
   Rank        Size  % Root        Files  Folder
   1      114.22 GB    37.2%        2,974  C:\ProgramData\Microsoft
   2       70.85 GB    23.1%      226,746  C:\Users\SomeUser
   3       48.50 GB    15.8%      187,964  C:\Windows

 Largest Files
      67.10 GB  C:\ProgramData\Microsoft\Windows\Virtual Hard Disks\dev environment.vhdx

 Folder Tree (depth 3, folders of 100.00 MB or more)
          Size  % Root        Files  Folder
     306.97 GB   100.0%      581,013  C:\
     116.49 GB    37.9%        6,122  +- ProgramData
     114.22 GB    37.2%        2,974  |  `- Microsoft
      72.23 GB    23.5%      236,626  +- Users
      48.50 GB    15.8%      187,964  +- Windows
      12.49 GB     4.1%      105,655  |  +- WinSxS
      11.02 GB     3.6%       20,560  |  `- System32

=====================================================================================
 Largest Folders, formatted for a custom field (82 characters)
=====================================================================================
C:\ProgramData\Microsoft 114.22GB | C:\Users\SomeUser 70.85GB | C:\Windows 48.50GB
```

Result file:

```text
.\Get-DiskUsage-result.txt
```

Log files:

```text
.\Get-DiskUsage-log.txt
.\Get-DiskUsage-error.txt
```

## Changelog

### 2026-08-03

- Initial version of the document
