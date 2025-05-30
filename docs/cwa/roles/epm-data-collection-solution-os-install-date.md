---
id: '4ed8cce5-502c-4207-857f-1dfd64697920'
slug: /4ed8cce5-502c-4207-857f-1dfd64697920
title: 'EPM - Data Collection -Solution - OS Install Date'
title_meta: 'EPM - Data Collection -Solution - OS Install Date'
keywords: ['custom', 'field', 'install', 'date', 'os']
description: 'This document outlines a solution for populating a custom field with the initial install date of the operating system. It ensures that the displayed date reflects the oldest installation date, unaffected by any feature updates or OS upgrades.'
tags: ['installation']
draft: false
unlisted: false
---

## Purpose

This solution allows for a custom field to be populated with the initial install date of the OS. This will show the oldest date and will not be impacted by feature updates or upgrades to a new OS.

## Associated Content

| Content                                                             | Type            | Function                                                                                                 |
| ------------------------------------------------------------------- | --------------- | -------------------------------------------------------------------------------------------------------- |
| [xPVAL OS Install Date](/docs/0fbf0989-b499-4d26-8cec-29e3d32d0ada) | Custom Field    | The custom field displays the initial install date of the OS based on the agent procedure results        |
| [OS Install Date](/docs/8beb5e09-23af-40e8-8810-ec1a030c600b)       | Agent Procedure | The agent procedure populates the custom field with the data based on the results run within PowerShell. |

## Implementation

The agent procedure must be run in order for the custom field to be populated.