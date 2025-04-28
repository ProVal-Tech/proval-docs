---
id: '823c8e22-0b24-4cf9-9e25-4048d2973b98'
slug: /823c8e22-0b24-4cf9-9e25-4048d2973b98
title: 'SonicWall NetExtender - Install/Update'
title_meta: 'SonicWall NetExtender - Install/Update'
keywords: ['SonicWall', 'NetExtender', 'Application']
description: 'This script installs/updates the latest version of the SonicWall NetExtender dynamically.'
tags: ['SonicWall', 'NetExtender', 'Application']
draft: false
unlisted: false
---

## Summary
This script installs/updates the latest version of the SonicWall NetExtender dynamically.

## Sample Run

 [Monitor - SonicWall NetExtender - Install/Update](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e)

## Process

This script installs/updates the latest version of the SonicWall NetExtender dynamically by Winget using [Script - Winget - Install/Update](/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25) if the fresh installation is being performed on the agent.
If the agent already have the SonicWall NetExtender installed then it first check if it is deployed using MSI or EXE.
If installed using MSI then it updates using [Script - Winget - Install/Update](/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25) else if it is deployed using EXE then it perform installation by downloading the latest exe package from the site `https://www.sonicwall.com/products/remote-access/vpn-clients` by fetching the latest version from the winget manifest and download it.
It has proper error handling to report success and failure.

## Output

- Script log