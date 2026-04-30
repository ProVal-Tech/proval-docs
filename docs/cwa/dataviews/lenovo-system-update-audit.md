---
id: '537b1c7c-5f38-4915-847f-3682339e9211'
slug: /537b1c7c-5f38-4915-847f-3682339e9211
title: 'Lenovo System Update Audit'
title_meta: 'Lenovo System Update Audit'
keywords: ['lenovo', 'bios', 'firmware', 'drivers', 'vendor-specific', 'driver-updates', 'lenovo-workstations']
description: 'Displays available Lenovo update information gathered by the script from the table pvl_lsuclient_audit.'
tags: ['lenovo', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Summary

Displays available Lenovo update information gathered by the [Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010) script from the table [pvl_lsuclient_audit](/docs/14af3c59-efba-4f62-959a-50ad6e382836).

## Dependencies

- [Custom Table: pvl_lsuclient_audit](/docs/14af3c59-efba-4f62-959a-50ad6e382836)
- [Script: Lenovo LSUClient Module - Install + Command Handler [DV,Param,Autofix]](/docs/9c0e2d8e-dccc-4253-9d3c-0f21a7d1f010)
- [Internal Monitor: Lenovo System Update Scan](/docs/ff8d3f33-14ea-4e5b-9cec-95fab016f633)
- [Solution: Lenovo System Update Handler](/docs/d801eded-6c8e-413b-852a-5ff83058667b)

## Columns

| Column             | Explanation                                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------------------|
| Client             | The name of the client for this computer.                                                                    |
| Location           | The name of the location for this computer.                                                                  |
| Computer           | The name of the computer where the scan was performed.                                                       |
| OperatingSystem    | The OS installed on the endpoint.                                                                            |
| LastContact        | The last check-in date of the agent.                                                                         |
| LastLoggedInUser   | The last user logged into the device.                                                                        |
| FormFactor         | The physical form factor of the machine.                                                                     |
| UpdateID           | The unique Lenovo update identifier.                                                                         |
| UpdateTitle        | Human-readable update description.                                                                           |
| UpdateType         | Update type (e.g., 'Driver', 'BIOS', 'Firmware').                                                            |
| Category           | Hardware category (e.g., 'Networking LAN Ethernet').                                                         |
| Version            | Update version.                                                                                              |
| Severity           | Severity level (e.g., 'Critical', 'Recommended').                                                            |
| ReleaseDate        | Release date of the update.                                                                                  |
| RebootType         | Integer indicating reboot requirements.                                                                      |
| Vendor             | The vendor name (e.g., 'Lenovo').                                                                            |
| SizeInBytes        | File size of the update payload.                                                                             |
| DownloadURL        | Direct download URL for the update XML/payload.                                                              |
| InstallerType      | Installer type (e.g., 'PackageInstallInfo').                                                                 |
| IsApplicable       | Applicability status (1 for True, 0 for False).                                                              |
| IsInstalled        | Installation status (1 for True, 0 for False).                                                               |
| ScanDate           | The timestamp of when the script executed and populated this record.                                         |

## Changelog

### 2026-04-30

- Initial version of the document.
