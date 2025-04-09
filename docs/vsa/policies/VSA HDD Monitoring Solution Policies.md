---
id: 'b39fe35b-74b3-442d-a977-daef64294297'
slug: /b39fe35b-74b3-442d-a977-daef64294297
title: 'VSA HDD Monitoring Solution Policies'
title_meta: 'VSA HDD Monitoring Solution Policies'
keywords: ['monitoring', 'storage', 'remediation', 'drive', 'policy']
description: 'This document outlines the configuration and details of 25 independent policies for monitoring and storage remediation for each drive letter on servers, including a specific monitor for the C: drive on workstations.'
tags: ['storage']
draft: false
unlisted: false
---

# Summary

This document presents 25 independent policies, one for each drive letter, which facilitate the automation of monitoring and storage remediation for drives on servers. Additionally, a specific monitor for the C: drive has been created for workstations.

# Details

- **Policy Name**: Server Core HDD Monitor Drive \{LETTER}
- **Policy Description**: Monitors server drive \{LETTER}.
- **Applied View**: [EPM - Disk - Custom Field - xPVAL Drive List](/docs/3b56f103-7e5b-4f5b-a44d-92e5d6872c9a)
- **Assigned Organizations / Machine Groups**: Global / Varies
- **Assigned Machines**: Varies based on client
- **Policy Objects Active**:
  - **Policy Object Name**: Monitor Sets
  - **Policy Object Settings**:
    - **Policy Object Members**: [EPM - Disk - Monitor Set - Vsa HDD Monitoring Solution Monitor Sets](/docs/ea55f0eb-9011-436a-bbd9-1795fc206f81)
      - **Policy Object Member Settings**: Alarm, Send Email

- **Policy Name**: Workstation Core HDD Monitor Drive C:
- **Policy Description**: Monitors workstation drive C:.
- **Applied View**: [xPVAL Drive C](/docs/3b56f103-7e5b-4f5b-a44d-92e5d6872c9a)
- **Assigned Organizations / Machine Groups**: Global / Varies
- **Assigned Machines**: Varies based on client
- **Policy Objects Active**:
  - **Policy Object Name**: Monitor Sets
  - **Policy Object Settings**:
    - **Policy Object Members**: [EPM - Disk - Monitor Set - Vsa HDD Monitoring Solution Monitor Sets](/docs/ea55f0eb-9011-436a-bbd9-1795fc206f81)
      - **Policy Object Member Settings**: Alarm, Send Email, Script: Soji Disk Cleaner
## Attachments
[Wokstation_Core_HDD_Monitor_Drive_C.xml](<../../../static/attachments/itg/10793261/Wokstation_Core_HDD_Monitor_Drive_C.xml>)
