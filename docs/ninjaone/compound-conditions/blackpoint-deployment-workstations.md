---
id: '85a2de03-5004-4e90-9598-9de731bb5b6b'
slug: /85a2de03-5004-4e90-9598-9de731bb5b6b
title: 'BlackPoint SNAP Installer - Windows Workstations'
title_meta: 'BlackPoint SNAP Installer - Windows Workstations'
keywords: ['deployment','windows','blackpoint']
description: 'This compound condition is used to deploy the Blackpoint on windows workstations.'
tags: ['windows','application','security']
draft: false
unlisted: false
---

## Summary

This compound condition is used to facilitate the automated deployment of Blackpoint on windows workstations. It enables targeted execution by evaluating specific criteria to ensure the installer is applied only to eligible systems. This helps streamline deployment, avoid duplicate installations, and maintain consistent security coverage across the environment.

## Details

- **Name:** `BlackPoint SNAP Installer - Windows Server`
- **Description:** `This compound condition is Used to automate and target the deployment of Blackpoint on eligible windows devices.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Automation - BlackPoint SNAP Installer - Windows](/docs/06b6d11b-92b0-478d-9323-3f599d5caa46)
- [Custom Field - cPVAL Blackpoint Deployment](/docs/d858853c-665a-4283-a653-6655c2477993)
- [Custom Field - cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Win CompanyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)

## Solution Document

- [Solution - BlackPoint Agent Deployment](/docs/b9f13c4b-742d-4118-be8e-0c03e43ded17)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/blackpoint-deployment-workstations.toml)
