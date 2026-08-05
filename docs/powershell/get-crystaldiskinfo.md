---
id: 'b08e9cd3-931f-4c70-a084-6193fe3702fb'
slug: /b08e9cd3-931f-4c70-a084-6193fe3702fb
title: 'Get-CrystalDiskInfo'
title_meta: 'Get-CrystalDiskInfo'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'Gathers deep disk health and S.M.A.R.T. data using CrystalDiskInfo to identify failing drives.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-05
---

## What it does

Gathers detailed disk health and S.M.A.R.T. data to identify physically degrading hard drives and SSDs. It automatically downloads the required diagnostic tool, runs it silently, and returns a clean report.

## When to use it

Use this script during hardware audits, break-fix troubleshooting, or proactive maintenance. It helps you catch failing drives before they cause data loss.

## Requirements

- PowerShell 5.1 or higher
- Administrator privileges
- Internet access (if using the default download source)

## Default Download Behavior

If you do not provide a custom source, the script downloads the latest CrystalDiskInfo ZIP from SourceForge. The default SourceForge mirror is located in India, which some regional firewalls block. If the download fails, use the `-Source` parameter to point to your own hosted copy.

## Host Your Own Copy (Recommended)

To avoid firewall blocks and speed up deployment, download the tool once and host it on your own network.

