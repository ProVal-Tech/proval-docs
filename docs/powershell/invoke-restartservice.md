---
id: 'df5d8267-5836-48d8-8971-a5cc8b33722d'
slug: /df5d8267-5836-48d8-8971-a5cc8b33722d
title: 'Invoke-RestartService'
title_meta: 'Invoke-RestartService'
keywords: ['restart', 'service', 'services', 'recovery', 'stuck service', 'svchost']
description: 'Restarts one or more Windows services at the same time, recovers services that fail to restart normally, and confirms that each one is running.'
tags: ['performance', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-10
---

## Overview

Invoke-RestartService restarts one or more Windows services at the same time and confirms that each one is running afterward. When a service doesn't restart normally, the script recovers it by forcefully ending the service's process and starting the service again. The script makes changes: it restarts services and can end a service's process.

**Key Features:**

- **Parallel restarts:** Every requested service restarts at the same time, so one slow service doesn't hold up the others.
- **Recovery for stuck services:** A service that doesn't restart normally is started again, after its process is forcefully ended when needed.
- **Shared processes protected:** The script never ends a process that also runs other services, such as a shared `svchost.exe`, so those services keep running.
- **Confirmed results:** A recovered service only counts as restarted when it's still running 60 seconds after it starts.
- **Flexible names:** Service names, display names and wildcards all work.
- **Disabled services skipped:** Services set to Disabled are left alone.
- **Detailed log:** The log records each step, including why a normal restart failed and which dependent services were running.

## Requirements

- PowerShell version 5.1 or later.
- Windows 10, Windows 11, or Windows Server 2016 or later.
- Administrative privileges (SYSTEM context).
- Network access to **ProVal's File Server** to download the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to `[www.powershellgallery.com](https://www.powershellgallery.com)` (queried by `Install-PSGalleryModule` to download the Strapper module).

## Dependencies

- [Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)

## Payload Usage

Below are usage examples:

### Example 1

Restarts the SAAZDPMACTL, SAAZWatchDog, SAAZServerPlus and SAAZScheduler services at the same time and confirms that each one is running.

```powershell
.\Invoke-RestartService.ps1 -ServiceNames 'SAAZDPMACTL', 'SAAZWatchDog', 'SAAZServerPlus', 'SAAZScheduler'
```

### Example 2

Restarts the Print Spooler service by its display name instead of its service name.

```powershell
.\Invoke-RestartService.ps1 -ServiceNames 'Print Spooler'
```

### Example 3

Restarts every service whose name starts with `SAAZ`, except any that are set to Disabled.

```powershell
.\Invoke-RestartService.ps1 -ServiceNames 'SAAZ*'
```

## What Happens When You Run the Script

1. The script installs or updates the Strapper logging module.
2. It looks up each requested name. A name that matches no service is logged as an error and reported as failed. A service set to Disabled is skipped without any change.
3. It starts restarting every remaining service at the same time, and logs each service's status, startup type and running dependent services.
4. It waits up to 60 seconds for the restarts to finish, then stops any restart that's still running.
5. For each service that didn't restart, it logs the reason and recovers the service:
    1. If the service isn't stopped yet, it forcefully ends the service's process. It leaves the service as it is when the process can't be found, when the process also runs other services, or when ending the process fails.
    2. It starts the service, waits 60 seconds, and checks that the service is still running.
6. It logs a summary of the results and returns a result for each service.

You'll know it worked when the services show as **Running** in Services and the log shows `Restart summary: 4 of 4 service(s) restarted successfully.`

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `ServiceNames` | `'Spooler', 'W32Time'` | One or more service names, display names or wildcards | True | | String[] | The services to restart. |

## Good to Know

- A run takes up to about 60 seconds for the restarts, plus about 60 seconds for each service that needs recovery, since recoveries run one after another. Allow for this when you set a timeout for the script.
- A normal restart can't stop a service while its dependent services are running, so that service goes through recovery instead. The script doesn't stop or restart the dependent services.
- A requested service that's stopped, but not disabled, is started.
- A wildcard restarts every service it matches, so keep it as specific as possible.
- Disabled services aren't included in the results.

:::warning

Forcefully ending a process skips the service's normal shutdown, so the service can lose data it hasn't saved yet. Use the script on services that are safe to end this way.

:::

## Troubleshooting

| Problem | Cause | Solution |
| ------- | ----- | -------- |
| `No service matching <Name> was found on this computer.` | No service on the device has this name or display name, or the wildcard matches nothing. | Check the name in Services, then run the script again with the correct name. |
| `Service <Name> is set to Disabled. Taking no action on this service.` | The service's startup type is Disabled. | Change the startup type if the service should run, then run the script again. |
| `The restart job for service <Name> did not finish within 60 seconds. Stopping the job.` | The service took longer than 60 seconds to restart, usually because it hung while stopping. | No action is needed when the recovery that follows succeeds. If it happens on every run, check why the service is slow to stop. |
| `Restart error for service <Name>: Cannot stop service '<Display Name> (<Name>)' because it has dependent services. It can only be stopped if the Force flag is set.` | Running dependent services blocked the normal restart, so the service went through recovery. | No action is needed when the recovery succeeds. Check that the dependent services still work. |
| `Service <Name> shares process <Process ID> with other services: <Names>. Skipping the forced termination so those services are not stopped.` | The service runs in one process with other services, such as a shared `svchost.exe`, and ending that process would stop them all. | Restart the service manually, or restart the device during a maintenance window. |
| `Unable to find the process ID of service <Name>. Status: <Status>.` | The service is stuck in a pending state without a running process. | Restart the device. |
| `Failed to terminate process <Process ID> of service <Name>. Reason: <Reason>` | The process couldn't be ended, for example because security software protects it. | Restart the service with the vendor's tools, or restart the device. |
| `Service <Name> is in the <Status> state 60 seconds after the recovery start. It did not start properly or stopped again. Please review the service.` | The service didn't start, or it started and stopped again. | Check the System event log and the service's own logs for the reason. |
| The script doesn't run, and PowerShell reports that it must run as Administrator. | The script wasn't run with administrative privileges. | Run it as SYSTEM or from an elevated PowerShell window. |

## Output

The script restarts the requested services and returns an object for each service it processed:

| Property | Type | Description |
| -------- | ---- | ----------- |
| `Name` | String | The service name. For a name that matched no service, the name as it was requested. |
| `Success` | Boolean | `True` when the service was restarted and is running, otherwise `False`. |

Disabled services have no result.

Log files (next to the script):

- `.\Invoke-RestartService-log.txt`
- `.\Invoke-RestartService-error.txt`

## Changelog

### 2026-11-10

- Names that match no service are now reported as failed, and display names and wildcards resolve to their services.
- Restarts still running after 60 seconds are now stopped before the recovery starts.
- The script no longer ends a process that also runs other services.
- The log now records each step, the reason a restart failed, and a summary of the results.
- Updated the document to the new format.

### 2025-04-10

- Initial version of the document
