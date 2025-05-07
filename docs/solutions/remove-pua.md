---
id: '73ebd85e-aa83-4f0b-a092-41de2b665873'
slug: /73ebd85e-aa83-4f0b-a092-41de2b665873
title: 'Remove - PUA'
title_meta: 'Remove - PUA'
keywords: ['windows', 'pua', 'software', 'uninstall', 'audit', 'bloatware']
description: 'This document provides guidance on removing or auditing potentially unwanted applications (PUAs) on Windows systems. It includes associated content, implementation steps, and FAQs related to the process.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Purpose

Remove or audit potentially unwanted applications on Windows systems (PUAs).

## Associated Content

| Content                                                                                               | Type             | Function                         |
| ----------------------------------------------------------------------------------------------------- | ---------------- | -------------------------------- |
| [SWM - Software Uninstall - Agnostic - Remove-PUA](/docs/fda5f79b-3e83-4561-af2b-2533f41c7443)        | Agnostic Script  | Remove or audit PUAs.            |
| [SWM - Software Uninstall - Agent Procedure - PUA Remove](/docs/7532eff4-e724-471e-96fc-ddfd944bf710) | Kaseya Procedure | VSA implementation of Remove-PUA |
| [CWM - Automate - Script - Remove - PUA - Command](/docs/dd7d4c4a-ee5a-46c1-bc19-5cfd16584ecf)        | Automate Script  | CWA implementation of Remove-PUA |

## Implementation

1. Import the Remove - PUA - Command script from the prosync tool.
   1. Run the script with the `-ListBloatware` argument to populate the automate custom table with data.
   2. Run the script with the desired arguments to remove the specified bloatware.

## FAQ

1. I don't see the bloatware that I want to get rid of, and my script is erroring, telling me that it could not find the item in any list.
   1. This will happen if the passed bloatware object is not supported in our current script.
   2. You may submit a request to us to add the desired item.

