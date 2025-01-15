---
id: 'b39fe35b-74b3-442d-a977-daef64294297'
title: 'Server HDD Monitoring Policies'
title_meta: 'Server HDD Monitoring Policies'
keywords: ['monitoring', 'storage', 'remediation', 'drive', 'policy']
description: 'This document outlines the configuration and details of 25 independent policies for monitoring and storage remediation for each drive letter on servers, including a specific monitor for the C: drive on workstations.'
tags: ['monitoring', 'storage', 'policy', 'hdd', 'server', 'workstation']
draft: false
unlisted: false
---
# Summary

25 independent policies, one for each drive letter allow, for automation of monitoring and storage remediation per drive on servers.

A C: drive monitor has been created for workstations.

# Details

- **Policy Name**: Server Core HDD Monitor Drive {LETTER}
- **Policy Description**: Monitors Server drive {LETTER}.
- **Applied View**: [EPM - Disk - Custom Field - xPVAL Drive List](https://proval.itglue.com/DOC-5078775-10793262)
- **Assigned Organizations / Machine Groups**: Global / Varies
- **Assigned Machines**: Varies based on client
- **Policy Objects Active**:
  - **Policy Object Name**: Monitor Sets
  - **Policy Object Settings**:
    - **Policy Object Members**: [EPM - Disk - Monitor Set - Vsa HDD Monitoring Solution Monitor Sets](https://proval.itglue.com/DOC-5078775-10793257)
      - **Policy Object Member Settings**: Alarm, Send Email

- **Policy Name**: Workstation Core HDD Monitor Drive C:
- **Policy Description**: Monitors Workstation drive C:.
- **Applied View**: [xPVAL Drive C](https://proval.itglue.com/DOC-5078775-10793262)
- **Assigned Organizations / Machine Groups**: Global / Varies
- **Assigned Machines**: Varies based on client
- **Policy Objects Active**:
  - **Policy Object Name**: Monitor Sets
  - **Policy Object Settings**:
    - **Policy Object Members**: [EPM - Disk - Monitor Set - Vsa HDD Monitoring Solution Monitor Sets](https://proval.itglue.com/DOC-5078775-10793257)
      - **Policy Object Member Settings**: Alarm, Send Email, Script: Soji Disk Cleaner






