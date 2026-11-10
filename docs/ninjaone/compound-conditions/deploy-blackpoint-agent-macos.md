---
id: 'c4c8973c-059f-4d8b-a091-8ad01760831b'
slug: /c4c8973c-059f-4d8b-a091-8ad01760831b
title: 'Deploy BlackPoint Agent - MacOS'
title_meta: 'Deploy BlackPoint Agent - MacOS'
keywords: ['deployment','mac','blackpoint']
description: 'This compound condition is used to deploy the BlackPoint on macos.'
tags: ['macos','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-11-06
---

## Summary

This compound condition is used to facilitate the automated deployment of BlackPoint on MacOS devices. It enables targeted execution by evaluating specific criteria to ensure the installer is applied only to eligible systems. This helps streamline deployment, avoid duplicate installations, and maintain consistent security coverage across the environment.

## Details

- **Name:** `Deploy BlackPoint Agent - MacOS`
- **Description:** `This compound condition is Used to automate and target the deployment of BlackPoint on eligible macos devices.`
- **Recommended Agent Policies:** `Mac Policy`

## Dependencies

- [Automation - BlackPoint SnapAgent Installer - MacOS](/docs/22a99cac-7acf-4251-a790-41a3b651f183)
- [Custom Field - cPVAL BlackPoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)
- [Custom Field - cPVAL BP CustomerID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Authentication Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)
- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/deploy-blackpoint-agent-macos.toml)

## Changelog

### 2026-11-06

- Renamed the compound condition from `BlackPoint SnapAgent Installer - MacOS` to `Deploy BlackPoint Agent - MacOS`.
- Updated the compound condition with the following changes:
  - The detection now checks whether the daemon `com.blackpoint.agent` is missing. It used to check whether the file `/Library/LaunchDaemons/snap-agent.plist` was missing.
- Updated the Dependencies to use the renamed `cPVAL BP CustomerID` and `cPVAL BP Authentication Token` custom fields.

### 2025-12-05

- Initial version of the document
