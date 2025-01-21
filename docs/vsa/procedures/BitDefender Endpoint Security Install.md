---
id: 'caaedea1-c322-4a36-833a-62e421c95e2a'
title: 'BitDefender Endpoint Security Install'
title_meta: 'BitDefender Endpoint Security Install'
keywords: ['bitdefender', 'endpoint', 'security', 'installation', 'msi']
description: 'This document provides a comprehensive guide on installing BitDefender Endpoint Security Tools on endpoints, detailing the installation process, logs, dependencies, and the overall procedure.'
tags: ['installation', 'security', 'software']
draft: false
unlisted: false
---

## Summary

This document outlines the installation of BitDefender Endpoint Security Tools on endpoints.

## Example Agent Procedure Log

```
4:37:47 pm 26-Jan-23    BitDefender Endpoint Security Install    Success THEN    provaltech.com/dan.hicks
4:37:47 pm 26-Jan-23    BitDefender Endpoint Security Install-0003    SUCCESS: Bitdefender installed successfully.    provaltech.com/dan.hicks
4:32:38 pm 26-Jan-23    BitDefender Endpoint Security Install-0001    Installing BitDefender Endpoint Security: msiexec C://ProgramData//_automation//AgentProcedure//BitDefenderEndpointSecurityInstall//BEST_downloaderWrapper.msi /qn GZ_PACKAGE_ID=aHR0cHM6Ly9jbG91ZC1lY3MuZ3Jhdml0eXpvbmUuYml0ZGVmZW5kZXIuY29tL1BhY2thZ2VzL0JTVFdJTi8wL3ZPcmhBYy9pbnN0YWxsZXIueG1sP2xhbmc9ZW4tVVM= REBOOT_IF_NEEDED=0    provaltech.com/dan.hicks
4:32:35 pm 26-Jan-23    BitDefender Endpoint Security Install    Downloading MSI Installation Wrapper from vendor...    provaltech.com/dan.hicks
4:32:35 pm 26-Jan-23    Execute Powershell Command    Success THEN    provaltech.com/dan.hicks
4:32:35 pm 26-Jan-23    Execute Powershell Command-0011    Powershell command completed!    provaltech.com/dan.hicks
4:32:32 pm 26-Jan-23    Execute Powershell Command-0011    Executing powershell "" -Command "New-Item -Type Directory -Path %ProgramData%//_automation//AgentProcedure -Name BitDefenderEndpointSecurityInstall" ""    provaltech.com/dan.hicks
4:32:31 pm 26-Jan-23    Execute Powershell Command-0010    Not sending output to variable.    provaltech.com/dan.hicks
4:32:31 pm 26-Jan-23    Execute Powershell Command-0008    New command variable is: -Command "New-Item -Type Directory -Path %ProgramData%//_automation//AgentProcedure -Name BitDefenderEndpointSecurityInstall"    provaltech.com/dan.hicks
4:32:31 pm 26-Jan-23    Execute Powershell Command-0008    Custom commands detected as New-Item -Type Directory -Path %ProgramData%//_automation//AgentProcedure -Name BitDefenderEndpointSecurityInstall    provaltech.com/dan.hicks
4:32:27 pm 26-Jan-23    Execute Powershell Command-0002    Powershell is present.    provaltech.com/dan.hicks
4:32:17 pm 26-Jan-23    Run Now - BitDefender Endpoint Security Install    Admin provaltech.com/dan.hicks scheduled procedure Run Now - BitDefender Endpoint Security Install to run at Jan 26 2023 4:32PM    provaltech.com/dan.hicks
```

## Dependencies

- Managed Variable: BD_PACKAGE_ID
- Vendor Tool: [Download BitDefender Installer](https://download.bitdefender.com/SMB/Hydra/release/bst_win/downloaderWrapper/BEST_downloaderWrapper.msi)

## Process

1. Download the vendor's BD Install wrapper.
2. Run the installer using `/qn` and the package ID from the managed variable.
3. Pause the procedure while the installer runs.
4. Check if the files and the service were properly installed.

## Output

Agent procedure log.



