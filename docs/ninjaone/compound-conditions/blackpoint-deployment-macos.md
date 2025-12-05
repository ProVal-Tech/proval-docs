---
id: 'c4c8973c-059f-4d8b-a091-8ad01760831b'
slug: /c4c8973c-059f-4d8b-a091-8ad01760831b
title: 'BlackPoint SNAP Installer - MacOS'
title_meta: 'BlackPoint SNAP Installer - MacOS'
keywords: ['deployment','mac','blackpoint']
description: 'This compound condition is used to deploy the Blackpoint on macos.'
tags: ['macos','application','security']
draft: false
unlisted: false
---

## Summary

This compound condition is used to facilitate the automated deployment of Blackpoint on macOS devices. It enables targeted execution by evaluating specific criteria to ensure the installer is applied only to eligible systems. This helps streamline deployment, avoid duplicate installations, and maintain consistent security coverage across the environment.

## Details

- **Name:** `BlackPoint SNAP Installer - Windows Server`
- **Description:** `This compound condition is Used to automate and target the deployment of Blackpoint on eligible macos devices.`
- **Recommended Agent Policies:** `Mac Policy`

## Dependencies

- [Automation - BlackPoint SNAP Installer - MacOS](docs/22a99cac-7acf-4251-a790-41a3b651f183)
- [Custom Field - cPVAL Blackpoint Deployment](docs/d858853c-665a-4283-a653-6655c2477993)
- [Custom Field - cPVAL BP AccountUID](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [Custom Field - cPVAL BP Mac Auth Token](/docs/7537a07a-9dda-4302-8ef4-b66ae94df2b8)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/blackpoint-deployment-macos.toml)
