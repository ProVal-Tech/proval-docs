---
id: '62ad1299-3e65-4bf7-a415-307fdf9a162c'
slug: /62ad1299-3e65-4bf7-a415-307fdf9a162c
title: 'SonicWall NetExtender - Latest Version Detection'
title_meta: 'SonicWall NetExtender - Latest Version Detection'
keywords: ['sonicwall', 'netextender', 'monitor', 'version', 'update']
description: 'This document outlines a monitor that schedules a script to collect the latest version details of the SonicWall NetExtender application monthly, updating the system properties without deploying the application itself. It is designed for Windows 10/11 workstations with a patch policy.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor schedules the script [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a) to collect the latest version details of the SonicWall NetExtender application every month and update it to the system properties `SonicWall_NetExtender_Version`. It is set up by default to run once per month on a random Windows 10/11 machine that has a patch policy, strictly to obtain the latest version only. This monitor will not update the application; it just sets up the [SonicWall NetExtender Deployment](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e) monitor to deploy updates based on the latest version.

## Dependencies

[SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a)

## Target

Workstations - Only one workstation is needed for this monitor because it is only required to fetch the latest version.


