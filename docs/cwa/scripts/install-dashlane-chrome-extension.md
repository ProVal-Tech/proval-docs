---
id: '7fa0ba87-97a3-4d8f-a5fe-d9faa697b533'
slug: /7fa0ba87-97a3-4d8f-a5fe-d9faa697b533
title: 'Install Dashlane - Chrome Extension'
title_meta: 'Install Dashlane - Chrome Extension'
keywords: ['extensions','browsers','chrome','deployment']
description: 'This script will add the Dashlane Credential Protection extension to Google Chrome.'
tags: ['extensions','browsers','chrome']
draft: false
unlisted: false
---

## Summary

This script will add the Dashlane Credential Protection extension to Google Chrome. The global variable "MassDeploymentKey" is required, and documentation detailing where to find this key will be included below.

## Dependencies

The configuration token found in step 5 of this process needs to be added as the MassDeploymentKey global variable in the script.

[Dashlane Documentation](https://support.dashlane.com/hc/en-us/articles/22882258054674-Mass-deploy-Omnix-Credential-Protection-using-Windows-and-Intune)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name              | Description                                                                                   |
|-------------------|-----------------------------------------------------------------------------------------------|
| ExtensionIDs      | Variable used to hold the extension id for the Dashlane credential extension.                 |
| MassDeploymentKey | Variable used to link the extension to a central tenant. This also enabled silent deployment. |

## Output

- Script Logs