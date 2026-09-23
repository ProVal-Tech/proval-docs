---
id: 'bb5b1652-515d-4981-95ca-a983d1e04b84'
slug: /bb5b1652-515d-4981-95ca-a983d1e04b84
title: 'Test-VcRuntime'
title_meta: 'Test-VcRuntime'
keywords: ['visual-c++', 'vcredist', 'runtime', 'health-check', 'remediation', 'dism', 'sfc', 'windows']
description: 'Checks the Microsoft Visual C++ 2015-2022 runtime for corruption and optionally remediates it by reinstalling the latest redistributables and running DISM and SFC repairs.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-23
---

## Description

Checks the Microsoft Visual C++ 2015-2022 runtime for corruption and optionally remediates it by reinstalling the latest redistributables and running DISM and SFC repairs.

The script runs under SYSTEM via your RMM platform and returns exactly one of two strings on the pipeline: `Healthy` or `Corrupted`. Without parameters it is completely read-only — no downloads, no installs, no system changes. When corruption is detected and the `Remediate` switch is supplied, it downloads the latest x64 and x86 redistributables directly from Microsoft, installs them silently, repairs the component store and system files, re-validates the runtime, and removes every temporary file it created.

All diagnostic detail — which DLL was missing, installer exit codes, full DISM and SFC results, and whether a restart is required — is written to the Strapper log. The script emits no console output and uses no exit codes, so detection and remediation can be driven from the same script by any platform.

---

## How It Works

### Health Check (every run)

1. **DLL validation:** Confirms that `vcruntime140.dll`, `vcruntime140_1.dll`, and `msvcp140.dll` exist and are readable in `System32` (64-bit), and that `vcruntime140.dll` and `msvcp140.dll` exist and are readable in `SysWOW64` (32-bit).
2. **Registry validation:** Confirms that the x64 and x86 runtime registry keys exist and report `Installed = 1`.
3. **Result:** If everything passes, the script returns `Healthy` and stops — nothing is downloaded or modified, even with `-Remediate` supplied. If any check fails, the failing item is logged and the script returns `Corrupted` (report-only) or proceeds to remediation (with `-Remediate`).

### Remediation Flow (only with `-Remediate` on a corrupted machine)

1. **Download:** Pulls the latest x64 and x86 redistributables from `aka.ms` (always the current 2015-2022 build — no version pinning needed).
2. **Install:** Silently installs both redistributables (`/install /quiet /norestart`). Exit codes `0`, `1638` (newer version already installed), and `3010` (reboot required) are accepted as success.
3. **DISM:** Runs `DISM /Online /Cleanup-Image /RestoreHealth` to repair the component store. Must exit with code `0` or the run is flagged as failed.
4. **SFC:** Runs `sfc /scannow` to verify and repair system files. Its result is logged (Error level if it could not repair files) but does not gate the final result.
5. **Post-validation:** Re-runs the identical health check. The definition of healthy is the same before and after.
6. **Cleanup:** Removes both installers, both output capture files, and the working folder — regardless of outcome.
7. **Return:** `Healthy` when all repair steps succeeded and post-validation passed; `Corrupted` otherwise.

### Scenario Handling

| Scenario | What Happens |
|----------|--------------|
| Runtime is healthy | Two log lines, returns `Healthy`. Nothing is created, downloaded, or modified — with or without `-Remediate`. |
| Corruption detected, no `-Remediate` | The failing check is logged at Error level, returns `Corrupted`. Nothing is downloaded, installed, or modified. |
| Corruption detected, `-Remediate` supplied | Full repair chain runs (download → install → DISM → SFC → re-validate → cleanup). |
| A download fails | Logged at Error level, returns `Corrupted`. Partial files may remain in the working folder; the next completed remediation run removes them. |
| Installer returns `3010` | Accepted as success. Restart is flagged and logged at Warning with an explicit restart-required message. |
| Installer returns `1638` | Accepted as success — a newer redistributable is already present. |
| DISM returns any non-zero code | Run is flagged as failed, returns `Corrupted` even if the runtime itself validates afterwards. |
| SFC cannot repair files | Logged at Error level with the full SFC result, but does not change the return value. |
| Machine uses WSUS via Group Policy | DISM may fail to find source files unless configured to bypass WSUS. The failure is logged and gates the run as `Corrupted`. |
| A restart is pending (from `3010`, DISM, or SFC) | Logged as a Warning line: `A restart is required to complete one or more repairs.` The return value is unaffected. The script never reboots the machine itself. |

### Reboot Reporting

Every completed remediation run logs one definitive line before returning:

