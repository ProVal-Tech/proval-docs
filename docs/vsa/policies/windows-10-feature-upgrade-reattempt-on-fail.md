---
id: 'a347ce1a-5ef9-4e07-a42e-629d7d49c620'
slug: /a347ce1a-5ef9-4e07-a42e-629d7d49c620
title: 'Windows 10 Feature Upgrade Reattempt on Fail'
title_meta: 'Windows 10 Feature Upgrade Reattempt on Fail'
keywords: ['windows', 'feature', 'upgrade', 'failure', 'policy', 'agent', 'procedure']
description: 'This document outlines the reattempt procedure for Windows 10 feature upgrades that have failed, utilizing a specific agent procedure designed to handle upgrades without rebooting the system. It details the policy name, applied view, assigned organizations, and active policy objects.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

# Summary

Reattempts Windows Feature Upgrade using [SEC - Windows Patching - Agent Procedure - Windows 10 Feature Upgrade (No Reboot)](/docs/0ecbf1e1-8947-417c-a3ad-952fcf218140)

# Details

- **Policy Name**: Windows 10 Feature Upgrade Reattempt on Fail
- **Applied View**: xPVAL Feature Upgrade Status [FAILURE]
- **Assigned Organizations / Machine Groups**: Global
- **Policy Objects Active**:
  - **Policy Object Name**: Agent Procedures
  - **Policy Object Settings**:  
    - **Policy Object Members**: [SEC - Windows Patching - Agent Procedure - Windows 10 Feature Upgrade (No Reboot)](/docs/0ecbf1e1-8947-417c-a3ad-952fcf218140)  
      - **Policy Object Member Settings**: Scheduled Monthly, 1st of the month, Do not skip if offline, at midnight.