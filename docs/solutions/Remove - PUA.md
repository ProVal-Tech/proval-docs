---
id: '73ebd85e-aa83-4f0b-a092-41de2b665873'
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

| Content                                                                                               | Type               | Function                      |
|-------------------------------------------------------------------------------------------------------|--------------------|-------------------------------|
| [SWM - Software Uninstall - Agnostic - Remove-PUA](<../powershell/Remove-PUA.md>)                 | Agnostic Script     | Remove or audit PUAs.        |
| [SWM - Software Uninstall - Agent Procedure - PUA Remove](<../vsa/procedures/PUA%20Remove.md>)   | Kaseya Procedure    | VSA implementation of Remove-PUA |
| [CWM - Automate - Script - Remove - PUA - Command](<../cwa/scripts/Remove - PUA.md>) | Automate Script     | CWA implementation of Remove-PUA |

## Implementation

1. Import the Remove - PUA - Command script from the prosync tool.
   1. Run the script with the `-ListBloatware` argument to populate the automate custom table with data.
   2. Run the script with the desired arguments to remove the specified bloatware.

## FAQ

1. I don't see the bloatware that I want to get rid of, and my script is erroring, telling me that it could not find the item in any list.
   1. This will happen if the passed bloatware object is not supported in our current script.
   2. You may submit a request to us to add the desired item.




