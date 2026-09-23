---
id: '0cf14533-c145-4a77-8ea7-8c70476768a9'
slug: /0cf14533-c145-4a77-8ea7-8c70476768a9
title: 'Install-SnapAgent'
title_meta: 'Install-SnapAgent'
keywords: ['install', 'snapagent', 'software', 'monitoring']
description: 'Documentation for the Install-SnapAgent command to install SnapAgent on Windows computers.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-23
---

## What it does

Installs the Blackpoint SnapAgent monitoring agent on a Windows computer. The installation runs silently and verifies itself when finished.

## What you need

- A 64-bit Windows computer.
- PowerShell 5.1 or later.
- Administrator rights — the script must run elevated.
- The licensed installer URL for your environment.
- Internet access to that URL.

## How to run it

1. Get the licensed installer URL from your service provider.
2. Open PowerShell as Administrator.
3. Run the script with your URL.
4. Wait for completion. Verification can take up to 5 minutes after the installer finishes.

```powershell
.\Install-SnapAgent.ps1 -Url 'https://example.com/SnapAgent.exe'
```

Replace the example URL with your licensed package link. Parameter names are not case-sensitive, so `-URL` also works.

## Parameters

| Parameter | Type   | Required | Default | Description                                             |
| --------- | ------ | -------- | ------- | ------------------------------------------------------- |
| `Url`     | String | Yes      | None    | Web address of the licensed SnapAgent installer file.  |

## What happens when you run it

- The installer package is downloaded to `C:\ProgramData\_Automation\App\SnapAgent`.
- The agent installs silently — no user interaction is needed.
- The script waits up to 5 minutes for the agent to register.
- The final result is written to the log files as `Success:` or `Failure:`.

## You'll know it worked when

- The last line of `Install-SnapAgent-Log.txt` reads `Success: Installed SnapAgent.`
- SnapAgent appears in Settings > Apps (or Programs and Features).
- The folder `C:\Program Files (x86)\Blackpoint\SnapAgent` exists.

## Troubleshooting

| Problem | Likely cause | What to do |
| ------- | ------------ | ---------- |
| Script stops with a message about a missing `Url` parameter. | The URL was not provided. | Rerun the command and include `-Url`. |
| `Download failed from ...` in the log. | The URL is wrong or expired, or the computer cannot reach it. | Open the URL in a browser to test it. Check the firewall, then rerun. |
| `Failed to create working directory ...` in the log. | PowerShell was not run as Administrator. | Reopen PowerShell as Administrator and rerun. |
| `Failure: Installation verification failed` after about 5 minutes. | The installer ran, but the agent did not register. | Check `Install-SnapAgent-Error.txt` for the exit code and rerun once. If it fails again, contact support with both log files. |

## Log files

Both files are created in the folder where the script runs:

- `Install-SnapAgent-Log.txt` — full progress record.
- `Install-SnapAgent-Error.txt` — errors only.

Attach both files when contacting support.

## Changelog

### 2026-09-23

- Document rewritten to match current script behavior.
- Corrected installation and verification timing.
- Documented the `Url` parameter (`-URL` is still accepted).

### 2025-04-10

- Initial version of the document
