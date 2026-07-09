---
id: '57f4f1cc-c334-4434-a6d5-d2c2cae693c7'
slug: /57f4f1cc-c334-4434-a6d5-d2c2cae693c7
title: 'Check Ninja Service Monitoring [Macintosh]'
title_meta: 'Check Ninja Service Monitoring [Macintosh]'
keywords: ['Ninja','Service','NinjaRMMAgent']
description: 'Validation script for the NinjaRMM self-healing solution on macOS. Checks if the background monitoring daemon and script are intact and triggers remediation if missing.'
tags: ['application','diagnostic','macos']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Overview

This script serves as the health check for the NinjaRMM self-healing solution on macOS. Its primary function is to verify that the background monitoring system (the LaunchDaemon and the watchdog script) is fully intact and operational. 

**When to use:** This script is not designed to be run as a standalone automation. Instead, it is deployed as the **Condition** (evaluation script) within your NinjaRMM Agent Policies. If this script detects that the monitoring setup is missing or broken, it triggers the corresponding remediation script to fix it.

## How it Works

When the script runs, it performs four quick validation checks:

- **Script Presence:** It verifies that the background monitoring script exists in the expected directory (`/Library/Application Support/NinjaSelfHeal/`).
- **File Integrity:** It checks the SHA-256 file hash of the monitoring script to ensure it hasn't been corrupted, altered, or deleted.
- **Plist Registration:** It verifies that the LaunchDaemon configuration file (`.plist`) is present in `/Library/LaunchDaemons/`.
- **Daemon Status:** It confirms that the watchdog daemon (`com.ninjarmm.EnsureNinjaServiceRunning`) is actively loaded and managed by `launchd`.

If all four checks pass, the script exits successfully (Exit Code 0). If any check fails, it exits with a failure code (Exit Code 1), which tells NinjaRMM to run the "Ensure Ninja Service is Running" remediation script.

## Sample Run

> **Note:** This script is specifically engineered to operate as the detection condition within the [Ensure Ninja Service is Running [Macintosh]](/docs/1e22ec15-e4e3-4696-a115-eeb1839adeb1) policy. Manual execution is not recommended, as the script's output is intended to trigger automated remediation actions rather than provide direct feedback.

![SampleRun1](../../../static/img/docs/57f4f1cc-c334-4434-a6d5-d2c2cae693c7/image1.webp)

## Dependencies

- [Solution: NinjaRMM Agent Self-Heal](/docs/e17b4631-7778-472f-8f5f-f8de33aa3529)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/check-ninja-service-monitoring-macintosh.sh)

## Output

- **Activity Details:** Text output indicating which specific checks passed or failed (e.g., `[PASS] Script file exists and hash validates.` or `[FAIL] LaunchDaemon com.ninjarmm.EnsureNinjaServiceRunning is not loaded.`).
- **Final Result:** A clear text output indicating overall success (`Success: Monitoring configuration is fully intact.`) or failure (`Failure: Monitoring configuration is missing or invalid.`).
- **Exit Code:** Returns `0` if the monitoring setup is healthy, or `1` if remediation is required.

## Changelog

### 2026-07-07

- Initial version of the document.
