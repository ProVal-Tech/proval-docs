---
id: '0dc22f98-f39e-4d02-9716-19087ff35e03'
slug: /0dc22f98-f39e-4d02-9716-19087ff35e03
title: 'Cisco Secure Client Parameter'
title_meta: 'Cisco Secure Client Parameter'
keywords: ['cisco', 'secure', 'client', 'installation', 'parameter']
description: 'This document provides detailed instructions on how to store and use the parameter for installing the Cisco Secure Client package through a company-level custom field. It includes dependencies, sample values, and outcomes for various installation configurations.'
tags: ['custom-fields', 'installation', 'networking', 'software', 'vpn']
draft: false
unlisted: false
last_update:
  date: 2026-11-18
---

## Summary

This company-level custom field stores the parameter to install the Cisco Secure Client package using the [Task - Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4) task.

Parameters must be set in a manner consistent with the agnostic script [Agnostic - Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea).

:::note

Use `-DownloadURL` only when the `cisco_secure_client.zip` file isn't stored in CW RMM File Sharing. If the zip file is in File Sharing, leave `-DownloadURL` out. The task copies the package from File Sharing, and the script uses that copy automatically.
:::

## Dependencies

- [Task - Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4)
- [Solution: Cisco Secure Client - CW RMM](/docs/7637a958-9383-46af-99f9-4146ea097bf0)

## Details

| Field Name                      | Type of Field | Description                                                                                                                                                     |
|---------------------------------|----------------|---------------------------------|
| Cisco Secure Client Parameter    | Company        | Stores the parameter to install the Cisco Secure Client package using the Cisco Secure Client Package Installation (Windows) task. How to use parameters: [Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea) |

## Screenshot

![Screenshot](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image_1.webp)


## Sample Values

The samples below include `-DownloadURL` for a package hosted at a download URL. If the zip file is stored in CW RMM File Sharing, remove `-DownloadURL` and its URL from the value.

**Value (package stored in CW RMM File Sharing):**  
```
-core -Dart
```
**Outcome:**  
The task will install the Core VPN module (keeping it hidden from the end-user) and the Diagnostics and Reporting module, using the package copied from CW RMM File Sharing. `-DownloadURL` isn't needed.

![Outcome](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image01.webp)

**Value:**  
```
-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -core -Umbrella -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
```
**Outcome:**  
The task will install the Core VPN (keeping it hidden from the end-user) and Umbrella Modules. Because Umbrella is being installed, the UserID, Fingerprint, and OrgId are required. Also, it's mandatory to install the Core VPN module to install the Umbrella module.  

![Outcome 1](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image_9.webp)

**Value:**  
```
-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -Dart -Nvm -Posture
```
**Outcome:**  
The task will install the Diagnostics and Reporting, VPN Posture (HostScan), and Network Visibility Modules.  
![Outcome 2](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image_8.webp)

**Value:**  
```
-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -core -Umbrella -Dart -Nvm -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
```
**Outcome:**  
The task will install the Core VPN module (keeping it hidden from the end-user), Umbrella, Diagnostics and Reporting, and Network Visibility Modules. Because Umbrella is being installed, the UserID, Fingerprint, and OrgId are required.  
![Outcome 3](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image_9.webp)

**Value:**  
```
-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -core -ShowVPN -Umbrella -Dart -Nvm -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
```
**Outcome:**  
The task will install the Core VPN module (visible to the end-user in the system tray icon), Umbrella, Diagnostics and Reporting, and Network Visibility Modules. Because Umbrella is being installed, the UserID, Fingerprint, and OrgId are required.  
![Outcome 4](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image_10.webp)

**Value:**  
```
-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -All -UserID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
```
**Outcome:**  
The task will install all modules, including Umbrella, which require the UserID, Fingerprint, and OrgId to be provided. Programmatically creates a JSON authentication file for access by the Umbrella module.  
![Outcome 5](../../../static/img/docs/0dc22f98-f39e-4d02-9716-19087ff35e03/image_11.webp)

**Note:**  
The DownloadURL, Fingerprint, OrgID, and UserID provided above are for illustrative purposes only. When executing the script, it is essential to set the correct values for these parameters according to the specific requirements.

## Parameters

Different installation parameters can be created by using these parameters from the agnostic script.  

| Parameter      | Required | Default | Type   | Parameter Set Members | Description                                                                                       |
|----------------|----------|---------|--------|-----------------------|---------------------------------------------------------------------------------------------------|
| All            | False    |         | Switch | All                   | Installs all modules. Requires dynamic parameters.                                               |
| UserID         | True     |         | String | Dynamic: All, Umbrella| Cisco Client ID: Required for Umbrella and all switches.                                        |
| FingerPrint    | True     |         | String | Dynamic: All, Umbrella| Cisco Fingerprint: Required for Umbrella and all switches.                                      |
| orgID          | True     |         | String | Dynamic: All, Umbrella| Cisco Org ID: Required for Umbrella and all switches.                                           |
| core           | False    |         | Switch | Custom                | Installs the Core VPN module.                                                                     |
| showVPN        | False    |         | Switch | Dynamic: All, core    | Displays the Core VPN module in the system tray icon.                                            |
| SBL            | False    |         | Switch | Custom                | Installs the Start Before Login module.                                                          |
| DART           | False    |         | Switch | Custom                | Installs the Diagnostic and Reporting Tool module.                                               |
| NVM            | False    |         | String | Custom                | Installs the Network Visibility module.                                                           |
| NAM            | False    |         | String | Custom                | Installs the Network Access Manager module.                                                       |
| Posture        | False    |         | String | Custom                | Installs the VPN Posture (HostScan) module.                                                     |
| ISEPosture     | False    |         | String | Custom                | Installs the ISE Posture module.                                                                  |
| Umbrella       | False    |         | String | Custom                | Installs the Umbrella module. Requires dynamic parameters.                                        |
| DownloadURL    | Conditional |      | String | Core, All, Custom, Umbrella | URL to download the `CiscoSecureClient.zip` file. Use it only when the zip file isn't stored in CW RMM File Sharing. Leave it out when the zip file is in File Sharing. |

## Changelog

### 2026-11-18

- Clarified that `-DownloadURL` should be used only when the zip file isn't stored in CW RMM File Sharing.
- Added the [Cisco Secure Client - CW RMM](/docs/7637a958-9383-46af-99f9-4146ea097bf0) solution to the dependencies.

### 2025-04-10

- Initial version of the document
