---
id: '81d82975-889b-49e4-b229-36d4f162a4ff'
slug: /81d82975-889b-49e4-b229-36d4f162a4ff
title: 'Get-LatestInstalledCU'
title_meta: 'Get-LatestInstalledCU'
keywords: ['cumulative', 'update', 'windows', 'patch']
description: 'Documentation for the Get-LatestInstalledCU command to retrieve the most recent cumulative update installed on the system.'
tags: ['update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-10
---

## Description

Identifies the most recent Windows Cumulative Update (CU) installed on your system and its official release date. It matches your current OS build number against a structured dataset to instantly retrieve patch details. If the dataset is unavailable, it automatically falls back to your local Windows Update logs.

## What you need

- **Administrator privileges** to read system update logs.
- **PowerShell 5.1** or later.
- A supported operating system:
  - Windows 10 or Windows 11
  - Windows Server 2016, 2019, 2022, or 2025

## Check your latest update

Use this script to verify patch compliance, audit fleet health, or generate system reports.

1. Open PowerShell as an Administrator.
2. Run the script:

   ```powershell
   .\Get-LatestInstalledCU.ps1
   ```

3. Review the returned object to confirm your KB article ID and release date.

**You'll know it worked when** you see a formatted summary of your latest Cumulative Update, including the `KBid` and `ReleaseDate`.

**Example output:**

```text
LastInstalledCU : 2026-07-18 KB5121768 July Cumulative Update
OSBuild         : 10.0.26200.8893
ReleaseDate     : 2026-07-18
KBid            : KB5121768
Title           : 2026-07-18 Cumulative Update for Windows (OS Build 26200.8893) (KB5121768)
```

## Update history dataset

The script relies on a machine-readable update history dataset to map build numbers to KB articles.

- **Default URL**: `https://api.datafornerds.io/v2/microsoft/windows-update-history.json`
- **Offline Support**: The dataset is cached locally on your machine. The script will continue to work during network outages using this cached file.
- **Customization**: Point the script to an internal mirror using the `-UpdateHistoryUrl` parameter if you prefer to host the dataset internally.

## Troubleshooting

- **No release date found**: If the script cannot reach the dataset URL and the local cache is missing, it falls back to the Windows Update Agent install date. Ensure the machine has internet access on the first run to populate the cache.
- **Unsupported OS**: The script only supports operating systems that receive modern Cumulative Updates from Microsoft.

## Changelog

### 2026-08-10

- Replaced web-scraping logic with a fast, cached JSON dataset lookup.
- Added local Windows Update Agent and CBS log fallbacks for offline reliability.
- Simplified documentation to focus on practical usage and outcomes.

### 2025-04-10

- Initial version of the document.
