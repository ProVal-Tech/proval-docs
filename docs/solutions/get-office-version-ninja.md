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
  date: 2026-05-21
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
| [cPVAL Office Install Type](/docs/03640b47-4b59-4f8e-b8cf-dc20841345ba)  | Custom Field | Stores the Office install Type on the machine fetched by `Get Office Version` script.|
| [cPVAL M365 Apps Installed](/docs/20fb97b5-2032-4f47-ad06-584799c6f192)  | Custom Field | Stores the Office m365 application information on the machine fetched by `Get Office Version` script.|
| [cPVAL Windows Office Version](/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638)  | Group | This group contains machines where office version is detected by `Get Office Version` Script. |

## Implementation

- Create the [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) using the implementation instruction provided in the document.
- Create the [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)   using the implementation instruction provided in the document.
- Create the [cPVAL Office Bitness](/docs/90a2e646-9424-4c8c-b408-e89ccc62c47e)   using the implementation instruction provided in the document.
- Create the [cPVAL Office Edition](/docs/4fad4211-7766-4d7a-af20-8d00123d2fa1)   using the implementation instruction provided in the document.
- Create the [cPVAL Office Install Type](/docs/03640b47-4b59-4f8e-b8cf-dc20841345ba)   using the implementation instruction provided in the document.
- Create the [cPVAL M365 Apps Installed](/docs/20fb97b5-2032-4f47-ad06-584799c6f192)   using the implementation instruction provided in the document.
- Create the [cPVAL Windows Office Version](/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638) using the implementation instruction provided in the document.


## FAQ

**Q1: What does this script detect?**

`Ans`: This script detects the installed Microsoft Office version on a Windows machine,
including edition (MSI or Click-to-Run), bitness (32-bit or 64-bit), install type
(Full, Language Pack, Partial, or Full + Language Pack), and whether Microsoft 365
Apps are installed.

**Q2: Does it support Microsoft 365 detection?**

`Ans`: Yes, the script accurately detects Microsoft 365 Apps using Click-to-Run (C2R)
registry information and ProductReleaseIds. It also sets a dedicated `M365 Apps
Installed` field to Yes or No, which is useful for identifying machines that already
have Microsoft 365 Apps present alongside an older MSI Office installation.

**Q3: What happens if Office is not detected?**

`Ans`: If Office is not detected, all five custom fields (Office Version, Office Edition,
Office Bitness, Office Install Type, and M365 Apps Installed) are set to undetermined
to ensure consistent output.

**Q4: Does the script support both MSI and Click-to-Run installations?**

`Ans`: Yes, the script primarily uses Click-to-Run registry detection and falls back to
ASSOC/FTYPE methods for MSI-based installations.

**Q5: How does the script identify Language Packs vs full installations?**

`Ans`: The script parses the `ProductReleaseIds` registry value to classify the install
as Full, LanguagePack, Partial (listing the individual apps found e.g. Word, Excel),
or Full + LanguagePack where both are present.

**Q6: Can the script detect Microsoft 365 Apps on a machine that also has an older MSI
Office version installed?**

`Ans`: Yes, the `Check-M365AppsInstalled` function handles mixed environments by checking
both the Click-to-Run registry key and the Windows uninstall registry entries
independently of the primary Office detection path.

## Changelog

### 2026-05-21

- Added two new custom fields: `cPVAL Office Install Type` and `cPVAL M365 Apps Installed`.

- Added `Resolve-InstallType` function to detect whether an Office installation is a
  Full suite, Language Pack only, Partial (individual apps e.g. Word, Excel), or a
  combination of Full + Language Pack by parsing the `ProductReleaseIds` registry value.

- Added `Check-M365AppsInstalled` function to detect Microsoft 365 Apps in mixed
  environments where an older MSI Office version and M365 Apps may both be present,
  checking both the C2R registry key and Windows uninstall registry entries.

- Script now updates five separate custom fields: Office Version, Office Edition,
  Office Bitness, Office Install Type, and M365 Apps Installed.

- Fixed variable scoping bug in functions where assignments were writing to local scope
  instead of the global script scope; all in-function assignments now use `$script:`.

### 2026-05-12

- Added two new custom fields: `Office Edition`, and `Office Bitness`
- Enhanced `Get Office Version` script to improve Click-to-Run (C2R) version identification using ProductReleaseIds and CDN channel mapping. 
- Added accurate detection for Microsoft 365 Apps, Office 2016, 2019, 2021, and 2024 along with improved Office bitness detection (32-bit / 64-bit). 
- Retained MSI fallback detection using ASSOC/FTYPE and updated Ninja custom field handling with undetermined fallback values for reliability. 
- Script now updates three separate custom fields for Office Version, Office Edition, and Office Bitness seperately.

### 2025-12-12

- Initial version of the document
