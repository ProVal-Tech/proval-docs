---
id: '73387129-5472-4b0e-945e-f7822c57185d'
slug: /73387129-5472-4b0e-945e-f7822c57185d
title: 'Unquoted Service Paths - Detection'
title_meta: 'Unquoted Service Paths - Detection'
keywords: ['unquoted-service-path','services','vulnerability','detection','audit']
description: 'Finds Windows services with an unquoted executable path, records them in cPVAL Unquoted Service Paths, and tells the Unquoted Service Paths compound conditions when the autofix must run.'
tags: ['security','vulnerability','windows','auditing','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Description

Finds the Windows services whose executable path contains a space and is not enclosed in quotation marks, and records them in [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196). It does not change any service. It is the condition of the [Unquoted Service Paths - Workstations](/docs/ed45bd74-48ec-4463-b012-1dfac05e9a1c) and [Unquoted Service Paths - Servers](/docs/2d18a56f-bbec-46ef-84c7-229643a76c4b) compound conditions. When it exits with 1, the compound condition runs [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30).

[cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) decides what happens on each device type: skip, audit or fix. Servers include domain controllers.

A service is reported when the executable part of its path, the text up to the first `.exe`, contains a space and is not in quotation marks. Spaces in the arguments after the executable are ignored, so `C:\Apps\agent.exe -config C:\Program Files\agent.ini` is not reported. Kernel drivers are not checked, because Windows loads them without the path search that makes unquoted paths a risk.

The automation verifies its own ProVal signature before it checks anything.

### Exit Code 0: No Action Needed

- cPVAL Unquoted Service Path Mode is `Disabled` or blank, or skips this device type. cPVAL Unquoted Service Paths is not changed.
- No service has an unquoted path. cPVAL Unquoted Service Paths is cleared.
- Services were found and the mode only audits this device type. They are recorded in cPVAL Unquoted Service Paths with `AutofixAttempted` set to `0`.

### Exit Code 1: Unquoted Service Paths - Autofix Must Run

Services were found and the mode fixes this device type. They are recorded in cPVAL Unquoted Service Paths with `AutofixAttempted` set to `0`, and the output contains a line that begins with `Detected:` and lists the services.

### Exit Code 2: Script Failure

The output gives the reason. Unquoted Service Paths - Autofix does not run.

- [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387), the operating system or the services could not be read.
- [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) could not be updated or cleared.
- The approved ProVal certificate list could not be downloaded, or the automation failed its signature check.

## Requirements

- Windows PowerShell 5.1, run as System.
- Access to `contentrepo.net`, for the signature check.

## Sample Run

Manual execution of this script is not recommended. It is designed to run as the condition of the solution's compound conditions.

## Dependencies

- [Custom Field - cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387)
- [Custom Field - cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196)
- [Automation - Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30)
- [Solution - Unquoted Service Paths - NinjaOne](/docs/463a9e42-df91-406d-b53c-285f4cbdabac)

## Custom Fields

| Field Label | Scope | Accepted Values | Default Value | Description |
| ----------- | ----- | --------------- | ------------- | ----------- |
| [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) | System, Organization, Location, Device | `Disabled`, `Audit All`, `Audit Workstations Only`, `Audit Servers Only`, `Autofix All`, `Autofix Workstations Only`, `Autofix Servers Only`, `Autofix Workstations and Audit Servers`, `Autofix Servers and Audit Workstations` | Blank, which works like `Disabled` | Decides whether this device type is skipped, audited or fixed. |
| [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) | Device | Written by the automation | - | The services with an unquoted path. Cleared when none is found. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/unquoted-service-paths-detection.ps1)

## Output

- Activity Logs
- Custom field: [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196)

## Changelog

### 2026-10-27

- Initial version of the document
