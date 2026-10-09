---
id: 'e18cdba3-96f3-4961-b516-d021752ada6f'
slug: /e18cdba3-96f3-4961-b516-d021752ada6f
title: 'Uninstall CrowdStrike - Workstations'
title_meta: 'Uninstall CrowdStrike - Workstations'
keywords: ['crowdstrike', 'uninstallation', 'windows', 'ninjaone', 'security']
description: 'This compound condition is used to trigger the automation to uninstall CrowdStrike if it is detected on the machine.'
tags: ['windows', 'auditing', 'uninstallation', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-10-09
---

## Summary

This compound condition is used to trigger the automation to uninstall CrowdStrike if it is detected on the machine.

## Details

- **Name:** `Uninstall CrowdStrike - Workstations`
- **Description:** `This compound condition is used to trigger the automation to uninstall CrowdStrike if it is detected on the machine.`
- **Recommended Agent Policies:** `Windows Workstation Policy` 

## Dependencies

- [Solution - Uninstall-Crowdstrike-Ninjaone](/docs/96ec2315-d8e2-4793-8db9-8d3f73803945)
- [File Transfer - Crowdstrike](/docs/7041c5e0-2aea-4dd7-a657-b8a5ae4caeff)
- [Automation - Uninstall CrowdStrike](/docs/3d721829-3986-4700-8eb5-5b1f746d460a)
- [Automation - CrowdStrike Detection](/docs/f4ea23b5-d7ab-4ca3-832a-5b4fe369517a)
- [Custom Field - cPVAL CS Uninstallation Deployment](/docs/7542dfd2-1e05-4203-8234-a703e70b6748)


## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/uninstall-crowdstrike-workstations.toml)

## Changelog

### 2026-10-09

Initial version of the script.
