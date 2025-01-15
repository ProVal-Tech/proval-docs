---
id: '4ed8cce5-502c-4207-857f-1dfd64697920'
title: 'Custom Field for Initial OS Install Date'
title_meta: 'Custom Field for Initial OS Install Date'
keywords: ['custom', 'field', 'install', 'date', 'os']
description: 'This document outlines a solution for populating a custom field with the initial install date of the operating system. It ensures that the displayed date reflects the oldest installation date, unaffected by any feature updates or OS upgrades.'
tags: ['custom-field', 'os', 'agent', 'procedure', 'installation']
draft: false
unlisted: false
---
## Purpose

This solution allows for a custom field to be populated with the initial install date of the OS. This will show the oldest date, and not be impacted by feature updates or upgrade to a new OS.

## Associated Content

| Content                                                                                          | Type          | Function                                                                                                    |
|--------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|
| [https://proval.itglue.com/DOC-5078775-12637112](https://proval.itglue.com/DOC-5078775-12637112) | Custom Field  | The custom field displays the initial install date of the OS based on the agent procedure results           |
| [https://proval.itglue.com/DOC-5078775-12637113](https://proval.itglue.com/DOC-5078775-12637113) | Agent Procedure| The agent procedure populates the custom field with the data based on the results ran within powershell.    |

## Implementation

Agent procedure must be run in order for the CF to be populated.






