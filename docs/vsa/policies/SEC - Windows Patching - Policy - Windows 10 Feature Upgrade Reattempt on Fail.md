---
id: 'vsa-windows-10-feature-upgrade-reattempt'
title: 'Windows 10 Feature Upgrade Reattempt on Fail'
title_meta: 'Windows 10 Feature Upgrade Reattempt on Fail'
keywords: ['windows', 'feature', 'upgrade', 'failure', 'policy', 'agent', 'procedure']
description: 'This document outlines the reattempt procedure for Windows 10 feature upgrades that have failed, utilizing a specific agent procedure designed to handle upgrades without rebooting the system. It details the policy name, applied view, assigned organizations, and active policy objects.'
tags: ['windows', 'update', 'policy', 'software', 'configuration']
draft: false
unlisted: false
---
# Summary

Reattempts Windows Feature Upgrade using [SEC - Windows Patching - Agent Procedure - Windows 10 Feature Upgrade (No Reboot)](https://proval.itglue.com/DOC-5078775-10784812)

# Details

- **Policy Name**: Windows 10 Feature Upgrade Reattempt on Fail
- **Applied View**: xPVAL Feature Upgrade Status [FAILURE]
- **Assigned Organizations / Machine Groups**: Global
- **Policy Objects Active**:
  - **Policy Object Name**: Agent Procedures
  - **Policy Object Settings**:  
    - **Policy Object Members**: [SEC - Windows Patching - Agent Procedure - Windows 10 Feature Upgrade (No Reboot)](https://proval.itglue.com/DOC-5078775-10784812)  
      - **Policy Object Member Settings**: Scheduled Monthly, 1st of the month, Do not skip if offline, at midnight.


