---
id: 6ba96e6b-21df-4d96-9200-3bdb7d79aae2
slug: /6ba96e6b-21df-4d96-9200-3bdb7d79aae2
title: 'AV Exclusions - ProVal Standard'
title_meta: 'AV Exclusions - ProVal Standard'
keywords: [ 'exclusions', 'antivirus', 'security', 'proval' ]
description: 'This document provides a list of recommended exclusions for various AV/security products to ensure the proper functioning of ProVal scripts and tools.'
tags: [ 'exclusions', 'antivirus', 'security' ]
draft: false
unlisted: false
---

- Exclude these folders and paths from AV restrictions to allow PowerShell to execute properly:
    - `C:\ProgramData\_Automation`
    - `C:\ProgramData\ProVal`
- Ability to add or modify the following systems in Windows:
    - Windows Services
    - Windows Registry
    - Event Logs
    - Scheduled Tasks
- https://file.provaltech.com/ should be accessible.
- Whitelist [our IP addresses](/docs/794c9b95-df88-4b63-8605-b7c9b138532b).