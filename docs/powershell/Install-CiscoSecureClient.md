---
id: ps-install-ciscosecureclient
title: 'Install-CiscoSecureClient'
title_meta: 'Install-CiscoSecureClient Command'
keywords: ['install', 'cisco', 'secure', 'client', 'vpn']
description: 'Documentation for the Install-CiscoSecureClient command to install the Cisco Secure client and selected modules.'
tags: ['installation', 'networking', 'security', 'software']
draft: false
unlisted: false
---
## Description
Installs the Cisco Secure client and selected modules.

## Requirements
For All modules or Umbrella installations, the OrgID, UserID, and Fingerprint are required to generate the Umbrella JSON.

## Usage
The script will accept parameters for module selection and install the MSI, gathering and checking the exit code on completion. For Umbrella, the provided information is used to generate a JSON file in the appropriate directory.


```powershell
.\Install-CiscoSecureClient.ps1 -Source 'https://downloadpath/CiscoSecureClient.zip' -Dart -Nvm -Posture
```
Will install the Diagnostics and Reporting, VPN Posture (HostScan), and Network Visibility Modules.
```powershell
.\Install-CiscoSecureClient.ps1 -Source 'https://downloadpath/CiscoSecureClient.zip' -core -Umbrella -Dart -Nvm -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
```
Will install the Core VPN module (keeping it hidden from the end-user), Umbrella, Diagnostics and Reporting, and Network Visibility Modules.
Because Umbrella is being installed, the UserID, Fingerprint, and OrgId are required.
```powershell
.\Install-CiscoSecureClient.ps1 -Source 'C:\PATH\TO\FILE' -core -ShowVPN -Umbrella -Dart -Nvm -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
```
Will install the Core VPN module (Visible to the end-user in the system tray icon), Umbrella, Diagnostics and Reporting, and Network Visibility Modules.
Because Umbrella is being installed, the UserID, Fingerprint, and OrgId are required.
```powershell
.\Install-CiscoSecureClient.ps1 -Source 'C:\PATH\TO\FILE' -All -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058 -ARP
This will install all Modules, including Umbrella, which require the UserID, Fingerprint, and OrgId to be provided, and hide the installation from the Add/Remove Programs List.

## Parameters
| Parameter         | Required  | Alias       | Type      | Parameter Set Members    | Description                                                  |
| ----------------- | --------- | ----------- | --------- |--------------------------|--------------------------------------------------------------|
| All               | False     |             | Switch    | All                      |  Installs All modules. Requires Dynamic Params               |
| UserID            | (True)    |             | String    | Dynamic: All, Umbrella   |  Cisco Client ID: Required for Umbrella and All Switches.    |
| FingerPrint       | (True)    |             | String    | Dynamic: All, Umbrella   |  Cisco Fingerprint: Required for Umbrella and All switches.  |
| orgID             | (True)    |             | String    | Dynamic: All, Umbrella   |  Cisco Org ID: Required for Umbrella and All Switches.       |
| core              | False     |             | Switch    | Custom                   |  Installs the Core-VPN module.                               |
| showVPN           | False     |             | Switch    | Dynamic: All, core       |  Displays Core-VPN module in the system tray icon            |
| SBL               | False     |             | Switch    | Custom                   |  Installs the Start Before Login module.                     |
| DART              | False     |             | Switch    | Custom                   |  Installs the Diagnostic And Reporting Tool module.          |
| NVM               | False     |             | String    | Custom                   |  Installs the Network Visibility module.                     |
| NAM               | False     |             | String    | Custom                   |  Installs the Network Access Manager module.                 |
| Posture           | False     |             | String    | Custom                   |  Installs the VPN Posture (HostScan) module.                 |
| ISEPosture        | False     |             | String    | Custom                   |  Installs the ISE Posture module.                            |
| Umbrella          | False     |             | String    | Custom                   |  Installs the Umbrella module. Requires Dynamic Params       |
| Source            | True      | DownloadURL | String    | Core, All, Custom        |  Source for the CiscoSecureClient.zip file.                  |
| ARP               | False     |             | Switch    | Core, All, Custom        |  Hides the modules from Add/Remove programs.                 |
| Lockdown          | False     |             | Switch    | Core, All, Custom        |  Prevents the modification of Cisco Secure Client services   |

## Output
    .\Install-CiscoSecureClient-log.txt
    .\Install-CiscoSecureClient-error.txt