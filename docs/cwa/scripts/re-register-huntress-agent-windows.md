---
id: '6cf7ba91-b78d-4368-91a2-43095fad952b'
slug: /6cf7ba91-b78d-4368-91a2-43095fad952b
title: 'Re-Register Huntress Agent Windows'
title_meta: 'Re-Register Huntress Agent Windows'
keywords: ['huntress', 'agent', 'windows', 'script', 'deployment']
description: 'This document provides a detailed guide on how to re-register the Huntress Agent on Windows machines using a PowerShell script. It includes file hashes, dependencies, variables, client-level and location-level EDFs, as well as sample run images and output logs.'
tags: ['installation', 'security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script can be used to re-register the Huntress Agent for Windows machines.

**File Hash:**
- **MD5:** `8F19848478D623C13615D166134FE8C1`
- **SHA256:** `DFC9C59A249E2C5EA0E3AD26CD9639F7F6953FF9781A17823BF84A6009627076`

## Sample Run

![Sample Run](../../../static/img/docs/6cf7ba91-b78d-4368-91a2-43095fad952b/image_1.webp)

## Dependencies

- [InstallHuntress.powershellv2.ps1](https://raw.githubusercontent.com/huntresslabs/deployment-scripts/main/Powershell/InstallHuntress.powershellv2.ps1)
- [SEC - Windows Protection - Script - Deploy Huntress Agent [Windows, Mac]](/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf)

## Variables

| Name               | Description                                                  |
|--------------------|--------------------------------------------------------------|
| projectName        | Invoke-HuntressAgentCommand                                  |
| workingDirectory    | C:/ProgramData/_Automation/Script/Invoke-HuntressAgentCommand |
| scriptPath         | C:/ProgramData/_Automation/Script/Invoke-HuntressAgentCommand/Invoke-HuntressAgentCommand.ps1 |

## Client-Level EDF

| Name                          | Type   | Example              | Section        | Required | Description                                                                                              |
|-------------------------------|--------|----------------------|----------------|----------|----------------------------------------------------------------------------------------------------------|
| Huntress Agent - Account Key   | Text   | 1SA2345AASSSS234     | Security Tools | True     | This is the Account Key that determines which Huntress Account an Agent should be associated with.      |
| Huntress Agent - Org Key       | Text   | Development          | Security Tools | False    | By default, the Huntress Organization key is the name of the client. Set this EDF if it's different for the client. |

**These EDFs can be created by running the [Deploy Huntress Agent [Windows, Mac]](/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf) script with the `Set_Environment` parameter set to `1`.**

## Location-Level EDF

| Name                             | Type       | Example | Section        | Required | Description                                                                                              |
|----------------------------------|------------|---------|----------------|----------|----------------------------------------------------------------------------------------------------------|
| Huntress Agent Install - Exclude | Check-Box  | 0/1     | Security Tools | False    | Mark this EDF to exclude the location from the auto deployment of the Huntress Agent from the [Deploy Huntress Agent](/docs/8888ddb9-ea31-48cb-a88e-56ff970b0e6c) monitor set. |

**This EDF can be created by running the [Deploy Huntress Agent [Windows, Mac]](/docs/523b8882-2c51-4f70-ad7d-cb2b4baf7bbf) script with the `Set_Environment` parameter set to `1`.**

## Output

- Script log