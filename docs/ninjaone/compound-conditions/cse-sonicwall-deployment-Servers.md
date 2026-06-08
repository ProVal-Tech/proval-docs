---
id: '0e96e9ab-436d-4d90-9bd5-59713edee157'
slug: /0e96e9ab-436d-4d90-9bd5-59713edee157
title: 'CSE SonicWall Deployment - Servers'
title_meta: 'CSE SonicWall Deployment - Servers'
keywords: ['sonicwall-cse', 'install-banyan-app', 'sonicwall-cloud-security-edge-app']
description: 'This compound condition triggers the auto-deployment script for CSE SonicWall deployment on windows Servers where deployment is enabled and the application is not installed.'
tags: ['application', 'installation', 'vpn', 'custom-field']
draft: false
unlisted: false
last_update:
  date: 2026-06-08
---

## Summary

This compound condition triggers the auto-deployment script for CSE SonicWall deployment on windows Servers where deployment is enabled and the application is not installed.

## Details

- **Name:** `CSE SonicWall Deployment - Servers`
- **Description:** `Triggers the auto-deployment script for the CSE SonicWall Deployment on Servers where deployment is enabled.`
- **Recommended Agent Policies:** It is advised to configure this compound policy within the following default agent policy: `Windows Server Policy`

## Dependencies


## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/cse-sonicwall-deployment-Servers.toml)

## Changelog

### 2026-06-08

- Initial version of the document