---
id: '8b6a5221-58a3-4117-99da-f3034f38df37'
slug: /8b6a5221-58a3-4117-99da-f3034f38df37
title: 'Microsoft 365 - C2R - Solution'
title_meta: 'Microsoft 365 - C2R - Solution'
keywords: ['channel', 'microsoft-office', 'c2r', 'click-to-run', 'office365']
description: 'This solution contains the Microsoft 365 - C2R - solution, like (Get, Set, Update, and Repair the C2R channel).'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Purpose

This solution contains the Microsoft 365 - C2R - solution, like (Get, Set, Update, and Repair the C2R channel).

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Microsoft 365 - C2R - Get Channel](/docs/03760c3d-ed64-44f5-a67b-2cbd39478fca)      | Component | This script is used to check the update channel for Microsoft Office and update to a UDF. |
| [Microsoft 365 - C2R - Set Update Channel](/docs/743a7427-2c38-471a-b1ca-899fc34bbd99) | Component | This script will modify the registry to set the update channel for Microsoft 365 products to the value specified in the variable and update the Update Channel UDF accordingly. |
| [Microsoft Office - C2R - Update](/docs/9c3e353a-4ee8-46a1-8262-db9234dc235e) | Component | Update Microsoft 365 Apps to their latest version |
| [Microsoft Office - C2R - Repair](/docs/0ed0fdc8-7813-47b7-bc5a-3e089dda7560) | Component | This checks the office bit version (32 / 64), then runs a shell command for quick repair. If you want to run a full repair, then set the variable FullRepair = 1. |

## Implementation

- Follow the component documentation to import and run on-demand
