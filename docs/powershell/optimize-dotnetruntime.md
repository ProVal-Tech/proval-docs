---
id: '6ec8fb3c-29ef-4b05-b8fd-546eb07176c7'
slug: /6ec8fb3c-29ef-4b05-b8fd-546eb07176c7
title: 'Optimize-DotNetRunTime'
title_meta: 'Optimize-DotNetRunTime'
keywords: ['dotnet', '.net', 'runtime', 'sdk', 'desktop-runtime', 'aspnetcore', 'end-of-support', 'eol', 'update', 'uninstall']
description: 'Lists, installs, updates, and removes .NET SDKs and runtimes on Windows, and can keep approved out-of-support versions such as .NET 8 and .NET 9 patched.'
tags: ['dotnet','windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Overview

Keeps .NET on Windows current. The script lists, installs, updates, and removes .NET SDKs and runtimes, and reads Microsoft's release data on every run to decide which versions are supported. The `list` action only reads information. Every other action installs or removes software.

**Key Features:**

- **Five actions:** `list`, `install`, `update`, `uninstall`, and `renew` cover everything from an audit to a full cleanup.
- **Always current:** Supported versions and their latest releases come from Microsoft at run time, so the script needs no changes when Microsoft ships or retires a version.
- **Approved versions:** Versions Microsoft no longer supports can be kept and patched by listing them in `AdditionalApprovedVersion`.
- **Version targeting:** `Version` limits an action to the major versions you choose.
- **x64 and x86 aware:** Both sets of components are found and cleaned up separately.

:::warning

.NET 8 and .NET 9 reached end of support on November 10, 2026. See [Microsoft's announcement](https://devblogs.microsoft.com/dotnet/dotnet-8-9-end-of-support/). Since then, `uninstall` and `renew` remove them and `update` no longer patches them. To keep them for applications that still need them, add `-AdditionalApprovedVersion 8, 9` to every run.

:::

## Requirements

- PowerShell version 5 or later.
- Windows 10, Windows 11, or Windows Server 2016 or later.
- Administrative privileges (SYSTEM context).
- Network access to **ProVal's File Server** to download the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to `www.powershellgallery.com` (queried by `Install-PSGalleryModule` to download the Strapper module).
- Network access to Microsoft's .NET release data at `dotnetcli.blob.core.windows.net` and to the Microsoft download servers it lists.
- Network access to `github.com` to download Microsoft's .NET Uninstall Tool the first time a removal needs it.
- The Background Intelligent Transfer Service (BITS), which the script uses for downloads.

## Dependencies

- [Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)
- [.NET Uninstall Tool](https://learn.microsoft.com/dotnet/core/additional-tools/uninstall-tool-overview) from Microsoft. The script installs it when an action removes components.

## Payload Usage

Below are usage examples:

### Example 1: List installed components

Shows every installed .NET SDK and runtime with its support and update status. Nothing is changed.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list
```

### Example 2: List selected types and versions

Shows only the .NET 8 and .NET 9 SDKs.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -Type sdk -Version 8, 9
```

### Example 3: Preview what an approval keeps

Shows the list with .NET 8 and .NET 9 marked as supported. Components that still show `Supported` as `0` are the ones `uninstall` and `renew` would remove.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -AdditionalApprovedVersion 8, 9
```

### Example 4: Install the latest Desktop Runtime

Installs the latest release of the newest supported .NET Desktop Runtime. `desktopRuntime` is the default type for every action except `list`.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install
```

### Example 5: Install the latest release of every component type

Installs the newest supported SDK, runtime, ASP.NET Core runtime, and Desktop Runtime.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type all
```

### Example 6: Install specific versions

Installs the latest release of the .NET 8 and .NET 9 Desktop Runtimes. Out-of-support versions install with a note in the log.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type desktopRuntime -Version 8, 9
```

### Example 7: Update supported versions

Patches every installed supported version to its latest release and removes its older patches.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type all
```

### Example 8: Update and keep approved versions patched

Does the same as Example 7 and also patches installed .NET 8 and .NET 9 components.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type all -AdditionalApprovedVersion 8, 9
```

### Example 9: Update one version

Patches only the .NET 8 Desktop Runtime, whether or not .NET 8 is still supported.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type desktopRuntime -Version 8
```

### Example 10: Remove out-of-support versions

Removes every component whose version Microsoft no longer supports.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type all
```

### Example 11: Remove out-of-support versions but keep approved ones

Removes out-of-support versions except .NET 8 and .NET 9.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type all -AdditionalApprovedVersion 8, 9
```

### Example 12: Remove specific versions

Removes every .NET 6 and .NET 7 component. With `Version`, supported versions are removed too.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type all -Version 6, 7
```

### Example 13: Renew

Installs the newest supported version, removes every out-of-support version, and patches what remains.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all
```

### Example 14: Renew and keep approved versions

Does the same as Example 13, but keeps .NET 8 and .NET 9 and patches them to their latest release.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all -AdditionalApprovedVersion 8, 9
```

### Example 15: Renew and keep only selected versions

Installs and patches .NET 8, 9, and 10, then removes every other version. .NET 8 and .NET 9 are out of support, so they must be approved in the same run.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all -Version 8, 9, 10 -AdditionalApprovedVersion 8, 9
```

### Example 16: Force a removal

Keeps only .NET 10 and removes every other version, even when another application has registered a dependency on it. Read the warning in [Good to Know](#good-to-know) first.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all -Version 10 -Force
```

## What Happens When You Run the Script

1. The script installs or updates the Strapper logging module.
2. It downloads Microsoft's .NET release list to find the supported versions and the latest release of each.
3. It adds the versions in `AdditionalApprovedVersion` to the supported versions. If a value is not a released .NET version, the script stops here without changing anything.
4. It checks `Version`. For `renew`, the script stops here without changing anything if a listed version is out of support and not approved.
5. It finds the installed SDKs and runtimes, x64 and x86, and marks each one as supported or not and up to date or not.
6. For `list`, it returns that list and stops. Nothing is changed.
7. For the other actions, it downloads the installers it needs from Microsoft, installs them silently, and removes the versions the action targets. Components already at their latest release are skipped.
8. It writes every step to the log, including each removal command and its result.

You'll know it worked when running the script again with `-Action list` shows `Supported` and `UpToDate` as `1` for the versions you kept, and the removed versions are no longer listed.

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `Action` | `renew` | `list`, `install`, `uninstall`, `update`, `renew` | False | `list` | String | What the script does. See the table below. |
| `Type` | `all` | `sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`, `all` | False | `all` for `list`, `desktopRuntime` for the other actions | String[] | The component type to manage. Accepts more than one value, for example `sdk, runtime`. |
| `Version` | `8, 9` | One or more .NET major version numbers, `5` or later | False | | Int[] | Limits the action to these major versions. Out-of-support versions are accepted, except by `renew`, which needs every listed version to be supported or approved. |
| `AdditionalApprovedVersion` | `8, 9` | One or more .NET major version numbers, `5` or later | False | | Int[] | Out-of-support major versions to treat as supported for this run. Works with every action. Versions Microsoft still supports are accepted and need no approval. |
| `Force` | `-Force` | Switch | False | False | Switch | Removes components even when another application has registered a dependency on them. |

### How the parameters change each action

| Action | With no other parameter | With `Version` | With `AdditionalApprovedVersion` |
| ------ | ----------------------- | -------------- | -------------------------------- |
| `list` | Shows every installed component. | Shows only the listed versions. | Shows the approved versions as supported. |
| `install` | Installs the latest release of the newest supported version. | Installs the latest release of each listed version, including out-of-support versions. | No change. |
| `update` | Patches every installed supported version and removes its older patches. | Patches the listed versions that are installed, including out-of-support versions. | Also patches the approved versions that are installed. |
| `uninstall` | Removes out-of-support versions. | Removes the listed versions, including supported ones. | Keeps the approved versions. |
| `renew` | Installs the newest supported version, removes out-of-support versions, and patches what remains. | Installs and patches the listed versions and removes every other version. | Keeps and patches the approved versions. |

## Good to Know

- An approved version is handled exactly like a supported one, but Microsoft no longer fixes it. Its latest release is its final one. Approve a version only while an application still needs it.
- Approvals are not saved. Pass the same `AdditionalApprovedVersion` list on every run, including scheduled runs.
- `AdditionalApprovedVersion` does not install anything. To add a version that is missing from a device, list it in `Version` with `install` or `renew`.
- `Version` takes priority over an approval. `-Action uninstall -Version 8` removes .NET 8 even when it is approved, and `renew` with `Version` removes every version that is not listed in `Version`.
- `update` only patches major versions that are already installed.
- `uninstall` leaves a component type untouched when no supported or approved version of that type is installed. This avoids removing the only copy a device has.
- Installing or removing an `sdk` can also install or remove the matching runtimes. Installing or removing a `desktopRuntime` can also install or remove the matching `runtime`.
- Installs use the device's own architecture, for example the x64 installer on x64 devices. Existing x86 components are found and cleaned up, but new x86 components are not installed on 64-bit devices.
- Downloaded installers are kept in `C:\ProgramData\_Automation\Script\DotNetRunTime`.

:::warning

`Force` overrides the protection Windows Installer gives to shared components. Without it, Windows skips the removal of a .NET component that another application, such as Visual Studio or SQL Server, has registered a dependency on. With it, the component is removed anyway, and the dependent application can stop working until it is repaired or reinstalled. Use `Force` only when you are sure nothing on the device needs the version, or when a newer version replaces it in the same run.

:::

## Troubleshooting

| Problem | Cause | Solution |
| ------- | ----- | -------- |
| .NET 8 or .NET 9 was removed by a run that used to keep it | Both versions reached end of support on November 10, 2026, so `uninstall` and `renew` now treat them as unsupported. | Reinstall them with `-Action install -Version 8, 9` and the type you need, and add `-AdditionalApprovedVersion 8, 9` to the runs that should keep them. |
| `Renew action does not support out of support versions. .NET 8, 9 is not supported. Supported or approved versions are: 10. To renew with an out of support version, add it to the AdditionalApprovedVersion parameter.` | `renew` was run with a `Version` value that is out of support and not approved. | Add the same versions to `AdditionalApprovedVersion`, or remove them from `Version`. |
| `.NET 4 from the AdditionalApprovedVersion parameter was not found in the releases index as a released version. Cannot proceed.` | The value is not a released version of .NET 5 or later. .NET Framework, .NET Core 3.1 and earlier, and preview versions cannot be approved. This message also appears when Microsoft's release list cannot be downloaded. | Use major version numbers such as `8` or `9`, and check the device's internet access. |
| `.NET 4 was not found in the releases index. Cannot proceed.` | A `Version` value is not a version of .NET 5 or later. | Use major version numbers such as `8` or `9`. |
| An approved version is missing after `renew` or `update` | Approving a version does not install it. | Run `install` or `renew` with the version in `Version`, as in Example 15. |
| `Supported Version of dot net 'desktopRuntime' is not installed. Skipping uninstallation..` | `uninstall` only removes out-of-support versions of a type when a supported or approved version of that type is installed. | Use `renew`, which installs a supported version first, or name the versions to remove in `Version`. |
| A message that starts with `Failed to download the latest version of` | The device cannot reach Microsoft's download servers, or BITS is not running. | Allow HTTPS access to Microsoft's download servers, start the Background Intelligent Transfer Service, and run again. |
| `Failed to install Dotnet uninstaller. Reason:` followed by the reason | The device cannot download the .NET Uninstall Tool from `github.com`. | Allow access to `github.com` and run again. |
| A version is still listed after a removal, or the log shows `Skipping manual directory delete for` | Another application has registered a dependency on the component, so Windows skipped its removal. | Confirm that nothing needs the version, then run again with `-Force`. |
| An application stops working after a forced removal | The application needed the removed version. | Reinstall it, for example `-Action install -Type desktopRuntime -Version 8`. |

## Output

The `list` action returns one object for each installed component:

| Property | Meaning |
| -------- | ------- |
| `Name` | Display name of the component. |
| `MajorVersion` | The .NET major version, for example `8`. |
| `Version` | The installed release, for example `8.0.20`. |
| `AvailablePatchVersion` | The latest release Microsoft offers for that major version. |
| `InstalledPath` | Where the component is installed. `RegistryOnly` means only Windows' list of installed programs still knows the component. |
| `Type` | `sdk`, `runtime`, `desktopRuntime`, or `aspNetCoreRuntime`. |
| `Supported` | `1` when Microsoft supports the major version or it is approved, otherwise `0`. |
| `UpToDate` | `1` when the installed release is the latest one, otherwise `0`. |
| `Architecture` | `x64` or `x86`. |

The other actions return nothing. They install or remove .NET components and record the result in the log.

Log files (next to the script):

- `.\Optimize-DotNetRunTime-log.txt`
- `.\Optimize-DotNetRunTime-error.txt`

## Changelog

### 2026-11-11

- Added the `AdditionalApprovedVersion` parameter, which treats out-of-support versions such as .NET 8 and .NET 9 as supported so they are kept and patched.
- Support status is now decided for each major version on its own.
- Updated the `renew` examples that used .NET 8 and .NET 9, which are now out of support.
- Rewrote the document on the current template.

### 2026-05-01

- Improved mixed x64/x86 handling: installs follow machine architecture, while cleanup actions can still remove outdated x86 components.
- Updated install, update, and removal logic to be architecture-aware for safer results.
- Improved uninstall reliability by resolving Windows Installer product codes from registry data.
- Added `-Force` to allow dependency bypass for advanced cleanup scenarios.
- Improved `renew` cleanup to remove orphaned MSI entries using .NET version parsing from package names.
- Expanded logging for removal operations, including exact uninstall command paths and exit codes.

### 2026-04-16

- Introduced the `Version` parameter.

### 2025-05-09

- Initial version of the document