1. Download the Standard Edition ZIP from the [official CrystalDiskInfo site](https://crystalmark.info/en/download/#CrystalDiskInfo).
2. Upload the ZIP to your internal file share, IT portal, or web server.
3. Pass that location to the script using the `-Source` parameter.

## Usage Examples

Run a standard health check:

```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1
```

Filter for failing drives:

```powershell
$FailingDisks = $GetDiskInfo | Where-Object { $_.SMART | Where-Object -Property Problematic }
```

Set a custom reallocated sector threshold (HDDs only). Flags the disk as degraded only if it exceeds 50 remapped sectors:

```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -ReallocatedSector 50
```

Use a custom local path:

```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -Source 'C:\Tools\CrystalDiskInfo.zip'
```

Use a custom network (UNC) path:

```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -Source '\\fileserver\share\CrystalDiskInfo.zip'
```

Use a custom web URL:

```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -Source 'https://host.example.com/CrystalDiskInfo.zip'
```

## Parameters

| Parameter | Alias | Required | Type | Description |
| :--- | :--- | :--- | :--- | :--- |
| `ReallocatedSector` | `r` | No | `int` | Sets the maximum allowed remapped sectors before an HDD is flagged as degraded. Ignored for SSDs. |
| `Source` | `src` | No | `string` | Path or URL to the CrystalDiskInfo ZIP. Accepts local paths, UNC shares, or HTTP URLs. Falls back to the default source if omitted or if the download fails. |

## Understanding the Results

The script returns one object per physical disk. Each object holds standard drive details plus a `SMART` array. SATA and NVMe drives report health differently, so the array has two shapes.

**SATA drives** report a vendor grade plus the physical count. `Current`, `Worst`, and `Threshold` are scores from 1 to 253 where higher is better. `RawValue` is the physical reality, such as the exact number of bad sectors. A drive can hold a perfect grade while still hiding hundreds of bad sectors.

**NVMe drives** report pure physical values only. There is no grading system. Values are converted to real units such as Celsius, percent, and gigabytes.

The `Problematic` flag is the value to trust. It is calculated from the physical data, not from the vendor grade.

## Output Property Reference

### Disk object (one per physical disk)

| Property | Example | Description |
| :--- | :--- | :--- |
| `ID` | `1` | Sequential index of the disk in the report |
| `Model` | `SKHynix_HFS512GDE9X081N` | Drive model string |
| `Firmware` | `41730C20` | Firmware revision |
| `Serial Number` | `FJB8N580114808H3A` | Drive serial number |
| `Disk Size` | `512.1 GB` | Capacity as reported by the drive |
| `Interface` | `NVM Express` | Bus type, NVM Express or Serial ATA |
| `Standard` | `NVM Express 1.3` | Protocol standard, when reported |
| `Transfer Mode` | `PCIe 3.0 x4 \| PCIe 3.0 x4` | Current and maximum transfer mode |
| `Rotation Rate` | `7200 RPM` | Present on spinning HDDs only |
| `Power On Hours` | `6020 hours` | Lifetime powered hours |
| `Power On Count` | `755 count` | Lifetime power cycles |
| `Host Reads` | `61523 GB` | Lifetime host reads, when reported |
| `Host Writes` | `36483 GB` | Lifetime host writes, when reported |
| `Temperature` | `57 C (134 F)` | Current drive temperature |
| `Health Status` | `Good (98 %)` | CrystalDiskInfo overall health verdict |
| `Features` | `S.M.A.R.T., TRIM, VolatileWriteCache` | Supported feature set |
| `Drive Letter` | `C: D:` | Letters currently assigned to the disk |
| `SMART` | Array of attribute objects | Parsed S.M.A.R.T. table, see below |

### SMART attribute object for SATA drives

| Property | Example | Description |
| :--- | :--- | :--- |
| `ID` | `05` | Attribute identifier in hex |
| `Name` | `Reallocated Sectors Count` | Attribute name as reported by the drive |
| `Format` | `SATA` | Marks the row as a SATA style attribute |
| `Current` | `100` | Normalized health score now, higher is better |
| `Worst` | `100` | Lowest normalized score ever recorded |
| `Threshold` | `36` | Vendor failure line |
| `RawHex` | `000000000138` | Raw 6 byte value as printed by CrystalDiskInfo |
| `RawValue` | `312` | Raw value converted to decimal |
| `HumanReadable` | `312 sectors` | Best effort units, vendor-specific where the raw encoding is not reliable |
| `Status` | `OK` | FAIL when Current is at or below Threshold, WARN when Worst is at or below Threshold, else OK |
| `Problematic` | `False` | True when Status is not OK or a known defect counter exceeds its threshold |

### SMART attribute object for NVMe drives

| Property | Example | Description |
| :--- | :--- | :--- |
| `ID` | `05` | Attribute identifier in hex, per the NVMe specification |
| `Name` | `Percentage Used` | Attribute name as reported by the drive |
| `Format` | `NVMe` | Marks the row as an NVMe style attribute |
| `RawHex` | `000000000002` | Raw 6 byte value as printed by CrystalDiskInfo |
| `RawValue` | `2` | Raw value converted to decimal |
| `HumanReadable` | `2 %` | Spec defined units, Celsius for temperatures, percent for spare and wear, GB for data units, minutes or hours for time counters, plain count otherwise |
| `Problematic` | `False` | True when a spec failure condition is met, see below |

## Identify Problematic Disks

Filter the results by the `Problematic` flag to find degrading drives:

```powershell
$FailingDisks = $GetDiskInfo | Where-Object { $_.SMART | Where-Object -Property Problematic }
```

An attribute is flagged `Problematic` when:

**SATA:**

- The vendor grade falls to or below the failure threshold.
- Pending, uncorrectable, or reported-uncorrectable sectors are above 0.
- Reallocated sectors exceed your `-ReallocatedSector` value, or 0 if omitted.

**NVMe:**

- Critical warning is set.
- Available spare is at or below 10 percent.
- Percentage used is at or above 95.
- Media integrity errors are above 0.
- Critical over-temperature time is above 0.

## Log Files

Execution logs and error traces are saved to the working directory.

```text
.\Get-CrystalDiskInfo-log.txt
.\Get-CrystalDiskInfo-error.txt
```

## Changelog

### 2026-08-05

- Added: Deep S.M.A.R.T. attribute parsing for both SATA and NVMe drives.
- Added: `Problematic` boolean flag to instantly identify physical drive degradation, bypassing misleading vendor health scores.
- Added: `HumanReadable` conversions for raw hex values (e.g., exact temperatures, gigabytes written, and sector counts).
- Improved: Download fallback logic and SourceForge mirror handling.

### 2026-07-29

- Added: `-Source` parameter to allow specifying a custom URL, local file path, or UNC share for the CrystalDiskInfo ZIP file.

### 2025-04-10

- Initial version of the document
