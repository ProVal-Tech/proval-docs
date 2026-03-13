---
id: '5d2830db-272e-4f60-8b18-54bf53a7dbed'
slug: /5d2830db-272e-4f60-8b18-54bf53a7dbed
title: 'Install Banyan App [SonicWall Cloud Secure Edge]'
title_meta: 'Install Banyan App [SonicWall Cloud Secure Edge]'
keywords: ['banyan', 'banyan-app', 'sonicwall-cse', 'install-banyan-app', 'sonicwall-cloud-security-edge-app']
description: 'Detects the machines where SonicWall Cloud Security Edge App installation is enabled but the application is not installed.'
tags: ['application', 'installation', 'vpn']
draft: false
unlisted: false
last_update:
  date: 2025-10-10
---

## Summary

Detects the machines where **SonicWall Cloud Security Edge App** installation is enabled but the application is not installed.

## Dependencies

- [Script - Install Banyan App](/docs/3a7001bb-a38b-11f0-9766-92000234cfc2)
- [Solution - Banyan App Deployment](/docs/f220b4c0-75f4-478d-860f-3e41a91ab6f0)

## Target

- Global

## Alert Template

- `△ Custom - Execute Script - Install Banyan App`

## Changelog

### 2026-03-09

- **Rebranding Update:** Renamed the monitor set to **"Install Banyan App [SonicWall Cloud Secure Edge]"** to align with the recent product rebranding.
- **Logic Enhancement:** Updated the monitor's internal logic to identify machines missing the **SonicWall Cloud Security Edge App** instead of the Banyan App.

### 2025-10-10

- Initial version of the document
