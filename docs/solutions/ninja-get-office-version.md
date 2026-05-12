---
id: '19ca26a2-c4f1-4ce1-99a2-b8d37dccfa04'
slug: /19ca26a2-c4f1-4ce1-99a2-b8d37dccfa04
title: 'Get Office Version'
title_meta: 'Get Office Version'
keywords: ['microsoft','365','Version','Office']
description: 'The purpose of this solution is to check the MS Office Version installed on the windows machine'
tags: ['office365', 'software', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-05-12
---

## Purpose

The purpose of this solution is to check the MS Office Version installed on the windows machine.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108)   | Script |  This script will check for the MS Office Version installed on the windows machine and updates the custom field. |
| [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)  | Custom Field | Stores the Office version installed on the machine fetched by `Get Office Version` script.|
| [cPVAL Office Bitness](/docs/90a2e646-9424-4c8c-b408-e89ccc62c47e)  | Custom Field | Stores the Office bitness on the machine fetched by `Get Office Version` script.|
| [cPVAL Office Edition](/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1)  | Custom Field | Stores the Office Edition on the machine fetched by `Get Office Version` script.|
| [cPVAL Windows Office Version](/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638)  | Group | This group contains machines where office version is detected by `Get Office Version` Script. |

## Implementation

- Create the [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) using the implementation instruction provided in the document.
- Create the [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)   using the implementation instruction provided in the document.
- Create the [cPVAL Office Bitness](/docs/90a2e646-9424-4c8c-b408-e89ccc62c47e)   using the implementation instruction provided in the document.
- Create the [cPVAL Office Edition](/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1)   using the implementation instruction provided in the document.
- Create the [cPVAL Windows Office Version](/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638) using the implementation instruction provided in the document.

## Changelog

### 2026-05-12

Enhanced Microsoft Office detection script to improve Click-to-Run (C2R) version identification using ProductReleaseIds and CDN channel mapping. Added accurate detection for Microsoft 365 Apps, Office 2016, 2019, 2021, and 2024 along with improved Office bitness detection (32-bit / 64-bit). Retained MSI fallback detection using ASSOC/FTYPE and updated Ninja custom field handling with undetermined fallback values for reliability. Script now updates three separate custom fields for Office Version, Office Edition, and Office Bitness seperately.

### 2025-12-12

- Initial version of the document


### FAQ

Q1: What does this script detect?

`Ans`: This script detects the installed Microsoft Office version on a Windows machine, including edition (MSI or Click-to-Run) and bitness (32-bit or 64-bit).

Q2: Does it support Microsoft 365 detection?

`Ans`: Yes, the script accurately detects Microsoft 365 Apps using Click-to-Run (C2R) registry information and ProductReleaseIds.

Q3: What happens if Office is not detected?

`Ans`: If Office is not detected, the custom fields are set to undetermined to ensure consistent output.

Q4: Does the script support both MSI and Click-to-Run installations?

`Ans`: Yes, the script primarily uses Click-to-Run registry detection and falls back to ASSOC/FTYPE methods for MSI-based installations.

Q5: Which custom fields are updated by this script?

`Ans`: The script updates the following three custom fields:

cpvalOfficeVersion
cpvalOfficeEdition
cpvalOfficeBitness