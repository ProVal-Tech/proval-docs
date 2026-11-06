---
id: '85a2de03-5004-4e90-9598-9de731bb5b6b'
slug: /85a2de03-5004-4e90-9598-9de731bb5b6b
title: 'Deploy BlackPoint Agent - Workstations'
title_meta: 'Deploy BlackPoint Agent - Workstations'
keywords: ['deployment','windows','blackpoint']
description: 'This compound condition is used to deploy the BlackPoint on windows workstations.'
tags: ['windows','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-11-06
---

## Summary

This compound condition is used to facilitate the automated deployment of BlackPoint SnapAgent on Windows workstations. It enables targeted execution by evaluating specific criteria to ensure the installer is applied only to eligible systems. This helps streamline deployment, avoid duplicate installations, and maintain consistent security coverage across the environment.

## Details

- **Name:** `Deploy BlackPoint Agent - Workstations`
- **Description:** `This compound condition is Used to automate and target the deployment of BlackPoint on eligible windows devices.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Automation - BlackPoint SnapAgent Installer - Windows](/docs/06b6d11b-92b0-478d-9323-3f599d5caa46)
- [Custom Field - cPVAL BlackPoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)
- [Custom Field - cPVAL BP CustomerID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Authentication Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)
- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/deploy-blackpoint-agent-workstations.toml)

## Changelog

### 2026-11-06

- Renamed the compound condition from `BlackPoint SnapAgent Installer - Windows Workstations` to `Deploy BlackPoint Agent - Workstations`.
- Updated the compound condition with the following changes:
  - The software condition now checks for `Blackpoint Agent` instead of `snapagent`.
- Updated the Dependencies. They now list the `BlackPoint SnapAgent Installer - Windows` automation and the `cPVAL BP CustomerID` and `cPVAL BP Authentication Token` custom fields instead of `cPVAL BP AccountUID` and `cPVAL BP Win CompanyEXE`.

### 2025-12-05

- Initial version of the document