- `A restart is required to complete one or more repairs.` (Warning) — triggered by installer exit code `3010`, DISM output mentioning a restart, or SFC reporting a pending or completed repair.
- `No restart is required to complete the repairs.` (Information) — no repair flagged a restart.

Reboot policy stays with your platform. Operators or automation watching for reboots should key off the Warning-level log line.

---

## Requirements

- Windows 10/11 or Windows Server 2016+
- PowerShell 5.1, 64-bit (the System32/SysWOW64 checks rely on the native file view)
- Administrative context (SYSTEM via RMM recommended)
- Internet access (for the Strapper module every run; additionally for `aka.ms` downloads during remediation)

---

## Dependencies

- Strapper module (auto-installed from PSGallery at runtime — no manual setup)

---

## Parameters

| Parameter | Default | Type | Description |
|-----------|---------|------|-------------|
| `Remediate` | `False` | Switch | Remediates a corrupted runtime (download + silent install + DISM + SFC + re-validation + cleanup). When absent the script performs a read-only health check and only reports. |

The script has no other inputs. Redistributable URLs, paths, the DLL list, and the registry key list are defined once in the script's variables region.

---

## Return Values

| Scenario | Pipeline Return |
|----------|-----------------|
| All DLL and registry checks pass on the first validation | `Healthy` |
| Any check fails, `-Remediate` not supplied | `Corrupted` |
| `-Remediate` supplied, all repair steps succeed, post-validation passes | `Healthy` |
| Working folder creation or a download fails | `Corrupted` |
| Any installer exits with an unexpected code, or DISM exits non-zero | `Corrupted` |
| Post-remediation validation fails | `Corrupted` |

There are no exit codes. `Healthy` covers both "was already healthy" and "was remediated successfully". A pending restart does **not** change the return value — it is reported in the log only. Platforms that branch on exit codes need a thin wrapper (see Usage Examples).

---

## Health Check Criteria

Critical DLLs (existence + readability):

| DLL | View |
|-----|------|
| `vcruntime140.dll` | 64-bit (`System32`) |
| `vcruntime140_1.dll` | 64-bit (`System32`) |
| `msvcp140.dll` | 64-bit (`System32`) |
| `vcruntime140.dll` | 32-bit (`SysWOW64`) |
| `msvcp140.dll` | 32-bit (`SysWOW64`) |

Registry markers:

| Key | Condition |
|-----|-----------|
| `HKLM:\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64` | exists and `Installed` = `1` |
| `HKLM:\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x86` | exists and `Installed` = `1` |

Notes:

- `14.0` covers the entire 2015-2022 redistributable line — every version in that line is binary-compatible and registers under the same keys.
- `vcruntime140_1.dll` ships only with the 64-bit runtime, which is why the 32-bit list omits it.
- The check validates presence and readability, not file integrity. A present-but-corrupt DLL with healthy registry markers passes the check — the remediation path (reinstall + DISM + SFC) is the recovery for that scenario.
- Evaluation short-circuits on the first failure and logs the failing item.

---

## DISM and SFC Output Logging

Both tools run with their console output captured, so their full results land in the Strapper log as readable text instead of being lost to the RMM session:

1. Console output encoding is switched to Unicode (and restored afterwards) so native-tool output decodes correctly.
2. Raw stdout and stderr are joined, null characters stripped, and blank lines collapsed.
3. The cleaned text is written to a timestamped UTF8 capture file in the working folder.
4. The file is read back and filtered for readability — DISM keeps lines with real text plus the final `100.0%` progress bar; SFC drops `Verification X% complete.` progress noise.
5. The result is logged as a single entry: `DISM repair results: ...` or `SFC scan results: ...`, leveled by content (Error when SFC could not repair, Warning when a restart is pending, Information otherwise).

Capture files live in the `VCHealth` working folder so the cleanup step removes them together with everything else.

---

## Usage Examples

### Example 1: Read-only health check

```powershell
.\Test-VcRuntime.ps1
```

**What happens:**

- On a healthy machine: two log lines, returns `Healthy`. Nothing is created or modified.
- On a corrupted machine: the failing check (e.g. `Missing DLL: C:\Windows\System32\vcruntime140_1.dll`) is logged at Error level, returns `Corrupted`. Nothing is downloaded or installed.

### Example 2: Check with conditional remediation

```powershell
.\Test-VcRuntime.ps1 -Remediate
```

**What happens:**

- On a healthy machine: identical to Example 1 — the remediation chain never starts.
- On a corrupted machine: the full repair chain runs — working folder created, both redistributables downloaded from `aka.ms` and silently installed, DISM RestoreHealth and SFC scannow run with their output captured and logged, the health check re-runs, everything is cleaned up, and `Healthy` or `Corrupted` is returned based on the outcome.

