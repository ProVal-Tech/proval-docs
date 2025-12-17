---
id: '0d8c4619-b666-44ec-93b1-2d00e4632865'
slug: /0d8c4619-b666-44ec-93b1-2d00e4632865
title: 'Install Windows App'
title_meta: 'Install Windows App'
keywords: ['windows', 'application', 'windows app']
description: 'This solution contains the Windows App installation and deployment.'
tags: ['windows', 'application', 'software']
draft: false
unlisted: false
---

## Purpose

This solution contains the Windows App installation and deployment.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658)      | Script | Install Windows App. Creates a shortcut on desktop. User must be logged on to the computer to run this script. |
| [Monitor - ProVal - Production - Install Windows App](/docs/b22f954e-6a02-46f4-81d3-3f5d18d4991c) | Monitor | This monitor is built to install the Windows App on the computers where the deployment EDFs are checked. |
| `△ Custom - Execute Script - Install Windows App` | Alert Template | Apply this with the [Monitor - ProVal - Production - Install Windows App](/docs/b22f954e-6a02-46f4-81d3-3f5d18d4991c) to run the [Script - Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658) as an autofix to install the Windows App on the detected agents |

## Implementation

- Import the [Script - Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658) 
- Import the monitor
- Import the Alert Template `△ Custom - Execute Script - Install Windows App`
- Apply the alert template to the monitor.
- Run now and reset the monitor

- Or the script can run on-demand too.

## FAQ

- This can only install the Windows App if it found the user logged in session.