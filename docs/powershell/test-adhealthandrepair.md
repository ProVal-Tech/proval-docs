---
id: 'f2c09601-b391-449b-9380-c022f1829eda'
slug: /f2c09601-b391-449b-9380-c022f1829eda
title: 'Test-ADHealthAndRepair'
title_meta: 'Test-ADHealthAndRepair'
keywords: ['ad', 'active-directory', 'domain-controller', 'self-heal', 'check-health', 'test-health', 'repair', 'repair-health']
description: 'This script automates health checks, self-healing, and conditional service restarts for Active Directory Domain Controllers. It helps administrators quickly identify and remediate AD issues, ensuring domain controller reliability and service continuity.'
tags: ['active-directory', 'domain']
draft: false
unlisted: false
---

## Overview

This script automates health checks, self-healing, and conditional service restarts for Active Directory Domain Controllers. It helps administrators quickly identify and remediate AD issues, ensuring domain controller reliability and service continuity.

## Requirements

- Must be run on a Domain Controller.
- Requires PowerShell 5 or later.
- Must be executed with administrative privileges.
- Internet access may be required for module installation (Strapper).

## Process

1. Checks if the host is a Domain Controller.
2. Initializes required modules and environment settings.
3. Tracks and stores the last script run time for event log queries.
4. Performs AD health checks using `dcdiag`, `repadmin /replsummary`, and `repadmin /showrepl`.
5. Queries Windows event logs for recent critical or error events in DNS Server and Directory Service logs.
6. Logs all findings and outcomes.
7. If issues are detected and self-healing is enabled, runs remediation steps:
    - Synchronizes AD replication.
    - Flushes DNS resolver cache.
    - Re-registers DNS records.
    - Updates domain controller DNS registration.
8. If issues are detected and SelfHeal is enabled, restarts all or selected AD-related services as specified by parameters.
9. Logs the outcome of each service restart and remediation step.
10. Updates and stores the script run time for future audits.

## Payload Usage

```PowerShell
.\Test-ADHealthAndRepair.ps1
```

Runs a health check only. No self-healing or service restart actions will be performed.

```PowerShell
.\Test-ADHealthAndRepair.ps1 -SelfHeal
```

Runs a health check and initiates self-healing actions if issues are found.

```PowerShell
.\Test-ADHealthAndRepair.ps1 -SelfHeal -RestartAllADService
```

Runs a health check, initiates self-healing actions, and restarts all core AD-related services if issues are found.

```PowerShell
.\Test-ADHealthAndRepair.ps1 -SelfHeal -ServicesToRestart 'DNS','Netlogon'
```

Runs a health check, initiates self-healing actions, and restarts only the specified AD-related services if issues are found.

## Parameters

| Parameter             | Alias | Required | Default | Type      | Description                                                                 |
| --------------------- | ----- | -------- | ------- | --------- | --------------------------------------------------------------------------- |
| `SelfHeal`            |       | False    |         | Switch    | Initiates self-healing actions if AD issues are detected.                   |
| `RestartAllADService` |       | False    |         | Switch    | Restarts all core AD-related services if issues are detected and SelfHeal is enabled. |
| `ServicesToRestart`   |       | False    |         | String[]  | Specify one or more AD-related services to restart if issues are detected and SelfHeal is enabled. |

## Output

Location of output for log and error files:

    .\Test-ADHealthAndRepair-log.txt
    .\Test-ADHealthAndRepair-error.txt
