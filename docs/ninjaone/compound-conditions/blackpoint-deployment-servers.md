---
id: '729cb4c0-adc7-4c9b-9274-5dd4ff093ca3'
slug: /729cb4c0-adc7-4c9b-9274-5dd4ff093ca3
title: 'BlackPoint SnapAgent Installer - Windows Server'
title_meta: 'BlackPoint SnapAgent Installer - Windows Server'
keywords: ['deployment','windows','blackpoint']
description: 'This compound condition is used to deploy the Blackpoint on windows servers.'
tags: ['windows','application','security']
draft: false
unlisted: false
---

## Summary

This compound condition is used to facilitate the automated deployment of Blackpoint on Windows servers. It enables targeted execution by evaluating specific criteria to ensure the installer is applied only to eligible systems. This helps streamline deployment, avoid duplicate installations, and maintain consistent security coverage across the environment.

## Details

- **Name:** `BlackPoint SnapAgent Installer - Windows Server`
- **Description:** `This compound condition is Used to automate and target the deployment of Blackpoint on eligible Windows servers.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Automation - BlackPoint SnapAgent Installer - Windows](/docs/06b6d11b-92b0-478d-9323-3f599d5caa46)
- [Custom Field - cPVAL Blackpoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)
- [Custom Field - cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Win CompanyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)
- [Solution - BlackPoint SnapAgent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/blackpoint-deployment-servers.toml)
