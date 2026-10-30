---
id: '0cf14533-c145-4a77-8ea7-8c70476768a9'
slug: /0cf14533-c145-4a77-8ea7-8c70476768a9
title: 'Install-BlackpointAgent'
title_meta: 'Install-BlackpointAgent'
keywords: ['install', 'blackpoint', 'snapagent', 'software', 'monitoring']
description: 'Documentation for the Install-BlackpointAgent command to install the Blackpoint SnapAgent on Windows computers using a Customer ID and Authentication Token.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-30
---

## What it does

Installs the Blackpoint SnapAgent on a Windows computer. The script downloads the installer for Blackpoint Customer ID, installs it with no user interaction, and verifies that the agent is installed.

## What you need

- A Windows computer.
- PowerShell 5.1 or later.
- Administrator rights — the script must run elevated (as Administrator or as the RMM SYSTEM account).
- Your Blackpoint **Customer ID** and **Authentication Token**.
- Internet access to:
  - `agent-sega-production-snap.bpcyber.net` (Blackpoint installer download).
  - `contentrepo.net` and the PowerShell Gallery (used to load the logging module).

## How to run it

1. Get your Blackpoint Customer ID and Authentication Token.
2. Open PowerShell as Administrator.
3. Run the script with both values.
4. Wait for completion. If the agent is not registered right away, verification can take up to 5 minutes.

```powershell
.\Install-BlackpointAgent.ps1 -CustomerID '00000000-0000-0000-0000-000000000000' -AuthenticationToken '<AuthenticationToken>'
```

Replace the example values with your own Customer ID and Authentication Token.

## Parameters

| Parameter             | Type   | Required | Default | Description                                                                             |
| --------------------- | ------ | -------- | ------- | --------------------------------------------------------------------------------------- |
| `CustomerID`          | String | Yes      | None    | Blackpoint Customer ID used to download the installer and register the agent.          |
| `AuthenticationToken` | String | Yes      | None    | Blackpoint Authentication Token used to authorize the download and register the agent. |

## What happens when you run it

- The installer for Customer ID is downloaded to `C:\ProgramData\_Automation\App\Blackpoint Agent\Blackpoint Agent.exe`. The Authentication Token is used to authorize the download.
- The agent installs in passive mode with Customer ID and Authentication Token — no user interaction is needed.
- The script checks Windows for an installed program named `Blackpoint Agent`. If found, the install is reported as successful.
- If it is not found, the script waits up to 5 minutes for the `blackpointagent` Windows service to start.
- The final result is written to the log files as `Success:` or `Failure:`.

## You'll know it worked when

- The last line of `Install-BlackpointAgent-Log.txt` reads `Success: Installed Blackpoint Agent.` or `Success: Installed Blackpoint Agent. Blackpoint Agent service is running.`
- Blackpoint Agent appears in Settings > Apps (or Programs and Features).
- The `blackpointagent` service shows as **Running** in Services.

## Troubleshooting

| Problem | Likely cause | What to do |
| ------- | ------------ | ---------- |
| Script stops with a message about a missing `CustomerID` or `AuthenticationToken` parameter. | One or both values were not provided. | Rerun the command and include both `-CustomerID` and `-AuthenticationToken`. |
| Script stops before running, saying it requires Administrator. | PowerShell was not run elevated. | Reopen PowerShell as Administrator and rerun. |
| `Download failed. Reason: ...` in the log. | The Customer ID or Authentication Token is wrong, or the computer cannot reach `agent-sega-production-snap.bpcyber.net`. | Check both values, check the firewall, then rerun. |
| `Failed to create working directory ...` in the log. | The computer blocked folder creation under `C:\ProgramData`. | Check permissions and security software, then rerun. |
| `Installation process failed. Reason: ...` in the log. | The downloaded installer could not be started. | Check that security software did not block or remove the file, then rerun. |
| `Failure: Installation verification failed` after about 5 minutes. | The installer ran, but the agent service did not start. | Check `Install-BlackpointAgent-Error.txt` for the service status and exit code, and rerun once. If it fails again, contact support with both log files. |


## Log files

Both files are created in the folder where the script runs:

- `Install-BlackpointAgent-Log.txt` — full progress record.
- `Install-BlackpointAgent-Error.txt` — errors only.

Attach both files when contacting support.

## Changelog

### 2026-10-30

- Script renamed from `Install-SnapAgent` to `Install-BlackpointAgent`.
- Replaced the `Url` parameter with the mandatory `CustomerID` and `AuthenticationToken` parameters. The installer is now downloaded from the Blackpoint installer API.
- Installation is now verified through the installed programs list, then the `blackpointagent` service.
- Updated working directory and log file names.

### 2026-09-23

- Document rewritten to match current script behavior.
- Corrected installation and verification timing.
- Documented the `Url` parameter (`-URL` is still accepted).

### 2025-04-10

- Initial version of the document
