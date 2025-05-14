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
---

## Summary
This script ensures that the system is running the latest supported versions of .NET runtimes and SDKs while removing unsupported versions to maintain a clean and secure environment. It manages the installation, uninstallation, and listing of .NET runtimes and SDKs on a Windows system.

## Dependencies
- [Agnostic - Optimize-DotNetRunTime](/docs/6ec8fb3c-29ef-4b05-b8fd-546eb07176c7)  

## Sample Run
![Sample Run](../../../static/img/docs/9b60e7a3-b7e8-4932-90e6-0cc1d13c6f16/image1.webp)

## User Parameters
| Name     | Example                                      | Mandatory | Description                                                                                                                                                                                                                     |
|----------|----------------------------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Action` | List<br></br>Install<br></br>Uninstall<br></br>New | False     | Specifies the action to perform. Valid values are: <br></br> - `list`: Lists all installed .NET runtimes and SDKs. <br></br> - `install`: Installs the latest supported versions of .NET runtimes and SDKs. <br></br> - `uninstall`: Uninstalls unsupported or specific versions of .NET runtimes and SDKs. <br></br> - `renew`: Removes all unsupported versions of .NET runtimes and SDKs and installs the latest available version. <br></br> **Note:** Default Action is `list` |
| `Type`   | Sdk<br></br>Runtime<br></br>Desktopruntime<br></br>aspNetCoreRuntime<br></br>all | False     | Specifies the type of .NET component to manage. Valid values are: <br></br> - `sdk`: Manages .NET SDKs. <br></br> - `runtime`: Manages .NET runtimes. <br></br> - `desktopRuntime`: Manages .NET desktop runtimes. <br></br> - `aspNetCoreRuntime`: Manages ASP.NET Core runtimes. <br></br> - `all`: Manages all .NET components. <br></br> **Note:** Default Type is `desktopRuntime` |

## Output
- Script Logs