### Example 3: Branching on the result

```powershell
$runtimeState = .\Test-VcRuntime.ps1
if ($runtimeState -eq 'Corrupted') {
    .\Test-VcRuntime.ps1 -Remediate
}
```

**What happens:**

- The first run reports only. The second run remediates only if corruption was found.
- Useful for manual runs or scripts that want an explicit detection step before committing to changes.

### Example 4: RMM integration (NinjaOne / Datto)

Upload the same script twice:

- **Condition / monitor:** run without the switch; alert or ticket when the output is `Corrupted`.
- **Remediation:** run with `-Remediate`.

For platforms that branch on exit codes, wrap with a translation layer:

```powershell
$output = & 'C:\ProgramData\_Automation\Script\Test-VcRuntime\Test-VcRuntime.ps1' -Remediate
if ($output -eq 'Corrupted') { exit 1 } else { exit 0 }
```

**What happens:**

- The wrapper maps `Healthy` → exit code `0` and `Corrupted` → exit code `1`, so standard RMM success/failure conditions work unchanged.
- All detail (DLL/registry failures, installer exit codes, DISM/SFC results, reboot status) remains in the Strapper log for the ticket.

### Example 5: Remediation on a corrupted machine with a pending reboot

```powershell
.\Test-VcRuntime.ps1 -Remediate
```

**What happens:**

1. Health check finds `C:\Windows\System32\vcruntime140_1.dll` missing; logged at Error level.
2. Working folder `C:\ProgramData\_Automation\App\VCHealth` is created; both installers are downloaded.
3. x64 installer completes with exit code `3010` — accepted as success, restart flagged, logged at Warning.
4. x86 installer completes with exit code `0`.
5. DISM RestoreHealth runs; its output is captured, cleaned, and logged as readable text.
6. SFC scannow runs the same way; its result is leveled by content.
7. Post-validation passes — all five DLLs and both registry keys check out.
8. Installers, capture files, and the working folder are removed.
9. The log records `A restart is required to complete one or more repairs.`

Strapper log excerpt:

```PlainText
Beginning Microsoft Visual C++ runtime health check.
Missing DLL: C:\Windows\System32\vcruntime140_1.dll
Corruption detected and the Remediate switch was supplied; beginning remediation.
Created working folder C:\ProgramData\_Automation\App\VCHealth.
Downloading the latest Microsoft Visual C++ redistributables.
Both redistributables downloaded successfully.
Installing the x64 Visual C++ redistributable.
The x64 redistributable installer completed with exit code 3010; a restart is required to finish the installation.
Installing the x86 Visual C++ redistributable.
The x86 redistributable installer completed with exit code 0.
Starting DISM RestoreHealth. This may take several minutes.
DISM repair results: Deployment Image Servicing and Management tool Version: 10.0... The restore operation completed successfully.
DISM RestoreHealth completed successfully.
Starting SFC scannow. This may take several minutes.
SFC scan successfully repaired system files.
SFC scan results: Beginning system scan. This process will take some time. ... Windows Resource Protection found corrupt files and successfully repaired them.
Re-validating the Visual C++ runtime after remediation.
Removing the downloaded redistributables and the temporary working folder.
A restart is required to complete one or more repairs.
Visual C++ runtime remediation completed successfully; the runtime is healthy.
```

Pipeline output:

```PlainText
Healthy
```

> **Note:** A healthy machine (with or without `-Remediate`) produces exactly two log lines and returns `Healthy`. Exit code `1638` from an installer is not an error — it means an equal or newer version of the redistributable is already installed.

---

## Output Artifacts

| Artifact | Path |
|----------|------|
| Working folder | `C:\ProgramData\_Automation\App\VCHealth` — created only during remediation, removed at the end of a completed run |
| x64 installer (transient) | `C:\ProgramData\_Automation\App\VCHealth\vc_redist.x64.exe` |
| x86 installer (transient) | `C:\ProgramData\_Automation\App\VCHealth\vc_redist.x86.exe` |
| DISM capture file (transient) | `C:\ProgramData\_Automation\App\VCHealth\Test-VcRuntime-DismRepair-<timestamp>.log` |
| SFC capture file (transient) | `C:\ProgramData\_Automation\App\VCHealth\Test-VcRuntime-SfcScan-<timestamp>.log` |
| Strapper log | Managed by the Strapper module per `Set-StrapperEnvironment` defaults |

No persistent artifacts, no stored state, and no scheduled tasks. The script itself writes no registry values — only the redistributable installers modify the system.

---

## Changelog

### 2026-09-23

- Initial version of the document.
