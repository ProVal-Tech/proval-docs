---
id: '7115ebed-2a19-4d78-9267-e7ff88fa783d'
slug: /7115ebed-2a19-4d78-9267-e7ff88fa783d
title: 'Manage - .Net Runtimes'
title_meta: 'Manage - .Net Runtimes'
keywords: ['dotnet', '.net', 'runtime', 'sdk', 'desktop-runtime', 'aspnetcore', 'end-of-support', 'eol', 'update', 'uninstall']
description: 'Lists, installs, updates, and removes .NET SDKs and runtimes on Windows devices, and can keep approved out-of-support versions such as .NET 8 and .NET 9 patched. ConnectWise RMM implementation of the Optimize-DotNetRunTime script.'
tags: ['dotnet','windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

The **Manage - .Net Runtimes** task lists, installs, updates, and removes .NET SDKs and runtimes on Windows endpoints. It can also keep versions that Microsoft no longer supports, such as .NET 8 and .NET 9, installed and patched for the applications that still need them. It runs the [Optimize-DotNetRunTime](/docs/6ec8fb3c-29ef-4b05-b8fd-546eb07176c7) script.

### How it works

1. **Download and verify the script.** The task downloads the current script from ProVal's file server and checks its code signature. If the signature is not valid, the task stops without changing anything.
2. **Check Microsoft's release list.** The script reads which .NET versions Microsoft supports and the latest release of each. Versions entered in `AdditionalApprovedVersion` are treated as supported too.
3. **Run the selected action.** `list` only reports what is installed. `install`, `update`, `uninstall`, and `renew` install, patch, or remove .NET components silently.
4. **Report the result.** The script's log appears in the task output. The task fails when the script logs an error.

**Requirements:** PowerShell 5 or later, and internet access to ProVal's file server, the PowerShell Gallery, Microsoft's .NET download servers, and `github.com`.

:::warning

.NET 8 and .NET 9 reached end of support on November 10, 2026. See [Microsoft's announcement](https://devblogs.microsoft.com/dotnet/dotnet-8-9-end-of-support/). Since then, `uninstall` and `renew` remove them and `update` no longer patches them. To keep them for applications that still need them, enter `8, 9` in `AdditionalApprovedVersion` on every run, including scheduled runs.

:::

## Sample Run

### Example 1: List all installed .NET components

Leave every parameter empty. Shows every installed .NET SDK and runtime with its support and update status. Nothing is changed.

![Image1](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image1.webp)

### Example 2: List only .NET SDKs

Shows only the installed SDKs.

- **Action:** `list`
- **Type:** `sdk`

![Image2](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image2.webp)

### Example 3: List only .NET 8 and .NET 9 components

Shows only the components of the listed versions.

- **Action:** `list`
- **Version:** `8, 9`

![Image3](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image3.webp)

### Example 4: Preview what an approval keeps

Shows the list with .NET 8 and .NET 9 marked as supported. Components that still show `Supported` as `0` are the ones `uninstall` and `renew` would remove.

- **Action:** `list`
- **AdditionalApprovedVersion:** `8, 9`

![Image4](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image4.webp)

### Example 5: Install the latest .NET Desktop Runtime

Installs the latest release of the newest supported Desktop Runtime. `desktopRuntime` is used when `Type` is empty.

- **Action:** `install`

![Image5](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image5.webp)

### Example 6: Install the latest version of all .NET components

Installs the newest supported SDK, runtime, ASP.NET Core runtime, and Desktop Runtime.

- **Action:** `install`
- **Type:** `all`

![Image6](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image6.webp)

### Example 7: Install specific versions

Installs the latest release of the .NET 8 and .NET 9 Desktop Runtimes. Out-of-support versions install with a note in the log.

- **Action:** `install`
- **Type:** `desktopRuntime`
- **Version:** `8, 9`

![Image7](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image7.webp)

### Example 8: Update SDKs to their latest patch

Patches every installed supported SDK to its latest release and removes its older patches.

- **Action:** `update`
- **Type:** `sdk`

![Image8](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image8.webp)

### Example 9: Update only .NET 8

Patches only the .NET 8 Desktop Runtime, whether or not .NET 8 is still supported.

- **Action:** `update`
- **Type:** `desktopRuntime`
- **Version:** `8`

![Image9](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image9.webp)

### Example 10: Update and keep .NET 8 and .NET 9 patched

Patches every installed supported version, and installed .NET 8 and .NET 9 components as well, then removes their older patches.

- **Action:** `update`
- **Type:** `all`
- **AdditionalApprovedVersion:** `8, 9`

![Image10](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image10.webp)

### Example 11: Remove unsupported ASP.NET Core runtimes

Removes the ASP.NET Core runtimes whose version Microsoft no longer supports.

- **Action:** `uninstall`
- **Type:** `aspNetCoreRuntime`

![Image11](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image11.webp)

### Example 12: Remove unsupported versions but keep .NET 8 and .NET 9

Removes every out-of-support component except .NET 8 and .NET 9.

- **Action:** `uninstall`
- **Type:** `all`
- **AdditionalApprovedVersion:** `8, 9`

![Image12](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image12.webp)

### Example 13: Remove specific .NET versions

Removes every .NET 6 and .NET 7 component. With `Version`, supported versions are removed too.

- **Action:** `uninstall`
- **Type:** `all`
- **Version:** `6, 7`

![Image13](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image13.webp)

### Example 14: Renew all components

Installs the newest supported version, removes every out-of-support version, and patches what remains.

- **Action:** `renew`
- **Type:** `all`

![Image14](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image14.webp)

### Example 15: Renew and keep .NET 8 and .NET 9

Does the same as Example 14, but keeps .NET 8 and .NET 9 and patches them to their latest release.

- **Action:** `renew`
- **Type:** `all`
- **AdditionalApprovedVersion:** `8, 9`

![Image15](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image15.webp)

### Example 16: Keep only .NET 8, 9, and 10 and remove all others

Installs and patches .NET 8, 9, and 10, then removes every other version. .NET 8 and .NET 9 are out of support, so they are approved in the same run.

- **Action:** `renew`
- **Type:** `all`
- **Version:** `8, 9, 10`
- **AdditionalApprovedVersion:** `8, 9`

![Image16](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image16.webp)

### Example 17: Keep only .NET 10 and remove all others

Installs and patches .NET 10, then removes every other version.

- **Action:** `renew`
- **Type:** `all`
- **Version:** `10`

![Image17](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image17.webp)

### Example 18: Force renew to .NET 10 only

Does the same as Example 17, and also removes components that other applications have registered a dependency on.

- **Action:** `renew`
- **Type:** `all`
- **Version:** `10`
- **Force:** `Checked`

![Image18](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image18.webp)

### Example 19: Force uninstall .NET 8

Removes every .NET 8 component, even when another application has registered a dependency on it.

- **Action:** `uninstall`
- **Type:** `all`
- **Version:** `8`
- **Force:** `Checked`

![Image19](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image19.webp)

## Dependencies

- [PowerShell: Optimize-DotNetRunTime](/docs/6ec8fb3c-29ef-4b05-b8fd-546eb07176c7)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `Action` | `renew` | `list`, `install`, `uninstall`, `update`, `renew` | False | `list` | DropDown | What the task does. See the table below. When it's left empty, the task lists the installed components and changes nothing. |
| `Type` | `all` | `sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`, `all` | False | `all` for `list`, `desktopRuntime` for the other actions | DropDown | The component type to manage. `all` covers the four types. |
| `Version` | `8, 9` | .NET major version numbers, `5` or later, separated by commas | False | | Text String | Limits the action to these major versions. Out-of-support versions are accepted, except by `renew`, which needs every listed version to be supported or approved. When it's left empty, each action uses its default scope. |
| `AdditionalApprovedVersion` | `8, 9` | .NET major version numbers, `5` or later, separated by commas | False | | Text String | Out-of-support major versions to treat as supported for this run. They are kept by `uninstall` and `renew`, and patched by `update` and `renew`. When it's left empty, only the versions Microsoft supports are treated as supported. |
| `Force` | `Checked` | `Checked` or `Unchecked` | False | False | Flag | When it's checked, components are removed even when another application has registered a dependency on them. |

`Version` and `AdditionalApprovedVersion` accept numbers and commas only. Any other text stops the task before it changes anything.

### How the parameters change each action

| Action | With no other parameter | With `Version` | With `AdditionalApprovedVersion` |
| ------ | ----------------------- | -------------- | -------------------------------- |
| `list` | Shows every installed component. | Shows only the listed versions. | Shows the approved versions as supported. |
| `install` | Installs the latest release of the newest supported version. | Installs the latest release of each listed version, including out-of-support versions. | No change. |
| `update` | Patches every installed supported version and removes its older patches. | Patches the listed versions that are installed, including out-of-support versions. | Also patches the approved versions that are installed. |
| `uninstall` | Removes out-of-support versions. | Removes the listed versions, including supported ones. | Keeps the approved versions. |
| `renew` | Installs the newest supported version, removes out-of-support versions, and patches what remains. | Installs and patches the listed versions and removes every other version. | Keeps and patches the approved versions. |

:::note

- Approvals are not saved. Enter the same `AdditionalApprovedVersion` list on every run that should keep those versions.
- `AdditionalApprovedVersion` does not install anything. To add a version that is missing from a device, enter it in `Version` with `install` or `renew`, as in Example 16.
- `Version` takes priority over an approval. `uninstall` with `8` in `Version` removes .NET 8 even when it is approved, and `renew` with `Version` removes every version that is not listed in `Version`.
- Approved versions no longer receive fixes from Microsoft. Approve a version only while an application still needs it.

:::

:::warning

`renew` and `uninstall` remove software, and `Force` removes it even when another application depends on it. Applications such as Visual Studio or SQL Server can stop working when a .NET version they need is removed. Run `list` first, as in Example 4, to see what a run would remove. Check `Force` only when you are sure nothing on the endpoint needs the version.

:::

For more details and troubleshooting, see [Optimize-DotNetRunTime](/docs/6ec8fb3c-29ef-4b05-b8fd-546eb07176c7).

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`
- **Task Type:** `Script Editor`

## Task Creation

:::note

Already have this task? Add the `AdditionalApprovedVersion` parameter, replace the script in Row 1 with the current one, and change the `Type` option `runtimes` to `runtime` if your task has it.

:::

### Description

- **Name:** `Manage - .Net Runtimes`
- **Description:**

```PlainText
Lists, installs, updates, and removes .NET SDKs and runtimes on Windows devices, using Microsoft's release data to decide which versions are supported.
Action: list, install, uninstall, update, or renew. Empty means list.
Type: sdk, runtime, desktopRuntime, aspNetCoreRuntime, or all. Empty means all for list and desktopRuntime for the other actions.
Version: .NET major versions to target, separated by commas, for example 8, 9. Empty means each action's default scope.
AdditionalApprovedVersion: out-of-support .NET major versions to keep and patch as if supported, separated by commas, for example 8, 9.
Force: check only to remove components that other applications depend on.
```

- **Category:** `Custom`

![Image20](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image20.webp)

### Parameters

#### Action

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `Action` | `False` | `DropDown` | |

- **Option Type:** `String`
- **Options:** `list`, `install`, `uninstall`, `update`, `renew`

![Image21](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image21.webp)

#### Type

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `Type` | `False` | `DropDown` | |

- **Option Type:** `String`
- **Options:** `sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`, `all`

![Image22](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image22.webp)

#### Version

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `Version` | `False` | `Text String` | |

![Image23](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image23.webp)

#### AdditionalApprovedVersion

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `AdditionalApprovedVersion` | `False` | `Text String` | |

![Image24](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image24.webp)

#### Force

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `Force` | `False` | `Flag` | |

![Image25](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image25.webp)

### Completed Parameters Section

![Image26](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image26.webp)

:::note

Name the parameters and the dropdown options exactly as shown. The script reads them by these names.

:::

### Script Editor

#### Row 1 Function: PowerShell script

- **Notes:** `<Leave it Blank>`
- **Use Generative AI Assist for script creation:** `False`
- **Expected time of script execution in seconds:** `600`
- **Continue on Failure:** `False`
- **Run As:** `System`
- **Operating System:** `Windows`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/manage-dotnet-rumtimes/script.ps1)

![Image27](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image27.webp)

#### Row 2 Function: Script Log

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Script Log Message:** `%Output%`

![Image28](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image28.webp)

## Completed Task

![Image29](../../../static/img/docs/7115ebed-2a19-4d78-9267-e7ff88fa783d/image29.webp)

## Output

- Script Log
- Log files on the endpoint:
  - `C:\ProgramData\_Automation\Script\Optimize-DotNetRunTime\Optimize-DotNetRunTime-log.txt`
  - `C:\ProgramData\_Automation\Script\Optimize-DotNetRunTime\Optimize-DotNetRunTime-error.txt`
- Downloaded installers, kept in `C:\ProgramData\_Automation\Script\DotNetRunTime`

## Changelog

### 2026-11-11

- Added the `AdditionalApprovedVersion` parameter, which treats out-of-support versions such as .NET 8 and .NET 9 as supported so they are kept and patched.
- `Version` now accepts a list of versions separated by commas.
- Corrected the `Type` option `runtimes` to `runtime`.
- Rewrote the document on the current template, with a sample run for each way to use the parameters.

### 2026-08-11

- Initial version of the document
