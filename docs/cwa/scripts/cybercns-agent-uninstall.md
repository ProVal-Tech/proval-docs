---
id: 'd4e3e9b3-bdf1-404a-9db0-2c4be4468a5d'
slug: /d4e3e9b3-bdf1-404a-9db0-2c4be4468a5d
title: 'Cybercns Agent Uninstall [Windows, MAC, Linux]'
title_meta: 'Cybercns Agent Uninstall'
keywords: ['cybercns', 'agent', 'uninstallation', 'client', 'edf']
description: 'This script will assist in uninstalling the ConnectSecure Vulnerability Scan Agent, otherwise known as the CyberCNS agent.'
tags: ['uninstallation', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Summary

This script will assist in uninstalling the ConnectSecure Vulnerability Scan Agent, otherwise known as the CyberCNS agent.

## Sample Run

Run the script with SetEnvironment = 1, after import to create the required EDFs for uninstallation automation.

![Sample Run 1](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image8.webp)

Run without SetEnvironment, for the uninstallation

![Sample Run 2](../../../static/img/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b/image7.webp)


## Dependencies

- [Solution - CyberCNS Agent](/docs/f68fc157-ae00-4c3f-bb05-b53cefab28ac)

### User Parameters

| Name         | Example                                                           | Required | Description                                                                                                                                                                                                                                                                                                                                                                     |
| ------------ | ----------------------------------------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SetEnvironment | 1 | False     | Run the script with SetEnvironment = 1, after import to create the required EDFs for the uninstallation. |

## EDFs

 

| Name | Type | Level | Section | Editable | Required | Description |
| ------------- | ------ | ------ | ----- | ----- | ----- | -------------------------------------------- |
| `CyberCNS Uninstall` | Checkbox | Client | CyberCNS  |  True | Yes | This EDF is required to be selected for the automated uninstallation of the CyberCNS Agent. |
| `Exclude CyberCNS Uninstall` | Checkbox | Location | Exclusions  |   False | Yes | If this EDF is checked, the agents of the location will be excluded from the CyberCNS uninstallation |
| `Exclude CyberCNS Uninstall` | Checkbox | Computer |  Exclusions |   False | Yes | If this EDF is checked, the agent will be excluded from the CyberCNS uninstallation |


## Output

- Script log


## Changelog

 ### 2026-03-12

 - Initial version of the document