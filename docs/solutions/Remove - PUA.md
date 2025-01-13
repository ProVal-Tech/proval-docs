---
id: 'cwa-remove-pua'
title: 'Remove Potentially Unwanted Applications on Windows'
title_meta: 'Remove Potentially Unwanted Applications on Windows'
keywords: ['windows', 'pua', 'software', 'uninstall', 'audit', 'bloatware']
description: 'This document provides guidance on removing or auditing potentially unwanted applications (PUAs) on Windows systems. It includes associated content, implementation steps, and FAQs related to the process.'
tags: ['windows', 'software', 'uninstall', 'audit', 'bloatware']
draft: false
unlisted: false
---
## Purpose

Remove or audit potentially unwanted applications on Windows systems (PUAs).

## Associated Content

| Content                                                                                               | Type               | Function                      |
|-------------------------------------------------------------------------------------------------------|--------------------|-------------------------------|
| [SWM - Software Uninstall - Agnostic - Remove-PUA](https://proval.itglue.com/DOC-5078775-9434539)  | Agnostic Script     | Remove or audit PUAs.        |
| [SWM - Software Uninstall - Agent Procedure - PUA Remove](https://proval.itglue.com/DOC-5078775-10489167) | Kaseya Procedure    | VSA implementation of Remove-PUA |
| [CWM - Automate - Script - Remove - PUA - Command](https://proval.itglue.com/DOC-5078775-11157214) | Automate Script     | CWA implementation of Remove-PUA |

## Implementation

1. Import the Remove - PUA - Command script from the prosync tool.
   1. Run the Script with the -ListBloatware Argument to populate the automate custom table with data.
   2. Run the Script with the desired arguments to remove desired bloatware.

## FAQ

1. I don't see the bloatware that I want to get rid of and my script is erroring telling me that it could not find the item in any list
   1. This will happen if the passed bloatware object is not supported in our current script.
   2. You may put a request in with us to add the desired item.




