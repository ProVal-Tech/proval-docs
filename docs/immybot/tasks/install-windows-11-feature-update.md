---
id: 'b34e8bcf-54c7-4e8e-9237-b1de0d1e4398'
slug: /b34e8bcf-54c7-4e8e-9237-b1de0d1e4398
title: 'Install Windows 11 Feature Update'
title_meta: 'Install Windows 11 Feature Update'
keywords: ['install', 'feature-update', 'upgrade', 'windows', 'windows11', 'troubleshooting', 'reboot']
description: 'The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process. The script can restart the computer up to seven times.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Description

An ImmyBot implementation of the agnostic script [Install-Windows11FeatureUpdate](/docs/837e00a9-4fde-4457-9516-591da7ba4da0). The task automates the installation of the latest Windows 11 Feature Update on Windows 11 and Windows 10 machines. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.

## Cautions

- The machine may restart up to 7 times to complete the upgrade process.
- Be aware of [known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2) with the feature update 24H2 before using the script.
- Even with the `-NoReboot` parameter, the computer may still restart due to firmware, BIOS, driver updates, or the feature update itself.

## Dependencies

[Install-Windows11FeatureUpdate](/docs/837e00a9-4fde-4457-9516-591da7ba4da0)

## Implementation

[Task Configuration](https://github.com/ProVal-Tech/immybot/blob/main/tasks/install-windows-11-feature-update.toml)
