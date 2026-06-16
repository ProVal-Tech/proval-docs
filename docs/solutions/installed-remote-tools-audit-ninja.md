---
id: 'eae2fab9-4697-4e1e-ad8f-93f8a09d7056'
slug: /eae2fab9-4697-4e1e-ad8f-93f8a09d7056
title: 'Installed Remote Access Tool Audit'
title_meta: 'Installed Remote Access Tool Audit'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'The purpose of this solution is to identify a curated set of remote access tools using multiple detection methods.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-16
---

## Purpose

The purpose of this solution is to identify a curated set of remote access tools using multiple detection methods, uninstall registry entries, running processes, running services, and common executable paths. It supports exclusions from both script variable and a Ninja custom field. The results are compiled into an HTML table and written to a Ninja custom field for easy visibility within the NinjaOne platform.

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

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom field - cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651)  | Custom Field | Custom field to select the required platform to start detecting Unauthorized remote tools. |
| [Custom field - cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47)  | Custom Field | Custom filed to define an optional comma-separated list of remote access tool display names to exclude from detection. |
| [Custom field - cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66)  | Custom Field | Custom field stores the remote management applications list gathered by the script [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e). |
| [Automation - Installed Remote Tool Audits](/docs/8111fecc-61de-4c72-933c-b719351b7a1e)  | Automation | Script to audit Windows endpoint for known remote access tools using multiple detection methods. |
| [Compound Condition - Audit Installed Remote Tools](/docs/05f4af3f-1f26-4080-aec5-fc9bbc0df5fc)  | Compound Condition | Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows workstations where deployment is enabled. |
| [Compound Condition - Audit Installed Remote Tools](/docs/3ed66f5a-e52f-4f79-a8c0-783597a4d439)  | Compound Condition | Triggers the [Installed Remote Tools Audit](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows Servers where deployment is enabled. |


## Implementation

- Create the below Custom Fields using the implementation instruction provided in the documents.
    - [Custom field - cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651)
    - [Custom field - cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47) 
    - [Custom field - cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66)
- Create the [Automation - Installed Remote Tool Audits](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) using the implementation instruction provided in the document.
- Create the below Compound Conditions using the implementation instruction provided in the documents.
    - [Compound Condition - Audit Installed Remote Tools](/docs/05f4af3f-1f26-4080-aec5-fc9bbc0df5fc) 
    - [Compound Condition - Audit Installed Remote Tools](/docs/3ed66f5a-e52f-4f79-a8c0-783597a4d439)

## Changelog

### 2026-06-16

- Initial version of the document
