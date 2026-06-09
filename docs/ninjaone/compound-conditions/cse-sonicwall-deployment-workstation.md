---
id: 'ac43f3f2-821f-4103-91c7-783e33f4aa0f'
slug: /ac43f3f2-821f-4103-91c7-783e33f4aa0f
title: 'CSE SonicWall Deployment - Workstations'
title_meta: 'CSE SonicWall Deployment - Workstations'
keywords: ['sonicwall-cse', 'install-banyan-app', 'sonicwall-cloud-security-edge-app']
description: 'This compound condition triggers the auto-deployment script for CSE SonicWall deployment on windows Workstations where deployment is enabled and the application is not installed.'
tags: ['application', 'installation', 'vpn', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-06-08
---

## Summary

This compound condition triggers the auto-deployment script for CSE SonicWall deployment on windows Workstations where deployment is enabled and the application is not installed.

## Details

- **Name:** `CSE SonicWall Deployment - Workstations`
- **Description:** `Triggers the auto-deployment script for the CSE SonicWall Deployment on Workstations where deployment is enabled.`
- **Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policy: `Windows Workstation Policy`

## Dependencies

- [Solution - CSE SonicWall Deployment - NinjaOne](/docs/14e999fb-5dc4-45b8-96e6-40d05fa2119e)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/cse-sonicwall-deployment-workstation.toml)

## Changelog

### 2026-06-08

- Initial version of the document.