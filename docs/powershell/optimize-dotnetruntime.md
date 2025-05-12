---
id: '6ec8fb3c-29ef-4b05-b8fd-546eb07176c7'
slug: /6ec8fb3c-29ef-4b05-b8fd-546eb07176c7
title: 'Optimize-DotNetRunTime'
title_meta: 'Optimize-DotNetRunTime'
keywords: ['Optimize','.net','Runtime','list','uninstall',]
description: 'A description of the script.'
tags: ['dotnet','windows']
draft: false
unlisted: false
---

# Overview
This script ensures that the system is running the latest supported versions of .NET runtimes and SDKs while removing unsupported versions to maintain a clean and secure environment. It manages the installation, uninstallation, and listing of .NET runtimes and SDKs on a Windows system.

# Requirements
- Powershell v5+
- Administrative PrivilegesI

# Process
1. **Initialization**
    - Ensure the script is run with administrative privileges.
    - Validate PowerShell version (requires version 5 or higher).
    - Install or update the `Strapper` module for environment setup.  

2. **Parameter Handling**
- Accept `Action` and `Type` parameters:
    - Action: `list`, `install`, `uninstall`, `renew`.
    - Type: `sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`, `all`.
- Default values:
    - `Action`: `list`.
    - `Type`: `desktopRuntime` (if not specified for install, uninstall, or renew). 

3. **Fetch Supported Versions**
    - Retrieve the latest supported .NET versions from the official .NET website.
    - Parse the HTML content to extract version details.

4. **List Installed Components**
    - Use dotnet --list-runtimes and dotnet --list-sdks to identify installed .NET runtimes and SDKs.
    - Categorize components into types (e.g., sdk, runtime, desktopRuntime, aspNetCoreRuntime).
    - Compare installed versions with supported versions.

5. **Perform Actions Based on Action Parameter**
- `list`:
    - Display installed .NET components filtered by Type (if specified).
- `install`:
    - Download and install the latest supported versions of specified components.
    - Skip installation if the latest version is already installed.
- `uninstall`:
    - Remove unsupported versions of specified components using the .NET Core Uninstall Tool.
- `renew`:  
    Combine uninstall and install actions: 
    - Remove unsupported versions.  
    - Install the latest supported versions.

6. **Error Handling and Logging**

    - Log all actions, including successes, failures, and skipped operations.
    - Handle errors gracefully, ensuring the script continues execution where possible.

7. **Clean Up**
    - Ensure temporary files and directories are managed appropriately.


# Payload Usage

To List all installed .NET runtimes and SDKs  
```.\Optimize-DotNetRunTime.ps1 -Action list```

To List only installed .NET SDKs  
```.\Optimize-DotNetRunTime.ps1 -Action list -Type sdk```

To Install the latest supported versions of all .NET components  
```.\Optimize-DotNetRunTime.ps1 -Action install -Type all```

To Install the latest supported version of the .NET runtime  
```.\Optimize-DotNetRunTime.ps1 -Action install -Type runtime```

To Uninstall unsupported versions of ASP.NET Core runtimes  
```.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type aspNetCoreRuntime```

To Remove all unsupported versions of .NET components and install latest available   
```.\Optimize-DotNetRunTime.ps1 -Action renew -Type all```

To Install the latest supported version of the .NET Desktop Runtime when no `Type` is specified  
```.\Optimize-DotNetRunTime.ps1 -Action install```

To Remove unsupported versions of the .NET Desktop Runtime and install latest available version when no `Type` is specified  
```.\Optimize-DotNetRunTime.ps1 -Action renew```


# Parameters
| Parameter | Alias | Required | Default         | Type   | Description |
|-----------|-------|----------|-----------------|--------|-------------|
| `Action`  |       | False    | List            | String | Specifies the action to perform. Valid values are: <br></br> - `list`: Lists all installed .NET runtimes and SDKs. <br></br> - `install`: Installs the latest supported versions of .NET runtimes and SDKs. <br></br> - `uninstall`: Uninstalls unsupported or specific versions of .NET runtimes and SDKs. <br></br> -  `renew`: Removes all unsupported versions of .NET runtimes and SDKs and installs the latest available version. |
| `Type`    |       | False    | desktopRuntime  | String | Specifies the type of .NET component to manage. Valid values are: <br></br> - `sdk`: Manages .NET SDKs. <br></br> - `runtime`: Manages .NET runtimes. <br></br> - `desktopRuntime`: Manages .NET desktop runtimes. <br></br> -  `aspNetCoreRuntime`: Manages ASP.NET Core runtimes. <br></br> - `all`: Manages all .NET components. |

# Output

The script generates the following output files:

- `.\Optimize-DotNetRunTime-log.txt`
- `.\Optimize-DotNetRunTime-Error.txt`