---
id: '62ad1299-3e65-4bf7-a415-307fdf9a162c'
title: 'SonicWall NetExtender Version Monitor'
title_meta: 'SonicWall NetExtender Version Monitor'
keywords: ['sonicwall', 'netextender', 'monitor', 'version', 'update']
description: 'This document outlines a monitor that schedules a script to collect the latest version details of the SonicWall NetExtender application monthly, updating the system properties without deploying the application itself. It is designed for Windows 10/11 workstations with a patch policy.'
tags: ['monitor', 'windows', 'version', 'update', 'software']
draft: false
unlisted: false
---
## Summary

This monitor schedules the script [SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835) to collect the latest version detail of the SonicWall Netextender application every month and update it to the system properties SonicWall_Netextender_Version. It is set up by default to run once per month on a random Windows 10/11 machine that has a patch policy, strictly to obtain the latest version only. This monitor will not update the application; it just sets up the [SonicWall NetExtender Deployment](https://proval.itglue.com/DOC-5078775-13399330) monitor to deploy updates based on the latest version.

## Dependencies

[SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835)

## Target

Workstations - Only one workstation is needed for this monitor because it is just needed to fetch the latest version.






