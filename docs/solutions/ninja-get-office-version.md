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
---

## Purpose

The purpose of this solution is to check the MS Office Version installed on the windows machine.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108)   | Script |  This script will check for the MS Office Version installed on the windows machine and updates the custom field. |
| [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)  | Custom Field| Stores the Office version installed on the machine fetched by `Get Office Version` script.|
| [cPVAL Windows Office Version](/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638)  | Group | This group contains machines where office version is detected by `Get Office Version` Script. |

## Implementation

- Create the [Get Office Version](/docs/9224179e-e14d-4fe2-95a3-a2304e31e108) using the implementation instruction provided in the document.
- Create the [cPVAL Office Version](/docs/4216d707-95cc-414c-8fa5-73fa9606fa97)   using the implementation instruction provided in the document.
- Create the [cPVAL Windows Office Version](/docs/8e9b5d24-2b9c-46bc-8d3a-5f4f67f1a638) using the implementation instruction provided in the document.
