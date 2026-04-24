---
id: '9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16'
slug: /9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16
title: 'Manage - .net Runtimes'
title_meta: 'Manage - .net Runtimes'
keywords: ['Sdk','runtime','Asp.Net','core','.net']
description: 'This script ensures that the system is running the latest supported versions of .NET runtimes and SDKs while removing unsupported versions to maintain a clean and secure environment. It manages the installation, uninstallation, and listing of .NET runtimes and SDKs on a Windows system.'
tags: ['dotnet','windows']
draft: False
unlisted: false
last_update:
  date: 2026-04-16
---

## Summary

This script helps keep .NET on your Windows device clean, current, and secure. It can list installed .NET components, install the latest supported versions, update to newer patch releases, remove unsupported versions, or perform a full cleanup and refresh.

The script checks Microsoft release data in real time, then uses that information to decide what to install, update, or remove. This helps reduce manual work and lowers the risk of keeping outdated .NET versions that may cause security or compatibility issues.

When you run this script, expect software changes on the endpoint. Depending on the selected action, it may download installers, silently install updates, and remove older versions. A stable internet connection and administrator access are required.

**NOTE:**

- Installing or uninstalling `sdk` can also install or remove related `aspNetCoreRuntime`, `desktopRuntime`, and `runtime` components.
- Installing or uninstalling `desktopRuntime` can also install or remove the related `runtime`.
- For actions other than `list`, if `Type` is not provided, the script uses `desktopRuntime` by default.
- Use `Version` carefully:
  - For `list`, `install`, `uninstall`, and `update`, you can target specific major versions (including unsupported versions).
  - For `renew` with `Version`, all specified versions must still be supported. If any are unsupported, the action will stop.
- `renew` is the most aggressive option. It can remove versions you are not targeting. Review your required application dependencies before using it.

## Dependencies

- [Optimize-DotNetRunTime](/docs/6ec8fb3c-29ef-4b05-b8fd-546eb07176c7)  

## Sample Run

### Example 1: List all installed .NET components

- **Action:** `<Blank>`
- **Type:** `<Blank>`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image1.webp)

### Example 2: List only .NET SDKs

- **Action:** `list`
- **Type:** `sdk`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image2.webp)

### Example 3: Install the latest versions of all .NET components

- **Action:** `install`
- **Type:** `all`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image3.webp)

### Example 4: Update SDKs to the latest patch version

- **Action:** `update`
- **Type:** `sdk`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image4.webp)

### Example 5: Remove unsupported ASP.NET Core versions

- **Action:** `uninstall`
- **Type:** `aspNetCoreRuntime`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image5.webp)

### Example 6: Removes all unsupported versions of .NET runtimes and SDKs and installs the latest available version

- **Action:** `renew`
- **Type:** `all`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image6.webp)

### Example 7: Install the latest .NET Desktop Runtime (default type)

- **Action:** `install`
- **Type:** `<Blank>`
- **Version:** `<Blank>`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image7.webp)

### Example 8: Install .NET 10 Desktop Runtime

- **Action:** `install`
- **Type:** `desktopRuntime`
- **Version:** `10`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image8.webp)

### Example 9: Install multiple specific versions

- **Action:** `install`
- **Type:** `desktopRuntime`
- **Version:** `8, 10`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image9.webp)

### Example 10: Update only .NET 8 to the latest patch

- **Action:** `update`
- **Type:** `desktopRuntime`
- **Version:** `8`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image10.webp)

### Example 11: Update multiple versions to their latest patches

- **Action:** `update`
- **Type:** `all`
- **Version:** `6, 7, 8, 9`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image11.webp)

### Example 12: Remove specific .NET versions

- **Action:** `uninstall`
- **Type:** `all`
- **Version:** `6, 9`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image12.webp)

### Example 13: Keep only .NET 8 and .NET 9 and remove all others

- **Action:** `renew`
- **Type:** `all`
- **Version:** `8, 9`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image13.webp)

### Example 14: List only .NET 8 and .NET 9 components

- **Action:** `list`
- **Type:** `<Blank>`
- **Version:** `8, 9`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image14.webp)

### Example 15: Keep only .NET 10 and remove all others

- **Action:** `renew`
- **Type:** `all`
- **Version:** `10`

![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image15.webp)

## Global Variables

| Name | Value | Accepted Values | Description |
| ---- | ----- | --------------- | ----------- |
| Debug | `False` | `False`, `True` | When `True`, enables informational logging; when `False` (default), informational logs are suppressed to avoid adding entries to the `h_scripts` table. Set to `True` to assist with troubleshooting. |
| ScriptEngineEnableLogger | `False` | `False`, `True` | When `True`, enables final (success/failure) logging; when `False` (default), these logs are suppressed to avoid adding entries to the `h_scripts` table. Set to `True` to assist with troubleshooting. |

## User Parameters

| Name     | Example                                      | Mandatory | Description                                                                                                                                                                                                                     |
|----------|----------------------------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Action` | <ul><li>`list`</li><li>`install`</li><li>`uninstall`</li><li>`update`</li><li>`renew`</li></ul> | False     | Specifies the action to perform. Valid values are: <br /><br /> <ul><li>`list`: Lists all installed .NET runtimes and SDKs.</li><li> `install`: Installs the latest supported versions of .NET runtimes and SDKs. </li><li> `uninstall`: Uninstalls unsupported or specific versions of .NET runtimes and SDKs. </li><li> `update`: Updates to latest patches and removes superseded patches. </li><li> `renew`: Removes all unsupported versions of .NET runtimes and SDKs and installs the latest available version.</li></ul> **Note:** Default Action is `list` |
| `Type`   | <ul><li>`sdk`</li><li>`runtime`</li><li>`desktopRuntime`</li><li>`aspNetCoreRuntime`</li><li>`all`</li></ul> | False     | Specifies the type of .NET component to manage. Valid values are: <br /><br /> <ul><li>`sdk`: Manages .NET SDKs. </li><li> `runtime`: Manages .NET runtimes. </li><li> `desktopRuntime`: Manages .NET desktop runtimes. </li><li>`aspNetCoreRuntime`: Manages ASP.NET Core runtimes. </li><li>`all`: Manages all .NET components. </li></ul> **Note:** Default Type is `desktopRuntime`|
| `Version` | <ul><li>`8`</li><li>`9`</li><li>`8, 9`</li></ul> | False     | (Optional) Limit the action to specific .NET versions by major version number (e.g., `8`, `9`, or `8, 9, 10`). When omitted, the script uses its default behavior for each action. Accepts both supported and EOL versions for `list`, `install`, `uninstall`, and `update`. For `renew`, all specified versions must be actively supported. **Note:** Default is not set (all applicable versions are targeted). |

### Tips for `Version` Behavior

| Action | Without `Version` | With `Version` (e.g., `Version 8, 9`) |
| --- | --- | --- |
| `list` | Shows all installed .NET components | Shows only versions 8 and 9 |
| `install` | Installs the latest supported version | Installs the latest release for each specified version (EOL included with warning) |
| `update` | Updates only supported installed versions | Updates the specified version(s), including EOL |
| `uninstall` | Removes only unsupported/EOL versions | Removes the specified version(s), including supported |
| `renew` | Installs latest supported + removes all unsupported | Keeps only specified version(s), removes everything else. **Aborts if any version is EOL.** |

## Output

- Script Logs

## Changelog

### 2026-04-16

- Introduced the `Version` parameter.

### 2025-05-14

- Initial version of the document
