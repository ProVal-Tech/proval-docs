---
id: 'f493756c-e4e0-4aba-af87-9aef14f389aa'
slug: /f493756c-e4e0-4aba-af87-9aef14f389aa
title: 'Microsoft 365 - Click-to-Run - Get Details'
title_meta: 'Microsoft 365 - Click-to-Run - Get Details'
keywords: ['microsoft', 'click-to-run', 'office', 'update', 'version', 'auto-update', 'channel']
description: 'The purpose of this solution is to retrieve the installed Microsoft Click-to-Run Office version on the machines.'
tags: ['application', 'office', 'update']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to retrieve the installed Microsoft Click-to-Run Office version on the machines.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Microsoft 365 - Click-to-Run - Get Details - Windows](/docs/91dda79f-b6ad-440f-8a08-b5150d7e2a93) | Script | This script retrieves the installed Microsoft Click-to-Run Office version on windows machines, verifies whether auto-update is enabled, and obtains the update channel. |
| [cPVAL C2R Auto Update](/docs/e0c31574-10e7-4b8c-b5d5-24e355753441)  | Custom Field | Indicates if the C2R Office Auto Update is enabled on the machine, as gathered by the Microsoft 365 - Click-to-Run - Get Details Script. |
| [cPVAL C2R Office Version](/docs/05d64903-e13b-4937-bba8-e2b2236d52d3)  | Custom Field | C2R Office version installed on the machine, gathered by the Microsoft 365 - Click-to-Run - Get Details Script. |
| [cPVAL C2R Update Channel](/docs/76865fc9-4736-4590-b365-e4f858b6da8d)  | Custom Field | Update Channel of the Office installed on the machine, gathered by the Microsoft 365 - Click-to-Run - Get Details script. |
| [cPVAL C2R Data Collection Time](/docs/02ef6c2c-bd37-43ab-8564-a808768f51c3)  | Custom Field |The time when the C2R Update Channel, C2R Auto Update, and C2R Office Version custom fields were updated. |
| [Group - Microsoft 365 - C2R - Get Details (Windows)](/docs/9c1619d8-7e7a-4944-a340-b7bf7bc7a491)  | Group | This group includes windows machines on which the “Microsoft 365 – Click-to-Run – Get Details” script has been executed and successfully retrieved Microsoft Click-to-Run Office information. |
| [Execute Microsoft 365 - Click-to-Run - Get Details](/docs/57718791-63bd-4288-94d2-58abc2dedd20)  | Scheduled Automation | Executes "Microsoft 365 - Click-to-Run - Get Details" script on windows machines. |
| [Microsoft 365 - Click-to-Run - Get Details(MacOS)](/docs/1e24bd19-0b8b-4456-a3ba-e5dad5caebda) | Script | his script retrieves the installed Microsoft Click-to-Run Office version on MAC machines. |
| [Group - Microsoft 365 - C2R - Get Details(MAC)](/docs/e626d7f2-56e6-4bfc-a193-4eab98c06d41)  | Group | This group includes Mac machines on which the “Microsoft 365 – Click-to-Run – Get Details(MacOS)” script has been executed and successfully retrieved Microsoft Click-to-Run Office information. |
| [Execute Microsoft 365 - Click-to-Run - Get Details(MAC)](/docs/42401ca0-492c-42fa-b9e4-19d78666c8a4)  | Scheduled Automation | Executes Microsoft 365 - Click-to-Run - Get Details(MAC) script on mac machines. |

## Implementation

#### For Windows 
- Create the [Microsoft 365 - Click-to-Run - Get Details - Windows](/docs/91dda79f-b6ad-440f-8a08-b5150d7e2a93) using the implementation instruction provided in the document.
- Create the [cPVAL C2R Auto Update](/docs/e0c31574-10e7-4b8c-b5d5-24e355753441) using the implementation instruction provided in the document.
- Create the [cPVAL C2R Office Version](/docs/05d64903-e13b-4937-bba8-e2b2236d52d3)  using the implementation instruction provided in the document.
- Create the  [cPVAL C2R Update Channel](/docs/76865fc9-4736-4590-b365-e4f858b6da8d)  using the implementation instruction provided in the document.
- Create the [cPVAL C2R Data Collection Time](/docs/02ef6c2c-bd37-43ab-8564-a808768f51c3) using the implementation instruction provided in the document.
- Create the [Execute Microsoft 365 - Click-to-Run - Get Details](/docs/57718791-63bd-4288-94d2-58abc2dedd20) using the implementation instruction provided in the document.
- Create the  [Group - Microsoft 365 - C2R - Get Details (Windows)](/docs/9c1619d8-7e7a-4944-a340-b7bf7bc7a491)  using the implementation instruction provided in the document.


#### For MAC 
- Create the [Microsoft 365 - Click-to-Run - Get Details(MacOS)](/docs/1e24bd19-0b8b-4456-a3ba-e5dad5caebda) using the implementation instruction provided in the document.
- Create the  [cPVAL C2R Update Channel](/docs/76865fc9-4736-4590-b365-e4f858b6da8d)  using the implementation instruction provided in the document.
- Create the  [Execute Microsoft 365 - Click-to-Run - Get Details(MAC)](/docs/42401ca0-492c-42fa-b9e4-19d78666c8a4) using the implementation instruction provided in the document.
- Create the  [Group - Microsoft 365 - C2R - Get Details(MAC)](/docs/e626d7f2-56e6-4bfc-a193-4eab98c06d41) using the implementation instruction provided in the document.