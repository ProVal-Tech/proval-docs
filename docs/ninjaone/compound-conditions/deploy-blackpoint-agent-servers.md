---
id: '729cb4c0-adc7-4c9b-9274-5dd4ff093ca3'
slug: /729cb4c0-adc7-4c9b-9274-5dd4ff093ca3
title: 'Deploy Blackpoint Agent - Servers'
title_meta: 'Deploy Blackpoint Agent - Servers'
keywords: ['deployment','windows','blackpoint']
description: 'This compound condition is used to deploy the Blackpoint on windows servers.'
tags: ['windows','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-11-04
---

## Summary

This compound condition is used to facilitate the automated deployment of Blackpoint on Windows servers. It enables targeted execution by evaluating specific criteria to ensure the installer is applied only to eligible systems. This helps streamline deployment, avoid duplicate installations, and maintain consistent security coverage across the environment.

## Details

- **Name:** `Deploy Blackpoint Agent - Servers`
- **Description:** `This compound condition is Used to automate and target the deployment of Blackpoint on eligible Windows servers.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Automation - BlackPoint SNAP Installer - Windows](/docs/06b6d11b-92b0-478d-9323-3f599d5caa46)
- [Custom Field - cPVAL Blackpoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)
- [Custom Field - cPVAL BP CustomerID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Authentication Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)
- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/deploy-blackpoint-agent-servers.toml)

## Changelog

### 2026-11-04

- Renamed the compound condition from `BlackPoint SnapAgent Installer - Windows Server` to `Deploy Blackpoint Agent - Servers`.
- Updated the compound condition with the following changes:
  - The software condition now checks for `Blackpoint Agent` instead of `snapagent`.
- Updated the Dependencies. They now list the renamed `BlackPoint SNAP Installer - Windows` automation and the `cPVAL BP CustomerID` and `cPVAL BP Authentication Token` custom fields instead of `cPVAL BP AccountUID` and `cPVAL BP Win CompanyEXE`.

### 2025-12-05

- Initial version of the document
