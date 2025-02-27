---
id: '161f5696-0f6b-46af-ad25-fe942745f099'
title: 'Reinstall Huntress Agent Windows'
title_meta: 'Reinstall Huntress Agent Windows'
keywords: ['huntress', 'agent', 'windows', 'reinstall', 'script']
description: 'This document provides a detailed guide on how to reinstall the Huntress Agent on Windows machines, including necessary dependencies, variables, and client-level and location-level EDFs required for the process.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script can be used to reinstall the Huntress Agent for Windows machines.

**File Hash:**
- **MD5:** `8F19848478D623C13615D166134FE8C1`
- **SHA256:** `DFC9C59A249E2C5EA0E3AD26CD9639F7F6953FF9781A17823BF84A6009627076`

## Sample Run

![Sample Run](../../../static/img/Reinstall-Huntress-Agent-Windows/image_1.png)

## Dependencies

- [InstallHuntress.powershellv2.ps1](https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1)
- [Deploy Huntress Agent [Windows, Mac]](./Deploy%20Huntress%20Agent%20Windows,%20Mac.md)

## Variables

| Name               | Description                                                 |
|--------------------|-------------------------------------------------------------|
| projectName        | Invoke-HuntressAgentCommand                                 |
| workingDirectory    | C:/ProgramData/_Automation/Script/Invoke-HuntressAgentCommand |
| scriptPath         | C:/ProgramData/_Automation/Script/Invoke-HuntressAgentCommand/Invoke-HuntressAgentCommand.ps1 |

## Client-Level EDF

| Name                          | Type  | Example          | Section        | Required | Description                                                                                               |
|-------------------------------|-------|------------------|----------------|----------|-----------------------------------------------------------------------------------------------------------|
| Huntress Agent - Account Key   | Text  | 1SA2345AASSSS234 | Security Tools | True     | This is the Account Key that determines which Huntress Account an Agent should be associated with.       |
| Huntress Agent - Org Key       | Text  | Development       | Security Tools | False    | By default, the Huntress Organization key is the name of the client. Set this EDF if it's different for the client. |

**These EDFs can be created by running the [Deploy Huntress Agent [Windows, Mac]](./Deploy%20Huntress%20Agent%20Windows,%20Mac.md) script with the `Set_Environment` parameter set to `1`.**

## Location-Level EDF

| Name                            | Type      | Example | Section        | Required | Description                                                                                               |
|---------------------------------|-----------|---------|----------------|----------|-----------------------------------------------------------------------------------------------------------|
| Huntress Agent Install - Exclude | Check-Box | 0/1     | Security Tools | False    | Mark this EDF to exclude the location from the auto deployment of the Huntress Agent from the [Deploy Huntress Agent](../monitors/Deploy%20Huntress%20Agent.md) monitor set. |

**This EDF can be created by running the [Deploy Huntress Agent [Windows, Mac]](./Deploy%20Huntress%20Agent%20Windows,%20Mac.md) script with the `Set_Environment` parameter set to `1`.**

## Output

- Script log



