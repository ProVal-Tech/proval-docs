---
id: '69bd8087-6e6e-47ce-8484-ef0d6317e506'
slug: /69bd8087-6e6e-47ce-8484-ef0d6317e506
title: 'Uninstall WSL'
title_meta: 'Uninstall WSL'
keywords: ['Vulnerability', 'CVE', 'WSL']
description: 'This solution provides an option to uninstall WSL manually or using automation'
tags: ['vulnerability', 'cve']
draft: false
unlisted: false
---

## Purpose

This solution provides an option to uninstall WSL manually or using automation.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - CVE-2025-24084 - WSL2 Uninstall](/docs/850b68d4-ba80-4807-9588-2263440fe5cc) | Script | This script uninstalls the Windows Subsystem Linux (WSL2) as it has a vulnerability. Refer to the article below for more details:
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2025-24084 |
| [Monitor - WSL Detection](/docs/cfe1d90a-11be-4ea8-80b3-4d3116358b7d) | Remote Monitor | This remote monitor detects the Windows agent where the WSL command works. |
| `Alert Template - △ Custom - Execute Script - Uninstall WSL` | Alert Template | This alert template is applied to the remote [Monitor - WSL Detection](/docs/cfe1d90a-11be-4ea8-80b3-4d3116358b7d) to uninstall the WSL installed detected agents using [Script - CVE-2025-24084 - WSL2 Uninstall](/docs/850b68d4-ba80-4807-9588-2263440fe5cc) |

## Implementation

- Import the [Script - CVE-2025-24084 - WSL2 Uninstall](/docs/850b68d4-ba80-4807-9588-2263440fe5cc)
- Create the remote [Monitor - WSL Detection](/docs/cfe1d90a-11be-4ea8-80b3-4d3116358b7d) to the requested Windows group. Refer to the monitor documentation.
- Import the `Alert Template - △ Custom - Execute Script - Uninstall WSL`
- Apply the `Alert Template - △ Custom - Execute Script - Uninstall WSL` to the remote monitor [Monitor - WSL Detection](/docs/cfe1d90a-11be-4ea8-80b3-4d3116358b7d) 

