---
id: '8111fecc-61de-4c72-933c-b719351b7a1e'
slug: /8111fecc-61de-4c72-933c-b719351b7a1e
title: 'Installed Remote Tool Audits'
title_meta: 'Installed Remote Tool Audits'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'This script scans the Windows registry (both 32-bit and 64-bit uninstall locations) to identify installed software matching known Remote Monitoring & Management (RMM), remote access, and support tool signatures.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-05-21
---

## Overview

This script audits a Windows endpoint for known remote access tools using multiple detection methods: uninstall registry entries, running processes, running services, and common executable paths. It supports exclusions from both script variable and a Ninja custom field. The results are compiled into an HTML table and written to a Ninja custom field for easy visibility within the NinjaOne platform.

Tool display names supported by this script:

1. AeroAdmin
2. Ammyy Admin
3. AnyDesk
4. Atera
5. Automate (ConnectWise Automate)
6. BeyondTrust
7. Chrome Remote Desktop
8. CW RMM (ConnectWise RMM)
9. DameWare
10. Datto RMM
11. DWService
12. GoToAssist
13. GoToMyPC
14. ITSPlatform
15. Kaseya
16. Kaseya VSA (VSA)
17. LiteManager
18. LogMeIn
19. Malwarebytes
20. ManageEngine
21. N-Able N-Central
22. N-Able N-Sight
23. Ninja RMM
24. NoMachine
25. Parsec
26. Remote Utilities
27. RemotePC
28. ScreenConnect / ConnectWise Control (instance-based detection)
29. Splashtop
30. Supremo
31. Syncro
32. TeamViewer
33. TightVNC
34. UltraVNC
35. VNC (generic detection)
36. VNC Connect (RealVNC)
37. Zoho Assist

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

- Search for the `Installed Remote Tools Audit` and then click on it

![Sample Run 2](../../../static/img/docs/8111fecc-61de-4c72-933c-b719351b7a1e/image.webp)

- Click Run

![Sample Run 2](../../../static/img/docs/8111fecc-61de-4c72-933c-b719351b7a1e/image1.webp)

## Dependencies

- [Solution - Installed Remote Access Tool Audit](/docs/eae2fab9-4697-4e1e-ad8f-93f8a09d7056)
- [Custom field - cPVAL RMM Audits](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
|Whitelisted Remote Access Tools| Ninja RMM, Datto RMM, Automate, ScreenConnect Client (3429b39dc0180fcf)|comma-separated list|False|-|String|Optional comma-separated list of remote access tools to exclude from detection. Tools specified here will be excluded globally across all clients. Additional client/location/machine-specific exclusions can be configured using the custom field. The script will combine exclusions from both sources when determining which tools to ignore.|

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/installed-remote-tools-audit.ps1)

## Output

- Activity Details  
- Custom Field

## Changelog

### 2026-06-16

- Added more remote tools and updated the powershell script to check processes, services and executable paths along with registries for remote tools
- Added script variable and a custom field to mention whitelisted remote tools
- Updated HTML output to show more columns like installed location, executable path, if tool is currently active and script last ran date.

### 2026-05-21

- Initial version of the document