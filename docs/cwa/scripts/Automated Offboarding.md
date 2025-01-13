---
id: 'cwa-offboarding-agent-removal'
title: 'Offboarding Agent Removal Script'
title_meta: 'Offboarding Agent Removal Script for ConnectWise Automate'
keywords: ['offboarding', 'agent', 'removal', 'script', 'connectwise']
description: 'This document provides a comprehensive guide on using the Offboarding Agent Removal Script in ConnectWise Automate. It details the global and user parameters, the process of checking agent status, and the removal of specified software products. The script is designed to facilitate the offboarding process by managing agent removal efficiently, including ticketing options for failures.'
tags: ['agent', 'connectwise', 'removal', 'ticketing', 'software', 'process', 'global', 'user']
draft: false
unlisted: false
---
## Summary

Script should be used against an offboarding group, location, monitor Autofix or run manually. Review and set global values per clients standards and products.

Will check if agent is online or offline, if online will attempt removal of products as set in Globals. If offline it will just retire agent.

## Sample Run

![Sample Run](../../../static/img/Automated-Offboarding/image_1.png)

#### Global Parameters

| Name                     | Example | Required | Description                                                                                     |
|--------------------------|---------|----------|-------------------------------------------------------------------------------------------------|
| AV_Software_Search       | ESET%   | False    | If filled out, will attempt to remove software. Also requires script line 18 to be set to correct removal script. |
| ticketcreationcategory    | 123     | False    | if filled out, will enable ticketing for AV, CW Control removal failures.                      |
| ThirdWallRemoval         | 0       | True     | 1 - Will attempt Third Wall Removal, 0 - Will NOT attempt removal.                            |
| SCRemoval                | 1       | True     | 1 - Will attempt CW Control removal, 0 - Will NOT attempt removal.                            |
| LTAgentRemoval           | 1       | True     | 1 - Will attempt LT Agent Uninstall, 0 - Will NOT attempt removal.                            |
| ContinueOnFailure        | 0       | True     | Cannot be used with ticketing, if set to 1 will force through AV, SC removal failures to continue offboarding. |

#### User Parameters

| Name               | Example                         | Required | Description                                                                                     |
|--------------------|---------------------------------|----------|-------------------------------------------------------------------------------------------------|
| OffboardingComment  | System Replaced - Offboarding   | False    | Comment can be specified to be added to the agent retired comments.                            |

## Process

Will check if agent is online or offline, if online will attempt removal of products as set in Globals. If offline will just retire agent.

Windows Updates will be reset back to normal. Will attempt to remove AV software if specified. Will remove CW Control (ScreenConnect) if specified. Thirdwall will be removed if specified.

Ticketing is optional.

## Output

Script Log  
Ticketing on failure if enabled.



