---
id: 'b0ca57d2-351c-4f1d-9d98-954c1d77777e'
slug: /b0ca57d2-351c-4f1d-9d98-954c1d77777e
title: 'SonicWall NetExtender Deployment'
title_meta: 'SonicWall NetExtender Deployment'
keywords: ['sonicwall', 'netextender', 'monitor', 'upgrade', 'deployment', 'edf', 'version']
description: 'This document outlines the setup of an internal monitor for detecting the online Windows agent with SonicWall NetExtender installed, facilitating upgrades and excluding specific locations or agents as needed. It details dependencies and integration with other monitors for effective management.'
tags: ['deployment']
draft: false
unlisted: false
---

## Summary

This internal monitor detects the online Windows agent where the SonicWall NetExtender is installed for the upgrade. It depends on the client-based EDF 'SonicWall NetExtender Deployment' to check for the SonicWall NetExtender Install/Update. It also relies on the location-based and computer-based EDF 'SonicWall NetExtender Exclude' to exclude particular locations or agents from the deployed clients.

This monitor is also set up to grab the latest version of SonicWall NetExtender from the system property created from [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a). This monitor should be paired with the other internal monitor [SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c).

## Dependencies

- [Script - SonicWall NetExtender - Install/Update](/docs/823c8e22-0b24-4cf9-9e25-4048d2973b98)
- [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a)
- [SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c)

## Target

Global
